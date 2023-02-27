select passatgers.dni passatgers.nom passatgers.cognom vol.numero vol.origen vol.desti reserva.import 
from passatgers reserves vol
where passatgers.dni=reserves .dni_passatgers
and reserves.id="29-3-2003";