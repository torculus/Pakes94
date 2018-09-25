workspace()

include("./functions.jl")

N = 2; wiMax = 19;

size = N + wiMax + 1;

Binom = eye(size);

for i=2:size
    Binom[i,1] = 1;

    for j=2:i-1 # everything beyond i is 0
        # calculate Binomial coefficients (more computationally-stable)
        Binom[i,j] = Binom[i-1, j] + Binom[i-1, j-1];
    end
end

Binom = [zeros(size, 1) Binom];

sizeWstar = Binom[size, wiMax+2];

#f = open("results.txt", "r+")

for i=1:sizeWstar
    d = decode(Binom, i, N);

    id = convert(Array{Integer}, floor.(d));

    e = encode(Binom, id, N);

    print("$d, $e\n")
end
