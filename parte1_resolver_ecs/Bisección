%___________________________________________________________________________________________________________________________%
%calcular la Xn con una determinada delta%

f= @(x) 4*pi^2 * x.^4 - 2000*pi*x - 500;

%busco a y b tal que sus imagenes tengan signos distintos (intervale no enorme xdeu)%

%la pinto para saber que a y b cojer%

x= 0: .01: 10;
plot(x, f(x));
grid

% he visto que en este caso está entre el 5 y el 6%

a=5 ;
b=6 ;   

an=a;
bn=b;
delta= 1e-6 ; %la que me den%

n= ceil ( log2 ((b-a)/delta )); %la formula que sabemos wei%


   for i= 1:n 
       
       xn= (an+bn)*0.5;    %ponemos los casos posibles%
       
          if f(xn)==0                   %caso1: xn=x*%
              break;
              
          elseif f(xn)*f(an)<0          %caso2: x* estará en el nuevo intervalo an-xn %
              
              an=an;
              bn=xn;
              
          else                          %caso3: x* está en el nuevo intervalo xn-bn % 
              
              an=xn;
              bn=bn;
              
          end
          
       
   end
   
   xn= (an+bn)*0.5
   
   
