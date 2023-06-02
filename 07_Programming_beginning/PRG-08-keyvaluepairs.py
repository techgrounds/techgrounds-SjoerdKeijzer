#---------------- Exercise 1
# Create a new script.
# Create a dictionary with the following keys and values:
# Key               Value
# Firstname         Casper
# Last name         Velzen
# Job title         Learning coach
# Company           Techgrounds
#
#Loop over the dictionary and print every key-value pair in the terminal.




#----------------- Exercise 2
# Create a new script.
# Use user input to ask for their information (first name, last name, job title, company). Store the information in a dictionary.
# Write the information to a csv file (comma-separated values). The data should not be overwritten when you run the script multiple times.
# 

# first we do the code to get input from user
input_first_name = input("Please state your first name: ")
input_last_name = input("Please state your last name: ")
input_job_title = input("What is your job title? ")
input_company = input("What company is your employer? ")

# save input from user in a custom dictionairy
custom_dict = {

"firstname" : {input_first_name},  
"lastname" : {input_last_name},
"job_title" : {input_job_title},
"company" : {input_company},
}

# for test purposes check values in dict
print(custom_dict)

# get the input from user into a csv file
import csv

with open('exercise.csv', 'w', newline='') as csv_file:
    writer = csv.writer(csv_file)

content = csv_file.read()
print(content)