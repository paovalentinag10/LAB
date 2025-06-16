model sir
parameter Real beta = 1;
parameter Real nu = 0.3;
parameter Real mu = 0.008;

Real s(start = 0.999);
Real i(start = 0.001);
Real r(start = 0.0);
equation
      der(s) = -beta*s*i + mu*(i+r);
      der(i) = beta*s*i - nu*i - mu*i;
      der(r) = nu*i - mu*r;


end sir;