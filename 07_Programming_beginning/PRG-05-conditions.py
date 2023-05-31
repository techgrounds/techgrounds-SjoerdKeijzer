#----------------Exercise 1
# Use the input() function to ask the user of your script for their name. 
# If the name they input is your name, print a personalized welcome message. 
# If not, print a different personalized message.



#----------------- Exercise 2 
# Ask the user of your script for a number. Give them a response based on whether the number is higher than, lower than, or equal to 100.
# Make the game repeat until the user inputs 100

number = input("Please select a number ")

if number > 100:
    print(f"Thanks for submitting your number. Your chosen number is: {number}. 'Tis a little high though. ")
elif number < 100:
    print(f"{number} is a great choice. Though bit on the low side.")
else:
    print(f"Your input directly matches 100. Congratulations!")