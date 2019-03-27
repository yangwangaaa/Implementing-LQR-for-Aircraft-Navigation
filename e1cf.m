function cost = e1cf(u)
t=0:0.1:8;
w1=0;
w2=1;
[tf,xf]=sim('e1',t',[],[t' u]);
cost = 0.5*w1*(xf(end,1)-100).^2 + 0.5*w2*(xf(end,2)).^2 + 0.5*0.1*trapz(u.*u);
end