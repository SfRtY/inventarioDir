from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.decorators import api_view
from inventario.Serializers.serializerEq import EquipoSerializer
from inventario.Serializers.serializers import AreaSerializer, EmpleadoSerializer
from inventario.models import Equipo, Area
from django.shortcuts import render, get_object_or_404, redirect
from django.http import JsonResponse
from django.contrib import messages
from .viewAreaData import AreaData, MarcaData
from django.contrib.auth.decorators import login_required
import datetime

@login_required
def EquipoIndex(request):
    return render(request, 'Hardware/HardwareEquipo/EC.html', {'queryarea': AreaData(), 'querynombre':MarcaData(0)})

@login_required
def BEquipoIndex(request):
    return render(request, 'Hardware/HardwareEquipo/ER.html', {'queryarea': AreaData(), 'querynombre':MarcaData(0)})

@login_required
def EquipoDniEmpleado(request, dniempleado):
    query = Equipo.objects.filter(dni_empleado=dniempleado).filter(date_final_cargo_hp=None)
    querys = EquipoSerializer(query, many=True)
    return JsonResponse(querys.data, safe=False)

@api_view(['GET', 'POST'])
@login_required
def EquipoGetAllCreate(request):
    if request.method == 'GET':
        equipo = Equipo.objects.all()
        equiposerializer = EquipoSerializer(equipo, many=True)
        return Response(equiposerializer.data)
    elif request.method == 'POST':
        print(request.data)
        solicitud=request.POST.copy()
        solicitud['date_inicio_cargo_hp']=datetime.datetime.now().date()
        equiposerializer = EquipoSerializer(data=solicitud)
        if equiposerializer.is_valid():
            equiposerializer.save()
            msg = "El inventario del equipo se almaceno correctamente"
            messages.success(
                request, msg, extra_tags='col-12 alert alert-success')
            return redirect("EC")
        else:
            print(equiposerializer.errors)
            messages.error(request, "Ocurrio un error al almacenar el CPU",
                           extra_tags='col-12 alert alert-danger')
            return redirect("EC")


@api_view(['GET', 'POST'])
@login_required
def EquipoGetUpdate(request, idequipo):
    try:
        equipo = Equipo.objects.get(id_hardware_periferico=idequipo)
    except:
        return JsonResponse({"error": 404}, status=404)
    if request.method == 'GET':
        area = equipo.dni_empleado.id_area
        marca=equipo.marca.nombre_marca
        sarea = AreaSerializer(area, many=False)
        empleado = equipo.dni_empleado
        sempleado = EmpleadoSerializer(empleado, many=False)
        serializer = EquipoSerializer(equipo)
        print(serializer.data)
        return render(request, 'Hardware/HardwareEquipo/EU.html', {'querys': serializer.data, 'querymarca':marca, 'querynombre':MarcaData(0), 'queryarea': AreaData(), 'area': sarea.data, 'empleado': sempleado.data})
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
@login_required
def EquipoDelete(request, idequipo):
    print("idequipo"+idequipo)
    try:
        equipo = Equipo.objects.get(id_hardware_periferico=idequipo)
    except:
        return JsonResponse({"success": 404}, status=404)
    if request.method == 'POST':
        equipo.delete()
        print("elimino")
        return JsonResponse({"success": True}, status=200)
    return JsonResponse({"success": True}, status=400)
