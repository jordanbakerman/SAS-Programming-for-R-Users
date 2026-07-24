/*SP4R05s03 (Part A)*/
/* Self-contained portion of the solution: a two-tailed t-test significance
   level computed with PROBT, pushed to a macro variable with CALL SYMPUTX,
   then written to the log with %PUT. */

data _NULL_;
   x=-3;
   df=5;
   p=(1-probt(abs(x),df))*2;
   call symputx('sig_level',p);
run;

%put The significance level for the two-tailed t test is &sig_level;
