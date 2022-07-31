### LIMIT
SELECT occurred_at, account_id, channel
FROM web_events
LIMIT 15;

### WHERE
/*Filter the accounts table to include the company name, website, and the primary point of contact
(primary_poc) just for the Exxon Mobil company in the accounts table.*/
SELECT name, website,primary_poc
FROM accounts
WHERE name='Exxon Mobil' ;

### Derived Columns
/*
Creating a new column that is a combination of existing columns is known as a derived column
(or "calculated" or "computed" column). Usually you want to give a name, or "alias,"
to your new column using the AS keyword.  */

/*
If you are deriving the new column from existing columns using a mathematical expression,
then these familiar mathematical operators will be useful:
* (Multiplication)
+ (Addition)
- (Subtraction)
/ (Division)
*/

/*
Introduction to Logical Operators
In the next concepts, you will be learning about Logical Operators. Logical Operators include:

LIKE This allows you to perform operations similar to using WHERE and =, but for cases when you might not know exactly what you are looking for.
IN This allows you to perform operations similar to using WHERE and =, but for more than one condition.
NOT This is used with IN and LIKE to select all of the rows NOT LIKE or NOT IN a certain condition.
AND & BETWEEN These allow you to combine operations where all combined conditions must be true.
OR This allows you to combine operations where at least one of the combined conditions must be true.
*/

SELECT id, (standard_amt_usd/total_amt_usd)*100 AS std_percent, total_amt_usd
FROM orders
LIMIT 10;


/*
Create a column that divides the standard_amt_usd by the standard_qty to find the unit price for standard paper for each order.
Limit the results to the first 10 orders, and include the id and account_id fields. */

SELECT id, account_id,standard_amt_usd/standard_qty AS unit_price
FROM orders
LIMIT 10;


### LIKE
/*
The LIKE operator is extremely useful for working with text. You will use LIKE within a WHERE clause. The LIKE operator is frequently used with %. The % tells us that we might want any number of characters leading up to a particular set of characters or following a certain set of characters, as we saw with the google syntax above. Remember you will need to use single quotes for the text you pass to the LIKE operator, because of this lower and uppercase letters are not the same within the string. Searching for 'T' is not the same as searching for 't'. In other SQL environments (outside the classroom), you can use either single or double quotes.
*/

/*
Use the accounts table to find

1. All the companies whose names start with 'C'.

2. All companies whose names contain the string 'one' somewhere in the name.

3. All companies whose names end with 's'.
*/

1.
SELECT name
FROM accounts
WHERE name LIKE 'C%';

2.
SELECT *
FROM accounts
WHERE name LIKE '%one%';

3.
SELECT name
FROM accounts
WHERE name LIKE '%s';
