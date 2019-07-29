function [residual, g1, g2, g3] = rbc_model_static(y, x, params)
%
% Status : Computes static model for Dynare
%
% Inputs : 
%   y         [M_.endo_nbr by 1] double    vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1] double     vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1] double   vector of parameter values in declaration order
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the static model equations 
%                                          in order of declaration of the equations.
%                                          Dynare may prepend or append auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by M_.endo_nbr] double    Jacobian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g2        [M_.endo_nbr by (M_.endo_nbr)^2] double   Hessian matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%   g3        [M_.endo_nbr by (M_.endo_nbr)^3] double   Third derivatives matrix of the static model equations;
%                                                       columns: variables in declaration order
%                                                       rows: equations in order of declaration
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

residual = zeros( 14, 1);

%
% Model equations
%

T11 = y(2)^((-1)/params(2));
T35 = exp(y(8))*y(3)^params(6);
T37 = y(5)^(1-params(6));
lhs =T11;
rhs =T11*params(1)*(1-params(7)+y(6));
residual(1)= lhs-rhs;
lhs =T11*y(7);
rhs =params(4)*y(5)^(1/params(3));
residual(2)= lhs-rhs;
lhs =y(1);
rhs =T35*T37;
residual(3)= lhs-rhs;
lhs =y(7);
rhs =y(1)*(1-params(6))/y(5);
residual(4)= lhs-rhs;
lhs =y(6);
rhs =y(1)*params(6)/y(3);
residual(5)= lhs-rhs;
lhs =y(3);
rhs =(1-params(7))*y(3)+y(4);
residual(6)= lhs-rhs;
lhs =y(1);
rhs =y(2)+y(4);
residual(7)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(8)+x(1);
residual(8)= lhs-rhs;
lhs =y(9);
rhs =100*log(y(1));
residual(9)= lhs-rhs;
lhs =y(10);
rhs =100*log(y(2));
residual(10)= lhs-rhs;
lhs =y(11);
rhs =100*log(y(4));
residual(11)= lhs-rhs;
lhs =y(12);
rhs =100*log(y(5));
residual(12)= lhs-rhs;
lhs =y(13);
rhs =100*log(y(7));
residual(13)= lhs-rhs;
lhs =y(14);
rhs =y(6)*400;
residual(14)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(14, 14);

  %
  % Jacobian matrix
  %

T89 = getPowerDeriv(y(2),(-1)/params(2),1);
  g1(1,2)=T89-(1-params(7)+y(6))*params(1)*T89;
  g1(1,6)=(-(T11*params(1)));
  g1(2,2)=y(7)*T89;
  g1(2,5)=(-(params(4)*getPowerDeriv(y(5),1/params(3),1)));
  g1(2,7)=T11;
  g1(3,1)=1;
  g1(3,3)=(-(T37*exp(y(8))*getPowerDeriv(y(3),params(6),1)));
  g1(3,5)=(-(T35*getPowerDeriv(y(5),1-params(6),1)));
  g1(3,8)=(-(T35*T37));
  g1(4,1)=(-((1-params(6))/y(5)));
  g1(4,5)=(-((-(y(1)*(1-params(6))))/(y(5)*y(5))));
  g1(4,7)=1;
  g1(5,1)=(-(params(6)/y(3)));
  g1(5,3)=(-((-(y(1)*params(6)))/(y(3)*y(3))));
  g1(5,6)=1;
  g1(6,3)=1-(1-params(7));
  g1(6,4)=(-1);
  g1(7,1)=1;
  g1(7,2)=(-1);
  g1(7,4)=(-1);
  g1(8,8)=1-params(8);
  g1(9,1)=(-(100*1/y(1)));
  g1(9,9)=1;
  g1(10,2)=(-(100*1/y(2)));
  g1(10,10)=1;
  g1(11,4)=(-(100*1/y(4)));
  g1(11,11)=1;
  g1(12,5)=(-(100*1/y(5)));
  g1(12,12)=1;
  g1(13,7)=(-(100*1/y(7)));
  g1(13,13)=1;
  g1(14,6)=(-400);
  g1(14,14)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],14,196);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,2744);
end
end
end
end
