--------------------------------------------
-- INCLUDE AND UPDATE FOR EVERY MIGRATION --
INSERT INTO "public"."migrations" ("description", "migration_index") VALUES ('Create initial table and column configuration with relationships', '1');
--------------------------------------------

CREATE TABLE "public"."users" ("id" serial, PRIMARY KEY ("id"));
CREATE TABLE "public"."locations" ("id" serial, PRIMARY KEY ("id"));
CREATE TABLE "public"."experiences" ("id" serial, PRIMARY KEY ("id"));
CREATE TABLE "public"."purchase_categories" ("id" serial, PRIMARY KEY ("id"));
CREATE TABLE "public"."purchase_types" ("id" serial, PRIMARY KEY ("id"));
CREATE TABLE "public"."purchases" ("id" serial, PRIMARY KEY ("id"));
CREATE TABLE "public"."experience_food_tags" ("id" serial, PRIMARY KEY ("id"));
CREATE TABLE "public"."experience_location_tags" ("id" serial, PRIMARY KEY ("id"));

ALTER TABLE "public"."users" ADD COLUMN "name" text NOT NULL;
ALTER TABLE "public"."users" ADD COLUMN "facebook_id" text;
ALTER TABLE "public"."users" ADD COLUMN "google_id" text;

ALTER TABLE "public"."locations" ADD COLUMN "name" text NOT NULL;
ALTER TABLE "public"."locations" ADD COLUMN "address_1" text;
ALTER TABLE "public"."locations" ADD COLUMN "address_2" text;
ALTER TABLE "public"."locations" ADD COLUMN "country" text;
ALTER TABLE "public"."locations" ADD COLUMN "google_places_id" text;
ALTER TABLE "public"."locations" ADD COLUMN "lat" text NOT NULL;
ALTER TABLE "public"."locations" ADD COLUMN "long" text NOT NULL;

ALTER TABLE "public"."experiences" ADD COLUMN "user_id" int4;
ALTER TABLE "public"."experiences" ADD COLUMN "location_id" int4;
ALTER TABLE "public"."experiences" ADD COLUMN "rank" int4;
ALTER TABLE "public"."experiences" ADD FOREIGN KEY ("user_id") REFERENCES "public"."users" ("id");
ALTER TABLE "public"."experiences" ADD FOREIGN KEY ("location_id") REFERENCES "public"."locations" ("id");

ALTER TABLE "public"."purchase_categories" ADD COLUMN "name" text NOT NULL;

ALTER TABLE "public"."purchase_types" ADD COLUMN "name" text NOT NULL;
ALTER TABLE "public"."purchase_types" ADD COLUMN "category_id" int4 NOT NULL;
ALTER TABLE "public"."purchase_types" ADD FOREIGN KEY ("category_id") REFERENCES "public"."purchase_categories" ("id");

ALTER TABLE "public"."purchases" ADD COLUMN "experience_id" int4 NOT NULL;
ALTER TABLE "public"."purchases" ADD COLUMN "name" text NOT NULL;
ALTER TABLE "public"."purchases" ADD COLUMN "description" text;
ALTER TABLE "public"."purchases" ADD COLUMN "type_id" int4;
ALTER TABLE "public"."purchases" ADD COLUMN "featured" bool;
ALTER TABLE "public"."purchases" ADD FOREIGN KEY ("experience_id") REFERENCES "public"."experiences" ("id");
ALTER TABLE "public"."purchases" ADD FOREIGN KEY ("type_id") REFERENCES "public"."purchase_types" ("id");

ALTER TABLE "public"."experience_food_tags" ADD COLUMN "experience_id" int4 NOT NULL;
ALTER TABLE "public"."experience_food_tags" ADD COLUMN "tag_name" text NOT NULL;
ALTER TABLE "public"."experience_food_tags" ADD FOREIGN KEY ("experience_id") REFERENCES "public"."experiences" ("id");

ALTER TABLE "public"."experience_location_tags" ADD COLUMN "experience_id" int4 NOT NULL;
ALTER TABLE "public"."experience_location_tags" ADD COLUMN "tag_name" text NOT NULL;
ALTER TABLE "public"."experience_location_tags" ADD FOREIGN KEY ("experience_id") REFERENCES "public"."experiences" ("id");