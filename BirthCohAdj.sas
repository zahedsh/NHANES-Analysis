/** 2005-2006**/
Libname CXHPV05 XPORT 'Directory for NHANES Data\HPVSWR_D.xpt';
Libname CXDEM05 XPORT 'Directory for NHANES Data\DEMO_D.xpt';
Libname IMQ05 XPORT 'Directory for NHANES Data\IMQ_D.XPT';
Libname CXSXQ05 XPORT 'Directory for NHANES Data\SXQ_D.xpt';

/** 2007-2008**/
Libname CXHPV07 XPORT 'Directory for NHANES Data\HPVSWR_E.xpt';
Libname CXDEM07 XPORT 'Directory for NHANES Data\DEMO_E.xpt';
Libname IMQ07 XPORT 'Directory for NHANES Data\IMQ_E.XPT';
Libname CXSXQ07 XPORT 'Directory for NHANES Data\SXQ_E.xpt';

/** 2009-2010**/
Libname CXHPV09 XPORT 'Directory for NHANES Data\HPVSWR_F.xpt';
Libname CXDEM09 XPORT 'Directory for NHANES Data\DEMO_F.xpt';
Libname IMQ09 XPORT 'Directory for NHANES Data\IMQ_F.XPT';
Libname CXSXQ09 XPORT 'Directory for NHANES Data\SXQ_F.xpt';

/** 2011-2012**/
Libname CXHPV11 XPORT 'Directory for NHANES Data\HPVSWR_G.xpt';
Libname CXDEM11 XPORT 'Directory for NHANES Data\DEMO_G.xpt';
Libname IMQ11 XPORT 'Directory for NHANES Data\IMQ_G.XPT';
Libname CXSXQ11 XPORT 'Directory for NHANES Data\SXQ_G.xpt';

/** 2013-2014**/
Libname CXHPV13 XPORT 'Directory for NHANES Data\HPVSWR_H.xpt';
Libname CXDEM13 XPORT 'Directory for NHANES Data\DEMO_H.xpt';
Libname IMQ13 XPORT 'Directory for NHANES Data\IMQ_H.XPT';
Libname CXSXQ13 XPORT 'Directory for NHANES Data\SXQ_H.xpt';

/** 2015-2016**/
Libname CXHPV15 XPORT 'Directory for NHANES Data\HPVSWR_I.xpt';
Libname CXDEM15 XPORT 'Directory for NHANES Data\DEMO_I.xpt';
Libname IMQ15 XPORT 'Directory for NHANES Data\IMQ_I.XPT';
Libname CXSXQ15 XPORT 'Directory for NHANES Data\SXQ_I.xpt';

/***********************************************************************************************************************************/
/***********************************************************************************************************************************/
/***********************************************************************************************************************************/



Data Prev05;       
merge CXHPV05.HPVSWR_D CXDEM05.DEMO_D IMQ05.IMQ_D CXSXQ05.SXQ_D;
by SEQN;

*Immunization;
/*
IF IMQ040=1 THEN VACCINE="YES"; ELSE IF IMQ040=2 THEN VACCINE="NO"; 
*/
length NDOSE $3;
NDOSE="0"; 

* Demographics;
length CouBirth $4;
length RACEETH $9;
IF DMDBORN=1 THEN CouBirth="US"; ELSE IF DMDBORN=2 OR DMDBORN=3 THEN CouBirth="Else"; 
IF RIDRETH1=1 OR RIDRETH1=2 THEN RACEETH="Hispanic"; ELSE IF RIDRETH1=3 THEN RACEETH="White"; ELSE IF RIDRETH1=4 THEN RACEETH="Black" ;ELSE IF RIDRETH1=5 THEN RACEETH="OtherRace";

IF 1980 <= 2006 - RIDAGEYR <= 1989 THEN BirthCoh="80s";
IF 1990 <= 2006 - RIDAGEYR <= 1998 THEN BirthCoh="90s"; 



* Sexual Behavior;
length SEXPART $3;
IF SXQ101=0 OR SXQ101=1 THEN SEXPART="0-1"; 
IF 2 <= SXQ101 <= 5 THEN SEXPART="2-5";
IF 6 <= SXQ101 <= 2000 THEN SEXPART=">=6";



Run;

/***********************************************************************************************************************************/
/***********************************************************************************************************************************/
 
Data Prev07;       
merge CXHPV07.HPVSWR_E CXDEM07.DEMO_E IMQ07.IMQ_E CXSXQ07.SXQ_E;
by SEQN;

*Immunization;
length NDOSE $3;
IF IMQ040=1 THEN VACCINE="YES"; ELSE IF IMQ040=2 THEN VACCINE="NO";
IF IMQ040=2 THEN NDOSE="0"; ELSE IF IMQ045=1 OR IMQ045=2 OR IMQ045=3 THEN NDOSE=">=1";

* Demographics;
length CouBirth $4;
length RACEETH $9;
IF DMDBORN2=1 THEN CouBirth="US"; ELSE IF DMDBORN2=2 OR DMDBORN2=4 OR DMDBORN2=5 THEN CouBirth="Else"; 
IF RIDRETH1=1 OR RIDRETH1=2 THEN RACEETH="Hispanic"; ELSE IF RIDRETH1=3 THEN RACEETH="White"; ELSE IF RIDRETH1=4 THEN RACEETH="Black"; ELSE IF RIDRETH1=5 THEN RACEETH="OtherRace";

IF 1980 <= 2008 - RIDAGEYR <= 1989 THEN BirthCoh="80s";
IF 1990 <= 2008 - RIDAGEYR <= 1998 THEN BirthCoh="90s"; 


* Sexual Behavior;
length SEXPART $3;
IF SXQ101=0 OR SXQ101=1 THEN SEXPART="0-1"; 
IF 2 <= SXQ101 <=5 THEN SEXPART="2-5";
IF 6 <= SXQ101 <= 2000 THEN SEXPART=">=6";

Run;

/***********************************************************************************************************************************/
/***********************************************************************************************************************************/

Data Prev09;       
merge CXHPV09.HPVSWR_F CXDEM09.DEMO_F IMQ09.IMQ_F CXSXQ09.SXQ_F;
by SEQN;

*Immunization;
length NDOSE $3;
IF IMQ040=1 THEN VACCINE="YES"; ELSE IF IMQ040=2 THEN VACCINE="NO";
IF IMQ040=2 THEN NDOSE="0"; ELSE IF IMQ045=1 OR IMQ045=2 OR IMQ045=3 THEN NDOSE=">=1";

* Demographics;
length CouBirth $4;
length RACEETH $9;
IF DMDBORN2=1 THEN CouBirth="US"; ELSE IF DMDBORN2=2 OR DMDBORN2=4 OR DMDBORN2=5 THEN CouBirth="Else"; 
IF RIDRETH1=1 OR RIDRETH1=2 THEN RACEETH="Hispanic"; ELSE IF RIDRETH1=3 THEN RACEETH="White"; ELSE IF RIDRETH1=4 THEN RACEETH="Black"; ELSE IF RIDRETH1=5 THEN RACEETH="OtherRace";

IF 1980 <= 2010 - RIDAGEYR <= 1989 THEN BirthCoh="80s";
IF 1990 <= 2010 - RIDAGEYR <= 1998 THEN BirthCoh="90s"; 



* Sexual Behavior;  
****** VARIABLE NAME CHANGED from thin year onward;
length SEXPART $3;
IF SXD101=0 OR SXD101=1 THEN SEXPART="0-1"; 
IF 2 <= SXD101 <=5 THEN SEXPART="2-5";
IF 6 <= SXD101 <= 2000 THEN SEXPART=">=6";

Run;

/***********************************************************************************************************************************/
/***********************************************************************************************************************************/

Data Prev11;       
merge CXHPV11.HPVSWR_G CXDEM11.DEMO_G IMQ11.IMQ_G CXSXQ11.SXQ_G;
by SEQN;

*Immunization;
length NDOSE $3;
IF IMQ040=1 THEN VACCINE="YES"; ELSE IF IMQ040=2 THEN VACCINE="NO";
IF IMQ040=2 THEN NDOSE="0"; ELSE IF IMQ045=1 OR IMQ045=2 OR IMQ045=3 THEN NDOSE=">=1";

* Demographics;
length CouBirth $4;
length RACEETH $9;
IF DMDBORN4=1 THEN CouBirth="US"; ELSE IF DMDBORN4=2 THEN CouBirth="Else";
IF RIDRETH1=1 OR RIDRETH1=2 THEN RACEETH="Hispanic"; ELSE IF RIDRETH1=3 THEN RACEETH="White"; ELSE IF RIDRETH1=4 THEN RACEETH="Black";ELSE IF RIDRETH1=5 THEN RACEETH="OtherRace";

IF 1980 <= 2012 - RIDAGEYR <= 1989 THEN BirthCoh="80s";
IF 1990 <= 2012 - RIDAGEYR <= 1998 THEN BirthCoh="90s"; 


* Sexual Behavior;
length SEXPART $3;
IF SXD101=0 OR SXD101=1 THEN SEXPART="0-1"; 
IF 2 <= SXD101 <=5 THEN SEXPART="2-5";
IF 6 <= SXD101 <= 2000 THEN SEXPART=">=6";

Run;

/***********************************************************************************************************************************/
/***********************************************************************************************************************************/

Data Prev13;       
merge CXHPV13.HPVSWR_H CXDEM13.DEMO_H IMQ13.IMQ_H CXSXQ13.SXQ_H;
by SEQN;

*Immunization;
length NDOSE $3;
IF IMQ040=1 THEN VACCINE="YES"; ELSE IF IMQ040=2 THEN VACCINE="NO";
IF IMQ040=2 THEN NDOSE="0"; ELSE IF IMQ045=1 OR IMQ045=2 OR IMQ045=3 THEN NDOSE=">=1"; 

* Demographics;
length CouBirth $4;
length RACEETH $9;
IF DMDBORN4=1 THEN CouBirth="US"; ELSE IF DMDBORN4=2 THEN CouBirth="Else";
IF RIDRETH1=1 OR RIDRETH1=2 THEN RACEETH="Hispanic"; ELSE IF RIDRETH1=3 THEN RACEETH="White"; ELSE IF RIDRETH1=4 THEN RACEETH="Black";ELSE IF RIDRETH1=5 THEN RACEETH="OtherRace";

IF 1980 <= 2014 - RIDAGEYR <= 1989 THEN BirthCoh="80s";
IF 1990 <= 2014 - RIDAGEYR <= 1998 THEN BirthCoh="90s"; 


* Sexual Behavior;
length SEXPART $3;
IF SXD101=0 OR SXD101=1 THEN SEXPART="0-1"; 
IF 2 <= SXD101 <=5 THEN SEXPART="2-5";
IF 6 <= SXD101 <= 2000 THEN SEXPART=">=6";

Run;

/***********************************************************************************************************************************/
/***********************************************************************************************************************************/

Data Prev15;       
merge CXHPV15.HPVSWR_I CXDEM15.DEMO_I IMQ15.IMQ_I CXSXQ15.SXQ_I;
by SEQN;

* Immunization;
length NDOSE $3;
IF IMQ060=1 THEN VACCINE="YES"; ELSE IF IMQ060=2 THEN VACCINE="NO";
IF IMQ060=2 THEN NDOSE="0"; ELSE IF IMQ100=1 OR IMQ100=2 OR IMQ100=3 THEN NDOSE=">=1"; 

* Demographics; 
length CouBirth $4;
length RACEETH $9;
IF DMDBORN4=1 THEN CouBirth="US"; ELSE IF DMDBORN4=2 THEN CouBirth="Else";
IF RIDRETH1=1 OR RIDRETH1=2 THEN RACEETH="Hispanic"; ELSE IF RIDRETH1=3 THEN RACEETH="White"; ELSE IF RIDRETH1=4 THEN RACEETH="Black";ELSE IF RIDRETH1=5 THEN RACEETH="OtherRace";

IF 1980 <= 2016 - RIDAGEYR <= 1989 THEN BirthCoh="80s";
IF 1990 <= 2016 - RIDAGEYR <= 1998 THEN BirthCoh="90s"; 



* Sexual Behavior;
length SEXPART $3;
IF SXD101=0 OR SXD101=1 THEN SEXPART="0-1"; 
IF 2 <= SXD101 <=5 THEN SEXPART="2-5";
IF 6 <= SXD101 <= 2000 THEN SEXPART=">=6";

Run;

/***********************************************************************************************************************************/
/***********************************************************************************************************************************/

/* For all */
Data PrevAll;
Set Prev05 Prev07 Prev09 Prev11 Prev13 Prev15;
NEWWT=WTMEC2YR/6;

IF RIAGENDR=2 THEN SEX="female"; 

IF 18 <= RIDAGEYR <= 26 THEN AGE="Young";

* Age groups for SURVEY FREQ prevalence values (figures);
IF 18 <= RIDAGEYR <= 20 THEN AGEGRP="18-20";
IF 21 <= RIDAGEYR <= 23 THEN AGEGRP="21-23";
IF 24 <= RIDAGEYR <= 26 THEN AGEGRP="24-26";
IF 27 <= RIDAGEYR <= 29 THEN AGEGRP="27-29";
IF 30 <= RIDAGEYR <= 32 THEN AGEGRP="30-32";


IF (BirthCoh="80s" OR BirthCoh="90s") AND (AGE="Young") AND (SEX="female") THEN BCEligble="YES"; 
*IF BirthCoh="80s" OR BirthCoh="90s" THEN BCEligble="YES"; 

IF SXD031 <= 76 THEN AgeSexDeb=SXD031;

/**combined HPV16 and 18**/
/*
IF LBDR16=1  Then HPV16=1; ELSE IF LBDR16=2 THEN HPV16=0; */
IF LBDR16=1 OR LBDR18=1 THEN HPV1618=1; ELSE IF LBDR16=2 AND LBDR18=2 THEN HPV1618=0; 
Run;


* variable RIDRETH1 was used for race/ethnicity ; 


* prevalence calculation;
PROC SURVEYFREQ DATA=PrevAll;
CLUSTER SDMVPSU; 
 STRATA SDMVSTRA; 
TABLES AGEGRP*BirthCoh*HPV1618/ WCHISQ; *ROW CL WCHISQ row cl ; 
weight NEWWT;
RUN;





PROC SURVEYLOGISTIC DATA=PrevAll;
CLUSTER SDMVPSU; 
 STRATA SDMVSTRA; 
 CLASS RACEETH (REF='White') CouBirth (REF='US') BirthCoh (REF='80s') SEXPART (REF='0-1') NDOSE (REF='0');* AGEGRP (REF='18-20');
MODEL HPV1618 (event='1') =  RACEETH CouBirth BirthCoh SEXPART NDOSE AgeSexDeb RIDAGEYR;* AGEGRP;
output out=Adj_Analysis1618 lower=lcl upper=ucl p=pred_probs;
DOMAIN BCEligble;
weight NEWWT;
RUN;



Data Modif_Adj_Analysis1618;
Set Adj_Analysis1618;

* for revision;
length AgeGrpDomain $5;
IF BCEligble="YES" AND AGEGRP="18-20" THEN AgeGrpDomain="18-20"; 
IF BCEligble="YES" AND AGEGRP="21-23" THEN AgeGrpDomain="21-23";
IF BCEligble="YES" AND AGEGRP="24-26" THEN AgeGrpDomain="24-26";


length DOSEDomain $3;
IF BCEligble="YES" AND NDOSE="0" THEN DOSEDomain="0"; ELSE IF BCEligble="YES" AND NDOSE=">=1" THEN DOSEDomain=">=1"; 

length RACEDomain $9;
IF BCEligble="YES" AND RACEETH="White" THEN RACEDomain="White"; IF BCEligble="YES" AND RACEETH="Black" THEN RACEDomain="Black"; 
IF BCEligble="YES" AND RACEETH="Hispanic" THEN RACEDomain="Hispanic"; IF BCEligble="YES" AND RACEETH="OtherRace" THEN RACEDomain="OtherRace";

length SEXPARTDomain $3;
IF BCEligble="YES" AND SEXPART="0-1" THEN SEXPARTDomain="0-1"; IF BCEligble="YES" AND SEXPART="2-5" THEN SEXPARTDomain="2-5"; IF BCEligble="YES" AND SEXPART=">=6" THEN SEXPARTDomain=">=6";

length CouBirthDomain $4;
IF BCEligble="YES" AND CouBirth="US" THEN CouBirthDomain="US"; IF BCEligble="YES" AND CouBirth="Else" THEN CouBirthDomain="Else";
RUN;

PROC SURVEYREG DATA=Modif_Adj_Analysis1618;
CLUSTER SDMVPSU; 
 STRATA SDMVSTRA; 
 CLASS BirthCoh;
MODEL pred_probs=BirthCoh;
DOMAIN SEXPART;   * By changing this each time we get results for every level of the variable;
lsmeans BirthCoh / diff cl;
weight NEWWT; 
RUN;





