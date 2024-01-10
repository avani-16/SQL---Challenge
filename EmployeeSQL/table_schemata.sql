-- Create titles table
CREATE TABLE titles(
	title_id VARCHAR PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);

-- Create employees table
CREATE TABLE employees(
    emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30) NOT NULL,
	sex VARCHAR(1),
	hire_date DATE NOT NULL,	
	FOREIGN KEY(emp_title_id) REFERENCES titles (title_id)
);

-- Create departments table
CREATE TABLE departments(
	dept_no VARCHAR(8) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

-- Create department employee table
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	dept_no VARCHAR(8) NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

-- Create department manager table
CREATE TABLE dept_manager(
	dept_no VARCHAR(8) NOT NULL,
	emp_no INTEGER NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY(dept_no) REFERENCES departments (dept_no)
);

-- Create salaries table
CREATE TABLE salaries(
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	FOREIGN KEY(emp_no) REFERENCES employees (emp_no)
);