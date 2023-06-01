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


