 
from django.contrib import admin
from .models import Marca,Empleado,Area,Pc
# Register your models here.

class PcAdmin(admin.ModelAdmin):
    list_filter=("dni_empleado",)
    pass

admin.site.register(Marca)
admin.site.register(Empleado)
admin.site.register(Area)
admin.site.register(Pc,PcAdmin)