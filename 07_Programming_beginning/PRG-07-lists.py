# ------------------ Exercise 1
# Create a new script.
# Create a variable that contains a list of five names.
# Loop over the list using a for loop. Print every individual name in the list on a new line.

name_list = ["Casper", "John", "Curt", "Sebastiaan", "Eline"]
for name in name_list:
    print(name)


# -------------------- Exercise 2
# Create a new script.
# Create a list of five integers.
# Use a for loop to do the following for every item in the list:
# Print the value of that item added to the value of the next item in the list. If it is the last item, add it to the value of the first item instead (since there is no next item).
# The first result above is created by adding 9 and 80. The second result is created by adding 80 and 16, etc. The last result is created by adding 35 and 9.

#------
# Gonna list my thought proces here because I had a really hard time with this one. 
# 
# Most written way out, but lots of typing is: 
# value 0+1= answer a | value 1+2 = answer B | value 2+3 = answer C | value 3+4 = answer D | value 4+5 = answer E | value 5 + 0 = answer F |
# The tough part is to make sure value 5 (or -1 as the end of the loop) adds up with value 0. How can we write this in proper code though? 
# list[i]+1 something something, but then we get in trouble at the end of the sequence going back to value 0. 
# so I guess we have 2 conditions: 
# 1. cycle next number and add next value 
# 2. when reaching end of line, add last value to the start sequence value (value 0)

# putting this into code will be something like:

list = [25, 88, 7, 12, 256]
for number in range(len(list)):
    if list[number] == list[-1]:     # if last value in the list [-1] is reached, 256 in this case; do 256 + [index value 0] (which is 25).
        print(list[number] + list[0])
    else:                            # in all other cases, do current looping number + the next one 
        print(list[number] + list[number+1])