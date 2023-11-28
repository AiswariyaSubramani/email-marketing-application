CREATE DATABASE  emailMarketing;

CREATE SCHEMA IF NOT EXISTS email;

create table if not exists email.category (category_id SERIAL primary key not null,
											category_name VARCHAR(255) unique  not null );
							
create table if not exists email.users (user_id SERIAL primary key not null,
										user_name VARCHAR(255) unique not null,
										first_name VARCHAR(255) not null,
										last_name VARCHAR(255),
										email_id VARCHAR(255) unique not null);


create table if not exists email.products (product_id SERIAL primary key not null,
											name VARCHAR(255) unique,
											category_id integer,
											category_name VARCHAR(255) ,
											FOREIGN KEY (category_id)  REFERENCES email.category(category_id),
											FOREIGN KEY (category_name) REFERENCES  email.category(category_name));



create table if not exists email.productUsers (id SERIAL primary key not null,
												product_id integer REFERENCES email.products(product_id),
												product_name VARCHAR(255) REFERENCES email.products(name),
												user_id integer REFERENCES email.users(user_id),
												user_name VARCHAR(255) REFERENCES email.users(user_name),
												email_id VARCHAR(255) REFERENCES email.users(email_id));
												
alter table email.users add column user_name VARCHAR(255) unique not null; 
