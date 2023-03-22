#https://thepalindrome.substack.com/p/the-non-recursive-formula-for-fibonacci

ϕ = (1 + √5) / 2 #Golden ratio
ψ = (1 - √5) / 2 #conjugate Golden Ratia

n = 150 #Fibonacci Number to calculate

F_n = (ϕ^n - ψ^n) / (ϕ - ψ) #Non-Recursive Formula to Fibonacci Numbers

F_n_round = round(UInt128, F_n)

function fibonacci_std(number)
    n1::UInt128 = 0
    n2::UInt128 = 1
    for _ in 1:number-1
        n1, n2 = n2, n1 + n2
    end
    return n2
end

fibo = fibonacci_std(n)

println("Fibonacci's Formula Round: ", F_n)
println("Fibonacci's Formula Float: ", F_n_round)
println("Fibonacci's Method       : ", fibo)
println("--------------------------------------------------------")
println("Fibonacci's Formula Round: ", typeof(F_n))
println("Fibonacci's Formula Float: ", typeof(F_n_round))
println("Fibonacci's Method       : ", typeof(fibo))

if !isequal(F_n, fibo)
    println("Error Diference: ", abs(F_n_round - fibo))
end
