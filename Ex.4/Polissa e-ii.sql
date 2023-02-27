select Polissa.codi TipusPolissa.Nom Client.dni Client.nom Client.cognom
from Polissa Client TipusPolissa
where Client.dni=Polissa.dni_client
and polissa.id_tipus_polissa=tipus_polissa_id
and tius_polissa.nom="Viatge";