from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import api_view
from inventario.Serializer.serializerEq import EquipoSerializer
from inventario.serializers import AreaSerializer, EmpleadoSerializer
from inventario.models import Equipo, Area
from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
from django.contrib import messages


def AreaData():
    queryset = Area.objects.all()
    return queryset


def EquipoIndex(request):
    return render(request, 'Hardware/HardwareEquipo/EC.html', {'queryarea': AreaData()})


def BEquipoIndex(request):
    return render(request, 'Hardware/HardwareEquipo/ER.html', {'queryarea': AreaData()})


def EquipoDniEmpleado(request, dniempleado):
    query = Equipo.objects.filter(dni_empleado=dniempleado)
    querys = EquipoSerializer(query, many=True)
    return JsonResponse(querys.data, safe=False)


@api_view(['GET', 'POST'])
def EquipoGetAllCreate(request):
    if request.method == 'GET':
        equipo = Equipo.objects.all()
        equiposerializer = EquipoSerializer(equipo, many=True)
        return Response(equiposerializer.data)
    elif request.method == 'POST':
        print(request.data)
        equiposerializer = EquipoSerializer(data=request.data)
        if equiposerializer.is_valid():
            equiposerializer.save()
            msg = "El inventario del equipo se almaceno correctamente"
            messages.success(
                request, msg, extra_tags='col-12 alert alert-success')
            return redirect("EC")
        else:
            messages.error(request, "Ocurrio un error al almacenar el CPU",
                           extra_tags='col-12 alert alert-danger')
            return redirect("EC")


@api_view(['GET', 'POST'])
def EquipoGetUpdate(request, idequipo):
    try:
        equipo = Equipo.objects.get(id_equipo=idequipo)
    except:
        return JsonResponse({"error": 404}, status=404)
    if request.method == 'GET':
        area = equipo.dni_empleado.id_area
        sarea = AreaSerializer(area, many=False)
        empleado = equipo.dni_empleado
        sempleado = EmpleadoSerializer(empleado, many=False)
        serializer = EquipoSerializer(equipo)
        querys = serializer.data
        return render(request, 'Hardware/HardwareEquipo/EU.html', {'querys': serializer.data, 'queryarea': AreaData(), 'area': sarea.data, 'empleado': sempleado.data})
    elif request.method == 'POST':
        print("estas en post")
        serializer = EquipoSerializer(equipo, data=request.data)
        if serializer.is_valid():
            serializer.save()
            messages.success(request, 'El equipo se actualizo correctamente',
                             extra_tags='col-12 alert alert-success')
            return redirect('EU', idequipo=idequipo)
        else:
            messages.error(request, 'Ocurrio un error al tratar de almacenar el equipo',
                           extra_tags='col-12 alert alert-danger')
            return redirect('EU', idequipo=idequipo)


@api_view(['POST'])
def EquipoDelete(request, idequipo):
    print("idequipo"+idequipo)
    try:
        equipo = Equipo.objects.get(id_equipo=idequipo)
    except:
        return JsonResponse({"success": 404}, status=404)
    if request.method == 'POST':
        equipo.delete()
        print("elimino")
        return JsonResponse({"success": True}, status=200)
    return JsonResponse({"success": True}, status=400)
