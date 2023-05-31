# --------------------- Exercise 1
# -- Create a new script.
# -- Import the random package.
# -- Print 5 random integers with a value between 0 and 100.

# Print 5 random integers between 0 and 100
for i in range(5):
    random_number = random.randint(0, 100)
    print(random_number)

# ------------------ Exercise 2
# -- Create a new script.
# -- Write a custom function myfunction() that prints “Hello, world!” to the terminal. Call myfunction.
# -- Rewrite your function so that it takes a string as an argument. Then, it should print “Hello, <string>!”.


# we make the custom function, myfunction(), that prints 'Hello, world!'. The c
def myfunction():
    print('Hello, world!')

# Call the function without argument
myfunction()

# Rewrite the function with a string argument
def myfunction(name):
    print("Hello, " + name + "!")

# Call myfunction with a string argument
myfunction("Sjoerd")
