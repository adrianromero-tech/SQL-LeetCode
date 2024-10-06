SELECT E2.name
FROM Employee E1
    INNER JOIN Employee E2 ON (E1.managerId = E2.id)
GROUP BY E1.managerId
HAVING COUNT(E1.id) >= 5