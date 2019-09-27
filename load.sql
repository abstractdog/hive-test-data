CREATE TABLE IF NOT EXISTS sample_txt_tmp
(id int, desc string, name varchar(50), category int, price1 float, price2 double, vat decimal, region varchar (100), department varchar (100), ratio decimal) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
stored as textfile;
LOAD DATA INPATH '/tmp/sample.csv' OVERWRITE INTO TABLE sample_txt_tmp;


CREATE TABLE IF NOT EXISTS sample_orc_tmp
(id int, desc string, name varchar(50), category int, price1 float, price2 double, vat decimal, region varchar (100), department varchar (100), ratio decimal) 
STORED AS ORC;
INSERT INTO TABLE sample_orc_tmp SELECT * FROM sample_txt_tmp;

CREATE TABLE IF NOT EXISTS sample
(id int, desc string, name varchar(50), category int, price1 float, price2 double, vat decimal, department varchar (100), ratio decimal)
PARTITIONED BY (region varchar (100))
CLUSTERED BY (department) INTO 32 BUCKETS
STORED AS ORC;

set hive.exec.dynamic.partition.mode=nonstrict;
INSERT INTO sample PARTITION (region) SELECT id, desc, name, category, price1, price2, vat, department, ratio, region FROM sample_orc_tmp;

