%__________________________________________________________________________________________________________________________________%
%EJEMPLO 1: hallar eˆ0.5%

x=0.5;
n=100; %lo voy cambiando%
Pn=1;

format long;
 
for i= 1 : 1+n
     
     Pn= Pn + x^i/ factorial(i)
     
end
 
 


%_________________________________________________________________________________________________________________________________%
 %EJEMPLOOOOO 2: hallar sen(1) con un error de menos de 10ˆ-6%
 
 format long;
 
 n=9 %voy cambiando la n hasta que veo que es menor que 10ˆ-6%
 
 1/factorial(n+1)
 
 
 
 %_____en teoría con esto siguiente debería parar en n=9 y así no tener que ir probando como parguelas, sale pero raro_______________%
 
 n=100; %por poner u número, podría ser cualquiera%
 
 for i = 1 : n
    
      
     R= 1/factorial(n+1);
    
 %hago un if para indicar que en el momento que el error sea menor del que quiero pare y me de el número de la n que es uwu%
 
     if R < 10^(-6)
         
         break;
     end
     
 end
 
 
 
 
 %____________________________________________________________________________________________________________________________________%
 
 
 
     
 