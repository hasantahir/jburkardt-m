function w = ymd_to_weekday_common ( y, m, d )

%*****************************************************************************80
%
%% YMD_TO_WEEKDAY_COMMON returns the weekday of a Common YMD date.
%
%  Discussion:
%
%    The "common" calendar is meant to be the calendar which is Julian up to
%    day JED = 2299160, and Gregorian from day JED = 2299161 and after.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 April 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer Y, M, D, the YMD date.
%
%    Output, integer W, is the week day number of the date, with
%    1 for Sunday, through 7 for Saturday.
%
  f = 0.5;

  jed = ymdf_to_jed_common ( y, m, d, f );

  [ w, f2 ] = jed_to_weekday ( jed );

  return
end
