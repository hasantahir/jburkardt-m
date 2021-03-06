function blend_test10 ( )

%*****************************************************************************80
%
%% BLEND_TEST10 tests BLEND_112.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 October 2008
%
%  Author:
%
%    John Burkardt
%
  n1 = 5;
  n2 = 5;

  d(1:n1,1:n2) = 0.0;

  for i = 1 : n1
    for j = 1 : n2
      if ( i == 1 | i == n1 | j == 1 | j == n2 )
        d(i,j) = ( i + j );
      end
    end
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, 'BLEND_TEST10\n' );
  fprintf ( 1, '  BLEND_112 blends side values into a table.\n' );
  fprintf ( 1, '\n' );

  r8mat_print ( n1, n2, d, '  Initial data array' );

  for i = 1 : n1

    r = ( i - 1 )  / ( n1 - 1 );

    for j = 1 : n2

      s = ( j - 1 ) / ( n2 - 1 );

      if ( i == 1 | i == n1 | j == 1 | j == n2 )
        continue
      end

      d(i,j) = blend_112 ( r, s, d(1,1), d(1,n2), d(n1,1), d(n1,n2), ...
        d(i,1), d(i,n2), d(1,j), d(n1,j) );

    end

  end

  r8mat_print ( n1, n2, d, '  Interpolated data array' );

  return
end
