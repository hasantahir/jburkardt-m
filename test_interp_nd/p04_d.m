function d = p04_d ( m, id, c, w, n, x )

%*****************************************************************************80
%
%% P04_D evaluates a derivative for problem p04.
%
%  Discussion:
%
%    f(x) = exp ( - sum ( c(1:m)^2 * ( x(1:m) - w(1:m) )^2 )
%
%    Default values are:
%
%    c(1:m) = 1 / m
%    w(1:m) = 0.5
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Alan Genz,
%    A Package for Testing Multiple Integration Subroutines,
%    in Numerical Integration: Recent Developments, Software
%    and Applications,
%    edited by Patrick Keast and Graeme Fairweather,
%    Reidel, 1987, pages 337-340,
%    ISBN: 9027725144,
%    LC: QA299.3.N38.
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer ID, the spatial coordinate to be differentiated.
%
%    Input, real C(M,1), W(M,1), the problem parameters.
%
%    Input, integer N, the number of points.
%
%    Input, real X(M,N), the evaluation points.
%
%    Output, real D(N,1), the value of the ID-th derivative component at X.
%
  d = zeros ( n, 1 );

  for i = 1 : m
    d = d + c(i)^2 .* ( x(i,:)' - w(i) ).^2;
  end
  d = exp ( - d ) .* c(id)^2 .* ( - 2.0 ) .* ( x(id,:)' - w(id) );

  return
end
