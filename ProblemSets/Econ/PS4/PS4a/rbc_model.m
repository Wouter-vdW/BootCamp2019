%
% Status : main Dynare file
%
% Warning : this file is generated automatically by Dynare
%           from model file (.mod)

if isoctave || matlab_ver_less_than('8.6')
    clear all
else
    clearvars -global
    clear_persistent_variables(fileparts(which('dynare')), false)
end
tic0 = tic;
% Save empty dates and dseries objects in memory.
dates('initialize');
dseries('initialize');
% Define global variables.
global M_ options_ oo_ estim_params_ bayestopt_ dataset_ dataset_info estimation_info ys0_ ex0_
options_ = [];
M_.fname = 'rbc_model';
M_.dynare_version = '4.5.7';
oo_.dynare_version = '4.5.7';
options_.dynare_version = '4.5.7';
%
% Some global variables initialization
%
global_initialization;
diary off;
diary('rbc_model.log');
M_.exo_names = 'e';
M_.exo_names_tex = 'e';
M_.exo_names_long = 'e';
M_.endo_names = 'y';
M_.endo_names_tex = 'y';
M_.endo_names_long = 'y';
M_.endo_names = char(M_.endo_names, 'c');
M_.endo_names_tex = char(M_.endo_names_tex, 'c');
M_.endo_names_long = char(M_.endo_names_long, 'c');
M_.endo_names = char(M_.endo_names, 'k');
M_.endo_names_tex = char(M_.endo_names_tex, 'k');
M_.endo_names_long = char(M_.endo_names_long, 'k');
M_.endo_names = char(M_.endo_names, 'i');
M_.endo_names_tex = char(M_.endo_names_tex, 'i');
M_.endo_names_long = char(M_.endo_names_long, 'i');
M_.endo_names = char(M_.endo_names, 'l');
M_.endo_names_tex = char(M_.endo_names_tex, 'l');
M_.endo_names_long = char(M_.endo_names_long, 'l');
M_.endo_names = char(M_.endo_names, 'r');
M_.endo_names_tex = char(M_.endo_names_tex, 'r');
M_.endo_names_long = char(M_.endo_names_long, 'r');
M_.endo_names = char(M_.endo_names, 'w');
M_.endo_names_tex = char(M_.endo_names_tex, 'w');
M_.endo_names_long = char(M_.endo_names_long, 'w');
M_.endo_names = char(M_.endo_names, 'z');
M_.endo_names_tex = char(M_.endo_names_tex, 'z');
M_.endo_names_long = char(M_.endo_names_long, 'z');
M_.endo_names = char(M_.endo_names, 'logY');
M_.endo_names_tex = char(M_.endo_names_tex, 'logY');
M_.endo_names_long = char(M_.endo_names_long, 'logY');
M_.endo_names = char(M_.endo_names, 'logC');
M_.endo_names_tex = char(M_.endo_names_tex, 'logC');
M_.endo_names_long = char(M_.endo_names_long, 'logC');
M_.endo_names = char(M_.endo_names, 'logI');
M_.endo_names_tex = char(M_.endo_names_tex, 'logI');
M_.endo_names_long = char(M_.endo_names_long, 'logI');
M_.endo_names = char(M_.endo_names, 'logL');
M_.endo_names_tex = char(M_.endo_names_tex, 'logL');
M_.endo_names_long = char(M_.endo_names_long, 'logL');
M_.endo_names = char(M_.endo_names, 'logW');
M_.endo_names_tex = char(M_.endo_names_tex, 'logW');
M_.endo_names_long = char(M_.endo_names_long, 'logW');
M_.endo_names = char(M_.endo_names, 'r_annual');
M_.endo_names_tex = char(M_.endo_names_tex, 'r\_annual');
M_.endo_names_long = char(M_.endo_names_long, 'r_annual');
M_.endo_partitions = struct();
M_.param_names = 'bbeta';
M_.param_names_tex = 'bbeta';
M_.param_names_long = 'bbeta';
M_.param_names = char(M_.param_names, 'eeis');
M_.param_names_tex = char(M_.param_names_tex, 'eeis');
M_.param_names_long = char(M_.param_names_long, 'eeis');
M_.param_names = char(M_.param_names, 'eeta');
M_.param_names_tex = char(M_.param_names_tex, 'eeta');
M_.param_names_long = char(M_.param_names_long, 'eeta');
M_.param_names = char(M_.param_names, 'cchi');
M_.param_names_tex = char(M_.param_names_tex, 'cchi');
M_.param_names_long = char(M_.param_names_long, 'cchi');
M_.param_names = char(M_.param_names, 'l_ss');
M_.param_names_tex = char(M_.param_names_tex, 'l\_ss');
M_.param_names_long = char(M_.param_names_long, 'l_ss');
M_.param_names = char(M_.param_names, 'aalpha');
M_.param_names_tex = char(M_.param_names_tex, 'aalpha');
M_.param_names_long = char(M_.param_names_long, 'aalpha');
M_.param_names = char(M_.param_names, 'ddelta');
M_.param_names_tex = char(M_.param_names_tex, 'ddelta');
M_.param_names_long = char(M_.param_names_long, 'ddelta');
M_.param_names = char(M_.param_names, 'rrho');
M_.param_names_tex = char(M_.param_names_tex, 'rrho');
M_.param_names_long = char(M_.param_names_long, 'rrho');
M_.param_names = char(M_.param_names, 'ssigma');
M_.param_names_tex = char(M_.param_names_tex, 'ssigma');
M_.param_names_long = char(M_.param_names_long, 'ssigma');
M_.param_partitions = struct();
M_.exo_det_nbr = 0;
M_.exo_nbr = 1;
M_.endo_nbr = 14;
M_.param_nbr = 9;
M_.orig_endo_nbr = 14;
M_.aux_vars = [];
M_.Sigma_e = zeros(1, 1);
M_.Correlation_matrix = eye(1, 1);
M_.H = 0;
M_.Correlation_matrix_ME = 1;
M_.sigma_e_is_diagonal = 1;
M_.det_shocks = [];
options_.block=0;
options_.bytecode=0;
options_.use_dll=0;
M_.hessian_eq_zero = 1;
erase_compiled_function('rbc_model_static');
erase_compiled_function('rbc_model_dynamic');
M_.orig_eq_nbr = 14;
M_.eq_nbr = 14;
M_.ramsey_eq_nbr = 0;
M_.set_auxiliary_variables = exist(['./' M_.fname '_set_auxiliary_variables.m'], 'file') == 2;
M_.lead_lag_incidence = [
 0 3 0;
 0 4 17;
 1 5 0;
 0 6 0;
 0 7 0;
 0 8 18;
 0 9 0;
 2 10 0;
 0 11 0;
 0 12 0;
 0 13 0;
 0 14 0;
 0 15 0;
 0 16 0;]';
M_.nstatic = 10;
M_.nfwrd   = 2;
M_.npred   = 2;
M_.nboth   = 0;
M_.nsfwrd   = 2;
M_.nspred   = 2;
M_.ndynamic   = 4;
M_.equations_tags = {
};
M_.static_and_dynamic_models_differ = 0;
M_.exo_names_orig_ord = [1:1];
M_.maximum_lag = 1;
M_.maximum_lead = 1;
M_.maximum_endo_lag = 1;
M_.maximum_endo_lead = 1;
oo_.steady_state = zeros(14, 1);
M_.maximum_exo_lag = 0;
M_.maximum_exo_lead = 0;
oo_.exo_steady_state = zeros(1, 1);
M_.params = NaN(9, 1);
M_.NNZDerivatives = [37; -1; -1];
close all
M_.params( 1 ) = 0.99;
bbeta = M_.params( 1 );
M_.params( 2 ) = 1;
eeis = M_.params( 2 );
M_.params( 5 ) = 0.3333333333333333;
l_ss = M_.params( 5 );
M_.params( 3 ) = 0.5;
eeta = M_.params( 3 );
M_.params( 6 ) = 0.3333333333333333;
aalpha = M_.params( 6 );
M_.params( 7 ) = 0.025;
ddelta = M_.params( 7 );
M_.params( 8 ) = 0.95;
rrho = M_.params( 8 );
M_.params( 9 ) = 0.007;
ssigma = M_.params( 9 );
%
% SHOCKS instructions
%
M_.exo_det_length = 0;
M_.Sigma_e(1, 1) = M_.params(9)^2;
steady;
oo_.dr.eigval = check(M_,options_,oo_);
options_.hp_filter = 1600;
options_.irf = 80;
options_.order = 1;
var_list_ = char('logY','logC','logI','logL','logW','r_annual');
info = stoch_simul(var_list_);
save('rbc_model_results.mat', 'oo_', 'M_', 'options_');
if exist('estim_params_', 'var') == 1
  save('rbc_model_results.mat', 'estim_params_', '-append');
end
if exist('bayestopt_', 'var') == 1
  save('rbc_model_results.mat', 'bayestopt_', '-append');
end
if exist('dataset_', 'var') == 1
  save('rbc_model_results.mat', 'dataset_', '-append');
end
if exist('estimation_info', 'var') == 1
  save('rbc_model_results.mat', 'estimation_info', '-append');
end
if exist('dataset_info', 'var') == 1
  save('rbc_model_results.mat', 'dataset_info', '-append');
end
if exist('oo_recursive_', 'var') == 1
  save('rbc_model_results.mat', 'oo_recursive_', '-append');
end


disp(['Total computing time : ' dynsec2hms(toc(tic0)) ]);
if ~isempty(lastwarn)
  disp('Note: warning(s) encountered in MATLAB/Octave code')
end
diary off
