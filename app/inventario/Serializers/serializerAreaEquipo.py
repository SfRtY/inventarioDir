from rest_framework import serializers
from inventario.models import Equipo,Area
from inventario.Serializers import serializerPC

class AreaEquipoSerializer(serializers.ModelSerializer):
    model_b=serializerPC(source="pc")
    class Meta:
        model=Area
        fields=("id_area","nombre_area","model_b")
