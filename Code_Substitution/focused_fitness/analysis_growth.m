select=4;
% 4 for scientific fields
% 3 for apps 
% 2 for automobiles




List=load('./point5_dynamics.txt');
Name=List(:,1);
t=List(:,2);
I=List(:,3);
eta=List(:,4);
h=List(:,6);
tau=List(:,5);
Type=List(:,7);

if select==3
    l=24;    
elseif select==2
    l=30;
elseif select==4
    l=360;
end



figure
hold all
W=0;
for i=1:max(Name)
    
      tt=t(Name==i & Type==select);
      II=I(Name==i & Type==select);
     
      plot(tt,II,'-')
      
end 


hplot=plot([]);
x=36;
xword='t';
yword='I';
set(gca, 'FontSize',x,'FontName','Times New Roman');
xlabel(xword,'FontSize',36,'FontName','Times New Roman');
ylabel(yword,'FontSize',36,'FontName','Times New Roman');

L1=strcat('$',xword,'$');
L2=strcat('$',yword,'$');
xlabel(L1,'Interpreter','latex');
ylabel(L2,'Interpreter','latex');
set(gca,'Xscale','log')
set(gca,'Yscale','log')

    


figure
hold all
W=0;
for i=1:max(Name)
    
      tt=l*t(Name==i & Type==select);
      II=I(Name==i & Type==select);
      
      h0=mean(h(Name==i & Type==select));
      eta0=mean(eta(Name==i & Type==select));
      tau0=mean(tau(Name==i & Type==select));
      
      SSS=II/(h0*tau0^(-eta0)*eta0);
      TTT=tau0*tt;
      plot(TTT,SSS,'-')
      
end 


hplot=plot([]);
x=36;
xword='\tilde{t}';
yword='\tilde{I}(t)';
set(gca, 'FontSize',x,'FontName','Times New Roman');
xlabel(xword,'FontSize',36,'FontName','Times New Roman');
ylabel(yword,'FontSize',36,'FontName','Times New Roman');

L1=strcat('$',xword,'$');
L2=strcat('$',yword,'$');
xlabel(L1,'Interpreter','latex');
ylabel(L2,'Interpreter','latex');
set(gca,'xscale','log')

set(gca,'ylim',[0,1]);
set(gca,'xlim',[0.01,20]);

tk=-2:0.001:2;
Tk=10.^tk;
a=1.5;
Sk=gammainc(Tk,a)*gamma(a);


plot(Tk,Sk,'-','LineWidth',1,'Color','k')



