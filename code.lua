print("Enter your name: ")
name = io.read()

print("Enter your age: ")
age = tonumber(io.read())


print("Enter the first number:")
a = tonumber(io.read())

print("Enter the second number:")
b = tonumber(io.read())

if not a or not b then
    print("Invalid input for numbers! Please enter numbers only.")
    return
end


c = a * b
d = b * c
e = c * d
f = d * e

sum = (a + b + c + d + e + f)
multiplication = (a * b * c * d * e * f)
division = (a / b / c / d / e / f)

print("Hello " .. name .. ", you are " .. age .. " years old!")
print("The sum of your numbers are: " .. sum .. "!")
print("The multiplication of your numbers are: " .. multiplication .. "!")
print("The division of your numbers are: " .. division .. "!")
