function s = mysort(a)


% sort vector a into nodecreasing order.

n = length(a);

if n <= 1

s = a;

else

s = merge( mysort( a(1 : n/2) ), ...

mysort( a(n/2+1 : n) ) );

end

function m = merge(a,b)

% Given sorted vectors a and b,

% return sort([a,b]).

n = length(a) + length(b);

m = zeros(1,n);

a = [a, inf]; b = [b, inf];

ia = 1; ib = 1;

for i = 1:n

if a(ia) < b(ib)

m(i) = a(ia);

ia = ia + 1;

else

m(i) = b(ib);

ib = ib + 1;

end

end
