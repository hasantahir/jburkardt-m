function value = r8_factorial2 ( n )

%*****************************************************************************80
%
%% R8_FACTORIAL2 computes the double factorial function.
%
%  Discussion:
%
%    FACTORIAL2( N ) = Product ( N * (N-2) * (N-4) * ... * 2 )  (N even)
%                    = Product ( N * (N-2) * (N-4) * ... * 1 )  (N odd)
%
%    N  Value
%    -  -----
%    1      1
%    2      2
%    3      3
%    4      8
%    5     15
%    6     48
%    7    105
%    8    384
%    9    945
%   10   3840
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 February 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the argument of the double factorial function.
%    If N is less than 1, VALUE is returned as 1.
%
%    Output, real VALUE, the value of N!!.
%
  value = 1;

  if ( n < 1 )
    return
  end

  while ( 1 < n )
    value = value * n;
    n = n - 2;
  end

  return
end
