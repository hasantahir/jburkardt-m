function [ y, m, ierror ] = ym_check_english ( y, m )

%*****************************************************************************80
%
%% YM_CHECK_ENGLISH checks an English YM date.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 March 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer Y, M, the YM date.
%
%    Output, integer IERROR, is 0 if no error was found in the date
%    and 1 otherwise.
%

%
%  Check the year.
%
  [ y, ierror ] = y_check_english ( y );

  if ( ierror ~= 0 )
    return
  end
%
%  Make sure the month isn't too small or too big.
%
  [ y, m ] = month_borrow_english ( y, m );

  [ y, m ] = month_carry_english ( y, m );

  return
end
