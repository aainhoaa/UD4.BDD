select cita.matricula cita.dia cita.hora tipus_vehicle.nom vehicle.marca client.nom
from client vehicle tipus_vehicle cita
where client.dni=vehicle.dni_client
and vehicle.matricula=cita.matricula_vehicle
and vehicle.id_tipus_vehicle=tipus_vehicle.id
and <cita.data> '25/6/2018';