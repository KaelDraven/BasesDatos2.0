create table usuario (id integer, nombre varchar2(40),sueldo_base float,
constraint pk_id primary key(id));
/
 CREATE TABLE respaldo_usuarioinicial
  (
    id     INTEGER,
    nombre VARCHAR2(20),
sueldo_base float
);
/
create or replace procedure elcontador(numero out integer)
as
begin
select count(*) into numero from usuario;
end;
/
create or replace procedure respaldo
as
cursor curso_usuario is select * from usuario;
begin 
for fila in curso_usuario loop
insert into respaldo_usuarioinicial values(fila.id, fila.nombre,fila.sueldo_base);
end loop;
end;
/
create or replace trigger disp_usuario before insert on usuario for each row
declare
contador integer;
begin
elcontador(contador);
if contador =3 then
respaldo();
delete from usuario;
end if;
end;
/
insert into usuario values(1,'paco',110.50);
insert into usuario values(2,'pancho',120.50);
insert into usuario values(3,'jesus',100.50);
insert into usuario values(4,'jessica',200.50);
insert into usuario values(5,'joana',220.50);
insert into usuario values(6,'paty',210.50);
insert into usuario values(7,'petra',250.50);

/
select * from usuario;
select * from respaldo_usuarioinicial;
