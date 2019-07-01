{smcl}
{* *! version 1.0.0 01apr2015}{...}
{cmd:help fdr}
{hline}

{title:Title}

{phang}
{bf:fdr} {hline 2} Routines to control for False Discovery Rate methods (FDR)

{title:Syntax}

{p 4 21 2}
{cmd:fdr} {cmd:(}{depvar:1} {varlist:1}{cmd:)}
{cmd:(}{it:depvar2} {it:varlist2}{cmd:)} {it:...}{cmd:(}{it:depvarN}
{it:varlistN}{cmd:)} {ifin} [{cmd:,} {opt TEST:var(varlist)} {it:{help fdr##options:options}}]


{synoptset 25}{...}
{p2coldent:{it:mandatory}}description{p_end}
{synoptline}
{synopt:{opth test:var(varlist)}}specify variables to test{p_end}
{synoptline}


{synoptset 25 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opth alpha(real)}}significance levels. default value 0.05 {p_end}
{synopt:{opt method(string)}}{it:method} may be BH, BY or BKY, default is BH{p_end}
{synopt:{opt hypadd(hyp1; hyp2;...)}}additional hypotheses not included in testvar, separated by semi-colon operator(;){p_end}
{synopt:{opth cluster(varname)}}variable identifying cluster{p_end}

{synoptline}
{p2colreset}{...}

{title:Description}

{pstd}{cmd:fdr} should be applied in a multiple regression context, and it is up to 
the user to choose between the methods: BH (Benjamini and Hochberg), BY(Benjamini and
Yekutieli) or BKY(Benjamini, Krieger and Yekutieli). 
Note that as it is not clear how to compute q-values for method BKY, the qvalue variable 
will contain missing values.



{title:Examples}

{phang2}{cmd:. webuse auto}{p_end}
{phang2}{cmd:. fdr (price weight length gear_ratio displacement) (turn weight length gear_ratio displacement foreign) if mpg>=20, testvar(weight length gear_ratio) method(BY) alpha(0.1)}{p_end}

{title:Saved results}

{pstd}
{cmd:fdr} saves the following in {cmd:r()}:

{synoptset 20 tabbed}{...}

{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:r(alpha)}}alpha value{p_end}
{synopt:{cmd:r(nhyp)}}number of hypotheses tested{p_end}
{synopt:{cmd:r(nrej)}}number of hypotheses rejected{p_end}

{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:r(result)}}results matrix{p_end}

{title:References} 

{phang}
Benjamini, Y. and Y. Hochberg. 1995.
Controlling the false discovery rate: a practical and powerful
approach to multiple testing. {it:Journal of the Royal Statistical Society B} 57: 289-300.

{phang}
Benjamini, Y. and D. Yekutieli. 2001.
The control of the false discovery rate in multiple testing under dependency.
{it:Annals of Statistics} 29: 1165-1188.

{phang}
Benjamini Y., A. Krieger, and D. Yekutieli. 2006. 
Adaptive linear step-up procedures that control the false discovery rate. 
{it:Biometrika} 93(3): 491-507.

{title:Author}

{pstd}Soledad Giardili, University College London (UCL), s.giardili@ucl.ac.uk {p_end}
