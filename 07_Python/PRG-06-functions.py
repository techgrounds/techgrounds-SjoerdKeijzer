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

# Call the function (without argument). Will print 'Hello, world!'.
myfunction()

# Rewrite the function
def myfunction(name):
    print(f"Hello, {name}!")

# Call myfunction with an argument. Will print 'Hello, Sjoerd!'.
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

# Took a while to get my head around this as I am not super proficient in maths. So when changing from letters to numbers this is somewhat confusing for me.
# However after reading several times how function calling works, I just had to figure out a way in the function code to make sure that z returned the average of x and y
# I think below works, so there we go. 

def avg(x, y):
    return (x + y) / 2

# you are not allowed to edit any code below here
x = 128
y = 255
z = avg(x,y)
print("The average of",x,"and",y,"is",z)