SELECT * FROM financial_loan

SELECT COUNT (id) AS Total_loan_Applications FROM financial_loan

SELECT COUNT (id) AS MTD_Total_loan_Applications FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date) = 2021

SELECT COUNT (id) AS PMTD_Total_loan_Applications FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS MTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date)= 12 AND YEAR(issue_date) = 2021

SELECT SUM(loan_amount) AS PMTD_Total_Funded_Amount FROM financial_loan
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS MTD_Total_Amount_received FROM financial_loan
WHERE MONTH(issue_date)= 12 AND YEAR(issue_date) = 2021

SELECT SUM(total_payment) AS PMTD_Total_Amount_received FROM financial_loan
WHERE MONTH(issue_date)= 11 AND YEAR(issue_date) = 2021

SELECT ROUND(AVG(int_rate),4)* 100 AS MTD_Avg_Interest_Rate FROM financial_loan
WHERE MONTH(issue_date) = 12 AND  YEAR (issue_date) =2021

SELECT ROUND(AVG(int_rate),4)* 100 AS PMTD_Avg_Interest_Rate FROM financial_loan
WHERE MONTH(issue_date) = 11 AND  YEAR (issue_date) =2021

SELECT ROUND(AVG(dti),4) * 100 AS MTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 12 AND YEAR(issue_date)=2021

SELECT ROUND(AVG(dti),4) * 100 AS PMTD_Avg_DTI FROM financial_loan
WHERE MONTH(issue_date) = 11 AND YEAR(issue_date)=2021

SELECT 
	(COUNT(CASE WHEN loan_status = 'Fully Paid' OR loan_status = 'Current' THEN id END)*100)
	/
	COUNT(id) AS Good_loan_percentage
FROM financial_loan

SELECT 
	(COUNT(CASE WHEN loan_status = 'Charged off' THEN id END)*100)
	/
	COUNT(id) AS Bad_loan_percentage
FROM financial_loan

SELECT COUNT(id) AS Good_loan_App FROM financial_loan
WHERE loan_status ='Fully Paid' OR loan_status = 'Current'

SELECT COUNT(id) AS Bad_loan_App FROM financial_loan
WHERE loan_status ='Charged off' 

SELECT SUM(loan_amount) AS Good_loan_Funded_Amount FROM financial_loan
WHERE loan_status ='Fully Paid' OR loan_status = 'Current'

SELECT SUM(loan_amount) AS Bad_loan_Funded_Amount FROM financial_loan
WHERE loan_status ='Charged off' 

SELECT SUM(total_acc) AS Good_loan_Received_Amount FROM financial_loan
WHERE loan_status ='Fully Paid' OR loan_status = 'Current'

SELECT SUM(total_payment) AS Bad_loan_Received_Amount FROM financial_loan
WHERE loan_status ='Charged off' 
SELECT
		loan_status,
		COUNT(id) AS LoanCount,
		SUM(total_payment) AS Total_Amount_Recived,
		SUM(loan_amount) AS Total_Funded_Amount,
		AVG(int_rate *100) AS Interest_Rate,
		AVG(dti * 100) AS DTI
	FROM
		financial_loan
	GROUP BY 
		loan_status
SELECT 
	loan_status,
	SUM(total_payment) AS MTD_Total_Amount_Received,
	SUM(loan_amount) AS MTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date) = 12
GROUP BY loan_status

SELECT 
	loan_status,
	SUM(total_payment) AS PMTD_Total_Amount_Received,
	SUM(loan_amount) AS PMTD_Total_Funded_Amount
FROM financial_loan
WHERE MONTH(issue_date) = 11
GROUP BY loan_status

--DASHBOARD 2

SELECT 
	MONTH(issue_date) AS Sno,
	DATENAME(MONTH, issue_date) AS Month_name ,
	COUNT(id) AS Total_Loan_ApSplications,
	SUM(loan_amount) AS Total_Funded_Amount
FROM financial_loan
GROUP BY MONTH( issue_date), DATENAME(MONTH, issue_date)
ORDER BY MONTH( issue_date)

SELECT 
	address_state,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY address_state
ORDER BY SUM(total_payment) DESC

SELECT 
	term,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY term
ORDER BY term

SELECT 
	emp_length,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY emp_length
ORDER BY emp_length

SELECT 
	purpose,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY purpose
ORDER BY purpose

SELECT 
	loan_status,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY loan_status
ORDER BY loan_status


SELECT 
	home_ownership,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY home_ownership
ORDER BY home_ownership

SELECT 
	verification_status,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY verification_status
ORDER BY verification_status

SELECT 
	grade,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY grade
ORDER BY grade


SELECT 
	sub_grade,
	COUNT(id) AS Total_loan_Applications ,
	SUM(loan_amount) AS Total_Funded_Amount,
	SUM(total_payment) AS Total_Recived_Amount
FROM financial_loan
GROUP BY sub_grade
ORDER BY sub_grade



