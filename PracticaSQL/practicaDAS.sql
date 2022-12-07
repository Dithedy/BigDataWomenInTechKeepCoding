create schema practicaDAS authorization eqfztpbo;

-- Creamos las tablas con sus Primary keys

create table practicaDAS.vehicle(
	id_vehicle integer not null primary key, -- PK
	id_model varchar (10) not null, -- FK1
	insurance_company varchar (20) not null,
	num_poliza integer not null,
	color varchar  (20) not null,
	matricula varchar (10) not null,
	total_km integer not null,
	fecha_compra date not null
);

create table practicaDAS.model(
	id_model varchar (10) not null primary key, -- PK
	model_name varchar (20) not null,
	brand varchar (20) not null,
	company varchar (20) not null
);

create table practicaDAS.revisions(
	revision_date integer not null, -- PK
	id_vehicle integer not null, -- PK, FK1
	km_revision integer not null,
	price numeric(6,2) not null,
	currency varchar (5) not null -- FK2
);

create table practicaDAS.currency(
	id_moneda varchar (5) not null primary key
);

--- Creaos las FK

alter table practicaDAS.vehicle 
add constraint vehicles_model_FK foreign key (id_model)
references practicaDAS.model (id_model);

alter table practicaDAS.revisions 
add constraint revisions_vehicle_FK foreign key (id_vehicle)
references practicaDAS.vehicle (id_vehicle);

alter table practicaDAS.revisions 
add constraint revisions_currency_FK foreign key (currency)
references practicaDAS.currency (id_moneda);


--- Datos tabla model

insert into practicaDAS.model (id_model, model_name, brand, company) 
values (1, 'Scenic', 'Renault', 'Groupe Renault');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (2, 'Clase A', 'Mercedes', 'Mercedes-Benz Group');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (3, 'Santa Fe', 'Hyunday', 'Hyunday Motor Group');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (4, '308', 'Peugeot', 'Grupo Stellantis');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (5, 'Tiguan', 'Volkswagen', 'Grupo Volskwagen');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (6, 'Arona', 'Seat', 'Grupo Volskwagen');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (7, 'Ibiza', 'Seat', 'Grupo Volskwagen');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (8, 'Polo', 'Volkswagen', 'Grupo Volskwagen');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (9, 'Clase C', 'Mercedes', 'Mercedes-Benz Group');
insert into practicaDAS.model (id_model, model_name, brand, company) 
values (10, 'Nuevo Taigo', 'Volkswagen', 'Grupo Volskwagen');

--- Datos tabla vehicle
insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (1, 2, 'mafre', 9748128, 'red', '8765MKJ', 0, '2022-12-03');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (2, 10, 'mafre', 7492746, 'blue', '2309POG', 875433, '2017-08-22');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (3, 3, 'mutua madrileña', 7400826, 'blue', '0754SXY', 764, '2022-10-17');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (4, 1, 'genesis', 1654320, 'silver', '9871YTG', 346790, '2018-05-08');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (5, 4, 'pelayo', 9763210, 'black', '9648HUY', 108876, '2021-11-11');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (6, 7, 'mafre', 7655211, 'black', '7620BHN', 98655, '2020-06-23');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (7, 5, 'genesis', 3090062, 'white', '3297ACT', 98765, '2020-06-22');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (8, 8, 'mutua madrileña', 2081932, 'red', '2946LMH', 245790, '2018-10-28');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (9, 6, 'mutua madrileña', 1109837, 'blue', '7543TGB', 309872, '2019-01-30');insert into practicaDAS.vehicle (id_vehicle, id_model, insurance_company, num_poliza, color, matricula, total_km, fecha_compra) 
values (10, 9, 'mafre', 8293749, 'silver', '3468CNO', 455, '2022-07-30');

--- Datos currency
insert into practicaDAS.currency (id_moneda)
values ('EUR');insert into practicaDAS.currency (id_moneda)
values ('USD');insert into practicaDAS.currency (id_moneda)
values ('TRY');insert into practicaDAS.currency (id_moneda)
values ('GBP');insert into practicaDAS.currency (id_moneda)
values ('CNY');insert into practicaDAS.currency (id_moneda)
values ('JPY');

-- Datos revisions
insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (43344, 2, 50736, 2000.45, 'CNY');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (43697, 2, 179376, 203.98, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44085, 2, 289376, 300.12, 'TRY');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44418, 2, 497633, 320.09, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44796, 2, 809002, 280.45, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (43605, 4, 90736, 300.99, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (43997, 4, 208761, 403.98, 'GBP');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44348, 4, 290182, 421.75, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44711, 4, 309711, 129.75, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44885, 5, 100376, 320.65, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44358, 6, 43972, 302.43, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44732, 6, 87299, 481.87, 'GBP');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44358, 7, 59820, 2780.00, 'CNY');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44717, 7, 90743, 387.87, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (43748, 8, 70023, 398.43, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44135, 8, 109726, 203.00, 'GBP');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44471, 8, 120387, 197.90, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44849, 8, 230887, 305.12, 'EUR');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (43847, 9, 109374, 4810.53, 'JPY');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44239, 9, 203861, 320.99, 'TRY');insert into practicaDAS.revisions (revision_date, id_vehicle, km_revision, price, currency) 
values (44596, 9, 300762, 387.94, 'EUR');


