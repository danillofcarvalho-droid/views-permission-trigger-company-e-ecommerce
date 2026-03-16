use ecommerce;

-- Manter histórico de usuários removidos
create table clients_backup (
    idClient int,
    Fname varchar(15),
    Lname varchar(20),
    CPF char(11),
    deleted_at timestamp default current_timestamp
);

DELIMITER $$

create trigger  trg_before_delete_client
before delete on  clients
for each row
begin

insert into clients_backup (idClient, Fname, Lname, CPF)
values (old.idClient, old.Fname, old.Lname, old.CPF);
end $$

DELIMITER ;

