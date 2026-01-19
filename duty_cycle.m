function Dref = mppt(V,I)

Dinit=0.42;
Dmax=0.9;
Dmin=0.1;
delDref=0.0008;

persistent Vold Pold Drefold

if(isempty(Vold))
    Vold=0;
    Pold=0;
    Drefold=Dinit;
end

P=V*I;
delv=V-Vold;
delp=P-Pold;

if delp>0
    if delv>0
        Dref=Drefold - delDref;
    else
        Dref=Drefold + delDref;
    end
elseif delp<0
    if delv>0
        Dref=Drefold + delDref;
    else
        Dref=Drefold - delDref;
    end
else
    Dref=Drefold;
end

if Dref>Dmax || Dref<Dmin
    Dref=Drefold;
end

Drefold=Dref;
Pold=P;
Vold=V;
