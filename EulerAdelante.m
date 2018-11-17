function EulerAdelante(u0,v0,p0,q0,h,tiempo)
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
		%variables auxiliares
		dividendo = -2*p(:,k)*q(:,k); 
		divisor= u(:,k)^2+v(:,k)^2+1;
		%Y(k+1)
		u(:,k+1) = u(:,k) + p(:,k)*h;
		v(:,k+1) = v(:,k) + q(:,k)*h;
		p(:,k+1) = p(:,k) + h*(dividendo * v(:,k))/divisor;
		q(:,k+1) = q(:,k) + h*(dividendo * u(:,k))/divisor;
		z(:,k+1)=u(:,k+1)*v(:,k+1);

		%if(abs(u(:,k)-u(:,k+1))<=tol && abs(v(:,k)-v(:,k+1))<=tol)
		%  break;
		%end
		k+=1;
	end  	

	%plot(gráficas)
	%x=1:h:tiempo;a
	hold on;
	solucionOctave([u(:,1),v(:,1),p(:,1),q(:,1)],tiempo);
	plot3(u, v, z,'color','blue');
	leyenda = legend ({"Geodesica Solucion Exacta", "Geodesica Euler Adelante"});
	legend (leyenda, "location", "north");
	 set (leyenda, "fontsize", 10);
	x_ph = -30:1:30;
	y_ph = -30:1:30;
	z_ph = x_ph' * y_ph;
	mesh(x_ph,y_ph,z_ph);
	title ("Geodesica en el Paraboloide Hiperbolico");
	grid;
	hold off;
	%Y=[u',v'];
endfunction
