function error()

octave_sol = solucionOctave([1 2 2 1],30,0);

i=1;
hs = [1,0.5,0.25,0.125,0.0625,0.001];
while (i <= 6)
metnum_sol = rk(1,2,2,1,hs(:,i),30,1/6,2/6,2/6,1/6,1/2,1/2,1,0);
	E(i) = norm(metnum_sol(10) - octave_sol(10));
	E(i);
	i++
end
E
scatter (E, hs, "r");
xlabel ("error");
ylabel ("h");
endfunction
