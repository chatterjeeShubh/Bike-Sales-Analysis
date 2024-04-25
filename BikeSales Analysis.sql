SELECT
    ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name) AS name,
    cus.city,
    cus.state,
    ord.order_date,
    SUM(itm.quantity) AS total_units,
    SUM(itm.quantity * itm.list_price) AS revenue,
    pro.product_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name) AS SalesRep
FROM 
    sales.orders ord
JOIN 
    sales.customers cus ON ord.customer_id = cus.customer_id
JOIN 
    sales.order_items itm ON ord.order_id = itm.order_id
JOIN 
    production.products pro ON itm.product_id = pro.product_id
JOIN 
    production.categories cat ON cat.category_id = pro.category_id
JOIN 
    sales.stores sto ON sto.store_id = ord.store_id
JOIN 
    sales.staffs sta ON sta.staff_id = ord.staff_id
GROUP BY
    ord.order_id,
    CONCAT(cus.first_name, ' ', cus.last_name),
    cus.city,
    cus.state,
    ord.order_date,
    pro.product_name,
    cat.category_name,
    sto.store_name,
    CONCAT(sta.first_name, ' ', sta.last_name);