CREATE TABLE IF NOT EXISTS sample
(id int, desc string, name varchar(50), category int, price1 decimal, price2 decimal, vat decimal, region varchar (100), department varchar (100), ratio decimal) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
stored as textfile;
LOAD DATA LOCAL INPATH '/tmp/sample.csv' OVERWRITE INTO TABLE sample;


CREATE TABLE IF NOT EXISTS sample_orc
(id int, desc string, name varchar(50), category int, price1 decimal, price2 decimal, vat decimal, region varchar (100), department varchar (100), ratio decimal) 
STORED AS ORC;
INSERT INTO TABLE sample_orc SELECT * FROM sample;

CREATE TABLE IF NOT EXISTS sample_orc_part
(id int, desc string, name varchar(50), category int, price1 decimal, price2 decimal, vat decimal, department varchar (100), ratio decimal)
PARTITIONED BY (region varchar (100))
STORED AS ORC;

set hive.exec.dynamic.partition.mode=nonstrict;
INSERT INTO sample_orc_part PARTITION (region) SELECT id, desc, name, category, price1, price2, vat, department, ratio, region FROM sample_orc;

