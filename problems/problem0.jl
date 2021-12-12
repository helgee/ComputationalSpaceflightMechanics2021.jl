function period(a, μ)
end

using Test

# Test that the period function works
const a = 450e3 + 6371e3
const μ = 3.986004418e14
@test period(a, μ) ≈ 5606.386763415304

import SPICE

func = error

# Test that `func` is the correct function
xyz = [1.0, 2.0, 3.0]

act = func(xyz)
exp = (3.741657386773941, 0.6405223126794246, 1.1071487177940904)
@test act[1] ≈ exp[1]
@test act[2] ≈ exp[2]
@test act[3] ≈ exp[3]

using LinearAlgebra

function rectangular_to_spherical(xyz)
end

act = rectangular_to_spherical(xyz)
@test act[1] ≈ exp[1]
@test act[2] ≈ exp[2]
@test act[3] ≈ exp[3]
