from rest_framework import serializers
from inventario.models import Pc

class PcSerializer(serializers.ModelSerializer):
    class Meta:
        model=Pc
        fields=('id_pc','procesador_pc','velocidad_pc','memoria_ram','almacenamiento','tarjeta_video','marca','tipo_equipo','numero_serie','modelo','codigo_activo','sistema_operativo','estado','dni_empleado')