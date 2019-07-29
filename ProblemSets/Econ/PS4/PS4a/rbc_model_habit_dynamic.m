function [residual, g1, g2, g3] = rbc_model_habit_dynamic(y, x, params, steady_state, it_)
%
% Status : Computes dynamic model for Dynare
%
% Inputs :
%   y         [#dynamic variables by 1] double    vector of endogenous variables in the order stored
%                                                 in M_.lead_lag_incidence; see the Manual
%   x         [nperiods by M_.exo_nbr] double     matrix of exogenous variables (in declaration order)
%                                                 for all simulation periods
%   steady_state  [M_.endo_nbr by 1] double       vector of steady state values
%   params    [M_.param_nbr by 1] double          vector of parameter values in declaration order
%   it_       scalar double                       time period for exogenous variables for which to evaluate the model
%
% Outputs:
%   residual  [M_.endo_nbr by 1] double    vector of residuals of the dynamic model equations in order of 
%                                          declaration of the equations.
%                                          Dynare may prepend auxiliary equations, see M_.aux_vars
%   g1        [M_.endo_nbr by #dynamic variables] double    Jacobian matrix of the dynamic model equations;
%                                                           rows: equations in order of declaration
%                                                           columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g2        [M_.endo_nbr by (#dynamic variables)^2] double   Hessian matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%   g3        [M_.endo_nbr by (#dynamic variables)^3] double   Third order derivative matrix of the dynamic model equations;
%                                                              rows: equations in order of declaration
%                                                              columns: variables in order stored in M_.lead_lag_incidence followed by the ones in M_.exo_names
%
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

%
% Model equations
%

residual = zeros(15, 1);
T15 = (-1)/params(2);
T49 = exp(y(11))*y(2)^params(7);
T51 = y(8)^(1-params(7));
lhs =y(12);
rhs =(y(5)-params(6)*y(1))^T15-params(6)*params(1)*(y(19)-y(5)*params(6))^T15;
residual(1)= lhs-rhs;
lhs =y(12);
rhs =params(1)*(1-params(8)+y(20))*y(21);
residual(2)= lhs-rhs;
lhs =y(12)*y(10);
rhs =params(4)*y(8)^(1/params(3));
residual(3)= lhs-rhs;
lhs =y(4);
rhs =T49*T51;
residual(4)= lhs-rhs;
lhs =y(10);
rhs =y(4)*(1-params(7))/y(8);
residual(5)= lhs-rhs;
lhs =y(9);
rhs =y(4)*params(7)/y(2);
residual(6)= lhs-rhs;
lhs =y(6);
rhs =(1-params(8))*y(2)+y(7);
residual(7)= lhs-rhs;
lhs =y(4);
rhs =y(5)+y(7);
residual(8)= lhs-rhs;
lhs =y(11);
rhs =params(9)*y(3)+x(it_, 1);
residual(9)= lhs-rhs;
lhs =y(13);
rhs =100*log(y(4));
residual(10)= lhs-rhs;
lhs =y(14);
rhs =100*log(y(5));
residual(11)= lhs-rhs;
lhs =y(15);
rhs =100*log(y(7));
residual(12)= lhs-rhs;
lhs =y(16);
rhs =100*log(y(8));
residual(13)= lhs-rhs;
lhs =y(17);
rhs =100*log(y(10));
residual(14)= lhs-rhs;
lhs =y(18);
rhs =y(9)*400;
residual(15)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(15, 22);

  %
  % Jacobian matrix
  %

T107 = getPowerDeriv(y(5)-params(6)*y(1),T15,1);
T110 = getPowerDeriv(y(19)-y(5)*params(6),T15,1);
  g1(1,1)=(-((-params(6))*T107));
  g1(1,5)=(-(T107-params(6)*params(1)*(-params(6))*T110));
  g1(1,19)=params(6)*params(1)*T110;
  g1(1,12)=1;
  g1(2,20)=(-(params(1)*y(21)));
  g1(2,12)=1;
  g1(2,21)=(-(params(1)*(1-params(8)+y(20))));
  g1(3,8)=(-(params(4)*getPowerDeriv(y(8),1/params(3),1)));
  g1(3,10)=y(12);
  g1(3,12)=y(10);
  g1(4,4)=1;
  g1(4,2)=(-(T51*exp(y(11))*getPowerDeriv(y(2),params(7),1)));
  g1(4,8)=(-(T49*getPowerDeriv(y(8),1-params(7),1)));
  g1(4,11)=(-(T49*T51));
  g1(5,4)=(-((1-params(7))/y(8)));
  g1(5,8)=(-((-(y(4)*(1-params(7))))/(y(8)*y(8))));
  g1(5,10)=1;
  g1(6,4)=(-(params(7)/y(2)));
  g1(6,2)=(-((-(y(4)*params(7)))/(y(2)*y(2))));
  g1(6,9)=1;
  g1(7,2)=(-(1-params(8)));
  g1(7,6)=1;
  g1(7,7)=(-1);
  g1(8,4)=1;
  g1(8,5)=(-1);
  g1(8,7)=(-1);
  g1(9,3)=(-params(9));
  g1(9,11)=1;
  g1(9,22)=(-1);
  g1(10,4)=(-(100*1/y(4)));
  g1(10,13)=1;
  g1(11,5)=(-(100*1/y(5)));
  g1(11,14)=1;
  g1(12,7)=(-(100*1/y(7)));
  g1(12,15)=1;
  g1(13,8)=(-(100*1/y(8)));
  g1(13,16)=1;
  g1(14,10)=(-(100*1/y(10)));
  g1(14,17)=1;
  g1(15,9)=(-400);
  g1(15,18)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  g2 = sparse([],[],[],15,484);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],15,10648);
end
end
end
end
