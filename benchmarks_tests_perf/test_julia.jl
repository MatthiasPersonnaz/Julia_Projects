println("Hello, World!")
message = "And now: something completely different," # pour définir des strings
message * " we will define a concatenated string"

message^3
parse(Float64 , "3.14159" )
trunc(Int64 , -2.3 )


string(3.14159)


α = 5;
Ψ = 65;
Σ = 45;
Δ = 32;

Σ+Δ+Ψ;

Δϕ = 5;

# pour trouver comment taper un symbole trouvé qqpart, le copier, taper dans la console ?, coller le symbole et taper entrée
# exemple avec α̂⁽²⁾

exp(-im*Δϕ)




using Plots; gr()

x = range(-3, 3, length=30)
x = range(-5, 4, length=30)
surface(
  x, x, (x, y)->exp(-x^2 - y^2), c=:viridis, legend=:none,
  nx=50, ny=50, display_option=Plots.GR.OPTION_SHADED_MESH,  # <-- series[:extra_kwargs]
)

# le @. au début d'une expression permet de convertir chaque appel de fonction en "dot-call": i.e. opération vectorisée sur chaque élement du vecteur, range, matrice, etc*
# le $ devant un appel de fonction permet d'échapper à cette règle
x = @. x * exp(-im*2.)


# définir une structure de nombre complexes comme dans la doc sur les types:

struct Polar{T<:Real} <: Number
  r::T
  Θ::T
end



A = Nothing;
# syntaxe: Array{type,N}(dims): N est le nombre d'arrays
A = Array{Polar{Float64}, 2}(undef, 2, 3)
# undef signifie UndefinedInitializer
# on peut aussi initialiser avec missing, nothing 

# utiliser type(B) et une certaine taille
similar(A, 2, 4, 1) 

# fonctions basiques utiles qui renseignent sur l'Array
sizeof(A)
ndims(A)
eltype(A)
axes(A)
eachindex(A)
stride(A,2)
strides(A)

function fractale(z)
  for j in 1:10
    z = z^2+.2+.7im
  end
  z
end


# exécuter 2 fois ce qui suit (compilation + exécution) si on ne l'a pas déjà fait avant
# la première fois donne un résultat grossier à cause de la compilation
# https://docs.julialang.org/en/v1/manual/performance-tips/
@time fractale(exp(-im*Δϕ))

# Utiliser des fonctions sur des structures array, vecteurs, etc

# avec des Arrays en 2D par exemple
A = zeros(Int8, 2, 4)
A[[CartesianIndex(1,1),CartesianIndex(1,2),CartesianIndex(2,3)]]

A[3] # on compte column-major (équivalent à compter linéairement les éléments)
# on peut convertir une convention d'indices à une autre comme ceci:
c = CartesianIndices(A)[5]
l = LinearIndices(A)[2, 2]

A[c] == A[l]

Z = zeros(Float64, 2, 2);

A = rand(Float64,3,4)
A = fractale.(A)

A[[3,5,6]] .= 5;

# avec des objets range comme le notebook d'Antoine Levitt en 1D
x = range(-2, 2, length=100)
fractale.(x)


n = 5;
t1 = exp(-.7*im+2.)*ones(Float64,(5,5));
t2 = ones(Float64,(5,5));

g = t1*t2

# pi est déjà défini !
pi


# construire une matrice par blocs avec le slicing:
B1 = rand(10, 10);
B2 = ones(Float64,3,2);

B1[1:3,4:5] .= B2;

# construction de listes par compréhension: ça marche aussi
[v for v in [4,5,6]]