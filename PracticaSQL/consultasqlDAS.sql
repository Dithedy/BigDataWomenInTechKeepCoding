

select a.matricula ,  b.model_name , b2.name_brand , cg.name_group , c.id_color , a.fecha_compra , a.total_km , a.num_poliza , ic.name_company 
from practicasql_das.vehicle a, practicasql_das.model b, practicasql_das.brand b2 , practicasql_das.car_group cg , practicasql_das.insurance_company ic, practicasql_das.color c  
where a.id_model = b.id_model and a.id_insurance_company = ic.id_insurance_company and a.id_color = c.id_color and b.id_brand = b2.id_brand and b2.id_group = cg.id_group;

