function [residual, g1, g2, g3] = rbc_model_habit2_static(y, x, params)
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

residual = zeros( 15, 1);

%
% Model equations
%

T15 = (y(2)-y(2)*params(6))^((-1)/params(2));
T43 = exp(y(8))*y(3)^params(7);
T45 = y(5)^(1-params(7));
lhs =y(9);
rhs =T15-T15*params(6)*params(1);
residual(1)= lhs-rhs;
lhs =y(9);
rhs =y(9)*params(1)*(1-params(8)+y(6));
residual(2)= lhs-rhs;
lhs =y(9)*y(7);
rhs =params(4)*y(5)^(1/params(3));
residual(3)= lhs-rhs;
lhs =y(1);
rhs =T43*T45;
residual(4)= lhs-rhs;
lhs =y(7);
rhs =y(1)*(1-params(7))/y(5);
residual(5)= lhs-rhs;
lhs =y(6);
rhs =y(1)*params(7)/y(3);
residual(6)= lhs-rhs;
lhs =y(3);
rhs =(1-params(8))*y(3)+y(4);
residual(7)= lhs-rhs;
lhs =y(1);
rhs =y(2)+y(4);
residual(8)= lhs-rhs;
lhs =y(8);
rhs =y(8)*params(9)+x(1);
residual(9)= lhs-rhs;
lhs =y(10);
rhs =100*log(y(1));
residual(10)= lhs-rhs;
lhs =y(11);
rhs =100*log(y(2));
residual(11)= lhs-rhs;
lhs =y(12);
rhs =100*log(y(4));
residual(12)= lhs-rhs;
lhs =y(13);
rhs =100*log(y(5));
residual(13)= lhs-rhs;
lhs =y(14);
rhs =100*log(y(7));
residual(14)= lhs-rhs;
lhs =y(15);
rhs =y(6)*400;
residual(15)= lhs-rhs;
if ~isreal(residual)
  residual = real(residual)+imag(residual).^2;
end
if nargout >= 2,
  g1 = zeros(15, 15);

  %
  % Jacobian matrix
  %

T99 = (1-params(6))*getPowerDeriv(y(2)-y(2)*params(6),(-1)/params(2),1);
  g1(1,2)=(-(T99-params(6)*params(1)*T99));
  g1(1,9)=1;
  g1(2,6)=(-(y(9)*params(1)));
  g1(2,9)=1-params(1)*(1-params(8)+y(6));
  g1(3,5)=(-(params(4)*getPowerDeriv(y(5),1/params(3),1)));
  g1(3,7)=y(9);
  g1(3,9)=y(7);
  g1(4,1)=1;
  g1(4,3)=(-(T45*exp(y(8))*getPowerDeriv(y(3),params(7),1)));
  g1(4,5)=(-(T43*getPowerDeriv(y(5),1-params(7),1)));
  g1(4,8)=(-(T43*T45));
  g1(5,1)=(-((1-params(7))/y(5)));
  g1(5,5)=(-((-(y(1)*(1-params(7))))/(y(5)*y(5))));
  g1(5,7)=1;
  g1(6,1)=(-(params(7)/y(3)));
  g1(6,3)=(-((-(y(1)*params(7)))/(y(3)*y(3))));
  g1(6,6)=1;
  g1(7,3)=1-(1-params(8));
  g1(7,4)=(-1);
  g1(8,1)=1;
  g1(8,2)=(-1);
  g1(8,4)=(-1);
  g1(9,8)=1-params(9);
  g1(10,1)=(-(100*1/y(1)));
  g1(10,10)=1;
  g1(11,2)=(-(100*1/y(2)));
  g1(11,11)=1;
  g1(12,4)=(-(100*1/y(4)));
  g1(12,12)=1;
  g1(13,5)=(-(100*1/y(5)));
  g1(13,13)=1;
  g1(14,7)=(-(100*1/y(7)));
  g1(14,14)=1;
  g1(15,6)=(-400);
  g1(15,15)=1;
  if ~isreal(g1)
    g1 = real(g1)+2*imag(g1);
  end
if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,225);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,3375);
end
end
end
end
