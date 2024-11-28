%Rappresentiamo un pendolo di Newton.

clear;
close all;

%Per prima cosa scriviamo due funzioni, "creaFilo" e "creaSfera", tramite
%le quali creeremo i fili e le sfere del pendolo.

%Fatto ciò scriviamo una funzione "Fpendolo" che rappresenti la dinamica
%della generica pallina del pendolo. In uscita avremo i vari angoli di ogni
%pallina al generico istante t; essi ne definiranno la posizione.

%Fatto ciò risolviamo tale funzione con il comando "ode45".

n=7;
y0=zeros(2*n,1);
y0(1)=-pi/6;
l=0.12;
d=0.02;
r=d/2;
alfa=1.5;
g=9.8;
m=(4*pi*7800*(r^3))/3;
k=10^7;

vtempi=linspace(0,2,300);

[t,y]= ode45(@Fpendolo,vtempi,y0);

%Dagli angoli theta trovati come soluzione della precedente ode45,
%plottiamo al variare di i e t le sfere.

for k=1:length(t)
    for i=1:n
        
    xc(k,i)=i*d + l*sin(y(k,i));
    yc(k,i)=0;
    zc(k,i)=-l*cos(y(k,i));
    
    xa=i*d;
    ya=0;
    za=0;
    
    creaFilo(xa,ya,za,xc(k,i),yc(k,i),zc(k,i))
    hold on
    creaSfera(xc(k,i),yc(k,i),zc(k,i),r)
    hold on
end    
hold off 
pause(0.01)
end
