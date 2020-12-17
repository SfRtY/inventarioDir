from django.template import RequestContext
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from inventario.models import Pc,Estabilizador,Equipo,Empleado,Area,Software,Marca
from inventario.Views.viewAreaData import MarcaData,AreaData
from django.http import JsonResponse,HttpResponse
from inventario.Views.viewAreaData import AreaData
from rest_framework.decorators import api_view
from inventario.Serializers import serializerPC,serializerEq,serializerUps,serializers
import json
from rest_framework.response import Response
from django.db.models import Count
import datetime


@login_required
def graficReport(request):
    return render(request,"Admin/graficas.html",{"queryarea":AreaData()})

def cargo(request):
    return render(request,"Admin/cargo.html",{"queryarea":AreaData()})

@api_view(["POST"])
def passPosition(request):
    empleado_cargo=Empleado.objects.get(dni_empleado=request.POST.get('dni1'))
    dataPc=Pc.objects.filter(dni_empleado=request.POST.get('dni0'),date_final_cargo_hc=None)
    dataEst=Estabilizador.objects.filter(dni_empleado=request.POST.get('dni0'),date_final_cargo_hr=None)
    dataEqui=Equipo.objects.filter(dni_empleado=request.POST.get('dni0'),date_final_cargo_hp=None)
    if len(dataPc):
        copyDataPc(dataPc,empleado_cargo)
    else:
        print("no hay hardware computadora")
    if len(dataEst):
        copyDataEstab(dataEst,empleado_cargo)
    else:
        print("no hay hardware regulador")
    if len(dataEqui):
        copyDataEquip(dataEqui)
    else:
        print("no hay hardware periferico")
    return JsonResponse({"lol":"El traspaso de cargo se ha realizado correctamente"})

def copyDataPc(data,empleado_cargo):
    for d in data:
        d.__setattr__("dni_empleado",empleado_cargo)
        d.__setattr__("id_hardware_comp",None)
        d.save()
    data.update(date_final_cargo_hc=datetime.datetime.now().date())

def copyDataEstab(data,empleado_cargo):
    for d in data:
        d.__setattr__("dni_empleado",empleado_cargo)
        d.__setattr__("id_hardware_regulador",None)
        d.save()
    data.update(date_final_cargo_hr=datetime.datetime.now().date())

def copyDataEquip(data,empleado_cargo):
    for d in data:
        d.__setattr__("dni_empleado",empleado_cargo)
        d.__setattr__("id_hardware_periferico",None)
        d.save()
    data.update(date_final_cargo_hp=datetime.datetime.now().date())

def dataGraficL(request):
    cantidad=Pc.objects.values('procesador').filter(dni_empleado__id_area='01').annotate(count=Count('procesador'))
    return 

@api_view(["GET"])
def dataGrafic(request,idarea):
    test=Pc.objects.filter(dni_empleado__id_area='02')
    cantidad=Pc.objects.values('procesador').filter(dni_empleado__id_area='01').annotate(count=Count('procesador'))
    print(test)
    print(cantidad)
    print(idarea)
    namearea=nameArea(idarea)
    queryEmpleado=listEmpleado(idarea)
    kindEquip=["PC","Servidor","Laptop","Tablet","Estabilizador","UPS","Otros"]
    graf={"PC":0,"Servidor":0,"Laptop":0,"Tablet":0,"Estabilizador":0,"UPS":0,"Otros":0,"Area":namearea}
    tbl=[]
    for q in queryEmpleado:
        quantity=0
        dat={}
        dat["Dni"]=q.dni_empleado
        dat["Nombre"]=q.nombre_empleado
        for i in range(0,len(kindEquip)):
            if(i<4):
                quantity=countKindEquip("Pc",kindEquip[i],q.dni_empleado)
                dat[kindEquip[i]]=quantity
                last_quantity=graf[kindEquip[i]]
                current_quantity=quantity+last_quantity
                graf[kindEquip[i]]=current_quantity
            elif(i>3 and i<6):
                quantity=countKindEquip("Estabilizador",kindEquip[i],q.dni_empleado)
                dat[kindEquip[i]]=quantity
                last_quantity=graf[kindEquip[i]]
                current_quantity=quantity+last_quantity
                graf[kindEquip[i]]=current_quantity
            else:
                quantity=countKindEquip("Otros",kindEquip[i],q.dni_empleado)
                dat[kindEquip[i]]=quantity
                last_quantity=graf[kindEquip[i]]
                current_quantity=quantity+last_quantity
                graf[kindEquip[i]]=current_quantity
        tbl.append(dat)
    graf['total']=int(graf['PC'])+int(graf['Servidor'])+int(graf['Laptop'])+int(graf['Tablet'])+int(graf['Estabilizador'])+int(graf['UPS'])+int(graf['Otros'])
    return JsonResponse({"graf":graf,"tbl":tbl})

def databyEmpl(request,dni_empleado):
    dataPc=Pc.objects.filter(dni_empleado=dni_empleado)
    data_s_p=serializerPC.PcSerializer(dataPc,many=True)
    dataSw=Software.objects.filter(dni_empleado=dni_empleado)
    data_s_s=serializers.SoftwareSerializer(dataSw,many=True)
    return render(request,'Admin/graficaEmpl.html',{'nombre':Empleado.objects.get(dni_empleado=dni_empleado).nombre_empleado,"data_pc":data_s_p.data,"data_est":dataEstab(dni_empleado),"data_eq":dataEquipo(dni_empleado),"data_soft":data_s_s.data})

def dataEstab(dni_empleado):
    dataEs=Estabilizador.objects.filter(dni_empleado=dni_empleado)
    data_s_e=serializerUps.UpsSerializer(dataEs,many=True)
    for d in data_s_e.data:
        d["marca_hardware_regulador"]=Marca.objects.get(id_marca=d["marca_hardware_regulador"]).nombre_marca
    return data_s_e.data

def dataEquipo(dni_empleado):
    dataEq=Equipo.objects.filter(dni_empleado=dni_empleado)
    data_s_eq=serializerEq.EquipoSerializer(dataEq,many=True)
    for d in data_s_eq.data:
        d["nombre_hardware_periferico"]=Marca.objects.get(id_marca=d["nombre_hardware_periferico"]).nombre_marca
        d["marca"]=Marca.objects.get(id_marca=d["marca"]).nombre_marca
    return data_s_eq.data

def nameArea(area):
    objectArea=Area.objects.filter(id_area=area)
    for i in objectArea:
        nameArea=i.nombre_area
    return nameArea

def listEmpleado(area):
    listEmpleado=Empleado.objects.filter(id_area=area)
    return listEmpleado

def countKindEquip(model,tipo,dni):
    if(model=="Pc"):
        quantity=Pc.objects.filter(dni_empleado=dni,tipo_hardware_comp=tipo,date_final_cargo_hc=None).count()
        return quantity
    elif(model=="Estabilizador"):
        quantity=Estabilizador.objects.filter(dni_empleado=dni,tipo_hardware_regulador=tipo,date_final_cargo_hr=None).count()
        return quantity
    else:
        quantity=Equipo.objects.filter(dni_empleado=dni,date_final_cargo_hp=None).count()
        return quantity
