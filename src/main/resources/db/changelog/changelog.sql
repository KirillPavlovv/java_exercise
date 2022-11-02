--liquibase formatted sql
--changeset java:202210291219

CREATE EXTENSION ltree;

CREATE TABLE sectors
(
    id        SERIAL PRIMARY KEY,
    parent_id integer,
    name      TEXT NOT NULL ,
    path      ltree NOT NULL
);

CREATE INDEX path_gist_idx ON sectors USING GIST (path);

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('1', 0, 'Manufacturing', 'Manufacturing');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('19', '1', 'Construction materials', 'Manufacturing.Construction');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('18', '1', 'Electronics and Optics', 'Manufacturing.Electronics');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('6', '1', 'Food and Beverage', 'Manufacturing.Food');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('342', '6', 'Bakery & confectionery products', 'Manufacturing.Food.Bakery');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('43', '6', 'Beverages', 'Manufacturing.Food.Beverages');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('42', '6', 'Fish & fish products', 'Manufacturing.Food.Fish');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('40', '6', 'Meat & meat products', 'Manufacturing.Food.Meat');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('39', '6', 'Milk & dairy products', 'Manufacturing.Food.Milk');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('437', '6', 'Other', 'Manufacturing.Food.Other');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('378', '6', 'Sweets & snack food', 'Manufacturing.Food.Sweets');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('13', '1', 'Furniture', 'Manufacturing.Furniture');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('389', '13', 'Bathroom/sauna', 'Manufacturing.Furniture.Bathroom');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('385', '13', 'Bedroom', 'Manufacturing.Furniture.Bedroom');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('390', '13', 'Children’s room', 'Manufacturing.Furniture.Childrens');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('98', '13', 'Kitchen', 'Manufacturing.Furniture.Kitchen');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('101', '13', 'Living room', 'Manufacturing.Furniture.Living');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('392', '13', 'Office', 'Manufacturing.Furniture.Office');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('394', '13', 'Other (Furniture)', 'Manufacturing.Furniture.Other');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('341', '13', 'Outdoor', 'Manufacturing.Furniture.Outdoor');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('99', '13', 'Project furniture', 'Manufacturing.Furniture.Project');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('12', '1', 'Machinery', 'Manufacturing.Machinery');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('94', '12', 'Machinery components', 'Manufacturing.Machinery.Components');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('91', '12', 'Machinery equipment', 'Manufacturing.Machinery.Equipment');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('224', '12', 'Manufacture of machinery', 'Manufacturing.Machinery.Manufacture');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('97', '12', 'Maritime', 'Manufacturing.Machinery.Maritime');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('271', '97', 'Aluminium and steel workboats', 'Manufacturing.Machinery.Maritime.Aluminium_workboats');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('269', '97', 'Boat/Yacht building', 'Manufacturing.Machinery.Maritime.Boat_building');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('230', '97', 'Ship repair and conversion', 'Manufacturing.Machinery.Maritime.Ship_repair');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('93', '12', 'Metal structures', 'Manufacturing.Machinery.Metal_structures');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('508', '12', 'Other', 'Manufacturing.Machinery.Other');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('227', '12', 'Repair and maintenance service', 'Manufacturing.Machinery.Repair_and_maintenance_service');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('11', '1', 'Metalworking', 'Manufacturing.Metalworking');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('67', '11', 'Construction of metal structures',
        'Manufacturing.Metalworking.Construction_of_metal_structures');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('263', '11', 'Houses and buildings', 'Manufacturing.Metalworking.Houses_and_buildings');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('267', '11', 'Metal products', 'Manufacturing.Metalworking.Metal_products');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('542', '11', 'Metal works', 'Manufacturing.Metalworking.Metal_works');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('75', '542', 'CNC-machining', 'Manufacturing.Metalworking.Metal_works.CNC');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('62', '542', 'Forgings, Fasteners', 'Manufacturing.Metalworking.Metal_works.Forgings');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('69', '542', 'Gas, Plasma, Laser cutting',
        'Manufacturing.Metalworking.Metal_works.Gas_Plasma_Laser_cutting');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('66', '542', 'MIG, TIG, Aluminum welding',
        'Manufacturing.Metalworking.Metal_works.MIG_TIG_Aluminum_welding');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('9', '1', 'Plastic and Rubber', 'Manufacturing.Plastic_and_Rubber');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('54', '9', 'Packaging', 'Manufacturing.Plastic_and_Rubber.Packaging');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('556', '9', 'Plastic goods', 'Manufacturing.Plastic_and_Rubber.Plastic_goods');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('559', '9', 'Plastic processing technology',
        'Manufacturing.Plastic_and_Rubber.Plastic_processing_technology');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('55', '559', 'Blowing', 'Manufacturing.Plastic_and_Rubber.Plastic_processing_technology.Blowing');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('57', '559', 'Moulding', 'Manufacturing.Plastic_and_Rubber.Plastic_processing_technology.Moulding');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('53', '559', 'Plastics welding and processing',
        'Manufacturing.Plastic_and_Rubber.Plastic_processing_technology.Plastics_welding_and_processing');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('560', '9', 'Plastic profiles', 'Manufacturing.Plastic_and_Rubber.Plastic_profiles');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('5', '1', 'Printing', 'Manufacturing.Printing');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('148', '5', 'Advertising', 'Manufacturing.Printing.Advertising');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('150', '5', 'Book/Periodicals printing', 'Manufacturing.Printing.Book_Periodicals_printing');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('145', '5', 'Labelling and packaging printing', 'Manufacturing.Printing.Labelling_and_packaging_printing');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('7', '1', 'Textile and Clothing', 'Manufacturing.Textile_and_Clothing');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('44', '7', 'Clothing', 'Manufacturing.Textile_and_Clothing.Clothing');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('45', '7', 'Textile', 'Manufacturing.Textile_and_Clothing.Textile');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('8', '1', 'Wood', 'Manufacturing.Wood');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('337', '8', 'Other (Wood)', 'Manufacturing.Wood.Other');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('51', '8', 'Wooden building materials', 'Manufacturing.Wood.Wooden_building_materials');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('47', '8', 'Wooden houses', 'Manufacturing.Wood.Wooden_houses');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('3', 0, 'Other', 'Other');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('37', '3', 'Creative industries', 'Other.Creative_industries');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('29', '3', 'Energy technology', 'Other.Energy_technology');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('33', '3', 'Environment', 'Other.Environment');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('2', 0, 'Service', 'Service');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('25', '2', 'Business services', 'Service.Business_services');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('35', '2', 'Engineering', 'Service.Engineering');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('28', '2', 'Information Technology and Telecommunications',
        'Service.Information_Technology_and_Telecommunications');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('581', '28', 'Data processing, Web portals, E-marketing',
        'Service.Information_Technology_and_Telecommunications.Data_processing_Web_portals');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('576', '28', 'Programming, Consultancy',
        'Service.Information_Technology_and_Telecommunications.Programming_Consultancy');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('121', '28', 'Software, Hardware',
        'Service.Information_Technology_and_Telecommunications.Software_Hardware');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('122', '28', 'Telecommunications',
        'Service.Information_Technology_and_Telecommunications.Telecommunications');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('22', '2', 'Tourism', 'Service.Tourism');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('141', '2', 'Translation services', 'Service.Translation_services');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('21', '2', 'Transport and Logistics', 'Service.Transport_and_Logistics');

INSERT INTO sectors (id, parent_id, name, path)
VALUES ('111', '21', 'Air', 'Service.Transport_and_Logistics.Air');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('114', '21', 'Rail', 'Service.Transport_and_Logistics.Rail');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('112', '21', 'Road', 'Service.Transport_and_Logistics.Road');
INSERT INTO sectors (id, parent_id, name, path)
VALUES ('113', '21', 'Water', 'Service.Transport_and_Logistics.Water');


--changeset java:202210292150

CREATE TABLE persons
(
    id         SERIAL PRIMARY KEY,
    name       TEXT NOT NULL ,
    sector_ids integer ARRAY[5] NOT NULL ,
    is_agree   boolean NOT NULL
);
