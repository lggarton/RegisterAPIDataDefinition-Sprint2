CREATE TABLE transactionentrytable (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  entryid uuid NOT NULL DEFAULT gen_random_uuid(),
  lookupcode character varying(32) NOT NULL DEFAULT(''),
  quantity int NOT NULL DEFAULT(0),
  price decimal(7,2) NOT NULL DEFAULT(0.00),
  CONSTRAINT transactionentrytable_Fkey FOREIGN KEY (id) REFERENCES transactiontable(id)
) WITH (
  OIDS=FALSE
);
