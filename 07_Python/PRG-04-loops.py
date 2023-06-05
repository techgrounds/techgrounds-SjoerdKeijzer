# ---------------- Exercise 1
# -- Create a new script
# -- Create a variable x and give it the value 0.
# Use a while loop to print the value of x in every iteration of the loop. After printing, the value of x should increase by 1. The loop should run as long as x is smaller than or equal to 10.


x = 0
while x < 11:
    print(x)
    x += 1 # little trick to add 1 each time


# --------------- Exercise 2
# Copy the code below into your script.
# for i in range(10):
	# do something here
# Print the value of i in the for loop. You did not manually assign a value to i. Figure out how its value is determined.
# Add a variable x with value 5 at the top of your script.
# Using the for loop, print the value of x multiplied by the value of i, for up to 50 iterations.

x = 5
for i in range(10):
    print(i) # Prints: 0 - 9 but not 10
for x in range(1, 51):
	print(x*i) # Prints: 18 till 450

# we use 51 in the range for x so the up till 50 iteritions is included. 


#------------------- Exercise 3
# Create a new script.
# Copy the array below into your script.
# arr = ["Coen", "Casper", "Joshua", "Abdessamad", "Saskia"]
# Use a for loop to loop over the array. Print every name individually.

arr = ["Coen", "Casper", "Joshua", "Abdessamad", "Saskia"]

for name in arr:
	print(name)
