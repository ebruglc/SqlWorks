--calisanlarin yaptigi ciro nedir (1997 yili) 
-- Egerki bu sorguyu parametrik hale getirmek istersek 
-- Create komutu databasde istenilen objeleri olusturmaya yazar.
-- ornek procedure olusturulmasi
Create PROCEDURE calisanlarinperformansi(@yil as INT)
as 
Begin 
select e.FirstName + ' '+ e.LastName ,Round(sum(od.Quantity*od.UnitPrice*(1-Discount)),0) Ciro 
from Employees e
inner join orders o on e.EmployeeID = o.EmployeeID
inner join [Order Details] od on od.OrderID=o.OrderID
where year(o.OrderDate) = @yil
group by  e.FirstName + ' '+ e.LastName
order by ciro desc 
end

-- procedure cagirma 
exec calisanlarinperformansi 1996


-- procedure degisikligi ve if kullanimi 
alter  PROCEDURE calisanlarinperformansi(@yil as INT)
as 
Begin 

if @yil is null 
begin 
    select e.FirstName + ' '+ e.LastName Calisan,Round(sum(od.Quantity*od.UnitPrice*(1-Discount)),0) Ciro 
    from Employees e
    inner join orders o on e.EmployeeID = o.EmployeeID
    inner join [Order Details] od on od.OrderID=o.OrderID
    group by  e.FirstName + ' '+ e.LastName
    order by ciro desc 

end 
else if @yil < 1996 or  @yil >1998
begin 
    select e.FirstName + ' '+ e.LastName Calisan,Round(sum(od.Quantity*od.UnitPrice*(1-Discount)),0) Ciro 
    from Employees e
    inner join orders o on e.EmployeeID = o.EmployeeID
    inner join [Order Details] od on od.OrderID=o.OrderID
     group by  e.FirstName + ' '+ e.LastName
    order by ciro desc 
end 
else 
begin 
    select e.FirstName + ' ' + e.LastName Calisan,Round(sum(od.Quantity*od.UnitPrice*(1-Discount)),0) Ciro 
    from Employees e
    inner join orders o on e.EmployeeID = o.EmployeeID
    inner join [Order Details] od on od.OrderID=o.OrderID
     group by  e.FirstName + ' '+ e.LastName
    order by ciro desc 
end 

end

exec calisanlarinperformansi 0
