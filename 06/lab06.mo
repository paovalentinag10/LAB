model lab06
parameter Real a=2;
parameter Real b=1;
parameter Real c=0.3;
parameter Real d=1;
Real x(start = 2);
Real y(start = 1);

equation
der(x)=a*x-b*x*y;
der(y)=c*x*y-d*y;

end lab06;