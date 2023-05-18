CREATE TABLE employees
(
    emp_id integer NOT NULL,
    title_id character varying(30) NOT NULL,
    birth_date character varying(30) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30)  NOT NULL,
    sex character varying(1) NOT NULL,
    hire_date character varying(30) NOT NULL,
    PRIMARY KEY (emp_id)
);

CREATE TABLE salaries
(
    emp_id integer NOT NULL,
    salary integer NOT NULL,
    PRIMARY KEY (emp_id),
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) 
);

CREATE TABLE titles
(
    title_id character varying(30) NOT NULL,
    title character varying(30) NOT NULL,
    PRIMARY KEY (title_id)
);

CREATE TABLE dept_emp
(
    id integer NOT NULL,
    emp_id integer NOT NULL,
    dept_id character varying(30) NOT NULL,
    CONSTRAINT composite_key PRIMARY KEY (id, emp_id),
    FOREIGN KEY (emp_id) REFERENCES public.employees (emp_id)
      
);

CREATE TABLE departments
(
    dept_id character varying(30) NOT NULL,
    dept_name character varying(30) NOT NULL,
    PRIMARY KEY (dept_id)
);

CREATE TABLE dept_manager
(
    id integer NOT NULL,
    dept_id character varying(30) NOT NULL,
    emp_id integer NOT NULL,
    CONSTRAINT composite_key2 PRIMARY KEY (id, dept_id),
    FOREIGN KEY (emp_id) REFERENCES employees (emp_id) 
       
);