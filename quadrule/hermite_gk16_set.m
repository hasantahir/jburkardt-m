function [ x, w ] = hermite_gk16_set ( n )

%*****************************************************************************80
%
%% HERMITE_GK16_SET sets a Hermite Genz-Keister 16 rule.
%
%  Discussion:
%
%    The integral:
%
%      integral ( -oo <= x <= +oo ) f(x) exp ( - x * x ) dx
%
%    The quadrature rule:
%
%      sum ( 1 <= i <= n ) w(i) * f ( x(i) )
%
%    A nested family of rules for the Hermite integration problem
%    was produced by Genz and Keister.  The structure of the nested
%    family was denoted by 1+2+6+10+16, that is, it comprised rules 
%    of successive orders O = 1, 3, 9, 19, and 35.
%
%    The precisions of these rules are P = 1, 5, 15, 29, and 51.
%
%    Consider, however, the special cases where a rule of precision 
%    at least 7, 17, 31 or 33 is desired.  Ordinarily, this would
%    suggest using the nested rule of order 9, 19, 51 or 51 respectively.
%    In these cases, however, the order of the rule that is used exceeds
%    the precision requested.  Hence, it is possible simply to select
%    a subset of the points in the higher precision rule and get a 
%    rule of lower order and the desired precision.  This accounts for
%    the four extra rules in this family.
%
%    The entire list of rules is therefore:
%
%    L   P   N
%
%    0   1   1  <-- Full rule
%    1   5   3  <-- Full rule
%    2   7   7  <-- Partial rule
%    3  15   9  <-- Full rule
%    4  17  17  <-- Partial rule
%    5  29  19  <-- Full rule
%    6  31  31  <-- Partial rule
%    7  33  33  <-- Partial rule
%    8  51  35  <-- Full rule 4
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    02 June 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Genz, Bradley Keister,
%    Fully symmetric interpolatory rules for multiple integrals
%    over infinite regions with Gaussian weight,
%    Journal of Computational and Applied Mathematics,
%    Volume 71, 1996, pages 299-309
%
%    Florian Heiss, Viktor Winschel,
%    Likelihood approximation by numerical integration on sparse grids,
%    Journal of Econometrics,
%    Volume 144, 2008, pages 62-80.
%
%    Thomas Patterson,
%    The Optimal Addition of Points to Quadrature Formulae,
%    Mathematics of Computation,
%    Volume 22, Number 104, October 1968, pages 847-856.
%
%  Parameters:
%
%    Input, integer N, the order.
%    N must be 1, 3, 7, 9, 17, 19, 31, 33 or 35.
%
%    Output, real X(N,1), the abscissas.
%
%    Output, real W(N,1), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  if ( n == 1 )

    x( 1) =   0.0000000000000000E+00;

    w( 1) =   1.7724538509055159E+00;

  elseif ( n == 3 )

    x( 1) =  -1.2247448713915889E+00;
    x( 2) =   0.0000000000000000E+00;
    x( 3) =   1.2247448713915889E+00;

    w( 1) =   2.9540897515091930E-01;
    w( 2) =   1.1816359006036772E+00;
    w( 3) =   2.9540897515091930E-01;

  elseif ( n == 7 )

    x( 1) =  -2.9592107790638380E+00;
    x( 2) =  -1.2247448713915889E+00;
    x( 3) =  -5.2403354748695763E-01;
    x( 4) =   0.0000000000000000E+00;
    x( 5) =   5.2403354748695763E-01;
    x( 6) =   1.2247448713915889E+00;
    x( 7) =   2.9592107790638380E+00;

    w( 1) =   1.2330680655153448E-03;
    w( 2) =   2.4557928535031393E-01;
    w( 3) =   2.3286251787386100E-01;
    w( 4) =   8.1310410832613500E-01;
    w( 5) =   2.3286251787386100E-01;
    w( 6) =   2.4557928535031393E-01;
    w( 7) =   1.2330680655153448E-03;

  elseif ( n == 9 )

    x( 1) =  -2.9592107790638380E+00;
    x( 2) =  -2.0232301911005157E+00;
    x( 3) =  -1.2247448713915889E+00;
    x( 4) =  -5.2403354748695763E-01;
    x( 5) =   0.0000000000000000E+00;
    x( 6) =   5.2403354748695763E-01;
    x( 7) =   1.2247448713915889E+00;
    x( 8) =   2.0232301911005157E+00;
    x( 9) =   2.9592107790638380E+00;

    w( 1) =   1.6708826306882348E-04;
    w( 2) =   1.4173117873979098E-02;
    w( 3) =   1.6811892894767771E-01;
    w( 4) =   4.7869428549114124E-01;
    w( 5) =   4.5014700975378197E-01;
    w( 6) =   4.7869428549114124E-01;
    w( 7) =   1.6811892894767771E-01;
    w( 8) =   1.4173117873979098E-02;
    w( 9) =   1.6708826306882348E-04;

  elseif ( n == 17 )

    x( 1) =  -4.4995993983103881E+00;
    x( 2) =  -3.6677742159463378E+00;
    x( 3) =  -2.9592107790638380E+00;
    x( 4) =  -2.0232301911005157E+00;
    x( 5) =  -1.8357079751751868E+00;
    x( 6) =  -1.2247448713915889E+00;
    x( 7) =  -8.7004089535290285E-01;
    x( 8) =  -5.2403354748695763E-01;
    x( 9) =   0.0000000000000000E+00;
    x(10) =   5.2403354748695763E-01;
    x(11) =   8.7004089535290285E-01;
    x(12) =   1.2247448713915889E+00;
    x(13) =   1.8357079751751868E+00;
    x(14) =   2.0232301911005157E+00;
    x(15) =   2.9592107790638380E+00;
    x(16) =   3.6677742159463378E+00;
    x(17) =   4.4995993983103881E+00;

    w( 1) =   3.7463469943051758E-08;
    w( 2) =  -1.4542843387069391E-06;
    w( 3) =   1.8723818949278350E-04;
    w( 4) =   1.2466519132805918E-02;
    w( 5) =   3.4840719346803800E-03;
    w( 6) =   1.5718298376652240E-01;
    w( 7) =   2.5155825701712934E-02;
    w( 8) =   4.5119803602358544E-01;
    w( 9) =   4.7310733504965385E-01;
    w(10) =   4.5119803602358544E-01;
    w(11) =   2.5155825701712934E-02;
    w(12) =   1.5718298376652240E-01;
    w(13) =   3.4840719346803800E-03;
    w(14) =   1.2466519132805918E-02;
    w(15) =   1.8723818949278350E-04;
    w(16) =  -1.4542843387069391E-06;
    w(17) =   3.7463469943051758E-08;

  elseif ( n == 19 )

    x( 1) =  -4.4995993983103881E+00;
    x( 2) =  -3.6677742159463378E+00;
    x( 3) =  -2.9592107790638380E+00;
    x( 4) =  -2.2665132620567876E+00;
    x( 5) =  -2.0232301911005157E+00;
    x( 6) =  -1.8357079751751868E+00;
    x( 7) =  -1.2247448713915889E+00;
    x( 8) =  -8.7004089535290285E-01;
    x( 9) =  -5.2403354748695763E-01;
    x(10) =   0.0000000000000000E+00;
    x(11) =   5.2403354748695763E-01;
    x(12) =   8.7004089535290285E-01;
    x(13) =   1.2247448713915889E+00;
    x(14) =   1.8357079751751868E+00;
    x(15) =   2.0232301911005157E+00;
    x(16) =   2.2665132620567876E+00;
    x(17) =   2.9592107790638380E+00;
    x(18) =   3.6677742159463378E+00;
    x(19) =   4.4995993983103881E+00;

    w( 1) =   1.5295717705322357E-09;
    w( 2) =   1.0802767206624762E-06;
    w( 3) =   1.0656589772852267E-04;
    w( 4) =   5.1133174390883855E-03;
    w( 5) =  -1.1232438489069229E-02;
    w( 6) =   3.2055243099445879E-02;
    w( 7) =   1.1360729895748269E-01;
    w( 8) =   1.0838861955003017E-01;
    w( 9) =   3.6924643368920851E-01;
    w(10) =   5.3788160700510168E-01;
    w(11) =   3.6924643368920851E-01;
    w(12) =   1.0838861955003017E-01;
    w(13) =   1.1360729895748269E-01;
    w(14) =   3.2055243099445879E-02;
    w(15) =  -1.1232438489069229E-02;
    w(16) =   5.1133174390883855E-03;
    w(17) =   1.0656589772852267E-04;
    w(18) =   1.0802767206624762E-06;
    w(19) =   1.5295717705322357E-09;

  elseif ( n == 31 )

    x( 1) =  -6.3759392709822356E+00;
    x( 2) =  -5.6432578578857449E+00;
    x( 3) =  -5.0360899444730940E+00;
    x( 4) =  -4.4995993983103881E+00;
    x( 5) =  -3.6677742159463378E+00;
    x( 6) =  -2.9592107790638380E+00;
    x( 7) =  -2.5705583765842968E+00;
    x( 8) =  -2.2665132620567876E+00;
    x( 9) =  -2.0232301911005157E+00;
    x(10) =  -1.8357079751751868E+00;
    x(11) =  -1.5794121348467671E+00;
    x(12) =  -1.2247448713915889E+00;
    x(13) =  -8.7004089535290285E-01;
    x(14) =  -5.2403354748695763E-01;
    x(15) =  -1.7606414208200893E-01;
    x(16) =   0.0000000000000000E+00;
    x(17) =   1.7606414208200893E-01;
    x(18) =   5.2403354748695763E-01;
    x(19) =   8.7004089535290285E-01;
    x(20) =   1.2247448713915889E+00;
    x(21) =   1.5794121348467671E+00;
    x(22) =   1.8357079751751868E+00;
    x(23) =   2.0232301911005157E+00;
    x(24) =   2.2665132620567876E+00;
    x(25) =   2.5705583765842968E+00;
    x(26) =   2.9592107790638380E+00;
    x(27) =   3.6677742159463378E+00;
    x(28) =   4.4995993983103881E+00;
    x(29) =   5.0360899444730940E+00;
    x(30) =   5.6432578578857449E+00;
    x(31) =   6.3759392709822356E+00;

    w( 1) =   2.2365645607044459E-15;
    w( 2) =  -2.6304696458548942E-13;
    w( 3) =   9.0675288231679823E-12;
    w( 4) =   1.4055252024722478E-09;
    w( 5) =   1.0889219692128120E-06;
    w( 6) =   1.0541662394746661E-04;
    w( 7) =   2.6665159778939428E-05;
    w( 8) =   4.8385208205502612E-03;
    w( 9) =  -9.8566270434610019E-03;
    w(10) =   2.9409427580350787E-02;
    w(11) =   3.1210210352682834E-03;
    w(12) =   1.0939325071860877E-01;
    w(13) =   1.1594930984853116E-01;
    w(14) =   3.5393889029580544E-01;
    w(15) =   4.9855761893293160E-02;
    w(16) =   4.5888839636756751E-01;
    w(17) =   4.9855761893293160E-02;
    w(18) =   3.5393889029580544E-01;
    w(19) =   1.1594930984853116E-01;
    w(20) =   1.0939325071860877E-01;
    w(21) =   3.1210210352682834E-03;
    w(22) =   2.9409427580350787E-02;
    w(23) =  -9.8566270434610019E-03;
    w(24) =   4.8385208205502612E-03;
    w(25) =   2.6665159778939428E-05;
    w(26) =   1.0541662394746661E-04;
    w(27) =   1.0889219692128120E-06;
    w(28) =   1.4055252024722478E-09;
    w(29) =   9.0675288231679823E-12;
    w(30) =  -2.6304696458548942E-13;
    w(31) =   2.2365645607044459E-15;

  elseif ( n == 33 )

    x( 1) =  -6.3759392709822356E+00;
    x( 2) =  -5.6432578578857449E+00;
    x( 3) =  -5.0360899444730940E+00;
    x( 4) =  -4.4995993983103881E+00;
    x( 5) =  -4.0292201405043713E+00;
    x( 6) =  -3.6677742159463378E+00;
    x( 7) =  -2.9592107790638380E+00;
    x( 8) =  -2.5705583765842968E+00;
    x( 9) =  -2.2665132620567876E+00;
    x(10) =  -2.0232301911005157E+00;
    x(11) =  -1.8357079751751868E+00;
    x(12) =  -1.5794121348467671E+00;
    x(13) =  -1.2247448713915889E+00;
    x(14) =  -8.7004089535290285E-01;
    x(15) =  -5.2403354748695763E-01;
    x(16) =  -1.7606414208200893E-01;
    x(17) =   0.0000000000000000E+00;
    x(18) =   1.7606414208200893E-01;
    x(19) =   5.2403354748695763E-01;
    x(20) =   8.7004089535290285E-01;
    x(21) =   1.2247448713915889E+00;
    x(22) =   1.5794121348467671E+00;
    x(23) =   1.8357079751751868E+00;
    x(24) =   2.0232301911005157E+00;
    x(25) =   2.2665132620567876E+00;
    x(26) =   2.5705583765842968E+00;
    x(27) =   2.9592107790638380E+00;
    x(28) =   3.6677742159463378E+00;
    x(29) =   4.0292201405043713E+00;
    x(30) =   4.4995993983103881E+00;
    x(31) =   5.0360899444730940E+00;
    x(32) =   5.6432578578857449E+00;
    x(33) =   6.3759392709822356E+00;

    w( 1) =  -1.7602932805372496E-15;
    w( 2) =   4.7219278666417693E-13;
    w( 3) =  -3.4281570530349562E-11;
    w( 4) =   2.7547825138935901E-09;
    w( 5) =  -2.3903343382803510E-08;
    w( 6) =   1.2245220967158438E-06;
    w( 7) =   9.8710009197409173E-05;
    w( 8) =   1.4753204901862772E-04;
    w( 9) =   3.7580026604304793E-03;
    w(10) =  -4.9118576123877555E-03;
    w(11) =   2.0435058359107205E-02;
    w(12) =   1.3032872699027960E-02;
    w(13) =   9.6913444944583621E-02;
    w(14) =   1.3726521191567551E-01;
    w(15) =   3.1208656194697448E-01;
    w(16) =   1.8411696047725790E-01;
    w(17) =   2.4656644932829619E-01;
    w(18) =   1.8411696047725790E-01;
    w(19) =   3.1208656194697448E-01;
    w(20) =   1.3726521191567551E-01;
    w(21) =   9.6913444944583621E-02;
    w(22) =   1.3032872699027960E-02;
    w(23) =   2.0435058359107205E-02;
    w(24) =  -4.9118576123877555E-03;
    w(25) =   3.7580026604304793E-03;
    w(26) =   1.4753204901862772E-04;
    w(27) =   9.8710009197409173E-05;
    w(28) =   1.2245220967158438E-06;
    w(29) =  -2.3903343382803510E-08;
    w(30) =   2.7547825138935901E-09;
    w(31) =  -3.4281570530349562E-11;
    w(32) =   4.7219278666417693E-13;
    w(33) =  -1.7602932805372496E-15;

  elseif ( n == 35 )

    x( 1) =  -6.3759392709822356E+00;
    x( 2) =  -5.6432578578857449E+00;
    x( 3) =  -5.0360899444730940E+00;
    x( 4) =  -4.4995993983103881E+00;
    x( 5) =  -4.0292201405043713E+00;
    x( 6) =  -3.6677742159463378E+00;
    x( 7) =  -3.3491639537131945E+00;
    x( 8) =  -2.9592107790638380E+00;
    x( 9) =  -2.5705583765842968E+00;
    x(10) =  -2.2665132620567876E+00;
    x(11) =  -2.0232301911005157E+00;
    x(12) =  -1.8357079751751868E+00;
    x(13) =  -1.5794121348467671E+00;
    x(14) =  -1.2247448713915889E+00;
    x(15) =  -8.7004089535290285E-01;
    x(16) =  -5.2403354748695763E-01;
    x(17) =  -1.7606414208200893E-01;
    x(18) =   0.0000000000000000E+00;
    x(19) =   1.7606414208200893E-01;
    x(20) =   5.2403354748695763E-01;
    x(21) =   8.7004089535290285E-01;
    x(22) =   1.2247448713915889E+00;
    x(23) =   1.5794121348467671E+00;
    x(24) =   1.8357079751751868E+00;
    x(25) =   2.0232301911005157E+00;
    x(26) =   2.2665132620567876E+00;
    x(27) =   2.5705583765842968E+00;
    x(28) =   2.9592107790638380E+00;
    x(29) =   3.3491639537131945E+00;
    x(30) =   3.6677742159463378E+00;
    x(31) =   4.0292201405043713E+00;
    x(32) =   4.4995993983103881E+00;
    x(33) =   5.0360899444730940E+00;
    x(34) =   5.6432578578857449E+00;
    x(35) =   6.3759392709822356E+00;

    w( 1) =   1.8684014894510604E-18;
    w( 2) =   9.6599466278563243E-15;
    w( 3) =   5.4896836948499462E-12;
    w( 4) =   8.1553721816916897E-10;
    w( 5) =   3.7920222392319532E-08;
    w( 6) =   4.3737818040926989E-07;
    w( 7) =   4.8462799737020461E-06;
    w( 8) =   6.3328620805617891E-05;
    w( 9) =   4.8785399304443770E-04;
    w(10) =   1.4515580425155904E-03;
    w(11) =   4.0967527720344047E-03;
    w(12) =   5.5928828911469180E-03;
    w(13) =   2.7780508908535097E-02;
    w(14) =   8.0245518147390893E-02;
    w(15) =   1.6371221555735804E-01;
    w(16) =   2.6244871488784277E-01;
    w(17) =   3.3988595585585218E-01;
    w(18) =   9.1262675363737921E-04;
    w(19) =   3.3988595585585218E-01;
    w(20) =   2.6244871488784277E-01;
    w(21) =   1.6371221555735804E-01;
    w(22) =   8.0245518147390893E-02;
    w(23) =   2.7780508908535097E-02;
    w(24) =   5.5928828911469180E-03;
    w(25) =   4.0967527720344047E-03;
    w(26) =   1.4515580425155904E-03;
    w(27) =   4.8785399304443770E-04;
    w(28) =   6.3328620805617891E-05;
    w(29) =   4.8462799737020461E-06;
    w(30) =   4.3737818040926989E-07;
    w(31) =   3.7920222392319532E-08;
    w(32) =   8.1553721816916897E-10;
    w(33) =   5.4896836948499462E-12;
    w(34) =   9.6599466278563243E-15;
    w(35) =   1.8684014894510604E-18;

  else

    fprintf ( stderr, '\n' );
    fprintf ( stderr, 'HERMITE_GK16_SET - Fatal error!\n' );
    fprintf ( stderr, '  Illegal input value of N.\n' );
    fprintf ( stderr, '  N must be 1, 3, 7, 9, 17, 19, 31, 33 or 35.\n' );
    error ( 'HERMITE_GK16_SET - Fatal error!' );

  end

  return
end
