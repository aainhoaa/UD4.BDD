select *
from polissa client TipusPolissa, venedor
where client.dni=polissa.dni_client
and polissa.id_tipus_polissa=tipus_polissa.id_polissa;