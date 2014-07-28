
function f = fibonacci(k)
% Fibonacci returns the first K Fibonacci numbers in array F

for j = 1:1:k
    if or(j == 1, j == 2)
        f(j) = 1;
    else
        f(j) = f(j-2)+f(j-1);
    end
end
