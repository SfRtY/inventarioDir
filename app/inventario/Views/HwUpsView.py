from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import api_view
from inventario.Serializer.serializerUps import UpsSerializer
from inventario.serializers import AreaSerializer,EmpleadoSerializer
from inventario.models import Estabilizador,Area
from django.shortcuts import render, get_object_or_404,redirect
from django.http import JsonResponse
from django.contrib import messages

def AreaData():
    queryset=Area.objects.all()
    return queryset

def UpsIndex(request):
    return render(request,'Hardware/HardwareUps/UC.html',{'queryarea':AreaData()})

def BUpsIndex(request):
    return render(request,'Hardware/HardwareUps/UR.html',{'queryarea':AreaData()})

def UpsDniEmpleado(request,dniempleado):
    query=Estabilizador.objects.filter(dni_empleado=dniempleado)
    querys=UpsSerializer(query,many=True)
    return JsonResponse(querys.data,safe=False)

@api_view(['GET','POST'])
def UpsGetAllCreate(request):
    if request.method=='GET':
        ups=Estabilizador.objects.all()
        upsserializer=EquipoSerializer(ups,many=True)
        return Response(upsserializer.data)
    elif request.method=='POST':
        print(request.data)
        upsserializer=UpsSerializer(data=request.data)
        if upsserializer.is_valid():
            upsserializer.save()
            msg="El inventario del estabilizador se almaceno correctamente"
            messages.success(request,msg,extra_tags='col-12 alert alert-success')
            return redirect("UC")
        else:
            messages.error(request,"Ocurrio un error al almacenar el estabilizador",extra_tags='col-12 alert alert-danger')
            return redirect("UC")

@api_view(['GET','POST'])
def UpsGetUpdate(request,idestabilizador):
    try:
        ups=Estabilizador.objects.get(id_estabilizador=idestabilizador)
    except:
        return JsonResponse({"error":404}, status=404)
    if request.method == 'GET':
        area=ups.dni_empleado.id_area
        sarea=AreaSerializer(area,many=False)
        empleado=ups.dni_empleado
        sempleado=EmpleadoSerializer(empleado,many=False)
        serializer = UpsSerializer(ups)
        querys=serializer.data
        return render(request,'Hardware/HardwareUps/UU.html',{'querys':serializer.data,'queryarea':AreaData(),'area':sarea.data,'empleado':sempleado.data})
    elif request.method == 'POST':
        print("estas en post")
        serializer = UpsSerializer(ups,data=request.data)
        if serializer.is_valid():
            serializer.save()
            messages.success(request,'El estabilizador se actualizo correctamente',extra_tags='col-12 alert alert-success')
            return redirect('UU',idestabilizador=idestabilizador)
        else:
            messages.error(request,'Ocurrio un error al tratar de almacenar el estabilizador',extra_tags='col-12 alert alert-danger')
            return redirect('UU',idestabilizador=idestabilizador)

@api_view(['POST'])
def UpsDelete(request,idestabilizador):
    try:
        ups=Estabilizador.objects.get(id_estabilizador=idestabilizador)
    except:
        return JsonResponse({"success":404}, status=404)
    if request.method == 'POST':
        ups.delete()
        print("elimino")
        return JsonResponse({"success":True}, status=200)
    return JsonResponse({"success":True}, status=400)