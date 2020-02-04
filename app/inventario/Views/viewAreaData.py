from inventario.models import Area,Marca
from inventario.Serializers.serializers import MarcaSerializer
from django.http import JsonResponse

def AreaData():
    query=Area.objects.all()
    return query

def MarcaData(tipoMarca):
    query=Marca.objects.filter(tipo_marca=tipoMarca)
    querys=MarcaSerializer(query, many=True)
    return querys.data

def MarcaDataJson(request,tipoMarca):
    query=Marca.objects.filter(tipo_marca=tipoMarca)
    querys=MarcaSerializer(query, many=True)
    print(querys.data)
    return JsonResponse(querys.data,safe=False)