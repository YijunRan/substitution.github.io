figure
hold all

l=360;
List=load('./rescale_dynamics.txt');
%A=load(Str);
Name=List(:,1);
rescale_t=List(:,2);
rescale_I=List(:,3);
Color=List(:,4);
Type=List(:,5);




W=0;
for i=1:max(Name)
    
      tt=rescale_t(Name==i & Type==4);
      II=rescale_I(Name==i & Type==4);
      
      if length(tt)==0
          continue
      end
      
       MM=mean(Color(Name==i & Type==4));
       
       if MM>1
            MM=1;
        end
        
        x=MM*0.8+0.2;
        hsv=[268/360,x,0.91];
        rgb=hsv2rgb(hsv);
   
    
    
      
      W=W+1;
      plot(tt,II,'o','MarkerEdgeColor',rgb)
      
end 
    
    


tk=0:0.01:10;
T=10.^tk;

plot(T,T,'k-','LineWidth',3)
%eta0=1.0
set(gca,'xscale','log')
set(gca,'yscale','log')
xlim([10.^(0),10^10])
ylim([10.^(0),10^10])



hplot=plot([]);
x=36;
xword='t^{\eta}';
yword='Q';
set(gca, 'FontSize',x,'FontName','Times New Roman');
xlabel(xword,'FontSize',36,'FontName','Times New Roman');
ylabel(yword,'FontSize',36,'FontName','Times New Roman');

L1=strcat('$',xword,'$');
L2=strcat('$',yword,'$');
xlabel(L1,'Interpreter','latex');
ylabel(L2,'Interpreter','latex');








% 









