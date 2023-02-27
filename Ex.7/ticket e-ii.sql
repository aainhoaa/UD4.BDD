select ticket.factura ticket.data ticket.hora venedor.nom
suma(linia_ticket.import_iva)
from ticket venedor producte
where ticket.dni_venedor=venedor.dni
and ticket.id=linia_ticket.id_ticket
and producte.id=linia_ticket.id_producte
and producte.codi_barres="28462";