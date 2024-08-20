println("There is more than one way to say hello:")

helloArray = ["Hello", "Hola", "Namaste"]

for i in 1:3
    println("\t", helloArray[i], " World!")
end

squares = [i^2 for i in 0:10]

for s in squares
    print(s, " ")
end

println(sqrt.(squares))

array1 = [(2n+1)^2 for n in 1:5]
array2 = [sqrt(i) for i in array1]

println(typeof(1:5), " ", typeof(array1), " ", typeof(array2))