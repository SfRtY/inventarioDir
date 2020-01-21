"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url, include
from rest_framework import routers
from inventario import views
from inventario.Views import HwPcView,HwEqView,HwUpsView

router=routers.DefaultRouter()
router.register(r'CSoftware',views.SoftwareView)
router.register(r'Area',views.AreaView)
router.register(r'User',views.UserView)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/',include(router.urls)),
    path('',views.index,name='index'),
    path('Hardware/IngresarCPU/',HwPcView.PCIndex,name='PCC'),
    path('Hardware/PCC/',HwPcView.PcGetAllCreate),
    path('Hardware/Buscar/CPU/',HwPcView.BPCIndex,name="PCR"),
    path('Hardware/PC/BuscarByEmpleado/<dniempleado>/',HwPcView.PCDniEmpleado),
    path('Hardware/PC/Actualizar/<idpc>/',HwPcView.PcGetUpdate,name="PCU"),
    path('Hardware/PC/Eliminar/<idpc>/',HwPcView.PcDelete,name="PCD"),

    path('Hardware/IngresarEquipo/',HwEqView.EquipoIndex,name="EC"),
    path('Hardware/Equipo/EC/',HwEqView.EquipoGetAllCreate),
    path('Hardware/Buscar/Equipo/',HwEqView.BEquipoIndex,name="ER"),
    path('Hardware/Equipo/BuscarByEmpleado/<dniempleado>/',HwEqView.EquipoDniEmpleado),
    path('Hardware/Equipo/Actualizar/<idequipo>/',HwEqView.EquipoGetUpdate,name="EU"),
    path('Hardware/Equipo/Eliminar/<idequipo>/',HwEqView.EquipoDelete,name="ED"),

    path('Hardware/IngresarEstabilizador/',HwUpsView.UpsIndex,name="UC"),
    path('Hardware/Estabilizador/UC/',HwUpsView.UpsGetAllCreate),
    path('Hardware/Buscar/Estabilizador/',HwUpsView.BUpsIndex,name="UR"),
    path('Hardware/Estabilizador/BuscarByEmpleado/<dniempleado>/',HwUpsView.UpsDniEmpleado),
    path('Hardware/Estabilizador/Actualizar/<idestabilizador>/',HwUpsView.UpsGetUpdate,name="UU"),
    path('Hardware/Estabilizador/Eliminar/<idestabilizador>/',HwUpsView.UpsDelete,name="UD"),
    
    path('Software/IngresarSoftware/',views.SoftwareIndex, name='SC'),
    path('Software/Buscar/Software/',views.BSoftwareIndex, name='SR'),
    path('Software/SC/',views.SoftwareGetPost),
    path('Software/BuscarByEmpleado/<dniempleado>/',views.SoftwareDniEmpleado),
    path('Software/Actualizar/<idsoftware>/',views.SoftwareGetUpdate,name='SU'),
    path('Software/Eliminar/<idsoftware>/',views.SoftwareDelete,name='SD'),
    
    path('obtener/<idarea>/',views.EmpleadoJson, name="prueba"),
    path('Empleado/<idarea>/',views.EmpleadoDetail),

    path('User/Login/',views.UserLoginView.as_view(),name='login'),
]
