        --  Homework-4_DB_sql

--1.Найти мин/стоимость товаров для каждой категории--

        SELECT
            CategoryID,
            MIN(Price) AS min_price
        FROM Products
        GROUP BY CategoryID


--2.Вывести ТОП-3 стран по количеству доставленных заказов

        SELECT
            Country,
            COUNT(*) AS total_orders
        FROM Orders
                 JOIN Shippers ON Orders.ShipperID=Shippers.ShipperID
                 JOIN Customers ON Orders.CustomerID=Customers.CustomerID
        GROUP BY Country
        ORDER BY total_orders DESC
            LIMIT 3


--3.Вывести названия категорий, в которых более 10 товаров

        SELECT
            CategoryName,
            COUNT(*) AS total_products
        FROM Products
                 JOIN Categories ON Products.CategoryID=Categories.CategoryID
        GROUP BY CategoryName
        HAVING
                total_products >=10


--4.Очистить тел/номер поставщикам из USA

        UPDATE Suppliers
        SET Phone=''
        WHERE
            Country='USA'


--5.Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

        SELECT
            Employees.FirstName,
            Employees.LastName,
            COUNT(*) AS total_orders
        FROM Orders
                 JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
        GROUP BY Employees.EmployeeID
        HAVING
                total_orders <=15


--6.Вывести товар, который находится на втором месте по ко-ву заказов

        SELECT
            ProductID,
            COUNT(*) AS count_orders
        FROM OrderDetails
        GROUP BY ProductID
        ORDER BY count_orders DESC
            LIMIT 1 OFFSET 1