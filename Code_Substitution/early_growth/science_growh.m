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



now=4; 
select=18;
count3=0;




for i=1:6399
    ppx=time(name==i & type==now);
    ppy=I(name==i & type==now);


    PX=ppx(ppx<=select);
    PY=ppy(ppx<=select);
    

    [aa,bb]=fit(log(PX),log(PY),'a*x','StartPoint',[0]);
    C=coeffvalues(aa);
    kappa=floor(0.1*select+1)/100;
    LL=1-kappa;
    
        if bb.rsquare<LL
            continue
        end

    Ex=[Ex,C];


    MM=(C-0.8)/(3-0.8);
        if MM>1
            MM=1;
        end
        
        x=MM*0.8+0.2;
        hsv=[268/360,x,0.91];
        rgb=hsv2rgb(hsv);


      h=plot(ppx,ppy,'-','Color',rgb); % impact vs. t
      %h=plot(PX.^C,PY,'-','Color',rgb); % normalized impact 
      count3=count3+1
end


 set(gca,'xscale','log')
 set(gca,'yscale','log')


%my_plot_settings(h,'\tau^{\eta}','I/I(1)');

x=0:2;
X=10.^x;
h=plot(X,X,'k-','Linewidth',4);

x=0:2;
X=10.^x;
h=plot(X,X.^2,'k-','Linewidth',4);

x=0:2;
X=10.^x;
h=plot(X,X.^0.5,'k-','Linewidth',4);


xlim([1,18])
ylim([1,10000])


x=48;
xword='t';
yword='I(t)/I(1)';
set(gca, 'FontSize',x,'FontName','Times New Roman');
xlabel(xword,'FontSize',36,'FontName','Times New Roman');
ylabel(yword,'FontSize',36,'FontName','Times New Roman');

L1=strcat('$',xword,'$');
L2=strcat('$',yword,'$');
xlabel(L1,'Interpreter','latex');
ylabel(L2,'Interpreter','latex');


% figure
% [x,y]=distribution(Ex,0.2);
% bar(x,y)
% h=plot([]);
% my_plot_settings(h,'\eta','p(\eta)')



