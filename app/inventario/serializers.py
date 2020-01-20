from rest_framework import serializers

from .models import (Software, Area, Empleado, Estabilizador, Pc)

from django.contrib.auth.models import User

from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token


class SoftwareSerializer(serializers.ModelSerializer):
    class Meta:
        model = Software
        fields = ('id_software', 'nombre_software', 'version_software', 'licencia_software',
                  'tipo_equipo_s', 'codigo_bien_s', 'sistema_operativo', 'dni_empleado')


class AreaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Area
        fields = ('id_area', 'nombre_area', 'abr_area')


class EmpleadoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Empleado
        fields = ('dni_empleado', 'id_area', 'nombre_empleado')


class EstabilizadorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Estabilizador
        fields = ('id_estabilizador', 'marca_estabilizador', 'potencia_watts', 'potencia_va',
                  'dni_empleado', 'tipo_estabilizador', 'codigo_activo', 'numero_serie')


class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('username', 'email')


class UserLoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField(min_length=8, max_length=64)

    def validate(self, data):
        user = authenticate(username=data['username'], password=data['password'])
        if not user:
            raise serializers.ValidationError('credenciales invalidos')
        self.context['user'] = user
        return data

    def create(self, data):
        token, create = Token.objects.get_or_create(user=self.context['user'])
        print('serializer token',token)
        print('serializer create',create)
        return self.context['user'], token.key
