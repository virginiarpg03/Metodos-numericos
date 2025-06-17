%HALLAR CON EL METODO DE LA BISECCION LAS RAÍCES

f = @(x) x.^2 - 1- sin(x);

%busco a y b tal que sus imagenes tengan signos distintos (intervale no enorme xdeu)%

%la pinto para saber que a y b cojer%

x= -3: .01: 10;
plot(x, f(x));
grid

%como tiene dos raízces primero hago una con el intervalo -1,0 y luego la otra con el 1,2%

a=1 ;
b=2;   

an=a;
bn=b;
delta= 1e-6 ; %la que me den%

n= ceil ( log2 ((b-a)/delta )); %la formula que sabemos wei%

format long

%voy a indicar en cada interaccion que intervalo cojo%
   for i= 1:n 
       
       xn= (an+bn)*0.5;    %ponemos los casos posibles%
       
          if f(xn)==0                   %caso1: xn=x*%
              break;
              
          elseif f(xn)*f(an)<0          %caso2: x* estará en el nuevo intervalo an-xn %
              
              an=an;
              bn=xn;
        
       fprintf ('interaccion número %d : x* estará en el intervalo [ %f, %f] \n', i, an, bn)      
              
          else                          %caso3: x* está en el nuevo intervalo xn-bn % 
              
              an=xn;
              bn=bn;
              
        fprintf ('interaccion número %d : x* estará en el intervalo [ %f, %f] \n', i, an, bn)
        
          end
          
       
   end
   
   xn= (an+bn)*0.5;
   
   fprintf ('x*= %f', xn)
   
