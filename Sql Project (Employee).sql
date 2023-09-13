--Q1: Number of Total Employees

select count(employee_count) from hrdata

--Q2: Number of employees in High School
select count(employee_count) from hrdata
where education = 'High School'


--Q3: Number of employees in sales department
select count(employee_count) from hrdata
where department = 'sales'



--Q4: Number of Employees left the job
select count(attrition) from hrdata
where attrition = 'Yes'

--Q5: Employees in the Medical education field

select count(employee_count) as employeeCountMedical from hrdata
where education_field = 'Medical'

--Q6: Number of people left the job and have the doctoral degree

select count(attrition) as doctoraldegreeattrition from hrdata 
where attrition = 'Yes' and education = 'doctoral degree'



--Q7: Number of people left the job from R&D department whose education field is medical


select count(attrition) as AttritionDepRandD from hrdata 
where attrition = 'Yes' and department = 'R&D' and education_field = 'medical'


--Q8: Number of people left the job from R&D department whose education field is medical and education is High School

select count(attrition) as MultipleCategoryAttrition from hrdata 
where attrition = 'Yes' and department = 'R&D' 
and education = 'High School' 
and education_field = 'Medical'


-- Q9: Total Number of Active Employees

select count(active_employee) as ActiveEmployees
from hrdata
where active_employee = '1' 


--OR

select count(employee_count) - (select count(attrition) from hrdata where attrition = 'Yes')
as ActiveEmployees
from hrdata


--Q10: Number of Active male Employees


 
 select count(employee_count) - (select count(attrition) from hrdata where attrition = 'Yes' and gender = 'Male')
as MaleActiveEmployees
from hrdata where gender = 'Male'

--Q11: Average age of employees

select avg(age) as AvgAge from hrdata 

--alter table hrdata
--alter column age int


--Q12: Attrition by Gender



select gender, count(attrition) as AttritionByGender from hrdata
where attrition = 'Yes'
group by gender
order by count(attrition) desc



--Q13: Attrition of High School By Gender 


select gender, count(attrition) as AttritionByGender from hrdata
where attrition = 'Yes' and education = 'High School'
group by gender
order by count(attrition) desc


--Q14: Department wise attrition

select department, count(attrition) as DepartmentWiseAttrition from hrdata
where attrition = 'Yes'
group by department
order by count(attrition) desc


--Q15: Percentage of Attrition by Department


select department, count(attrition),
(cast(count(attrition) as numeric)  / (select count(attrition) from hrdata where attrition = 'Yes'))* 100 as percentage from hrdata
where attrition = 'Yes' 
group by department
order by count(attrition) desc


--Q16: Percentage of Attrition by Department for female only

select department, count(attrition),
(cast(count(attrition) as numeric)  / (select count(attrition) from hrdata where attrition = 'Yes' and gender = 'Female'))* 100 as Femalepercentage from hrdata
where attrition = 'Yes' and gender = 'Female'
group by department
order by count(attrition) desc



--Q17: Age Bracket of Employees


select age, count( employee_count) as EmployeeAgeBracket from hrdata
group by age
order by age

--Q18: Age Bracket of employees in R&D department

select age, count( employee_count) as EmployeeAgeBracket from hrdata
where department = 'R&D'
group by age
order by age

--Q19: Age Bracket of Employees per department individually

select age, department, count(employee_count) as EmployeeAgeBracket from hrdata
group by age,department
order by age,department

--Q20: Attrition by Education Field


select education_field, count(attrition) as AttritionPerEducationField from hrdata
where attrition = 'Yes'
group by education_field
order by count(attrition) desc



--Q21: Attrition on the bases of gender and age_ band



select age_band, gender, count(attrition) as Attrition from hrdata
where attrition = 'Yes'
group by age_band, gender
order by age_band, gender
