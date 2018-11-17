function PuntoMedio(u0,v0,p0,q0,h,tiempo)
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
	
	dividendo = -2*p(:,1)*q(:,1); 
	divisor= u(:,1)^2+v(:,1)^2+1;
	u(:,2) = u(:,1) + p(:,1)*h;
	v(:,2) = v(:,1) + q(:,1)*h;
	p(:,2) = p(:,1) + h*(dividendo * v(:,1))/divisor;
	q(:,2) = q(:,1) + h*(dividendo * u(:,1))/divisor;
	z(:,2)=u(:,2)*v(:,2);	
	
	k=2;
	tol=1e-10;
	while (k<k_max)
		%variables auxiliares
		dividendo = -2*p(:,k)*q(:,k); 
		divisor= u(:,k)^2+v(:,k)^2+1;
		%Y(k+1)
		u(:,k+1) = u(:,k-1) + p(:,k)*2*h;
		v(:,k+1) = v(:,k-1) + q(:,k)*2*h;
		p(:,k+1) = p(:,k-1) + 2*h*(dividendo * v(:,k))/divisor;
		q(:,k+1) = q(:,k-1) + 2*h*(dividendo * u(:,k))/divisor;
		z(:,k+1)= u(:,k+1)*v(:,k+1);

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
