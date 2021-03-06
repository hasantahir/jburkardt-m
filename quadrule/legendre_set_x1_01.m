function [ x, w ] = legendre_set_x1_01 ( n )

%*****************************************************************************80
%
%% LEGENDRE_SET_X1_01 sets a Gauss-Legendre rule for X * F(X) on [0,1].
%
%  Discussion:
%
%    The integral:
%
%      Integral ( 0 <= X <= 1 ) X * F(X) dX
%
%    The quadrature rule:
%
%      Sum ( 1 <= I <= N ) WEIGHT(I) * F ( X(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 October 2005
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Abramowitz, Stegun,
%    Handbook of Mathematical Functions,
%    National Bureau of Standards, 1964, page 921.
%
%  Parameters:
%
%    Input, integer N, the order.
%    N must be between 1 and 8.
%
%    Output, real X(N), the abscissas.
%
%    Output, real W(N), the weights.
%
  x = zeros ( n, 1 );
  w = zeros ( n, 1 );

  if ( n == 1 )

    x(1) =   0.6666666667;

    w(1) = 0.5000000000;

  elseif ( n == 2 )

    x(1) = 0.3550510257;
    x(2) = 0.8449489743;

    w(1) = 0.1819586183;
    w(2) = 0.3180413817;

  elseif ( n == 3 )

    x(1) = 0.2123405382;
    x(2) = 0.5905331356;
    x(3) = 0.9114120405;

    w(1) = 0.0698269799;
    w(2) = 0.2292411064;
    w(3) = 0.2009319137;

  elseif ( n == 4 )

    x(1) = 0.1397598643;
    x(2) = 0.4164095676;
    x(3) = 0.7231569864;
    x(4) = 0.9428958039;

    w(1) = 0.0311809710;
    w(2) = 0.1298475476;
    w(3) = 0.2034645680;
    w(4) = 0.1355069134;

  elseif ( n == 5 )

    x(1) = 0.0985350858;
    x(2) = 0.3045357266;
    x(3) = 0.5620251898;
    x(4) = 0.8019865821;
    x(5) = 0.9601901429;

    w(1) = 0.0157479145;
    w(2) = 0.0739088701;
    w(3) = 0.1463888701;
    w(4) = 0.1671746381;
    w(5) = 0.0967815902;

  elseif ( n == 6 )

    x(1) = 0.0730543287;
    x(2) = 0.2307661380;
    x(3) = 0.4413284812;
    x(4) = 0.6630153097;
    x(5) = 0.8519214003;
    x(6) = 0.9706835728;

    w(1) = 0.0087383108;
    w(2) = 0.0439551656;
    w(3) = 0.0986611509;
    w(4) = 0.1407925538;
    w(5) = 0.1355424972;
    w(6) = 0.0723103307;

  elseif ( n == 7 )

    x(1) = 0.0562625605;
    x(2) = 0.1802406917;
    x(3) = 0.3526247171;
    x(4) = 0.5471536263;
    x(5) = 0.7342101772;
    x(6) = 0.8853209468;
    x(7) = 0.9775206136;

    w(1) = 0.0052143622;
    w(2) = 0.0274083567;
    w(3) = 0.0663846965;
    w(4) = 0.1071250657;
    w(5) = 0.1273908973;
    w(6) = 0.1105092582;
    w(7) = 0.0559673634;

  elseif ( n == 8 )

    x(1) = 0.0446339553;
    x(2) = 0.1443662570;
    x(3) = 0.2868247571;
    x(4) = 0.4548133152;
    x(5) = 0.6280678354;
    x(6) = 0.7856915206;
    x(7) = 0.9086763921;
    x(8) = 0.9822200849;

    w(1) = 0.0032951914;
    w(2) = 0.0178429027;
    w(3) = 0.0454393195;
    w(4) = 0.0791995995;
    w(5) = 0.1060473594;
    w(6) = 0.1125057995;
    w(7) = 0.0911190236;
    w(8) = 0.0445508044;

  else

    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEGENDRE_SET_X1_01 - Fatal error!\n' );
    fprintf ( 1, '  Illegal value of N = %d\n', n );
    error ( 'LEGENDRE_SET_X1_01 - Fatal error!' );

  end

  return
end
