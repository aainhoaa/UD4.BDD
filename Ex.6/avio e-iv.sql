select reserves.id passatgers.nom
from passatgers vol reserves
where passatgers.dni=reserves.dni_passatgers
and reserves.id_vol=vol.id vol.data="18-2-2023";