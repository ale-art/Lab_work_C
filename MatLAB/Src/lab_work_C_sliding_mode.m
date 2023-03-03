%% Sliding Mode Controller

%finding the stable curve
%p2/p1<0 first guess rand()
p2 = 0.2;
p1 = 0.5;


z = [dh;h];
dz = jacobian(z,x)*dx;
dz = simplify(dz);
dz = simplifyFraction(dz)
dz = vpa(dz)

dz_collect=collect(dz,u_bar)
dz_collect=matlabFunction(dz_collect)
f_1=1.0./sqrt(x1.*5.0+1.6e+1).*1.0./sqrt(x2.*5.0+1.6e+1).*(x1.*2.7795e+4+8.8944e+4).*3.491988616282361e-6;sqrt(x1.*5.0+1.6e+1).*7.609042393596842e-2-sqrt(x2.*5.0+1.6e+1).*7.609042393596842e-2;

g_1=1.0./sqrt(x1.*5.0+1.6e+1).*5.764426055755183e-3;

f_z = [f_1;dz(2)]
g_z = [g_1;0]

z1 = z(1);
z2 = z(2);

surface = p1*z1+p2*(z2-r);
%surface=matlabFunction(surface)
%fsurf(surface)
%V=surface^2/2
%fsurf(V)
p=[p1 p2]; %p vector transposed
p_norm=p/norm(p);
%f=f*[0 r]
syms mu
u=-p_norm*f_z/(p_norm*g_z)-mu/(p_norm*g_z)*sat(surface,0.2);
u=matlabFunction(u)
