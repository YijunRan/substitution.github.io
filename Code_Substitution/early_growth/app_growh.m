fittype='poly1';
Ex=[];
figure
hold all
file='./early_dynamic.txt';
A=load(file);
name=A(:,1);
time=A(:,2);
I=A(:,3);
type=A(:,4);
Scolor=colormap(jet(2400));


now=3; 
select=7;
count3=0;



for i=1:2672
    ppx=time(name==i & type==now);
    ppy=I(name==i & type==now);


    PX=ppx(ppx<=select);
    PY=ppy(ppx<=select);


    [aa,bb]=fit(log(PX),log(PY),'a*x','StartPoint',[0]);
    C=coeffvalues(aa);
    kappa=floor(0.1*select+1)/100;
    L=1-kappa;
    
    if bb.rsquare<L     
        continue
    end

    Ex=[Ex,C];
    


%     MM=(C-0.3)/(4-0.3);
%     if MM>0.8
%         MM=0.8;
%     end
% 
%     if C<0.3
%         MM=0.001;
%     end
%h=plot(ppx,ppy/ppy(1),'-','Color',Scolor(round(MM*600)+1000,:)); % impact
%%vs. t   % change color..

   h=plot(ppx,ppy/ppy(1),'-')
   count3=count3+1


end

 set(gca,'xscale','log')
 set(gca,'yscale','log')

x=1:1000;
h=plot(x,x,'k-');


x=0:1;
X=10.^x;
h=plot(X,X,'k-','Linewidth',4);

x=0:1;
X=10.^x;
h=plot(X,X.^2,'k-','Linewidth',4);

x=0:1;
X=10.^x;
h=plot(X,X.^0.5,'k-','Linewidth',4);


xlim([1,10])
ylim([1,1000])


x=48;
xword='t~(days)';
yword='I(t)/I(1)';
set(gca, 'FontSize',x,'FontName','Times New Roman');
xlabel(xword,'FontSize',36,'FontName','Times New Roman');
ylabel(yword,'FontSize',36,'FontName','Times New Roman');

L1=strcat('$',xword,'$');
L2=strcat('$',yword,'$');
xlabel(L1,'Interpreter','latex');
ylabel(L2,'Interpreter','latex');

% figure
% [x,y]=distribution(Ex,0.1);
% bar(x,y)
% h=plot([]);
% my_plot_settings(h,'\eta','p(\eta)')





