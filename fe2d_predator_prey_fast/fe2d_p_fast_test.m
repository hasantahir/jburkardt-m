function fe2d_p_fast_test ( )

%*****************************************************************************80
%
%% FE2D_P_FAST_TEST tests the FE2D_P_FAST code.
%
%  Discussion:
%
%    This function sets all parameter values and initial condition information
%    necessary to execute the "fast" version of the fe2d_p algorithm.
%
%  Licensing:
%
%    Copyright (C) 2014 Marcus R. Garvie. 
%    See 'mycopyright.txt' for details.
%
%  Modified:
%
%    26 April 2014
%
%  Author:
%
%    Marcus R. Garvie. 
%
%  Reference:
%
%    Marcus R Garvie, John Burkardt, Jeff Morgan,
%    Simple Finite Element Methods for Approximating Predator-Prey Dynamics
%    in Two Dimensions using MATLAB,
%    Submitted to Bulletin of Mathematical Biology, 2014.
%
  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FE2D_P_FAST_TEST:\n' );
  fprintf ( 1, '  Test the FE2D_P_FAST function\n' );
  fprintf ( 1, '  which applies periodic boundary conditions as it\n' );
  fprintf ( 1, '  approximates a solution to a predator-prey system.\n' );
%
%  Set the parameters.
%
  alpha = 0.4;
  beta = 2.0;
  gamma = 0.6;
  delta = 1.0;
  a = 0.0;
  b = 400.0;
%
%  Use h = 2.0 for standard run.
%  Use h = 40 for tiny run.
%
  h = 2.0;
% h = 40.0;
%
%  Use T=150.0 for normal run.
%  Use T=0.50 for a "quick" run that might take 15 minutes of computing.
%
% T = 150.0;
  T = 0.50;
  delt = 1.0 / 384.0;

  t = tic;
  fe2d_p_fast ( alpha, beta, gamma, delta, a, b, h, T, delt, @u0f, @v0f );
  t = toc ( t );

  fprintf ( 1, '  Execution took %10.2g minutes \n', t / 60.0 );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'FE2D_P_FAST_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  return
end

function value = u0f ( x, y )

%*****************************************************************************80
%
%% U0F evaluates the initial condition for U.
%
%  Licensing:
%
%    Copyright (C) 2014 Marcus R. Garvie. 
%    See 'mycopyright.txt' for details.
%
%  Modified:
%
%    26 April 2014
%
%  Author:
%
%    Marcus R. Garvie. 
%
%  Parameters:
%
%    Input, real X, Y, a location in the region.
%
%    Output, real VALUE, the initial condition for U at (X,Y).
%
  value = 6.0 / 35.0 - 2.0E-07 * ( x - 0.1 * y - 225.0 ) * ( x - 0.1 * y - 675.0 );

  return
end

function value = v0f ( x, y )

%*****************************************************************************80
%
%% V0F evaluates the initial condition for V.
%
%  Licensing:
%
%    Copyright (C) 2014 Marcus R. Garvie. 
%    See 'mycopyright.txt' for details.
%
%  Modified:
%
%    26 April 2014
%
%  Author:
%
%    Marcus R. Garvie. 
%
%  Parameters:
%
%    Input, real X, Y, a location in the region.
%
%    Output, real VALUE, the initial condition for V at (X,Y).
%
  value = 116.0 / 245.0 - 3.0E-05 * ( x - 450.0 ) - 1.2E-04 * ( y - 150.0 );

  return
end

