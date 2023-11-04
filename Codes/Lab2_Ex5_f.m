function y = Lab2_Ex5_f(x)

if x <= 5
    y = 2-x;
elseif (5 < x) && (x <= 10)
    y = exp(x-13);
elseif x == 13
    y = "the function is undefined at x = 13";
else
    y = x./(x-13);
end

end