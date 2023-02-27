select avio.marca avio.model avio.capacitat vol.id vol.data vol.hora_sortida reserves.origen reserves.desti vol.hora_arribada
from avio vol reserves
where avio.marca="airbus"
and avio.id=vol.id_avio
and reserves.id_vol=vol.id;