-- შექმენით ორი ცხრილი:
-- დეპარტამენტები - სახელი და ლოკაცია
-- თანამშრომლები - სახელი, ხელფასი და კავშირი დეპარტამენტებთან

-- create table departments(
-- 	department_id serial primary key,
-- 	department_name varchar(20) NOT NULL UNIQUE,
-- 	location varchar
-- );

-- create table employees (
-- 	employee_id serial primary key,
-- 	name varchar(30),
-- 	salary numeric(10, 2),
-- 	department_id int references departments(department_id) on delete cascade
-- )

-- insert into departments(department_name, location) values
-- 		('support', 'millwake'),
-- 		('legal', NULL)
-- 		('HR', 'New York'),          
--     	('IT', 'San Francisco'),     
--     	('Sales', 'Chicago'),        
--     	('Marketing', 'Los Angeles'),
--     	('Finance', 'Boston');      

-- insert into employees(name, salary, department_id) values
--  	('John Doe', 45000, 1),      
--     ('Jane Smith', 52000, 1),    
--     ('Alice Johnson', 65000, 2), 
--     ('Bob Wilson', 70000, 2),
--     ('Carol Davis', 55000, 3),   
--     ('David Brown', 48000, 3),   
--     ('Eve Garcia', 6000, 4),    
--     ('Frank Miller', 58000, 4),  
--     ('Grace Lee', 75000, 5),     
--     ('Henry Taylor', 68000, 5),  
--     ('Ivy Anderson', 50000, 2); 

-- 1: Subquery-ის გამოყენებით დაწერეთ SQL მოთხოვნა, რომელიც აბრუნებს იმ თანამშრომლების სახელებს და ხელფასებს, 
-- რომელთა ხელფასი საშუალოზე მეტია.

	-- select name, salary from employees where salary > (select avg(salary) from employees)


-- 2: Subquery-ის გამოყენებით დაწერეთ SQL მოთხოვნა, რომელიც აბრუნებს 
-- ყველა თანამშრომლის სახელს, ხელფასს და დეპარტამენტის სახელს (JOIN-ის გარეშე).
-- select department_name from departments

	-- select name, salary, 
	-- (SELECT department_name FROM departments WHERE department_id = employees.department_id) 
	-- FROM employees


-- 3: Subquery-ის გამოყენებით დაწერეთ SQL მოთხოვნა, რომელიც აბრუნებს ყველა თანამშრომელს, 
-- ვინც მუშაობს "New York"-ში(ლოკაცია) განთავსებულ დეპარტამენტებში (IN ოპერატორის გამოყენებით)

-- 1:
-- select name from employees where department_id = (select department_id from departments where location in('New York'))
-- 2:	
-- select name from employees where department_id in(select department_id from departments where location = 'New York')



-- 4: დაწერეთ SQL მოთხოვნა, რომელიც აბრუნებს მხოლოდ იმ დეპარტამენტებს, 
-- სადაც მინიმუმ ერთი თანამშრომელი მუშაობს.(გამოიყენეთ EXISTS ოპერატორი)
	-- select department_name from departments 
	-- where exists (select 1 from employees where employees.department_id = departments.department_id) 


-- 5: დაწერეთ SQL მოთხოვნა, რომელიც აბრუნებს ყველა თანამშრომელს, ვინც იმაზე მეტ ხელფასს იღებს, 
-- ვიდრე ნებისმიერი თანამშრომელი Marketing დეპარტამენტში.(გამოიყენეთ ANY ოპერატორი)

	-- select name, salary from employees 
	-- where salary > all(select salary from employees 
	-- where department_id = (select department_id from departments 
	-- where department_name = 'Marketing'))


-- 6: დაწერეთ SQL მოთხოვნა, რომელიც აბრუნებს ყველა თანამშრომელს, ვინც იმაზე მეტ ხელფასს იღებს, 
-- -- ვიდრე ნებისმიერი თანამშრომელი IT დეპარტამენტში.(გამოიყენეთ ALL ოპერატორი)
	-- select name, salary from employees 
	-- where salary >= all(select salary from employees 
	-- where department_id = (select department_id from departments 
	-- where department_name = 'IT'))
-- რადგანაც Bob ის salary არის null არ აბრუნებს


-- 7: დაწერეთ SQL მოთხოვნა, რომელიც აბრუნებს ყველა თანამშრომელს, 
-- ვინც მუშაობს "New York" ან "Los Angeles" ლოკაციებში, მაგრამ დუბლიკატების გარეშე.

	-- select distinct name from employees 
	-- where department_id IN (select department_id from departments where location like('New%')) 
	-- or
	-- department_id = (select department_id from departments where location like('Los%')) 

-- 8: დაწერეთ იგივე მოთხოვნა, მაგრამ ამჯერად UNION ALL გამოიყენეთ, რომ დუბლიკატებიც დაბრუნდეს.
	-- select name from employees 
	-- where department_id = (select department_id from departments where location like('New%')) 
	-- union all
	-- select name from employees 
	-- where department_id = (select department_id from departments where location like('Los%')) 






