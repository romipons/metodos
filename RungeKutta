function metnum_sol = rk(u0,v0,p0,q0,h,tiempo,a,b,c,d,beta1,beta2,beta3,plot)
	k_max = floor(tiempo/h);
% Inicializo vector
	u =zeros(1,k_max);
	v =zeros(1,k_max);
	p =zeros(1,k_max);
	q =zeros(1,k_max);
	z =zeros(1,k_max);

	u(:,1)=u0;
	v(:,1)=v0;
	p(:,1)=p0;
	q(:,1)=q0;
	z(:,1)=u(:,1)*v(:,1);
	k=1;
	tol=1e-10;
	while (k<k_max)
		k1=f([u(:,k),v(:,k),p(:,k),q(:,k)]);
		
		w1=[u(:,k),v(:,k),p(:,k),q(:,k)] + beta1*h*k1;
		k2=f(w1);
		
		w2= [u(:,k),v(:,k),p(:,k),q(:,k)] + beta2*h*k2;
		k3= f(w2);
		
		w3= [u(:,k),v(:,k),p(:,k),q(:,k)] + beta3*h*k3;
		k4=f(w3);

		r = [u(:,k),v(:,k),p(:,k),q(:,k)] + a*h*k1 + b*h*k2 + c*h*k3 + d*h*k4;

		u(:,k+1)=r(:,1);
		v(:,k+1)=r(:,2);
		p(:,k+1)=r(:,3);
		q(:,k+1)=r(:,4);

		z(:,k+1) = u(:,k+1)*v(:,k+1);
		k+=1;
	end  	
	if plot 
		hold on;
	end
	sol_octave = solucionOctave([u(:,1),v(:,1),p(:,1),q(:,1)],tiempo,plot);
	if plot 
		plot3(u, v, z,'color','blue');
		leyenda = legend ({"Geodesica Solucion Exacta", "Geodesica Euler Adelante"});
		legend (leyenda, "location", "north");
		set (leyenda, "fontsize", 10);
	end
	metnum_sol = [u' v' z'];
	x_ph = -30:1:30;
	y_ph = -30:1:30;
	z_ph = x_ph' * y_ph;
	if plot
		mesh(x_ph,y_ph,z_ph);
		title ("Geodesica en el Paraboloide Hiperbolico");
		grid;
		hold off;
	end
	%Y=[u',v'];
endfunction
