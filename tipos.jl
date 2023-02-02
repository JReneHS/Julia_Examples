x = 7

println("$x valor")

for a ∈ 0:10
    print("$a ")
end

λ = 0.00005

δ = 0.4

println("\nλ = $λ")
println("δ = $δ")

A = rand(1:4, 3, 3)

display([A A])

x = ones(3)

b = A * x

display(b)

sum(b)


println("Infinitos y NaN: ")

println(0 / 0)
println(Inf / Inf)
println(5 / 0)
println(Inf + Inf)