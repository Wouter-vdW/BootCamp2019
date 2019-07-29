function [residual, g1, g2, g3] = rbc_model_3_dynamic(y, x, params, steady_state, it_)
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
T27 = 1/params(3);
T37 = exp(y(10))*y(1)^params(6);
T39 = y(7)^(1-params(6));
lhs =T11;
rhs =T15*(1-params(7)+y(18));
residual(1)= lhs-rhs;
lhs =T11*y(9);
rhs =params(4)*y(7)^T27;
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
  g1(2,7)=(-(params(4)*getPowerDeriv(y(7),T27,1)));
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
T137 = params(1)*getPowerDeriv(y(17),T10,2);
T146 = exp(y(10))*getPowerDeriv(y(1),params(6),2);
T151 = getPowerDeriv(y(7),1-params(6),2);
  v2(1,1)=1;
  v2(1,2)=61;
  v2(1,3)=T135;
  v2(2,1)=1;
  v2(2,2)=321;
  v2(2,3)=(-((1-params(7)+y(18))*T137));
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
  v2(6,3)=(-(params(4)*getPowerDeriv(y(7),T27,2)));
  v2(7,1)=2;
  v2(7,2)=156;
  v2(7,3)=T94;
  v2(8,1)=2;
  v2(8,2)=66;
  v2(8,3)=  v2(7,3);
  v2(9,1)=3;
  v2(9,2)=1;
  v2(9,3)=(-(T39*T146));
  v2(10,1)=3;
  v2(10,2)=115;
  v2(10,3)=(-(T104*T118));
  v2(11,1)=3;
  v2(11,2)=7;
  v2(11,3)=  v2(10,3);
  v2(12,1)=3;
  v2(12,2)=121;
  v2(12,3)=(-(T37*T151));
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

  v3 = zeros(50,3);
T191 = getPowerDeriv(y(4),T10,3);
  v3(1,1)=1;
  v3(1,2)=1144;
  v3(1,3)=T191;
  v3(2,1)=1;
  v3(2,2)=6097;
  v3(2,3)=(-((1-params(7)+y(18))*params(1)*getPowerDeriv(y(17),T10,3)));
  v3(3,1)=1;
  v3(3,2)=6458;
  v3(3,3)=(-T137);
  v3(4,1)=1;
  v3(4,2)=6098;
  v3(4,3)=  v3(3,3);
  v3(5,1)=1;
  v3(5,2)=6116;
  v3(5,3)=  v3(3,3);
  v3(6,1)=2;
  v3(6,2)=1144;
  v3(6,3)=y(9)*T191;
  v3(7,1)=2;
  v3(7,2)=2287;
  v3(7,3)=(-(params(4)*getPowerDeriv(y(7),T27,3)));
  v3(8,1)=2;
  v3(8,2)=2949;
  v3(8,3)=T135;
  v3(9,1)=2;
  v3(9,2)=1149;
  v3(9,3)=  v3(8,3);
  v3(10,1)=2;
  v3(10,2)=1239;
  v3(10,3)=  v3(8,3);
  v3(11,1)=3;
  v3(11,2)=1;
  v3(11,3)=(-(T39*exp(y(10))*getPowerDeriv(y(1),params(6),3)));
  v3(12,1)=3;
  v3(12,2)=2167;
  v3(12,3)=(-(T118*T146));
  v3(13,1)=3;
  v3(13,2)=7;
  v3(13,3)=  v3(12,3);
  v3(14,1)=3;
  v3(14,2)=115;
  v3(14,3)=  v3(12,3);
  v3(15,1)=3;
  v3(15,2)=2281;
  v3(15,3)=(-(T104*T151));
  v3(16,1)=3;
  v3(16,2)=121;
  v3(16,3)=  v3(15,3);
  v3(17,1)=3;
  v3(17,2)=2173;
  v3(17,3)=  v3(15,3);
  v3(18,1)=3;
  v3(18,2)=2287;
  v3(18,3)=(-(T37*getPowerDeriv(y(7),1-params(6),3)));
  v3(19,1)=3;
  v3(19,2)=3250;
  v3(19,3)=(-(T39*T146));
  v3(20,1)=3;
  v3(20,2)=10;
  v3(20,3)=  v3(19,3);
  v3(21,1)=3;
  v3(21,2)=172;
  v3(21,3)=  v3(19,3);
  v3(22,1)=3;
  v3(22,2)=3364;
  v3(22,3)=(-(T104*T118));
  v3(23,1)=3;
  v3(23,2)=124;
  v3(23,3)=  v3(22,3);
  v3(24,1)=3;
  v3(24,2)=178;
  v3(24,3)=  v3(22,3);
  v3(25,1)=3;
  v3(25,2)=2176;
  v3(25,3)=  v3(22,3);
  v3(26,1)=3;
  v3(26,2)=2338;
  v3(26,3)=  v3(22,3);
  v3(27,1)=3;
  v3(27,2)=3256;
  v3(27,3)=  v3(22,3);
  v3(28,1)=3;
  v3(28,2)=3370;
  v3(28,3)=(-(T37*T151));
  v3(29,1)=3;
  v3(29,2)=2290;
  v3(29,3)=  v3(28,3);
  v3(30,1)=3;
  v3(30,2)=2344;
  v3(30,3)=  v3(28,3);
  v3(31,1)=3;
  v3(31,2)=3421;
  v3(31,3)=(-(T39*T104));
  v3(32,1)=3;
  v3(32,2)=181;
  v3(32,3)=  v3(31,3);
  v3(33,1)=3;
  v3(33,2)=3259;
  v3(33,3)=  v3(31,3);
  v3(34,1)=3;
  v3(34,2)=3427;
  v3(34,3)=(-(T37*T118));
  v3(35,1)=3;
  v3(35,2)=2347;
  v3(35,3)=  v3(34,3);
  v3(36,1)=3;
  v3(36,2)=3373;
  v3(36,3)=  v3(34,3);
  v3(37,1)=3;
  v3(37,2)=3430;
  v3(37,3)=(-(T37*T39));
  v3(38,1)=4;
  v3(38,2)=2283;
  v3(38,3)=(-((-((-(1-params(6)))*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7))));
  v3(39,1)=4;
  v3(39,2)=843;
  v3(39,3)=  v3(38,3);
  v3(40,1)=4;
  v3(40,2)=2211;
  v3(40,3)=  v3(38,3);
  v3(41,1)=4;
  v3(41,2)=2287;
  v3(41,3)=(-((y(7)*y(7)*y(7)*y(7)*(-(2*(-(y(3)*(1-params(6))))))-(-((-(y(3)*(1-params(6))))*(y(7)+y(7))))*(y(7)*y(7)*(y(7)+y(7))+y(7)*y(7)*(y(7)+y(7))))/(y(7)*y(7)*y(7)*y(7)*y(7)*y(7)*y(7)*y(7))));
  v3(42,1)=5;
  v3(42,2)=3;
  v3(42,3)=(-((-((-params(6))*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1))));
  v3(43,1)=5;
  v3(43,2)=39;
  v3(43,3)=  v3(42,3);
  v3(44,1)=5;
  v3(44,2)=723;
  v3(44,3)=  v3(42,3);
  v3(45,1)=5;
  v3(45,2)=1;
  v3(45,3)=(-((y(1)*y(1)*y(1)*y(1)*(-(2*(-(y(3)*params(6)))))-(-((-(y(3)*params(6)))*(y(1)+y(1))))*(y(1)*y(1)*(y(1)+y(1))+y(1)*y(1)*(y(1)+y(1))))/(y(1)*y(1)*y(1)*y(1)*y(1)*y(1)*y(1)*y(1))));
  v3(46,1)=9;
  v3(46,2)=763;
  v3(46,3)=(-(100*(y(3)+y(3))/(y(3)*y(3)*y(3)*y(3))));
  v3(47,1)=10;
  v3(47,2)=1144;
  v3(47,3)=(-(100*(y(4)+y(4))/(y(4)*y(4)*y(4)*y(4))));
  v3(48,1)=11;
  v3(48,2)=1906;
  v3(48,3)=(-(100*(y(6)+y(6))/(y(6)*y(6)*y(6)*y(6))));
  v3(49,1)=12;
  v3(49,2)=2287;
  v3(49,3)=(-(100*(y(7)+y(7))/(y(7)*y(7)*y(7)*y(7))));
  v3(50,1)=13;
  v3(50,2)=3049;
  v3(50,3)=(-(100*(y(9)+y(9))/(y(9)*y(9)*y(9)*y(9))));
  g3 = sparse(v3(:,1),v3(:,2),v3(:,3),14,6859);
end
end
end
end
