#------------ exercise 1
value1=1
value2=24
value3=(value1+value2)

# value3=sum(value1+value2) but Python is smart enough to recognise this without syntax sum

print()
print(value1)
print(value2)
print(value3)
print()


# --------- exercise 2
name='Sjoerd'
print(f"Hello, {name}!")

# we are using f string so we can reference {name} in the string itself


#---------- exercise 3

# create a var that changes with output, but the print value var name (changevar) itself should remain the same. 
changevar="Bonjour"
print()
print(f"Value 1: {changevar}")
changevar='Dobre dan'
print(f"Value 2: {changevar}")
changevar = 'Buenos noches'
print(f"Value 3: {changevar}")
