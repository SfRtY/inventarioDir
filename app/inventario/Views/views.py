"""Importando de rest_framework"""
import json
from inventario.Serializers.serializers import (
    SoftwareSerializer, AreaSerializer, EmpleadoSerializer, UserSerializer, UserLoginSerializer)
from inventario.models import (Software, Area, Empleado)
from django.shortcuts import render, get_object_or_404, redirect
from rest_framework.decorators import permission_classes
from rest_framework.permissions import IsAuthenticated
from django.contrib import messages
from django.http import JsonResponse
from django.contrib.auth.models import User
from rest_framework import viewsets, mixins, status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.views import APIView
from django.http import QueryDict
from django.contrib.auth import authenticate
from django.contrib.auth import login as do_login
"""Importando los serializadores y modelos a utilizar"""
from django.contrib.auth.decorators import login_required


@api_view(['GET'])
def index(request):
    return render(request, 'Login/Login.html')


def AreaData():
    queryset = Area.objects.all()
    return queryset


def SoftwareIndex(request):
    return render(request, 'Software/SC.html', {'queryarea': AreaData()})


def BSoftwareIndex(request):
    return render(request, 'Software/SR.html', {'queryarea': AreaData()})


def SoftwareDniEmpleado(request, dniempleado):
    query = Software.objects.filter(dni_empleado=dniempleado)
    querys = SoftwareSerializer(query, many=True)
    return JsonResponse(querys.data, safe=False)

@login_required
def EmpleadoJson(request, idarea):
    query = Empleado.objects.filter(id_area=idarea)
    querys = EmpleadoSerializer(query, many=True)
    return JsonResponse(querys.data, safe=False)


def EmpleadoDetail(request, idarea):
    queryset2 = Empleado.objects.filter(id_area=idarea)
    return render(request, 'Hardware/CH.html', {'queryarea': AreaData(), 'queryempleado': queryset2})


def FormHardware(request):
    return render(request, 'Hardware/CH.html', {'queryarea': AreaData()})


@api_view(['GET', 'POST'])
def SoftwareGetPost(request):
    if request.method == 'GET':
        software = Software.objects.all()
        serializer = SoftwareSerializer(software, many=True)
        print(serializer.data)
        return Response(serializer.data)
    elif request.method == 'POST':
        print(request.POST['nombre_software'])
        serializer = SoftwareSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            msg = 'El inventario de software se almaceno correctamente'
            messages.success(
                request, msg, extra_tags='col-12 alert alert-success')
            return redirect("SC")
        else:
            messages.error(request, 'Ocurrio un error al tratar de almacenar el producto',
                           extra_tags='col-12 alert alert-danger')
            return redirect("SC")


"""@api_view(['GET','PUT','DELETE'])
def SoftwareUpdateDelete(request,id):
    try:
        software=Software.objects.get(id_software=id)
        print(software.data)
    except:
        return response(status=status.HTTP_404_NOT_FOUND)
    if request.method == 'GET':
        serializer = SoftwareSerializer(software)
        return Response(serializer.data)
    if request.method == 'PUT':
        serializer = SoftwareSerializer(software, data=request.DATA)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    elif request.method == 'DELETE':
        software.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)"""


@api_view(['GET', 'POST'])
def SoftwareGetUpdate(request, idsoftware):
    try:
        software = Software.objects.get(id_software=idsoftware)
    except:
        return JsonResponse({"success": 404}, status=404)
    if request.method == 'GET':
        area = software.dni_empleado.id_area
        sarea = AreaSerializer(area, many=False)
        empleado = software.dni_empleado
        sempleado = EmpleadoSerializer(empleado, many=False)
        serializer = SoftwareSerializer(software)
        querys = serializer.data
        return render(request, 'Software/SU.html', {'querys': serializer.data, 'queryarea': AreaData(), 'area': sarea.data, 'empleado': sempleado.data})
    elif request.method == 'POST':
        print("estas en post")
        serializer = SoftwareSerializer(software, data=request.data)
        if serializer.is_valid():
            serializer.save()
            messages.success(request, 'El software se actualizo correctamente',
                             extra_tags='col-12 alert alert-success')
            return redirect('SU', idsoftware=idsoftware)
        else:
            messages.error(request, 'Ocurrio un error al tratar de almacenar el producto',
                           extra_tags='col-12 alert alert-danger')
            return redirect('SU', idsoftware=idsoftware)


@api_view(['POST'])
def SoftwareDelete(request, idsoftware):
    print("idsoftware"+idsoftware)
    try:
        software = Software.objects.get(id_software=idsoftware)
    except:
        return JsonResponse({"success": 404}, status=404)
    if request.method == 'POST':
        software.delete()
        print("elimino")
        return JsonResponse({"success": True}, status=200)
    return JsonResponse({"success": True}, status=400)


class SoftwareView(mixins.CreateModelMixin, viewsets.GenericViewSet):
    serializer_class = SoftwareSerializer
    queryset = Software.objects.all()


class AreaView(viewsets.ModelViewSet):
    serializer_class = AreaSerializer
    queryset = Area.objects.all()


class UserView(viewsets.ModelViewSet):
    serializer_class = UserSerializer
    queryset = User.objects.all()


class UserLoginView(APIView):

    def post(self, request):
        user=authenticate(username=request.POST.get('username'),password=request.POST.get('password'))
        print(user)
        if user is not None:
            do_login(request,user)
            return redirect('PCC')
        else:
            messages.error(request, 'El usuario o la contraseña son invalidos', extra_tags='col-12 alert alert-danger')
            return redirect('index')
        '''lista={'username':request.POST.get('username'),'password':request.POST.get('password')}
        serializer = UserLoginSerializer(data=request.data)
        if serializer.is_valid():
            user, token = serializer.save()
            print('usuario', user)
            print('token', token)
            data = {
                'status': 'ok',
                'token': token
            }
            return JsonResponse({"token":token})
        messages.error(request, 'El usuario o la contraseña son invalidos',
                       extra_tags='col-12 alert alert-danger')
        return redirect('index')'''
