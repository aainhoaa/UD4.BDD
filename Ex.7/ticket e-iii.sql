select count(linia_ticket)as "21"
from linia_ticket ticket venedor
where venedor.dni=ticket.dni_venedor
and ticket.id=linia_ticket.id_ticket
and venedor.nom like "o%"
and ticket.data <"18-1-1023";