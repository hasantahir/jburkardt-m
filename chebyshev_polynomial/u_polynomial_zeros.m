function z = u_polynomial_zeros ( n )

%*****************************************************************************80
%
%% U_POLYNOMIAL_ZEROS returns zeroes of Chebyshev polynomials U(n,x).
%
%  Discussion:
%
%    The I-th zero of U(n,x) is cos((I-1)*PI/(N-1)), I = 1 to N
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the polynomial.
%
%    Output, real Z(N), the zeroes of U(n,x).
%
  for i = 1 : n
    angle = i * pi / ( n + 1 );
    z(i) = cos ( angle );
  end

  return
end
