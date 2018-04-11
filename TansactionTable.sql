CREATE TABLE transactiontable (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  cashierid uuid NOT NULL,
  totalamount int NOT NULL DEFAULT(0),
  isrefund boolean NOT NULL DEFAULT(FALSE), --if its false then it is a new bought item
  referenceid uuid NOT NULL,
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT transactiontable_pkey PRIMARY KEY (id)
  CONSTRAINT transactiontable_Fkey1 FOREIGN KEY (cashierid) REFERENCES employee(id),
  CONSTRAINT transactiontable_Fkey2 FOREIGN KEY (referenceid) REFERENCES transactiontable(id)
) WITH (
  OIDS=FALSE
);
