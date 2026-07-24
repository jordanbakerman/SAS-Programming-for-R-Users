/*SP4R05d05 — the %mymac macro definition, exercised by two callers.*/
/* The %macro below is verbatim from Code/SP4R05d05.sas (Parts A-D). The two
   %mymac(...) calls at the bottom replace the course's original callers so the
   bundle is self-contained and exercises both the one-parameter and
   two-parameter argument branches with PROC MEANS output. */

%macro mymac(dist,param1,param2=,n=100,stats=no,plot=no);

/*Part B*/
%if &dist= %then %do;
   %put Dist is a required argument;
   %return;
%end;

%if &param1= %then %do;
   %put Param1 is a required argument;
   %return;
%end;

/*Part C*/
%if &param2= %then %do;
   data random (drop=i);
      do i=1 to &n;
         y=rand("&dist",&param1);
	     x+1;
	     output;
      end;
   run;
%end;

%else %do;
   data random (drop=i);
      do i=1 to &n;
         y=rand("&dist",&param1,&param2);
	     x+1;
	     output;
      end;
   run;
%end;

/*Part D*/
%if %upcase(&stats)=YES %then %do;
   proc means data=random mean std;
      var y;
   run;
%end;

%mend;

/* Caller 1: single-parameter distribution branch (%param2 empty) with stats */
%mymac(dist=Poisson,param1=5,stats=yes)

/* Caller 2: two-parameter distribution branch with MPRINT tracing on */
options mprint;
%mymac(dist=Normal,param1=100,param2=10,n=100,stats=yes)
