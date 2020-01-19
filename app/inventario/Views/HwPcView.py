from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import api_view
from inventario.Serializer.serializerPC import PcSerializer
from inventario.serializers import AreaSerializer,EmpleadoSerializer
from inventario.models import Pc,Area
from django.shortcuts import render, get_object_or_404,redirect
from django.http import JsonResponse
from django.contrib import messages

""" Autenticacion por tokens """

from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import permission_classes,authentication_classes

def AreaData():
    queryset=Area.objects.all()
    return queryset

@api_view(['GET'])
#@permission_classes((IsAuthenticated, ))
#@authentication_classes((TokenAuthentication, ))
def PCIndex(request):
    return render(request,'Hardware/HardwarePC/PCC.html',{'queryarea':AreaData()})

def BPCIndex(request):
    return render(request,'Hardware/HardwarePC/PCR.html',{'queryarea':AreaData()})

def PCDniEmpleado(request,dniempleado):
    query=Pc.objects.filter(dni_empleado=dniempleado)
    querys=PcSerializer(query,many=True)
    return JsonResponse(querys.data,safe=False)

@api_view(['GET','POST'])
def PcGetAllCreate(request):
    if request.method=='GET':
        pc=Pc.objects.all()
        pcserializer=PcSerializer(pc,many=True)
        return Response(pcserializer.data)
    elif request.method=='POST':
        print(request.data)
        pcserializer=PcSerializer(data=request.data)
        if pcserializer.is_valid():
            pcserializer.save()
            msg="El inventario del CPU se almaceno correctamente"
            messages.success(request,msg,extra_tags='col-12 alert alert-success')
            return redirect("PCC")
        else:
            messages.error(request,"Ocurrio un error al almacenar el CPU",extra_tags='col-12 alert alert-danger')
            return redirect("PCC")

@api_view(['GET','POST'])
def PcGetUpdate(request,idpc):
    try:
        pc=Pc.objects.get(id_pc=idpc)
    except:
        return JsonResponse({"error":404}, status=404)
    if request.method == 'GET':
        area=pc.dni_empleado.id_area
        sarea=AreaSerializer(area,many=False)
        empleado=pc.dni_empleado
        sempleado=EmpleadoSerializer(empleado,many=False)
        serializer = PcSerializer(pc)
        querys=serializer.data
        return render(request,'Hardware/HardwarePC/PCU.html',{'querys':serializer.data,'queryarea':AreaData(),'area':sarea.data,'empleado':sempleado.data})
    elif request.method == 'POST':
        print("estas en post")
        serializer = PcSerializer(pc, data=request.data)
        if serializer.is_valid():
            serializer.save()
            messages.success(request,'El CPU se actualizo correctamente',extra_tags='col-12 alert alert-success')
            return redirect('PCU',idpc=idpc)
        else:
            messages.error(request,'Ocurrio un error al tratar de almacenar el producto',extra_tags='col-12 alert alert-danger')
            return redirect('PCU',idpc=idpc)

@api_view(['POST'])
def PcDelete(request,idpc):
    print("idpc"+idpc)
    try:
        pc=Pc.objects.get(id_pc=idpc)
    except:
        return JsonResponse({"success":404}, status=404)
    if request.method == 'POST':
        pc.delete()
        print("elimino")
        return JsonResponse({"success":True}, status=200)
    return JsonResponse({"success":True}, status=400)