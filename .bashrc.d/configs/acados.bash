#!/usr/bin/bash
export ACADOS_ROOT="${MAIN_WS}/third_party/acados"
export ACADOS_SOURCE_DIR="${ACADOS_ROOT}"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"${ACADOS_ROOT}/lib"
