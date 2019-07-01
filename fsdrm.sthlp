{smcl}
{* *! version 1.0.2  08aug2014}{...}
{cmd:help fsdrm}
{hline}

{title:Title}

{phang}
{bf:fsdrm} {hline 2} Resampling based Adjustment. Free Step-Down Resampling Method

{title:Syntax}

{p 4 21 2}
{cmd:fsdrm} {cmd:(}{depvar:1} {varlist:1}{cmd:)}
{cmd:(}{it:depvar2} {it:varlist2}{cmd:)} {it:...}{cmd:(}{it:depvarN}
{it:varlistN}{cmd:)} {ifin} [{cmd:,} {opt TEST:var(varlist)} {opt R:eps(#)} {it:{help fsdrm##options:options}}]


{synoptset 25 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opth TEST:var(varlist)}}variables to test{p_end}
{synopt:{opth R:eps(#)}}perform # replications{p_end}

{syntab:Options}
{synopt :{opth hypadd(hyp1; hyp2;...)}}additional hypotheses not included in TESTvar, separated by semi-colon operator{p_end}
{synopt :{opth cl:uster(varname)}}variable identifying cluster{p_end}
{synopt :{opth permadd(varlist)}}variables to add for permutation{p_end}
{synopt :{opth permstrata(varname)}}variable identifying strata for permutation{p_end}
{synopt :{opth export(filename)}}creates a xls file with the output and export it{p_end}
{synoptline}
{p2colreset}{...}

{title:Description}

{pstd}{cmd:fsdrm} computes a resampling based adjustment of p-values based on 
algorithm 2.8: Free Step-Down Resampling Method. Westfall, P.and Young, S., 
(1993), Resampling-Based Multiple Testing, pag.66-67.

{title:Examples}

{phang2}{cmd:. webuse auto}{p_end}
{phang2}{cmd:. fsdrm (price weight length gear_ratio displacement) (turn weight length gear_ratio displacement foreign) if mpg>=20, testvar(weight length gear_ratio) rep(1000) hypadd(weight-length) cluster(make) permadd(trunk) }{p_end}

{title:Saved results}

{pstd}
{cmd:fsdrm} saves the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:r(p_h#)}}unadjusted p-value of hypothesis #{p_end}
{synopt:{cmd:r(p_adj_h#)}}adjusted p-value of hypothesis #{p_end}
{synopt:{cmd:r(results)}}results matrix

{title:Notes}

{pstd}
The hypothesis numbering h# follows the syntax, corresponding h1 to the 
null of the first testvar specified for the first equation, h2 to the second 
testvar and so on for all the testvars in equation 1. After that, the numbering 
continues with the second equation.  

{title:Author}
{phang}Soledad Giardili, University College London (UCL){break}
s.giardili@ucl.ac.uk {p_end}
