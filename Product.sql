CREATE EXTENSION pgcrypto; --Allows PostgreSQL to understand UUIDs. Only have to create the extension once for a database.

--DROP TABLE product;

CREATE TABLE product (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  lookupcode character varying(32) NOT NULL DEFAULT(''),
  quantity int NOT NULL DEFAULT(0),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  price decimal(7,2) NOT NULL DEFAULT(0.00),
  active char(3) CHECK (active in ('IS','BO','OFS')),

  CONSTRAINT product_pkey PRIMARY KEY (id)
) WITH (
  OIDS=FALSE
);

--DROP INDEX ix_product_lookupcode;

CREATE INDEX ix_product_lookupcode --An index on the product table lookupcode column
  ON product
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default"); --Index on the lower case of the lookup code. Queries for product by lookupcode should search using the lower case of the lookup code.

INSERT INTO product (lookupcode, quantity, active, price) VALUES ( --id and createdon are generated by default.
       'lookupcode1'
     , 100,
   'IS',
 9.99)
RETURNING id, createdon;

INSERT INTO product (lookupcode, count) VALUES (
       'lookupcode2'
     , 125)
RETURNING id, createdon;

INSERT INTO product (lookupcode, count) VALUES (
       'lookupcode3'
     , 150)
RETURNING id, createdon;

--SELECT * FROM product;

--DELETE FROM product;
