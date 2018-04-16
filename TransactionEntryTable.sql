CREATE TABLE transactionentrytable (
  entryid uuid NOT NULL DEFAULT gen_random_uuid(),
  id uuid NOT NULL,
  lookupcode character varying(32) NOT NULL DEFAULT(''),
  quantity int NOT NULL DEFAULT(0),
  price decimal(7,2) NOT NULL DEFAULT(0.00),
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT transactionentrytable_pkey PRIMARY KEY (entryid),
  CONSTRAINT transactionentrytable_Fkey FOREIGN KEY (id) REFERENCES transactiontable(id)
) WITH (
  OIDS=FALSE
);

CREATE INDEX ix_transactionentrytable_lookupcode --An index on the product table lookupcode column
  ON transactionentrytable
  USING btree
  (lower(lookupcode::text) COLLATE pg_catalog."default");
