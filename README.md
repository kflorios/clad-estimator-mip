# clad-estimator-mip
Exact computation of Censored Least Absolute Deviations estimator with Mixed Integer Programming via MATLAB code

Use handy matlab function CladCompute.m in order to exactly compute the CLAD estimator with MIP in MATLAB.
The function sets up the matrices A,b,c,Aeq,beq,lb,ub of the MIP model,
and then relies on a MIP solver to solve it.
We can use CPLEX, or the built-in function intlinprog() in MATLAB R2014a and after.

The dataset is read in readXyw.m function via the files X.txt and ys.txt which can be adopted as desired.
Currently, left censoring at zero is supposed, as is in most applications of CLAD.
In order to have a more flexible modeling approach, readers are suggested to consult the GAMS version
of the same model in https://www.gams.com/modlib/libhtml/clad.htm.

Feedback for the MATLAB code at: cflorios@central.ntua.gr, cflorios@aueb.gr

Suggested Reference:  

Bilias, Yannis and Florios, Kostas and Skouras, Spyros, Exact Computation of Censored Least Absolute Deviations Estimators (December 28, 2013). Available at SSRN: http://ssrn.com/abstract=2372588

