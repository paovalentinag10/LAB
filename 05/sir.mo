model sir
parameter Real beta =1;
parameter Real nu = 0.3;
Real s(start= 0.999);
Real i(start=0.001);
Real r(start=0.0);
equation
der(s) = -beta*s*i;
der(i) = beta*s*i - nu*i;
der(r) = nu*i;

end sir;