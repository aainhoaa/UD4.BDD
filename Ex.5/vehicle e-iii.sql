select *
from client vehicle tipus_vehicle cita
where client.dni=vehicle.dni_client
and vehicle.id_tipus_vehicle=tipus_vehicle.id
and vehicle.matricula=cita.matricula_vehicle;