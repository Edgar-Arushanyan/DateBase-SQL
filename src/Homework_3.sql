  /* 1.Вывести кол-во заказов, которое компания Speedy Express доставила в Brazil  */




/* ---------------------------------------------------------------
 2.Вывести среднюю стоимость проданного в Germany товар  */

SELECT
AVG(Products.Price) AS avg_sold_products_in_Germany
FROM Products
JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
WHERE
  Suppliers.Country ='Germany'


   /* -------------------------------------------------------------
    3.Вывести ко-во и сред/стоимость товаров из USA */

  SELECT
  AVG(Products.Price) AS avg_products_from_USA,
  COUNT(*) AS count_products_from_USA
  FROM Products
  JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
  JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID
  WHERE
          Country='USA'

/*-------------------------------------------------------------------------
    4.Вывести стоимость и название двух самых дешевых товаров из Germany */
  SELECT
      Price,
      ProductName
  FROM Products
  JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
  WHERE
      Country='Germany'
  ORDER BY Products.Price ASC
  LIMIT 2

  /*---------------------------------------------------------------------
    5.Применить наценку в 15% ко всем товарам из категории 4  */
  SELECT
    Price * 1.15 AS price_up_from_category_4
  FROM Products
  WHERE
     CategoryID='4'

