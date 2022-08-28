clc
clear

% LETRERO DE LA INFORMACION DEL PROGRAMA

disp('--->>>>PON TUS DATOS AQUI')

E=0;
L=0;
R=0;
C=0;
q0=0;
Dq0=0;
% PEDIMOS DATOS
while(1)
    
    L=input('Incerta valor de la Inductancia ... ');
    if(L>0)% ES CORRECTO EL DATO?
        break
    else
       disp('Incerte un valor correcto!!!') 
    end
end

while(1)
    
    C=input('Incerta valor de la Capacitancia ... ');
    if(C>0)
        break
    else
       disp('Incerte un valor correcto!!!') 
    end
end

while(1)
    
    R=input('Incerta valor de la Resistencia ... ');
    if(R>0)
        break
    else
       disp('Incerte un valor correcto!!!') 
    end
end

while(1)
    
    E=input('Incerta valor de la Fuente ... ');
    if(E=>0)
        break
    else
       disp('Incerte un valor correcto!!!') 
    end
end

q0=input('Incerta valor de q(0)= ');
Dq0=input('Incerta valor de Dq(0)= ');
syms q(t) t



eq=L*diff(q,t,2)+R*diff(q,t,1)+(1/C)*q==E;

disp('Ecuacion diferencial --->')
pretty(eq)

Dq=diff(q,t,1);
cond=[q(0)==q0;...
    Dq(0)==Dq0];

qn=dsolve(eq,cond);
disp('Solucion de Ecuacion q(t)--->')
pretty(qn)


qn=matlabFunction(qn);



t=0:0.0001:0.5;
plot(t,qn(t));
xlabel('Tiempo [ s ]');
ylabel('Carga [ q ]');
title('Carga  en el tiempo')
grid on













