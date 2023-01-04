create schema practicasql_das authorization eqfztpbo;

-- Creamos las tablas con sus Primary keys

create table practicasql_das.vehicle(
	id_vehicle integer not null primary key, -- PK
	id_model integer not null, -- FK1.
	id_insurance_company integer not null, --FK
	num_poliza integer not null,
	id_color varchar  (20) not null,
	matricula varchar (10) null,
	total_km integer null,
	fecha_compra date not null,
	fecha_baja date null,
	description varchar(200) null
);

create table practicasql_das.color(
	id_color varchar (10) not null primary key
);

create table practicasql_das.insurance_company(
	id_insurance_company integer not null primary key,
	name_company varchar (50) not null
);

create table practicasql_das.car_group(
	id_group integer not null primary key, --PK
	name_group varchar (50) not null,
	description varchar (200) null

);

create table practicasql_das.brand(
	id_brand integer not null primary key, --PK
	name_brand varchar (50) not null,
	id_group integer not null, --FK.
	description varchar (200) null

);

create table practicasql_das.model(
	id_model integer not null primary key, -- PK
	model_name varchar (20) not null,
	id_brand integer not null,--FK.
	description varchar (200) null
);

create table practicasql_das.currency(
	id_currency varchar (5) not null primary key, --PK
	name_currency varchar (20) not null,
	descripcion varchar (200) null
);

create table practicasql_das.revisions(
	id_revision integer not null primary key, --PK
	revision_date date not null,
	id_vehicle integer not null, -- PK, FK1.
	km_revision integer not null,
	price numeric(6,2) not null,
	currency varchar (5) not null, -- FK2.
	description varchar (200) null
);



--- Creaos las FK

alter table practicasql_das.vehicle 
add constraint vehicles_model_FK foreign key (id_model)
references practicasql_das.model (id_model);

alter table practicasql_das.vehicle
add constraint vehicles_insurance_FK foreign key (id_insurance_company)
references practicasql_das.insurance_company (id_insurance_company);

alter table practicasql_das.revisions 
add constraint revisions_vehicle_FK foreign key (id_vehicle)
references practicasql_das.vehicle (id_vehicle);

alter table practicasql_das.revisions 
add constraint revisions_currency_FK foreign key (currency)
references practicasql_das.currency (id_currency);

alter table practicasql_das.model
add constraint model_brand_FK foreign key (id_brand)
references practicasql_das.brand (id_brand);

alter table practicasql_das.brand
add constraint brand_group_FK foreign key (id_group)
references practicasql_das.car_group (id_group);

-- Datos tabla car_group
insert into practicasql_das.car_group (id_group, name_group) 
values (1, 'Groupe Renault');
values (2, 'Mercedes-Benz Group');
values (3, 'Hyunday Motor Group');
values (4, 'Grupo Stellantis');
values (5, 'Grupo Volskwagen');
values (6, 'Grupo Ford');


--- Datos tabla brand
insert into practicasql_das.brand (id_brand, name_brand, id_group) 
values (1, 'Renault', 1);
values (2, 'Mercedes', 2);
values (3, 'Hyunday', 3);
values (4, 'Peugeot', 4);
values (5, 'Volkswagen', 5);
values (6, 'Seat', 5);
values (7, 'Audi', 5);
values (8, 'Ford', 6);



--- Datos tabla model

insert into practicasql_das.model (id_model, model_name, id_brand) 
values (1, 'Scenic', 1);
values (2, 'Clase A', 2);
values (3, 'Santa Fe', 3);
values (4, '308', 4);
values (5, 'Tiguan', 5);
values (6, 'Arona', 6);
values (7, 'Ibiza', 6);
values (8, 'Polo', 5);
values (9, 'Clase C', 2);
values (10, 'Nuevo Taigo', 5);

--- Datos tabla color

insert into practicasql_das.color (id_color) 
values ('green');
values ('red');
values ('blue');
values ('silver');
values ('white');
values ('black');
values ('gold');

--- Datos tabla insurance_company
insert into practicasql_das.insurance_company (id_insurance_company, name_company) 
values (1, 'mafre');
values (2, 'axa');
values (3, 'mutua madrileña');
values (4, 'genesis');
values (5, 'pelayo');

--- Datos currency
insert into practicasql_das.currency (id_currency, name_currency) 
values ('EUR', 'euro');
values ('USD', 'dolar');
values ('TRY', 'turikish lira');
values ('GBP', 'pound');
values ('CNY', 'yuan');
values ('JPY', 'yen');

--- Datos tabla vehicle
insert into practicasql_das.vehicle (id_vehicle, id_model, id_insurance_company, num_poliza, id_color, matricula, total_km, fecha_compra) 
values (1, 2, 1, 9748128, 'red', '8765MKJ', 0, '2022-12-03');
values (2, 10, 1, 7492746, 'blue', '2309POG', 875433, '2017-08-22', '2020-03-01');
values (3, 3, 3, 7400826, 'blue', '0754SXY', 764, '2022-10-17');
values (4, 1, 4, 1654320, 'silver', '9871YTG', 346790, '2018-05-08');
values (5, 4, 5, 9763210, 'black', '9648HUY', 108876, '2021-11-11');
values (6, 7, 1, 7655211, 'black', '7620BHN', 98655, '2020-06-23');
values (7, 5, 4, 3090062, 'white', '3297ACT', 98765, '2020-06-22');
values (8, 8, 3, 2081932, 'red', '2946LMH', 245790, '2018-10-28');
values (9, 6, 3, 1109837, 'blue', '7543TGB', 309872, '2019-01-30');
values (10, 9, 1, 8293749, 'silver', '3468CNO', 455, '2022-07-30');



-- Datos revisions
insert into practicasql_das.revisions (id_revision, revision_date, id_vehicle, km_revision, price, currency) 
values (43344, '2022-04-30', 2, 50736, 2000.45, 'CNY');
values (43697, '2022-10-12', 2, 179376, 203.98, 'EUR');
values (44085, '2022-11-15', 2, 289376, 300.12, 'TRY');
values (44418, '2020-02-24', 2, 497633, 320.09, 'EUR');
values (44796, '2021-08-23', 2, 809002, 280.45, 'EUR');
values (43605, '2022-01-27', 4, 90736, 300.99, 'EUR');
values (43997, '2022-06-13', 4, 208761, 403.98, 'GBP');
values (44348, '2022-05-17', 4, 290182, 421.75, 'EUR');
values (44711, '2019-02-19', 4, 309711, 129.75, 'EUR');
values (44885, '2022-03-20', 5, 100376, 320.65, 'EUR');
values (44358, '2021-12-20', 6, 43972, 302.43, 'EUR');
values (44732, '2022-11-04', 6, 87299, 481.87, 'GBP');
values (44398, '2021-09-07', 7, 59820, 2780.00, 'CNY');
values (44717, '2020-01-02', 7, 90743, 387.87, 'EUR');
values (43748, '2020-09-06', 8, 70023, 398.43, 'EUR');
values (44135, '2021-07-05', 8, 109726, 203.00, 'GBP');
values (44471, '2022-08-01', 8, 120387, 197.90, 'EUR');
values (44849, '2022-06-06', 8, 230887, 305.12, 'EUR');
values (43847, '2022-05-04', 9, 109374, 4810.53, 'JPY');
values (44239, '2022-03-11', 9, 203861, 320.99, 'TRY');
values (44596, '2022-01-18', 9, 300762, 387.94, 'EUR');

