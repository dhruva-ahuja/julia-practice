import LinearAlgebra as la
import StatsBase as sb

P = [0.5 0.4 0.1;
     0.3 0.2 0.5;
     0.5 0.3 0.2]

# First way
piProb1 = (P^100)[1, :]
@show piProb1

# Second way
A = vcat((P' - sb.I)[1:2, :], ones(3)')
b = [0 0 1]'
piProb2 = A\b
@show piProb2

# Third way
eigVecs = la.eigvecs(copy(P'))
highestVec = eigVecs[:, findmax(abs.(la.eigvals(P)))[2]]
piProb3 = Array{Float64}(highestVec)/sb.norm(highestVec, 1)
@show piProb3

# Fourth way
numInState = zeros(Int, 3)
state = 1
N = 10^6

for t in 1:N
    numInState[state] += 1
    global state = sb.sample(1:3, sb.weights(P[state, :]))
end
piProb4 = numInState/N
@show piProb4

println("Comparing all methods in a single line...")
display([piProb1, piProb2, piProb3, piProb4])
