--문제1.평균 급여보다 적은 급여을 받는 직원은 몇 명이나 있습니까? 56
select count(*)
from employees
where  salary < (select avg(salary)
                 from employees);
                 

--문제2.
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 성(last_name)과 급여(salary)
--부서번호(department_id)를 조회하세요 단 조회결과는 급여의 내림차순으로 정렬되어 나타나야
--합니다. 11


--부서별 최고 급여 사원 출력
select employee_id, last_name, salary, department_id
from employees
where (department_id,salary) in (select department_id, max(salary)
                from employees
                group by department_id) ;

--문제3.
--각 업무(job) 별로 연봉(salary)의 총합을 구하고자 합니다. 연봉 총합이 가장 높은 업무부터
--업무명(job_title)과 연봉 총합을 조회하시오        19         

select jo.job_title,sb.su
from jobs jo ,(select job_id,sum(salary) su
                from employees
                group by job_id) sb
where jo.job_id = sb.job_id
order by sb.su desc;            

--문제4.
--자신의 부서 평균 급여보다 연봉(salary)이 많은 직원의 직원번호(employee_id), 성(last_name)과
--급여(salary)을 조회하세요
--//38명

select em.employee_id,em.last_name,em.salary
from employees em, (select department_id,avg(salary) av
                 from employees
                 group by department_id) sb
where em.department_id = sb.department_id 
      and em.salary>sb.av;

