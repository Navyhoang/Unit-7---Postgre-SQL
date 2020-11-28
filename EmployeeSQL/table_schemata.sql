-- Create 6 tables and import provided CSVs
CREATE TABLE titles (

		title_id VARCHAR(100) PRIMARY KEY NOT NULL,
		title VARCHAR(100) NOT NULL
);

CREATE TABLE employees (

		emp_no INT PRIMARY KEY NOT NULL,
		emp_title VARCHAR(100) NOT NULL ,
		birthday VARCHAR(100) NOT NULL,
		first_name VARCHAR(100) NOT NULL,
		last_name VARCHAR(100) NOT NULL,
		sex VARCHAR(100) NOT NULL,
		hire_date VARCHAR(100) NOT NULL,
		FOREIGN KEY (emp_title) REFERENCES titles(title_id)
		
);

CREATE TABLE salaries (

		emp_no INT NOT NULL,
		salary INT NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)
		
);


CREATE TABLE departments (

		dept_no VARCHAR(100) PRIMARY KEY NOT NULL,
		dept_name VARCHAR(100) NOT NULL
);

CREATE TABLE dept_emp (

		emp_no INT NOT NULL,
		dept_no VARCHAR(100) NOT NULL,
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
		
);

-- There is a change to a column name in this table due to a mistake in naming
CREATE TABLE dept_manager (

		dept_no VARCHAR(100) NOT NULL,
		emp_no INT PRIMARY KEY NOT NULL,
		FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
		FOREIGN KEY (emp_no) REFERENCES employees(emp_no)

);