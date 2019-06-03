
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
    LL=1-kappa;
    if bb.rsquare<LL      
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
%h=plot(PX.^C,PY,'-','Color',Scolor(round(MM*600)+1000,:)); % impact
%%vs. t   % change color

   h=plot(PX.^C,PY,'-')
   
   count3=count3+1


end

 set(gca,'xscale','log')
 set(gca,'yscale','log')

x=1:1000;
h=plot(x,x,'k-');




xlim([1,1000])
ylim([1,1000])


x=48;
xword='t^\eta';
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


      %h=plot(ppx,ppy,'-','Color',rgb); % impact vs. t
      h=plot(PX.^C,PY,'-','Color',rgb); % normalized impact
      count3=count3+1
end


 set(gca,'xscale','log')
 set(gca,'yscale','log')


x=0:4;
X=10.^x;
h=plot(X,X,'k-','Linewidth',4);

xlim([1,10000])
ylim([1,10000])


x=48;
xword='t^{\eta}';
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
Scolor=colormap(jet(180));


now=2; 
select=4;   % early stage
select2=10;  % further test for the fitting exponent
count3=0; 
error_toloence=0.5;
DD=[];


for i=1:126
    ppx=time(name==i & type==now);
    ppy=I(name==i & type==now);
    
    PX=ppx(ppx<=select);
    PY=ppy(ppx<=select);


    [aa,bb]=fit(log(PX),log(PY/PY(1)),'a*x','StartPoint',[0]);
    C=coeffvalues(aa);
    
    
    PX2=ppx(ppx<=select2);
    PY2=ppy(ppx<=select2);

    [aa,bb2]=fit(log(PX2),log(PY2/PY2(1)),'a*x','StartPoint',[0]);
    C2=coeffvalues(aa);
    
    difference=abs(C-C2); % exponent different
    kappa=floor(0.1*select+1)/100;
    LL=1-kappa;
    % for selecting power law growth
    if bb.rsquare<LL
        continue
    end    % high r-square
    
    
    if length(PX2)<select2 && difference>0.2*error_toloence
        continue
    end  % longer enough dynamic
    
    if difference>error_toloence
        continue
    end     % smaller fitting varience 
    
   %  for selecting power law growth, 

    
    
        
    Ex=[Ex,C];
%     MM=(C-0.8)/(5-0.8);
%     if MM>1
%         MM=1;
%     end
%     if MM<0.01
%         MM=0.01;
%     end
%     
%     % Color Setting
%     
%     if C>3.5
%        M=3.5;
%     else
%         M=C;
%     end

    %h=plot(ppx,ppy/ppy(1),'-','Color',Scolor(round(M*20+1),:));
    %h=plot(ppx,ppy/ppy(1),'-');
    
    h=plot(PX.^C,PY,'-');
    %h=plot(ppx,ppy/ppy(1),'-','Color',Scolor(round(MM*50+20),:));
    %h=plot(PX.^C,PY/PY(1),'-','Color',Scolor(round(MM*50+10),:)); % normalized impact 
    count3=count3+1
        



end


 set(gca,'xscale','log')
 set(gca,'yscale','log')

x=1:1000;
h=plot(x,x,'k-');


xlim([1,100])
ylim([1,100])


x=48;
xword='t^\eta';
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











