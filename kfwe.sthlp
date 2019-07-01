{smcl}
{* *! version 1.0.0 01Mar2015}{...}
{cmd:help kfwe}
{hline}

{title:Title}

{phang}
{bf:kfwe} {hline 2} Routine designed to control for the Generalized Familywise Error Rate (k-FWE)

{title:Syntax}

{p 4 21 2}
{cmd:kfwe} {helpb using} {it:filename}{cmd:,} {opt bst:stat(filename)} [{cmd:}{it:options}]

{synoptset 25}{...}
{p2coldent:{it:mandatory}}description{p_end}
{synoptline}
{synopt :{opt filename}}csv file with a (1 x S) vector of test statistics corresponding to the S null hypothesis{p_end}
{synopt:{opth bst:stat(filename)}}csv file with a (M x S) vector of bootstrap test statistics{p_end}

{synoptset 25}{...}
{p2coldent:{it:options}}description{p_end}
{synoptline}
{synopt:{opth k(integer)}}k control for k-FWE (k>=1){p_end}
{synopt:{opth alpha(real)}}significance level {p_end}
{synopt:{opth nmax(integer)}}max value for Operative Method {p_end}
{synoptline}

{title:Description}

{pstd}
{cmd:kfwe} is designed to control the generalized familywise error rate, 
k-FWE, as described in Algorithms 4.1 to 4.4 in "Formalized Data Snooping Based 
on Generalized Error Rates" of J.P. Romano and M. Wolf (Econometric Theory,2008).

{title:Remarks}

{pstd}
It is up to the user to supply basic or studentized statistics and test statistics 
designed for the one-sided setup or for the two-sided setup. Recall that in the 
latter case, absolute values should be used everywhere

{pstd}
Note that the test statistic vector and the bootstrap test statitic vectors both 
need to be centered. The test statistic vector is centered with the null-hypothesized 
value. Each bootstrap test statistic vector needs to be centered with the observed 
value.

{pstd}
Default values for kvalue, alpha and nmax are 1, 0.05 and 50, respectively.

{title:Examples}

{phang2}{cmd: kfwe using filename, bststat(filename) kvalue(1) alpha(0.05)}{p_end}

{title:Saved results}

{pstd}
{cmd:regress} saves the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:r(critval)}}critical values for each step j{p_end}
{synopt:{cmd:r(results)}}indices of rejected null hypothesis (according to columns of 1xS vector){p_end}

{title:Author}

{pstd}Soledad Giardili, University College London (UCL), s.giardili@ucl.ac.uk {p_end}


