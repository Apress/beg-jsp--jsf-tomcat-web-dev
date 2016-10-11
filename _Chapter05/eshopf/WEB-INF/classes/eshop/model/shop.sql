drop database shop;
create database shop;
create table shop.categories (
  category_id integer not null auto_increment unique,
  category_name varchar(70),
  primary key (category_id)
  );
create table shop.order_details (
  id integer not null auto_increment unique,
  book_id integer,
  title varchar(70),
  author varchar(70),
  quantity integer,
  price double precision,
  order_id double precision,
  primary key (id)
  );
create table shop.orders (
  order_id double precision not null auto_increment unique,
  delivery_name varchar(70),
  delivery_address varchar(70),
  cc_name varchar(70),
  cc_number varchar(32),
  cc_expiry varchar(20),
  primary key (order_id)
  );
create table shop.books (
  book_id integer not null auto_increment unique,
  title varchar(70),
  author varchar(70),
  price double precision,
  category_id integer,
  primary key (book_id)
  );
create index category_id_key on shop.categories (category_id);
create index order_details_id_key on shop.order_details (id);
alter table shop.order_details add index order_id (order_id),
  add constraint order_id foreign key (order_id)
  references shop.orders (order_id)
  ;
create index order_id_key on shop.orders (order_id);
create index book_id_key on shop.books (book_id);
alter table shop.books add index category_id (category_id),
  add constraint category_id foreign key (category_id)
  references shop.categories (category_id)
  ;

/*-------------------- Populate --------------------*/
USE shop;
INSERT INTO categories (
    category_id
  , category_name
  )
  VALUES
    (1,'Web Development')
  , (2,'SF')
  , (3,'Action Novels')
  ;
INSERT INTO books (
    book_id
  , title
  , author
  , price
  , category_id
  )
  VALUES
    (1,'Pro CSS and HTML Design Patterns','Michael Bowers',44.99,1)
  , (2,'Pro PayPal E-Commerce','Damon Williams',59.99,1)
  , (3,'The Complete Robot','Isaac Asimov',8.95,2)
  , (4,'Foundation','Isaac Asimov',8.95,2)
  , (5,'Area 7','Matthew Reilly',5.99,3)
  , (6,'Term Limits','Vince Flynn',6.99,3)
  ;
