function a = r82row_sort_quick_a ( n, a )

%*****************************************************************************80
%
%% R82ROW_SORT_QUICK_A ascending sorts an R82ROW using quick sort.
%
%  Discussion:
%
%    An R82ROW is a (2,N) array of R8's.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of entries in the array.
%
%    Input, real A(2,N), the array to be sorted.
%
%    Output, real A(2,N), the sorted array.
%
  level_max = 30;
  ndim = 2;

  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R82ROW_SORT_QUICK_A - Fatal error!\n' );
    fprintf ( 1, '  N < 1.\n' );
    error ( 'R82ROW_SORT_QUICK_A - Fatal error!' );
  elseif ( n == 1 )
    return
  end

  level = 1;
  rsave(level) = n + 1;
  base = 1;
  n_segment = n;

  while ( 1 )
%
%  Partition the segment.
%
    [ a(1:2,base:base+n_segment-1), l_segment, r_segment ] = ...
      r82row_part_quick_a ( n_segment, a(1:2,base:base+n_segment-1) );
%
%  If the left segment has more than one element, we need to partition it.
%
    if ( 1 < l_segment )

      if ( level_max < level )
        fprintf ( 1, '\n' );
        fprintf ( 1, 'R82ROW_SORT_QUICK_A - Fatal error!\n' );
        fprintf ( 1, '  Exceeding recursion maximum of %d\n', level_max );
        error ( 'R82ROW_SORT_QUICK_A - Fatal error!' );
      end

      level = level + 1;
      n_segment = l_segment;
      rsave(level) = r_segment + base - 1;
%
%  The left segment and the middle segment are sorted.
%  Must the right segment be partitioned?
%
    elseif ( r_segment < n_segment )

      n_segment = n_segment + 1 - r_segment;
      base = base + r_segment - 1;
%
%  Otherwise, we back up a level if there is an earlier one.
%
    else

      while ( 1 )

        if ( level <= 1 )
          return
        end

        base = rsave(level);
        n_segment = rsave(level-1) - rsave(level);
        level = level - 1;

        if ( 0 < n_segment )
          break
        end

      end

    end

  end

  return
end
