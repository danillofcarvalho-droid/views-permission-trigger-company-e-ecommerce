use company;

create user 'gerente'@'localhost' identified by  '123456';
create user 'funcionario'@'localhost' identified by '123456';

grant select on company.employee to 'gerente'@'localhost';
grant select on company.departament to 'gerente'@'localhost';

grant select on company.vw_empregados_departamento_local 
to 'funcionario'@'localhost';

grant select on company.vw_projetos_maior_numero_empregados 
to 'funcionario'@'localhost';