function [value,estimates,time,quality]=CladCompute()


%Main Program: Computes Max score by defining a MILP and calling milp.m
tic
[X,y,w]=readXyw();
[X,mu,sigma]=standardizeX(X,y);
[c,A,b]=definecAb(X,y,w);
[lb,ub, Aeq, beq, n, p, best]=definelbub(X,y);
%[x,fval,exitflag]=milp(c,A,b,Aeq,beq,lb,ub,n, p, best);
%[x,cost,feasible, time]=milp_cplex(c,A,b,Aeq,beq,lb,ub,n, p, best);
intcon=[1:n];
[x,fval,exitflag,output] = intlinprog(c,intcon,A,b,Aeq,beq,lb,ub);

estimatesNorm=x((n+1):(n+p))
value=fval
status=exitflag
runtime=output

estimatesRaw=denormalizeEstimates(estimatesNorm,mu,sigma)
estimates=estimatesRaw

estimates=estimatesRaw
value=fval
time=toc
quality=exitflag;

end