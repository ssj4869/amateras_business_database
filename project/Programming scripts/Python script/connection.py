import mysql.connector
import csv

#### Connect to mysql database
#### requires host, username,password and the target database
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="amateras_business"
)

## Menu driven program to print data from database
print("Welcome to amateras_business database")
print("1. Show product_information table\n2. Show laptop Table")
print("3. Show laptop_data table\n4. Show employee_data table")
print("5. Show employee_billing_data table\n6. Show sales_data table")
print("7. Exit")
ch = int(input("Enter your choice: ")) ## stores user input as integer 
print("\n")

## table names which are present in my database
## i stored them in array format to write only one block of code
## this will help in using only one block of code for multiple tables

tables = ['', 'product_information', 'laptops', 'laptop_data', 'employee_data', 'employee_billing_details', 'sales_data']
table_name = tables[ch]; #This variable will hold the value of the table name which the user has selected

print("Showing table:  "+table_name)
print("-"*50)
mycursor = mydb.cursor() ## connect to cursor object to execute sql statements

while(ch in range(1,7)):
    res = mycursor.execute("SELECT * FROM "+tables[ch]) ## writing only one SQL query for multiple tables by using array

    myresult = mycursor.fetchall()
    for x in myresult:
       print(x) ## prints result to screen

    print("-"*50)
    print("\n")
    file = open(table_name+'.txt', 'w') ## open the file to write data
    with file as f:
        f.writelines([(str(i)+'\n') for i in myresult]) ## this will write all the mysql table data to file

    ch = int(input("Enter your choice: ")) ##writing this here will help to generate the menu again using while condition
    if(ch > 6):
        print("Exiting the program.. have a good day");
  
file.close() ## close the file pointer
mydb.close() ## close the database connection
