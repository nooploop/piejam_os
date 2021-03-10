################################################################################
#
# benchmark
#
################################################################################

BENCHMARK_VERSION = v1.5.2
BENCHMARK_SITE = https://github.com/google/benchmark.git
BENCHMARK_SITE_METHOD = git
BENCHMARK_GIT_SUBMODULES = YES
BENCHMARK_CONF_OPTS = -DBENCHMARK_ENABLE_GTEST_TESTS=OFF
BENCHMARK_INSTALL_STAGING = YES

$(eval $(cmake-package))
