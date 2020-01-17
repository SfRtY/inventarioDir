from django.db import models
# Create your models here

class Estabilizador(models.Model):
    id_estabilizador = models.AutoField(primary_key=True)
    marca_estabilizador = models.CharField(max_length=16)
    potencia_watts = models.CharField(max_length=10, blank=True, null=True)
    potencia_va = models.CharField(max_length=10, blank=True, null=True)
    tipo_estabilizador = models.CharField(max_length=13)
    numero_serie = models.CharField(max_length=15, blank=True, null=True)
    codigo_activo = models.CharField(max_length=12, blank=True, null=True)
    estado_estabilizador = models.CharField(max_length=15)
    dni_empleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='dni_empleado')

    class Meta:
        managed = False
        db_table = 'estabilizador'

class Pc(models.Model):
    id_pc = models.AutoField(primary_key=True)
    procesador_pc = models.CharField(max_length=20)
    velocidad_pc = models.CharField(max_length=10)
    memoria_ram = models.CharField(max_length=7)
    almacenamiento = models.CharField(max_length=7)
    tarjeta_video = models.CharField(max_length=15, blank=True, null=True)
    marca = models.CharField(max_length=8, blank=True, null=True)
    tipo_equipo = models.CharField(max_length=8)
    numero_serie = models.CharField(max_length=15, blank=True, null=True)
    modelo = models.CharField(max_length=15, blank=True, null=True)
    codigo_activo = models.CharField(max_length=12, blank=True, null=True)
    sistema_operativo = models.CharField(max_length=11)
    estado = models.CharField(max_length=7, blank=True, null=True)
    dni_empleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='dni_empleado')

    class Meta:
        managed = False
        db_table = 'pc'

class Software(models.Model):
    id_software = models.AutoField(primary_key=True)
    nombre_software = models.CharField(max_length=25)
    version_software = models.CharField(max_length=10, blank=True, null=True)
    licencia_software = models.CharField(max_length=2, blank=True, null=True)
    tipo_equipo_s = models.CharField(max_length=6)
    codigo_bien_s = models.CharField(max_length=12, blank=True, null=True)
    sistema_operativo = models.CharField(max_length=11)
    dni_empleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='dni_empleado')

    class Meta:
        managed = False
        db_table = 'software'

class Area(models.Model):
    id_area = models.CharField(primary_key=True, max_length=2)
    nombre_area = models.CharField(max_length=62, blank=True, null=True)
    abr_area = models.CharField(max_length=19, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'area'
        
class Empleado(models.Model):
    dni_empleado = models.CharField(primary_key=True, max_length=8)
    id_area = models.ForeignKey(Area, models.DO_NOTHING, db_column='id_area', blank=True, null=True)
    nombre_empleado = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'empleado'

class Equipo(models.Model):
    id_equipo = models.AutoField(primary_key=True)
    nombre_equipo = models.CharField(max_length=25)
    marca_equipo = models.CharField(max_length=25, blank=True, null=True)
    modelo_equipo = models.CharField(max_length=25, blank=True, null=True)
    estado_equipo = models.CharField(max_length=15)
    numero_serie = models.CharField(max_length=15, blank=True, null=True)
    codigo_activo = models.CharField(max_length=12, blank=True, null=True)
    dni_empleado = models.ForeignKey('Empleado', models.DO_NOTHING, db_column='dni_empleado')
    descripcion = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'equipo'

