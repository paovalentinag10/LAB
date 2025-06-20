model lab08
parameter Real N=1;
parameter Real R=1;
parameter Real K=5.3;
parameter Real C=0.1;
Real w(start=0.1);
Real q(start=1);
equation

der(w)=1/R-w*delay(w,R)/2*R*K*delay(q,R);
der(q)=if noEvent (q>0) then N*w/R-C else max(N*w/R,0);

end lab08;