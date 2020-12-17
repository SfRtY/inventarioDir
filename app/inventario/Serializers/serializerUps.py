from rest_framework import serializers
from inventario.Serializers.serializers import MarcaSerializer
from inventario.models import Estabilizador

class UpsSerializer(serializers.ModelSerializer):
    marca=serializers

    class Meta:
        model=Estabilizador
        fields='__all__'