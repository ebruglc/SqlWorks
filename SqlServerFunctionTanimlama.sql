
create function dbo.Calisanlar(@yil int)
returns TABLE
as 
return(
    select e.FirstName + ' '+ e.LastName Calisan,Round(sum(od.Quantity*od.UnitPrice*(1-Discount)),0) Ciro 
    from Employees e
    inner join orders o on e.EmployeeID = o.EmployeeID
    inner join [Order Details] od on od.OrderID=o.OrderID
    where year(o.OrderDate) = @yil
     group by  e.FirstName + ' '+ e.LastName
   );

   select * from Calisanlar(1996);
