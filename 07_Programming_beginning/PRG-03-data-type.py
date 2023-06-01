# ------------- exercise 1

# variable x should be the result of variable b plus variable d. However because of the quotation marks
# var d is actually a string instead of a floating number. We have to remove the quotation marks first. 
a = 'int'
b = 7
c = False
d = 18.5

# now we have an integer (b) and a float (d) we can use Python do a bit of maths. 
x = b+d
 
# we also want to know the data types of all variables a to d. 
print("type a is: ",  type(a)) 
print("type b is: ",  type(b)) 
print("type c is: ",  type(c)) 
print("type d is: ",  type(d))


# Print result x (a float number should arise)
print(x)

#------------- exercise 2
# -- Use the input() function to get input from the user. Store that input in a variable.
# -- Find out what data type the output of input() is. See if it is different for different kinds of input (numbers, words, etc.)."""

# At first I had:

inputvar = input("\nEnter a value: ")
typevar = type(inputvar)
 
print(f'\nYou chosen value is {inputvar}.\nThis is a {typevar} data type.')

# The problem with this, that Python always returns a string as datatype, regardless of input.
# I know this is probably beyond the scope of what is required, but what if we can try add certain conditions to make sure we can actually
# use 1 print line and yet determine datatypes. 

inputvar = input("Enter a value: ")

# First I tried this with If/else statements but that was very difficult. After some research found that you can use try to make Python attempt
# things and if failed, take another action. That works actually just fine in this scenario. 

# So if you enter a float you will probably use a '.'. So if there is a . try to see if it is indeed a float by converting it to float. 
if "." in inputvar:
    try:
        # Try converting to float
        number = float(inputvar)
        data_type = type(number)
    except ValueError:
        # If not a valid float, consider it a string
        data_type = str
else:
    try:
        # Try converting to integer
        number = int(inputvar)
        data_type = type(number)
    except ValueError:
        # If not a valid integer, consider it a string
        data_type = str

# Print the data type
print(f'\nYour chosen value is {inputvar}.\nThis is a {data_type} data type.')