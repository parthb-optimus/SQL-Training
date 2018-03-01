SELECT  CONCAT(Emp_f_name,' ',Emp_m_name,' ',Emp_l_name) AS Name,
        Emp_DOB
FROM    t_emp
WHERE Emp_DOB = EOMONTH(Emp_DOB)
