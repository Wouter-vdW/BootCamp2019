function [residual, g1, g2, g3] = rbc_model_2_dynamic(y, x, params, steady_state, it_)
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

residual = zeros(14, 1);
T10 = (-1)/params(2);
T11 = y(4)^T10;
T15 = params(1)*y(17)^T10;
T37 = exp(y(10))*y(1)^params(6);
T39 = y(7)^(1-params(6));
lhs =T11;
rhs =T15*(1-params(7)+y(18));
residual(1)= lhs-rhs;
lhs =T11*y(9);
rhs =params(4)*y(7)^(1/params(3));
residual(2)= lhs-rhs;
lhs =y(3);
rhs =T37*T39;
residual(3)= lhs-rhs;
lhs =y(9);
rhs =y(3)*(1-params(6))/y(7);
residual(4)= lhs-rhs;
lhs =y(8);
rhs =y(3)*params(6)/y(1);
residual(5)= lhs-rhs;
lhs =y(5);
rhs =(1-params(7))*y(1)+y(6);
residual(6)= lhs-rhs;
lhs =y(3);
rhs =y(4)+y(6);
residual(7)= lhs-rhs;
lhs =y(10);
rhs =params(8)*y(2)+x(it_, 1);
residual(8)= lhs-rhs;
lhs =y(11);
rhs =100*log(y(3));
residual(9)= lhs-rhs;
lhs =y(12);
rhs =100*log(y(4));
residual(10)= lhs-rhs;
lhs =y(13);
rhs =100*log(y(6));
residual(11)= lhs-rhs;
lhs =y(14);
rhs =100*log(y(7));
residual(12)= lhs-rhs;
lhs =y(15);
rhs =100*log(y(9));
residual(13)= lhs-rhs;
lhs =y(16);
rhs =y(8)*400;
residual(14)= lhs-rhs;
if nargout >= 2,
  g1 = zeros(14, 19);

  %
  % Jacobian matrix
  %

T94 = getPowerDeriv(y(4),T10,1);
T100 = params(1)*getPowerDeriv(y(17),T10,1);
T104 = exp(y(10))*getPowerDeriv(y(1),params(6),1);
T118 = getPowerDeriv(y(7),1-params(6),1);
  g1(1,4)=T94;
  g1(1,17)=(-((1-params(7)+y(18))*T100));
  g1(1,18)=(-T15);
  g1(2,4)=y(9)*T94;
  g1(2,7)=(-(params(4)*getPowerDeriv(y(7),1/params(3),1)));
  g1(2,9)=T11;
  g1(3,3)=1;
  g1(3,1)=(-(T39*T104));
  g1(3,7)=(-(T37*T118));
  g1(3,10)=(-(T37*T39));
  g1(4,3)=(-((1-params(6))/y(7)));
  g1(4,7)=(-((-(y(3)*(1-params(6))))/(y(7)*y(7))));
  g1(4,9)=1;
  g1(5,3)=(-(params(6)/y(1)));
  g1(5,1)=(-((-(y(3)*params(6)))/(y(1)*y(1))));
  g1(5,8)=1;
  g1(6,1)=(-(1-params(7)));
  g1(6,5)=1;
  g1(6,6)=(-1);
  g1(7,3)=1;
  g1(7,4)=(-1);
  g1(7,6)=(-1);
  g1(8,2)=(-params(8));
  g1(8,10)=1;
  g1(8,19)=(-1);
  g1(9,3)=(-(100*1/y(3)));
  g1(9,11)=1;
  g1(10,4)=(-(100*1/y(4)));
  g1(10,12)=1;
  g1(11,6)=(-(100*1/y(6)));
  g1(11,13)=1;
  g1(12,7)=(-(100*1/y(7)));
  g1(12,14)=1;
  g1(13,9)=(-(100*1/y(9)));
  g1(13,15)=1;
  g1(14,8)=(-400);
  g1(14,16)=1;

if nargout >= 3,
  %
  % Hessian matrix
  %

  v2 = zeros(28,3);
T135 = getPowerDeriv(y(4),T10,2);
  v2(1,1)=1;
  v2(1,2)=61;
  v2(1,3)=T135;
  v2(2,1)=1;
  v2(2,2)=321;
  v2(2,3)=(-((1-params(7)+y(18))*params(1)*getPowerDeriv(y(17),T10,2)));
  v2(3,1)=1;
  v2(3,2)=340;
  v2(3,3)=(-T100);
  v2(4,1)=1;
  v2(4,2)=322;
  v2(4,3)=  v2(3,3);
  v2(5,1)=2;
  v2(5,2)=61;
  v2(5,3)=y(9)*T135;
  v2(6,1)=2;
  v2(6,2)=121;
  v2(6,3)=(-(params(4)*getPowerDeriv(y(7),1/params(3),2)));
  v2(7,1)=2;
  v2(7,2)=156;
  v2(7,3)=T94;
  v2(8,1)=2;
  v2(8,2)=66;
  v2(8,3)=  v2(7,3);
  v2(9,1)=3;
  v2(9,2)=1;
  v2(9,3)=(-(T39*exp(y(10))*getPowerDeriv(y(1),params(6),2)));
  v2(10,1)=3;
  v2(10,2)=115;
  v2(10,3)=(-(T104*T118));
  v2(11,1)=3;
  v2(11,2)=7;
  v2(11,3)=  v2(10,3);
  v2(12,1)=3;
  v2(12,2)=121;
  v2(12,3)=(-(T37*getPowerDeriv(y(7),1-params(6),2)));
  v2(13,1)=3;
  v2(13,2)=172;
  v2(13,3)=(-(T39*T104));
  v2(14,1)=3;
  v2(14,2)=10;
  v2(14,3)=  v2(13,3);
  v2(15,1)=3;
  v2(15,2)=178;
  v2(15,3)=(-(T37*T118));
  v2(16,1)=3;
  v2(16,2)=124;
  v2(16,3)=  v2(15,3);
  v2(17,1)=3;
  v2(17,2)=181;
  v2(17,3)=(-(T37*T39));
  v2(18,1)=4;
  v2(18,2)=117;
  v2(18,3)=(-((-(1-params(6)))/(y(7)*y(7))));
  v2(19,1)=4;
  v2(19,2)=45;
  v2(19,3)=  v2(18,3);
  v2(20,1)=4;
  v2(20,2)=121;
  v2(20,3)=(-((-((-(y(3)*(1-params(6))))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7))));
  v2(21,1)=5;
  v2(21,2)=3;
  v2(21,3)=(-((-params(6))/(y(1)*y(1))));
  v2(22,1)=5;
  v2(22,2)=39;
  v2(22,3)=  v2(21,3);
  v2(23,1)=5;
  v2(23,2)=1;
  v2(23,3)=(-((-((-(y(3)*params(6)))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
  v2(24,1)=9;
  v2(24,2)=41;
  v2(24,3)=(-(100*(-1)/(y(3)*y(3))));
  v2(25,1)=10;
  v2(25,2)=61;
  v2(25,3)=(-(100*(-1)/(y(4)*y(4))));
  v2(26,1)=11;
  v2(26,2)=101;
  v2(26,3)=(-(100*(-1)/(y(6)*y(6))));
  v2(27,1)=12;
  v2(27,2)=121;
  v2(27,3)=(-(100*(-1)/(y(7)*y(7))));
  v2(28,1)=13;
  v2(28,2)=161;
  v2(28,3)=(-(100*(-1)/(y(9)*y(9))));
  g2 = sparse(v2(:,1),v2(:,2),v2(:,3),14,361);
if nargout >= 4,
  %
  % Third order derivatives
  %

  g3 = sparse([],[],[],14,6859);
end
end
end
end
