#----------------Exercise 1
# Use the input() function to ask the user of your script for their name. 
# If the name they input is your name, print a personalized welcome message. 
# If not, print a different personalized message.

name = input("Please state your name.")

if name == "Sjoerd":
    then: print(f"Dobar Python ratnik {name}")
else:
    print(f"Greetings {name}!")

#----------------- Exercise 2 
# Ask the user of your script for a number. Give them a response based on whether the number is higher than, lower than, or equal to 100.
# Make the game repeat until the user inputs 100


# User input hebben we al paar keer gehad en if/elif ook. Truc is nu om iets te hebben om de number gaande te houden
# tot 100 is geraden. 

# start loop
while True: 

    # ask for input that is an integer
    number = int(input("Please select a number: "))

# Conditions for the numbers game. 
    if number > 100:
        print(f"Thanks for submitting your number, {number}.'Tis a little high though.")
    elif number < 100:
        print(f"Great choice. Though {number} is a bit on the low side.")
    else:
        print(f"Your input directly matches 100. Congratulations!")
        break # if 100 has been guessed, stop the loop