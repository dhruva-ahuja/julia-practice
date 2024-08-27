using Random, LinearAlgebra, Plots, Measures; pyplot()
Random.seed!()

N = 10^5

data = [[rand(), rand()] for _ in 1:N]
indata = filter((x) -> (norm(x) <= 1), data)

piApprox = 4*length(indata)/N

outdata = filter((x) -> (norm(x) > 1), data)

# Create scatter plots
scatter(first.(indata), last.(indata), color=:blue, ms=1, msw=0, label="Inside")
scatter!(first.(outdata), last.(outdata), color=:red, ms=1, msw=0, label="Outside",
              xlim=(0,1), ylim=(0,1), ratio=:equal, legend=:top, margin=5mm)

# Display the plot with appropriate size
plot!(size=(600, 600), margin=5mm, grid=false)