function EulerAtras(u0,v0,p0,q0,h,tiempo)
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
	
	%estimo la derivada y'(1)
	u_(:,1)=p0;
	v_(:,1)=q0;
	%variables auxiliares
	divisor0 = (u0^2+v0^2+1);
	dividendo0=-(2*p0*q0);
	p_(:,1)=(dividendo0 * v0)/divisor0;
	q_(:,1)=(dividendo0 * u0)/divisor0;
	k=1;
	while (k<k_max)
		%calculo y'(k+1) = y(k) + h*(f(y(k))
		u_(:,k+1) = u(:,k) + h*p(:,k);
		v_(:,k+1) = v(:,k) + h*q(:,k);
		%variables auxiliares
		dividendo_ = -2*p(:,k)*q(:,k); 
		divisor_= u(:,k)^2+v(:,k)^2+1;
		p_(:,k+1) = p(:,k) + h*(dividendo_*v(:,k))/divisor_;
		q_(:,k+1) = q(:,k) + h*(dividendo_*u(:,k))/divisor_;
		
		%variables auxiliares
		dividendo = -2*p_(:,k+1)*q_(:,k+1); 
		divisor= u_(:,k+1)^2+v_(:,k+1)^2+1;
		%Y(k+1)
		u(:,k+1) = u(:,k) + h*p_(:,k+1);
		v(:,k+1) = v(:,k) + h*q_(:,k+1);
		p(:,k+1) = p(:,k) + h*(dividendo * v_(:,k+1))/divisor;
		q(:,k+1) = q(:,k) + h*(dividendo * u(:,k+1))/divisor;
		z(:,k+1)=u(:,k+1)*v(:,k+1);

		k+=1;
	end   

	%plot(gráficas)
	%x=1:h:tiempo;a
	hold on;
	solucionOctave([u(:,1),v(:,1),p(:,1),q(:,1)],tiempo);
	plot3(u, v, z,'color','red');
	legend ("Geodesica");
	x_ph = -30:1:30;
	y_ph = -30:1:30;
	z_ph = x_ph' * y_ph;
	mesh(x_ph,y_ph,z_ph);
	title ("Geodesica en el Paraboloide Hiperbolico");
	grid;
	hold off;
	%Y=[u',v'];
endfunction
