
/*Динамика дохода и прибыли*/
select extract('year' from order_date),
	round(sum(o.sales)) as Сумма_по_Sales, 
	round(sum(profit)) as Сумма_по_Profit
from  public.orders o 
group by 1;

/*Сравнение по категориям*/
select category,
	round(sum(o.sales)) as Сумма_по_Sales, 
	round(sum(profit)) as Сумма_по_Profit
from  public.orders o 
group by 1;

/*Сравнение по региональным менеджерам*/
select p.person  as Sales_per_Customer,
	round(sum(sales)) as Сумма_по_Sales, 
	round(sum(profit)) as Сумма_по_Profit
from public.people p left join public.orders o 
	on p.region = o.region
group by 1
order by 2 desc;


/*Сравнение по сегментам*/
select segment, 
	round(sum(sales)) as Сумма_по_Sales, 
	round(sum(profit)) as Сумма_по_Profit
from public.orders o 
group by 1;



/*Динамика дохода и прибыли по сегментам*/

select extract('year' from order_date), 
	round(sum(case when o.segment = 'Consumer' then o.sales end)) as Consumer, 
	round(sum(case when o.segment = 'Corporate' then o.sales end)) as Corporate,
	round(sum(case when o.segment = 'Home Office' then o.sales end)) as Home_Office,
	round(sum(o.sales)) as Total_sum
from public.orders o 
group by 1;



/*Основные показатели*/
select round(sum(sales)) as Total_Sales,
	round(sum(profit)) as Total_Profit,
	sum(sales)/sum(profit) as Рентабельность_Profit_Ratio,
	round(sum(profit)/count(order_id)) as Profit_per_Order,
	(sum(discount)/count(order_id)) as Avg_Discount
from public.orders o ;

