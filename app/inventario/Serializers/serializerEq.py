from rest_framework import serializers
from inventario.models import Equipo

class EquipoSerializer(serializers.ModelSerializer):
    class Meta:
        model=Equipo
        fields='__all__'