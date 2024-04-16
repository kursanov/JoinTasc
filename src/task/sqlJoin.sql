-- Бардык клиенттердин шаарлары уникалдуу чыксын.
select distinct City from Customers;

-- Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
select *
from Employees
where BirthDate > #1950-08-12# AND BirthDate < #1960-08-12#;

--Франциялык поставщиктердин аттары жана мамлекети чыксын
select s.SupplierName,s.Country from Suppliers s;

--Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
select CustomerName, Address, Country
from Customers
where CustomerName LIKE 'A%';

--PostalCode бош болгон клиенттер чыксын
select PostalCode
from Customers
where PostalCode is null;

-- Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
select top 2 * from Customers c where City = 'London' ;

--Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
select e.FirstName,e.BirthDate from Employees e where len(LastName) > 4;

--Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
select Country,count(SupplierID) as SupplierCount from Suppliers group by  Country;

--Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
select Country from Suppliers group by Country having count(SupplierId) = 1 order by Country;

--Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
select CategoryID, COUNT(*) as TotalProducts
from Products
group by  CategoryID;

--6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT ProductName, Price
FROM Products
WHERE CategoryID IN (6, 8)
ORDER BY Price;


--Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
select p.ProductID,p.ProductName,p.SupplierID,p.CategoryID,p.Unit,p.Price,s.SupplierName
        from Products p inner join
        Suppliers s
        on p.SupplierID = s.SupplierID
        order by SupplierName ;

--Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
select s.SupplierID, s.SupplierName, COUNT(p.ProductID) as ProductCount
from Suppliers s
         left join Products p on s.SupplierID = p.SupplierID
group by s.SupplierID, s.SupplierName
order by  ProductCount;


--




