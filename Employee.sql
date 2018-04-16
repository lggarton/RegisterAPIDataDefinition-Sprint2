CREATE TABLE employee (
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  employeeid character varying(32) NOT NULL DEFAULT(''),
  firstname character varying(128) NOT NULL DEFAULT(''),
  lastname character varying(128) NOT NULL DEFAULT(''),
  password character varying(512) NOT NULL DEFAULT(''),
  active boolean NOT NULL DEFAULT(FALSE),
  classification int NOT NULL DEFAULT(0),
  managerid uuid NOT NULL,
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT employee_pkey PRIMARY KEY (id),
  CONSTRAINT employee_fkey FOREIGN KEY (managerid) REFERENCES employee(id)
) WITH (
  OIDS=FALSE
);

CREATE INDEX ix_employee_employeeid
  ON employee
  USING btree(employeeid);
