function line_fekete_rule_test01 ( m )

%*****************************************************************************80
%
%% LINE_FEKETE_RULE_TEST01 seeks Fekete points in [-1,+1].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 March 2014
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alvise Sommariva, Marco Vianello,
%    Computing approximate Fekete points by QR factorizations of Vandermonde 
%    matrices,
%    Computers and Mathematics with Applications,
%    Volume 57, 2009, pages 1324-1336.
%
%  Parameters:
%
%    Input, integer M, the dimension of the polynomial space.
%
  n = 5001;
  a = -1.0;
  b = +1.0;
  if ( nargin < 1 )
    m = 5;
  end
  x = linspace ( a, b, n );

  fprintf ( 1, '\n' );
  fprintf ( 1, 'LINE_FEKETE_RULE_TEST01:\n' );
  fprintf ( 1, '  Seek Fekete points in [%g,%g]\n', a, b );
  fprintf ( 1, '  using %d equally spaced sample points\n', n );
  fprintf ( 1, '  for polynomials of degree M = %d\n', m );
  fprintf ( 1, '  using the monomial basis and uniform weight.\n' );

  [ nf, xf, wf, vf ] = line_fekete_monomial ( m, a, b, n, x );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  NF = %d\n', nf );
  r8vec_print ( nf, xf, '  Estimated Fekete points XF:' );
  wf_sum = sum ( wf(1:nf) );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sum(WF) = %g\n', wf_sum );

  return
end

