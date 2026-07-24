/*SP4R02d01*/
/* WORK library used in place of the course SP4R library so the script is self-contained. */

/*Part A*/
data example_data;
   length First_Name $ 25 Last_Name $ 25;
   input First_Name $ Last_Name $ age height;
   datalines;
   Jordan Bakerman 27 68
   Bruce Wayne 35 70
   Walter White 51 70
   Henry Hill 65 66
   JeanClaude VanDamme 55 69
;
run;

proc print data=example_data;
run;

/*Part B*/
data example_data2;
   length First_Name $ 25 Last_Name $ 25;
   input First_Name $ Last_Name $ age height @@;
   datalines;
   Jordan Bakerman 27 68 Bruce Wayne 35 70 Walter White 51 70
   Henry Hill 65 66 JeanClaude VanDamme 55 69
   ;
run;

proc print data=example_data2;
run;
