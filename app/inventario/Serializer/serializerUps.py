from rest_framework import serializers
from inventario.models import Estabilizador

class UpsSerializer(serializers.ModelSerializer):
    class Meta:
        model=Estabilizador
        fields='__all__'