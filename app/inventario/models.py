from django.db import models
# Create your models here

class Marca(models.Model):
    id_marca = models.AutoField(primary_key=True)
    nombre_marca = models.CharField(max_length=20)
    tipo_marca = models.ForeignKey('self', models.DO_NOTHING, db_column='tipo_marca',related_name='tipomarca')

    class Meta:
        managed = False
        db_table = 'marca'

    def __str__(self):
        return self.nombre_marca

class Area(models.Model):
    id_area = models.CharField(primary_key=True, max_length=2)
    nombre_area = models.CharField(max_length=62, blank=True, null=True)
    abr_area = models.CharField(max_length=19, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'area'
    
    def __str__(self):
        return str(self.id_area)+" "+self.nombre_area

class Empleado(models.Model):
    dni_empleado = models.CharField(primary_key=True, max_length=8)
    id_area = models.ForeignKey(Area, models.DO_NOTHING, db_column='id_area', blank=True, null=True,related_name='idarea')
    nombre_empleado = models.CharField(max_length=50)

    class Meta:
        managed = False
        db_table = 'empleado'
    
    def __str__(self):
        return self.nombre_empleado

class Software(models.Model):
    id_software = models.AutoField(primary_key=True)
    nombre_software = models.CharField(max_length=25)
    version_software = models.CharField(max_length=10, blank=True, null=True)
    licencia_software = models.CharField(max_length=2, blank=True, null=True)
    tipo_equipo_s = models.CharField(max_length=6)
    codigo_bien_s = models.CharField(max_length=12, blank=True, null=True)
    sistema_operativo = models.CharField(max_length=11)
    dni_empleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='dni_empleado')

    class Meta:
        managed = False
        db_table = 'software'

class Equipo(models.Model):
    id_hardware_periferico = models.AutoField(primary_key=True)
    nombre_hardware_periferico = models.IntegerField()
    marca = models.ForeignKey(Marca, models.DO_NOTHING, db_column='marca', blank=True, null=True)
    modelo = models.CharField(max_length=25, blank=True, null=True)
    estado = models.CharField(max_length=15)
    numero_serie = models.CharField(max_length=15, blank=True, null=True)
    codigo_activo = models.CharField(max_length=12, blank=True, null=True)
    descripcion = models.CharField(max_length=50, blank=True, null=True)
    date_inicio_cargo_hp = models.DateField()
    date_final_cargo_hp = models.DateField(blank=True, null=True)
    dni_empleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='dni_empleado')

    class Meta:
        managed = False
        db_table = 'harware_perifericos_otros'

    

class Estabilizador(models.Model):
    id_hardware_regulador = models.AutoField(primary_key=True)
    marca_hardware_regulador = models.ForeignKey(Marca, models.DO_NOTHING, db_column='marca_hardware_regulador')
    potencia_watts = models.CharField(max_length=10, blank=True, null=True)
    potencia_voltaje = models.CharField(max_length=10, blank=True, null=True)
    tipo_hardware_regulador = models.CharField(max_length=13)
    numero_serie = models.CharField(max_length=15, blank=True, null=True)
    codigo_activo = models.CharField(max_length=12, blank=True, null=True)
    estado = models.CharField(max_length=15)
    date_inicio_cargo_hr = models.DateField()
    date_final_cargo_hr = models.DateField(blank=True, null=True)
    dni_empleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='dni_empleado')

    class Meta:
        managed = False
        db_table = 'hardware_regulador_voltaje'


    def __str__(self):
        return self.tipo_hardware_regulador

class Pc(models.Model):
    id_hardware_comp = models.AutoField(primary_key=True)
    procesador = models.CharField(max_length=20)
    velocidad = models.CharField(max_length=10)
    memoria_ram = models.CharField(max_length=7)
    almacenamiento = models.CharField(max_length=7)
    tarjeta_video = models.CharField(max_length=15, blank=True, null=True)
    marca = models.ForeignKey(Marca, models.DO_NOTHING, db_column='marca')
    tipo_hardware_comp = models.CharField(max_length=8)
    numero_serie = models.CharField(max_length=15, blank=True, null=True)
    modelo = models.CharField(max_length=15, blank=True, null=True)
    codigo_activo = models.CharField(max_length=12, blank=True, null=True)
    sistema_operativo = models.CharField(max_length=11)
    estado = models.CharField(max_length=7, blank=True, null=True)
    date_inicio_cargo_hc = models.DateField(blank=True, null=True)
    date_final_cargo_hc = models.DateField(blank=True, null=True)
    dni_empleado = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='dni_empleado')

    class Meta:
        managed = False
        db_table = 'hardware_computadora'

    
    def __str__(self):
        return str(self.id_hardware_comp)+" "+str(self.procesador)+" "+str(self.dni_empleado)
