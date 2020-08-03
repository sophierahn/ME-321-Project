% Setting up the mechanism

%Assigning Variable
One = 0;
O2B = 4;
BC = 12.5;
O2D = 7;
Rg2 = O2B/2;
Rg3 = BC/2;
% okay, lets do the plots of link 2 first, that part is deff fine
XSection = 3.14*(0.5^2);


for theta2 = 0:1:360
    F12x=
    
    
    theta3 = asind((-r1+r2*sind(theta2))/r3);
    %theta3 dot
    dtheta3 = r2 .* dtheta2 .* cosd(theta2)./r3./cosd(theta3);
    %theta3 double dot
    ddtheta3 = 1./r3./cosd(theta3).*(r2*ddtheta2-r2.*dtheta2.^2.*sind(theta2)+r3.*dtheta3.^2.*sind(theta3));
    B = get_ma_vector(m2, b2, r2, theta2, dtheta2, phi2, m3, b3, r3, theta3, dtheta3, ddtheta3, phi3, IG3, m4);
    A = get_A_matrix(r2, theta2, r3, theta3, b3, phi3);  

    x = A\ B;
    M12 = [M12; x(8)];
	theta2_list = [theta2_list, theta2];
    
end

figure (7)
plot(theta2_list,M12)
grid on;
title('\theta_2 vs M12')
xlabel('\theta_2   unit: degree')
ylabel('M12   unit: N-m')