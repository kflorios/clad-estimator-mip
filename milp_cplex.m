function [x,deviation,feasible, time]=milp_cplex(c,A,b,Aeq,beq,lb,ub,n, p, best);   
% Solves a mixed integer lp using gurobi 5.0.1 
% c: is objective function coefficients A: is constraint matrix   b: is constraint vector
% lb: lower bound  ub: upper bound  n: number of 0-1 variables
% best: is best solution so far
% Note this uses the MATLAB/Gurobi Interface documented at
% http://www.gurobi.com/documentation/5.0/reference-manual/node650
% Also, it assumes first n variables must be integer.
% The MIP equations of the maximum score estimator are available at
% Florios. K, Skouras, S. (2008) Exact computation of maximum weighted
% score estimators, Journal of Econometrics 146, 86-91.
% Written by Kostas Florios, July 20, 2012
%
% gurobi 5.0.1
% cd c:/Users/jones/gurobi500/win64/matlab
% gurobi_setup
%
% cd C:\gurobi501\win32\matlab
% gurobi_setup
%
% cplex 12.6
% addpath('C:\Program Files\IBM\ILOG\CPLEX_Studio_Preview126\cplex\matlab\x86_win32')
% Greg corei3 2016
% addpath('D:\Program Files\IBM\ILOG\CPLEX_Studio_Preview126\cplex\matlab\x86_win32')

model.Aineq = sparse(A) ;
model.f = c ;
model.bineq = b ;
model.Aeq = sparse(Aeq) ;
model.beq = beq' ;
model.lb = lb ;
model.ub = ub ;
%model.ctype = [repmat('B',size(b,2),1) ; repmat('C',size(c,2)-size(b,2),1)]' ;
model.ctype = [repmat('B',n,1) ; repmat('C',p,1) ; repmat('C',n,1) ; repmat('C',n,1) ; repmat('C',n,1)]' ;


opt = cplexoptimset('cplex') ;
opt.mip.display = 4 ;
opt.mip.interval = 1000 ;

opt.timelimit= 1800 ;
opt.mip.tolerances.mipgap = 0.00 ;
opt.parallel = 1 ;
opt.threads = 1 ;
opt.mip.strategy.file = 3 ; 
opt.workmem = 1024 ;
opt.emphasis.mip = 3 ;

opt.exportmodel = 'G:\KOSTAS\Core-i5-Laptop\matlab2011\milp-cplex-2016-for-CLAD\myModel.lp' ;

model.options = opt;


[x,fval,exitflag,output] = cplexmilp(model) ;

  fprintf('Optimization returned status: %s\n', output.message);
  fprintf('Objective Value: %e\n', fval);
  fprintf('(Wall clock) Time elapsed (s): %e\n', output.time);
  fprintf('Decision variables: show only the  betas\n');
  %disp(x)


x=x((n+1):(n+p))
deviation=fval;
feasible=output.message;
time=output.time;
return;