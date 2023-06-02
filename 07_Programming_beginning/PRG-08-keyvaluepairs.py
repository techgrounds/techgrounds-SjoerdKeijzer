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

techgrounds_dict = {
"First name": "Casper",
"Last name": "Velzen",
"Job title": "Learning Coach",
"Company": "Techgrounds",
}

# Looping over dict while printing every key-value pair
for key, value in techgrounds_dict.items():
    print(f"{key} : {value}")


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

# save input from user in a custom dictionary
custom_dict = {
    "First name": input_first_name,
    "Last name": input_last_name,
    "Job title": input_job_title,
    "Company": input_company
}

import csv

# write the content from the dictionary to a CSV file
with open('exercise.csv', 'a', newline='') as csv_file:
    writer = csv.DictWriter(csv_file, fieldnames=custom_dict.keys())

    # In the ideal world I would like to have the header also but it keeps printing each time for each rerun of the script. I could probably fix it with enough time, but for now
    # I decide to move on with PRG-09
    # writer.writeheader() 
    writer.writerow(custom_dict)

# Check if content is there
with open('exercise.csv', 'r') as csv_file:
    content = csv_file.read()
    print(content)