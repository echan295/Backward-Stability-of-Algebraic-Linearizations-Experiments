function B = bernsteinbasis(k, n, a, b, x)
    B = nchoosek(n, k)*((b - x)^(n - k) * (x - a)^(k))/(b - a);
end