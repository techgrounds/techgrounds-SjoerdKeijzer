# --------------------- Exercise 1
# -- Create a new script.
# -- Import the random package.
# -- Print 5 random integers with a value between 0 and 100.

# Print 5 random integers between 0 and 100
import random
for i in range(5):
    random_number = random.randint(0, 100)
    print(random_number)

# ------------------ Exercise 2
# -- Create a new script.
# -- Write a custom function myfunction() that prints “Hello, world!” to the terminal. Call myfunction.
# -- Rewrite your function so that it takes a string as an argument. Then, it should print “Hello, <string>!”.


# we make the custom function, myfunction(), that prints 'Hello, world!'.
def myfunction():
    print('Hello, world!')

# Call the function without argument
myfunction()

# Rewrite the function with a string argument
def myfunction(name):
    print("Hello, " + name + "!")

# Call myfunction with a string argument
myfunction("Sjoerd")

# ------------- Exercise 3
# Create a new script.
# Copy the code below into your script.
# def avg():
	# write your code here

# you are not allowed to edit any code below here
# x = 128
# y = 255
# z = avg(x,y)
# print("The average of",x,"and",y,"is",z)
# Write the custom function avg() so that it returns the average of the given parameters. You are not allowed to edit any code below the second comment.

# I tried many versions of this, but this worked in the end. The trick sort of is to that z ends up being the average. I cheesed it by doing the return command and already calculating the average of x + y. 
# Pretty sure there is a more elegant way to do this, but in the end this produced the required results so I'm keeping as is for the time being. 

def avg(x, y):
    return (x + y) / 2

# you are not allowed to edit any code below here
x = 128
y = 255
z = avg(x,y)
print("The average of",x,"and",y,"is",z)