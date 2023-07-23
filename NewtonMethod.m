function [x , ite, matout] = NewtonMethod (initial_guess, tol, maxite,custom_function, var)
%{
inputs:
initial guess is our starting x, a point near answer
tol is for tolerance 
maxite is for maximum iterations
custum_function is for input function with only one variable 
var is for variable used in input function
outputs:
x is for final answer
ite is for how many iterations it took until it reached tolerance
%}

syms  x 
x = var;
f(x) = custom_function;
g = diff(f);
x(1)=initial_guess;

for i = (2:1:maxite+1)
    x(i)= x(i-1) - f(x(i-1))/g(x(i-1)); 
    if ( abs(f(x(i-1))) <=  double(tol) )
        break;
    end       
    matout(i,:)=[double(x(i)),double(f(x(i-1))),double(g(x(i-1)))];
end

ite=i-1;
x = double(x(i));

end

