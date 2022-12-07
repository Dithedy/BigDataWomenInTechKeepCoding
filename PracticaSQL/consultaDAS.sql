
select b.model_name, b.brand, b.company , a.fecha_compra , a.matricula , a.color , a.total_km , a.insurance_company , a.num_poliza 
from practicaDAS.vehicle a, practicaDAS.model b
where a.id_model = b.id_model 

