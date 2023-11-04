function S = Lab2_Ex2_geomsum1(commRatio,a_1st,n_term)

S=0;

for i = 0:1:n_term-1
    S = S + a_1st*commRatio^i;
end