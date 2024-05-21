/
// RUN: dpct -format-range=none -out-root %T/cuda_user_defined_scan cuda_user_defined_scan.cu --cuda-include-path="%cuda-path/include" --usm-level=none --rule-file=cuda_user_defined_scan.yaml -- -x cuda --cuda-host-only

// CHECK: #include <oneapi/dpl/execution>
// CHECK: #include <oneapi/dpl/algorithm>
#include <stddef.h>
#include "user_define_rule_header_order1.h"