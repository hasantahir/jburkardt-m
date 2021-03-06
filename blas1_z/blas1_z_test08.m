function blas1_z_test08 ( )

%*****************************************************************************80
%
%% TEST08 tests ZDOTC.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 May 2006
%
%  Author:
%
%    John Burkardt
%
  n = 5;

  x = [ ...
     2.0 - 1.0 * i, ...
    -4.0 - 2.0 * i, ...
     3.0 + 1.0 * i, ...
     2.0 + 2.0 * i, ...
    -1.0 - 1.0 * i ];
  y = [ ...
    -1.0 + 0.0 * i, ...
     0.0 - 3.0 * i, ...
     4.0 + 0.0 * i, ...
    -3.0 + 4.0 * i, ...
    -2.0 + 0.0 * i ];

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST08\n' );
  fprintf ( 1, '  ZDOTC computes the conjugated dot product of\n' );
  fprintf ( 1, '  two complex vectors.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  X =\n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( x(j) ), imag ( x(j) ) );
  end

  x_norm = zdotc ( n, x, 1, x, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The square of the norm of X, computed as\n' );
  fprintf ( 1, '  ZDOTC(X,X) = %f  %f\n', real ( x_norm ), imag ( x_norm ) );

  xy_dot = zdotc ( n, x, 1, y, 1 );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Y = \n' );
  fprintf ( 1, '\n' );
  for j = 1 : n
    fprintf ( 1, '  %6d  %10f  %10f\n', j, real ( y(j) ), imag ( y(j) ) );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The dot product X.Y* is %f  %f\n', ...
    real ( xy_dot ), imag ( xy_dot ) );

  return
end
