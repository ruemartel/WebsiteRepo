{smcl}
{* *! version 1.0.0 05mar2015}{...}
{cmd:help kfwebs}
{hline}

{title:Title}

{phang}
{bf:kfwebs} {hline 2} Routines to get bootstrap test statistics and to control for the Generalized Familywise Error Rate (k-FWE)

{title:Syntax}

{p 4 21 2}
{cmd:kfwebs} {cmd:(}{depvar:1} {varlist:1}{cmd:)}
{cmd:(}{it:depvar2} {it:varlist2}{cmd:)} {it:...}{cmd:(}{it:depvarN}
{it:varlistN}{cmd:)} {ifin} [{cmd:,} {opt TEST:var(varlist)} {opt K:values(numlist)} {opt alphas(numlist)} {it:{help kfwebs##options:options}}]


{synoptset 25}{...}
{p2coldent:{it:mandatory}}description{p_end}
{synoptline}
{synopt:{opth test:var(varlist)}}specify variables to test{p_end}
{synopt:{opth k:values(numlist)}}k values to control for k-FWE (k>=1){p_end}
{synopt:{opth alphas(numlist)}}significance levels {p_end}
{synoptline}


{synoptset 25 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt hypadd(hyp1; hyp2;...)}}additional hypotheses not included in testvar, separated by semi-colon operator(;){p_end}
{synopt:{opt method(method)}}{it:method} may be basic or studentized, default is studentized{p_end}
{synopt:{opt nmax(integer)}} max value for Operative Method, default is 50 {p_end}

{syntab :Resampling}
{synopt :{opt str:ata(varname)}}variable identifying strata{p_end}
{synopt :{opt cl:uster(varname)}}variable identifying cluster{p_end}
{synopt :{opt w:eight(varname)}}variable identifying weight{p_end}
{synopt :{opt R:eps(rep_num)}}perform # bootstrap replications{p_end}
{synopt :{opt seed(#)}}set random-number seed to #{p_end}

{syntab :saving}
{synopt :{opt save(filename)}}{it:save} store the original test statistics and bootstrap replicates in a Stata data file on disc under the name {it:filename}{p_end}
{synoptline}
{p2colreset}{...}

{title:Description}

{pstd}{cmd:kfwebs} should be applied in a multiple regression context, and it is up to 
the user to choose between the basic or studentized method. The first routine draws {it:reps} 
random samples with replacement from the data in memory (using the bsample stata command) and 
computes the 'centered' test statistics in each step. The second routine computes the critical 
values in order to control the generalized familywise error rate, k-FWE, as described 
in Algorithms 4.1-4.4 in "Formalized Data Snooping Based on Generalized Error Rates" 
of J.P. Romano and M. Wolf (Econometric Theory,2008).

{pstd}{cmd:Note}: kfwebs routine is designed to be used with svmat2. So make sure you have installed it. 

{title:Examples}

{phang2}{cmd:. webuse auto}{p_end}
{phang2}{cmd:. kfwebs (price weight length gear_ratio displacement) (turn weight length gear_ratio displacement foreign) if mpg>=20, testvar(weight length gear_ratio) kvalue(1 3) alphas(0.05) rep(5000) hypadd(weight; length) cluster(make)}{p_end}

{title:Saved results}

{pstd}
{cmd:kfwebs} saves the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:r(critval_k_a)}}critical values for each step j for pair kvalue-alpha{p_end}
{synopt:{cmd:r(res_k_a)}}results matrix for each pair kvalue-alpha{p_end}

{title:Author}

{pstd}Soledad Giardili, University College London (UCL), s.giardili@ucl.ac.uk {p_end}
