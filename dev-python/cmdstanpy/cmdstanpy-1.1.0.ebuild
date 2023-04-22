# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..11} )

inherit distutils-r1

DESCRIPTION="Python interface to CmdStan"
HOMEPAGE="https://cmdstanpy.readthedocs.io"
SRC_URI="https://github.com/stan-dev/cmdstanpy/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="all doc"
PROPERTIES="test_network"
RESTRICT="test"	# Test phase runs with fails

RDEPEND=">=dev-python/numpy-1.21[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	all? ( dev-python/xarray[${PYTHON_USEDEP}] )
"
BDEPEND="test? ( dev-vcs/git )"

distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# E ValueError: No CmdStan installation found, run command "install_cmdstan"or (re)activate your conda environment!
	test/test_generate_quantities.py
	test/test_log_prob.py
)

EPYTEST_DESELECT=(
	# E ValueError: No CmdStan installation found, run command "install_cmdstan"or (re)activate your conda environment!
	test/test_cmdstan_args.py::test_args_sig_figs
	test/test_model.py::test_model_good
	test/test_model.py::test_ctor_compile_arg
	test/test_model.py::test_exe_only
	test/test_model.py::test_fixed_param
	test/test_model.py::test_model_pedantic
	test/test_model.py::test_model_bad
	test/test_model.py::test_model_info
	test/test_model.py::test_compile_with_bad_includes
	test/test_model.py::test_compile_with_includes
	test/test_model.py::test_compile_force
	test/test_model.py::test_model_paths
	test/test_model.py::test_repr
	test/test_model.py::test_print
	test/test_model.py::test_model_compile
	test/test_model.py::test_model_compile_space
	test/test_model.py::test_model_includes_explicit
	test/test_model.py::test_model_includes_implicit
	test/test_optimize.py::test_instantiate
	test/test_optimize.py::test_rosenbrock
	test/test_optimize.py::test_eight_schools
	test/test_optimize.py::test_variable_bern
	test/test_optimize.py::test_variables_3d
	test/test_optimize.py::test_optimize_good
	test/test_optimize.py::test_negative_parameter_values
	test/test_optimize.py::test_parameters_are_floats
	test/test_optimize.py::test_parameters_and_optimizer_compatible
	test/test_optimize.py::test_optimize_good_dict
	test/test_optimize.py::test_optimize_rosenbrock
	test/test_optimize.py::test_optimize_no_data
	test/test_optimize.py::test_optimize_bad
	test/test_optimize.py::test_single_row_csv
	test/test_optimize.py::test_show_console
	test/test_optimize.py::test_exe_only
	test/test_optimize.py::test_complex_output
	test/test_optimize.py::test_attrs
	test/test_optimize.py::test_timeout
	test/test_optimize.py::test_serialization
	test/test_sample.py::test_bernoulli_good
	test/test_sample.py::test_bernoulli_unit_e
	test/test_sample.py::test_init_types
	test/test_sample.py::test_bernoulli_bad
	test/test_sample.py::test_multi_proc_1
	test/test_sample.py::test_multi_proc_2
	test/test_sample.py::test_num_threads_msgs
	test/test_sample.py::test_multi_proc_threads
	test/test_sample.py::test_multi_proc_err_msgs
	test/test_sample.py::test_fixed_param_good
	test/test_sample.py::test_fixed_param_unspecified
	test/test_sample.py::test_index_bounds_error
	test/test_sample.py::test_show_console
	test/test_sample.py::test_show_progress
	test/test_sample.py::test_validate_good_run
	test/test_sample.py::test_custom_metric
	test/test_sample.py::test_custom_step_size
	test/test_sample.py::test_custom_seed
	test/test_sample.py::test_adapt_schedule
	test/test_sample.py::test_save_csv
	test/test_sample.py::test_diagnose_divergences
	test/test_sample.py::test_sample_sporadic_exception
	test/test_sample.py::test_save_warmup
	test/test_sample.py::test_save_warmup_thin
	test/test_sample.py::test_dont_save_warmup
	test/test_sample.py::test_sampler_diags
	test/test_sample.py::test_variable_bern
	test/test_sample.py::test_variables_issue_361
	test/test_sample.py::test_validate
	test/test_sample.py::test_validate_sample_sig_figs
	test/test_sample.py::test_validate_summary_sig_figs
	test/test_sample.py::test_save_latent_dynamics
	test/test_sample.py::test_save_profile
	test/test_sample.py::test_xarray_draws
	test/test_sample.py::test_no_xarray
	test/test_sample.py::test_single_row_csv
	test/test_sample.py::test_overlapping_names
	test/test_sample.py::test_complex_output
	test/test_sample.py::test_attrs
	test/test_sample.py::test_diagnostics
	test/test_sample.py::test_timeout
	test/test_sample.py::test_json_edges
	test/test_sample.py::test_serialization
	test/test_utils.py::test_cmdstan_version
	test/test_utils.py::test_check_sampler_csv_thin
	test/test_variational.py::test_instantiate
	test/test_variational.py::test_variables
	test/test_variational.py::test_variables_3d
	test/test_variational.py::test_variational_good
	test/test_variational.py::test_variational_eta_small
	test/test_variational.py::test_variational_eta_fail
	test/test_variational.py::test_single_row_csv
	test/test_variational.py::test_show_console
	test/test_variational.py::test_exe_only
	test/test_variational.py::test_complex_output
	test/test_variational.py::test_attrs
	test/test_variational.py::test_timeout
	test/test_variational.py::test_serialization
	test/test_model.py::test_model_syntax_error
	test/test_model.py::test_model_format_options
	test/test_model.py::test_format_old_version
)

python_install_all() {
	use doc && HTML_DOCS=( docs/. )
	distutils-r1_python_install_all
}

python_test() {
	mkdir -p "${HOME}"/.cmdstan || die
	epytest
}
