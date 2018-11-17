function solucionOctave(y0,tiempo)


function xdot = fcn(y,t) 
xdot(1) = y(3);
xdot(2) = y(4);
xdot(3) = (-2*y(2)*y(3)*y(4))/(y(1)^2+y(2)^2+1);
xdot(4) = (-2*y(1)*y(3)*y(4))/(y(1)^2+y(2)^2+1);
endfunction


t = linspace (0, tiempo, 500)';
y=lsode("fcn", y0 , t);
z=y(:,1).*y(:,2);
plot3(y(:,1),y(:,2),z,'color','red');
endfunction;
