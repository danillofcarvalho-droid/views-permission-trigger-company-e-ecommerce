use company;

-- Número de empregados por departamento e localidade
create view vw_empregados_departamento_local as
select 
    d.Dname as departamento,
    dl.Dlocation as localidade,
    COUNT(e.Ssn) as total_empregados
from departament d
join dept_locations dl 
    on d.Dnumber = dl.Dnumber
left join employee e 
    on d.Dnumber = e.Dno
group by d.Dname, dl.Dlocation;

-- Lista de departamentos e seus gerentes
create view vw_departamentos_gerentes as
select 
    d.Dname as departamento,
    concat(e.Fname, ' ', e.Lname) as gerente
from departament d
left join employee e
    on d.Mgr_ssn = e.Ssn;
    
-- Projetos com maior número de empregados
create view vw_projetos_maior_numero_empregados as
select 
    p.Pname as projeto,
    COUNT(w.Essn) as total_empregados
from project p
join works_on w
    on p.Pnumber = w.Pno
group by p.Pname
order by total_empregados desc;

-- Lista de projetos, departamentos e gerentes
create view vw_projetos_departamentos_gerentes as
select 
    p.Pname as projeto,
    d.Dname as departamento,
    CONCAT(e.Fname,' ',e.Lname) as gerente
from project p
join departament d
    on p.Dnum = d.Dnumber
left join  employee e
    on d.Mgr_ssn = e.Ssn;
    
-- Quais empregados possuem dependentes e se são gerentes 
create view vw_empregados_dependentes_gerentes as
select 
    concat(e.Fname,' ',e.Lname) as empregado,
    count(dep.Dependent_name) as total_dependentes,
    case
        when e.Ssn in (select Mgr_ssn from departament)
        then 'Sim'
        else 'Não'
    end as  gerente
from employee e
left join dependent dep
    on e.Ssn = dep.Essn
group by e.Ssn;


-- Atualização de salário base de colaboradores
create table salary_history (
    employee_id char(9),
    old_salary decimal(10,2),
    new_salary decimal (10,2),
    update_date timestamp default current_timestamp
);

DELIMITER $$

create trigger trg_before_update_salary
before update on employee
for each row
begin

if old.Salary <> new.Salary then

insert into salary_history(employee_id, old_salary, new_salary)
values (OLD.Ssn, OLD.Salary, NEW.Salary);
end if;
end $$

DELIMITER ;