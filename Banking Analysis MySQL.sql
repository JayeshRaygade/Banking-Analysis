create database banking;

select * from finance_1;
select * from finance_2;

select count(*)  from finance_1;
select count(*)  from finance_2;

-- KPI- 1
# Year wise loan amount
select YEAR(issue_d) AS Issue_Year,
	   SUM(loan_amnt) as Total_Loan_Amount       
       from finance_1
       group by year(issue_d)
       ORDER by year(issue_d);
       
-- KPI- 2
# Grade and subgrade wise Revolving Balance
SELECT finance_1.grade, 
    finance_1.sub_grade, 
    SUM(finance_2.revol_bal) AS Total_Revol_Bal
    FROM finance_1 INNER JOIN finance_2
    ON finance_1.id = finance_2.ï»¿id
    GROUP BY grade, sub_grade
    ORDER BY grade,sub_grade;

-- KPI- 3
# Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status, 
        sum(total_pymnt) as Total_Payment
        from finance_1 inner join finance_2
        on finance_1.id = finance_2.ï»¿id
        group by verification_status
        order by verification_status;
        
        
-- KPI- 4
# State wise and month wise loan status
select addr_state, 
         month(issue_d) as months,
        loan_status
        from finance_1 inner join finance_2
        on finance_1.id= finance_2.ï»¿id 
        group by addr_state, issue_d, loan_status
        order by issue_d;
 
 -- KPI- 5
# Home ownership Vs last payment date stats
select	home_ownership as Home_Owernership,
        (last_pymnt_d) as Last_Payment_Date
         from finance_1 inner join finance_2
         on finance_1.id= finance_2.ï»¿id 
         group by home_ownership, last_pymnt_d
         order by home_ownership, last_pymnt_d;

