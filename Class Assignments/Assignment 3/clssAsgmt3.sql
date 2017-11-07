set pagesize 100;

select isbn, title, to_char(cost, '$999,999.99') as Cost, 

nvl(to_char(last_value(cost) over (order by cost desc rows between unbounded 
preceding and 1 preceding), '$999.99'),'Highest Paid') Next_Higher_Cost,

nvl(last_value(title) over (order by cost desc rows between unbounded 
preceding and 1 preceding),'None') Next_Higher_Book

from books;