function [ x, seed ] = normal_truncated_ab_sample ( mu, s, a, b, seed )

%*****************************************************************************80
%
%% NORMAL_TRUNCATED_AB_SAMPLE samples the truncated Normal PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2013
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real MU, S, the mean and standard deviation of the
%    parent Normal distribution.
%
%    Input, real A, B, the lower and upper truncation limits.
%
%    Input/output, integer SEED, a seed for the random number
%    generator.
%
%    Output, real X, a sample of the PDF.
%
  alpha = ( a - mu ) / s;
  beta = ( b - mu ) / s;

  alpha_cdf = normal_01_cdf ( alpha );
  beta_cdf = normal_01_cdf ( beta );

  [ u, seed ] = r8_uniform_01 ( seed );
  xi_cdf = alpha_cdf + u * ( beta_cdf - alpha_cdf );
  xi = normal_01_cdf_inv ( xi_cdf );

  x = mu + s * xi;

  return
end