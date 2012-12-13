clf();
N = 300;                    //number of points(matrix will also be N  by N)
x = 0:1/N:1;                //generate one extra point to be able to calculate i-1
function y = f ( x )
    y = x
endfunction                 //input function

//<task1>
a = zeros(N,N); //allocate matrix
for j=2:N+1
    for i=2:N+1
        xjl = (x(j-1)+x(j))/2;
        
        if(i<j)
            alpha = xjl-x(i);
            beta = xjl-x(i-1);
            a(i-1,j-1) = alpha*log(alpha)-beta*log(beta)-alpha+beta;
        end;
        if(i>j)
            alpha = x(i) - xjl;
            beta = x(i-1)- xjl;
            a(i-1,j-1) = -alpha*log(alpha)+beta*log(beta)+alpha-beta;
        end;
        if(i==j)
            alpha = x(i) - xjl;
            beta = xjl - x(i-1);
            a(i-1,j-1) = -alpha*log(alpha)-beta*log(beta)+x(i)-x(i-1);
        end;
        
    end;
end;
a = a/(2*%pi);   //divide by 2*PI
//</task1>

y = (x(2:N+1)+x(1:N))/2;    //we will be plotting for middle points for each segment
g = f(y);                   //generate vector from input function
res = g*inv(a);             //calc gaussian
subplot(121);
plot(y,res);                //plot the result
xgrid(1);
xtitle('Завдання 1');

//<task2>
a = zeros(N,N);         //reset matrix for task2
function y = fx ( x )
    y = (x+2)*%pi/N;
endfunction             //define some function needed further in calculations
for j=2:N+1
    for i=2:N+1
        xjl = (x(j-1)+x(j))/2;
        xil = (x(i-1)+x(i))/2;
        a(i-1,j-1) = sum((xil^2+xjl^2-2*xjl*xil*cos(fx(0:N-1))).^-0.5);
    end;
end;
a = a*2/N*N;
//</task2>


res = g*inv(a);             //calc gaussian
subplot(122);
plot(y,res);                //plot the result
xgrid(1);
xtitle('Завдання 2');
