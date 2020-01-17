from rest_framework import serializers
from .models import Software,Area,Empleado,Estabilizador,Pc

class SoftwareSerializer(serializers.ModelSerializer):
    class Meta:
        model=Software
        fields=('id_software','nombre_software','version_software','licencia_software','tipo_equipo_s','codigo_bien_s','sistema_operativo','dni_empleado')

class AreaSerializer(serializers.ModelSerializer):
    class Meta:
        model=Area
        fields=('id_area','nombre_area','abr_area')

class EmpleadoSerializer(serializers.ModelSerializer):
    class Meta:
        model=Empleado
        fields=('dni_empleado','id_area','nombre_empleado')

class EstabilizadorSerializer(serializers.ModelSerializer):
    class Meta:
        model=Estabilizador
        fields=('id_estabilizador','marca_estabilizador','potencia_watts','potencia_va','dni_empleado','tipo_estabilizador','codigo_activo','numero_serie')
        