function calpak_test019 ( )

%*****************************************************************************80
%
%% CALPAK_TEST019 tests JED_TO_YMDF_ETHIOPIAN and YMDF_TO_JED_ETHIOPIAN.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    10 March 2013
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'CALPAK_TEST019\n' );
  fprintf ( 1, '  For the Ethiopian calendar:\n' );
  fprintf ( 1, '  JED_TO_YMDF_ETHIOPIAN: JED -> YMDF.\n' );
  fprintf ( 1, '  YMDF_TO_JED_ETHIOPIAN: YMDF -> JED.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  JED (in)    YMDF		JED (out)\n' );
  fprintf ( 1, '\n' );

  jed_epoch = epoch_to_jed_ethiopian ( );

  i = 0;

  while ( 1 )

    i = i + 1;
    jed1 = jed_test ( i );
    
    if ( jed1 < 0.0 )
      break
    end

    if ( jed_epoch <= jed1 )

      [ y2, m2, d2, f2 ] = jed_to_ymdf_ethiopian ( jed1 );

      s2 = ymdf_to_s_numeric ( y2, m2, d2, f2 );

      jed3 = ymdf_to_jed_ethiopian ( y2, m2, d2, f2 );

      fprintf ( 1, '  %11.2f  %20s  %11.2f\n', jed1, s2, jed3 );

    end

  end

  return
end
