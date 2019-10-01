CREATE TABLE "public"."migrations" ("id" serial, PRIMARY KEY ("id"));
ALTER TABLE "public"."migrations" ADD COLUMN "description" text NOT NULL;
ALTER TABLE "public"."migrations" ADD COLUMN "migration_index" int4 NOT NULL;

--------------------------------------------
-- INCLUDE AND UPDATE FOR EVERY MIGRATION --
INSERT INTO "public"."migrations" ("description", "migration_index") VALUES ('Add migrations table and columns', '0');
--------------------------------------------