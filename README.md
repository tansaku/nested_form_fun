Nested Form Fun
===============

Based on http://stackoverflow.com/questions/18575039/how-can-i-use-accepts-nested-attributes-with-the-habtm we want to see if https://github.com/gabrielhilal/nested_form will support nested forms where relations are both created and destroyed.

Used the following to generate this

```
rails new nested_form_test
rails g scaffold Category name:string
rails g scaffold Organisation name:string
rails g model CategoryOrganisations organisation:references category:references
rake db:create
rake db:migrate
```

to support the following:

```
→ rails c
Loading development environment (Rails 4.2.2)
2.2.2 :001 > o = Organisation.create name: 'test'
   (0.1ms)  begin transaction
  SQL (0.5ms)  INSERT INTO "organisations" ("name", "created_at", "updated_at") VALUES (?, ?, ?)  [["name", "test"], ["created_at", "2015-07-08 15:25:57.456736"], ["updated_at", "2015-07-08 15:25:57.456736"]]
   (0.7ms)  commit transaction
 => #<Organisation id: 2, name: "test", created_at: "2015-07-08 15:25:57", updated_at: "2015-07-08 15:25:57">
2.2.2 :002 > c = Category.create name: 'thing'
   (0.0ms)  begin transaction
  SQL (0.5ms)  INSERT INTO "categories" ("name", "created_at", "updated_at") VALUES (?, ?, ?)  [["name", "thing"], ["created_at", "2015-07-08 15:25:59.244850"], ["updated_at", "2015-07-08 15:25:59.244850"]]
   (0.7ms)  commit transaction
 => #<Category id: 2, name: "thing", created_at: "2015-07-08 15:25:59", updated_at: "2015-07-08 15:25:59">
2.2.2 :003 > o.categories << c
   (0.0ms)  begin transaction
  SQL (0.3ms)  INSERT INTO "category_organisations" ("organisation_id", "category_id", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["organisation_id", 2], ["category_id", 2], ["created_at", "2015-07-08 15:26:01.796829"], ["updated_at", "2015-07-08 15:26:01.796829"]]
   (0.6ms)  commit transaction
  Category Load (0.2ms)  SELECT "categories".* FROM "categories" INNER JOIN "category_organisations" ON "categories"."id" = "category_organisations"."category_id" WHERE "category_organisations"."organisation_id" = ?  [["organisation_id", 2]]
 => #<ActiveRecord::Associations::CollectionProxy [#<Category id: 2, name: "thing", created_at: "2015-07-08 15:25:59", updated_at: "2015-07-08 15:25:59">]>
2.2.2 :004 > o.categories
 => #<ActiveRecord::Associations::CollectionProxy [#<Category id: 2, name: "thing", created_at: "2015-07-08 15:25:59", updated_at: "2015-07-08 15:25:59">]>
 ```
