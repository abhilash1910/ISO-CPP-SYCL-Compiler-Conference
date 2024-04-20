# Author Abhilash Majumder (abhilash.majumder@intel.com)
import os
import platform
import subprocess
import sys
from pathlib import Path

from setuptools import find_packages, setup


import intel_extension_for_pytorch
os.environ["CC"] = "icx"
os.environ["CXX"] = "icpx"
    
common_setup_kwargs = {
    "version": "0.0.0.dev0",
    "name": "sycl_pytorch",
    "author": "Abhilash Majumder",
    "description": "A collection of Deep Learning SYCL Kernels with Pytorch for ISO::C++.",
    "long_description": "",
    "long_description_content_type": "text/markdown",
    "url": "",
    "keywords": ["activation", "quantization", "llm-kernels", "sycl", "pytorch Aten"],
    "platforms": ["linux"],
    "classifiers": [
        "Natural Language :: English",
        "Programming Language :: Python :: 3.8",
        "Programming Language :: Python :: 3.9",
        "Programming Language :: Python :: 3.10",
        "Programming Language :: Python :: 3.11",
        "Programming Language :: C++",
    ]
}


PYPI_RELEASE = os.environ.get('PYPI_RELEASE', None)
BUILD_SYCL = int(os.environ.get('BUILD_SYCL', '1')) == 1


if BUILD_SYCL:
    try:
        import torch
        import intel_extension_for_pytorch
        from torch.xpu.cpp_extension import DPCPPExtension, DpcppBuildExtension
    except Exception as e:
        print(f"Building PyTorch IPEX extension requires PyTorch being installed, please install PyTorch &IPEX first")
        sys.exit(1)

    print(f"Building PyTorch IPEX extension for sycl_pytorch")
    SYCL_VERSION = os.environ.get('SYCL_VERSION', '0.0.1')
    
    
    if not PYPI_RELEASE:
        common_setup_kwargs['version'] += f"+sycl{SYCL_VERSION}"
    print(f"Registering sycl backend with version : {common_setup_kwargs['version']}")




requirements = [
    "numpy",
    "torch>=1.13.0",
    "tqdm",
]

extras_require = {
    "triton": ["triton==2.0.0"],
    "test": ["pytest", "parameterized"],
    "quality": ["ruff==0.1.5"],
}


if BUILD_SYCL:
    import torch
    import intel_extension_for_pytorch
    from torch.xpu.cpp_extension import DPCPPExtension, DpcppBuildExtension

    
    with open(os.path.join("requirements_sycl.txt")) as f:
        requirements_sycl = f.read().strip().split("\n")
            
    cxx_flags = [
        '-fsycl', '-O3', '-std=c++20', '-w', '-fPIC', '-DMKL_ILP64',
        '-Wno-narrowing'
        ]
    extra_ldflags = [
        '-fsycl', '-fPIC', '-Wl,-export-dynamic'
        
         ]
    
    include_headers=["kernels/utils.h", "kernels/reduction_utils.h"]
    
    sycl_source_files = [
                "kernels/sycl_activation_kernels.cpp",
                "kernels/sycl_layernorm_kernel.cpp"
                
            ]
   
    extensions = [
        DPCPPExtension(name="sycl_pytorch",
                       sources=sycl_source_files,
                       include_dirs=include_headers,
                       extra_compile_args={'cxx': cxx_flags},
                       extra_link_args=extra_ldflags)
        
    ]

    
    additional_setup_kwargs = {
        "ext_modules": extensions,
        "cmdclass": {'build_ext': DpcppBuildExtension}
    }
    common_setup_kwargs.update(additional_setup_kwargs)
    setup(
        packages=find_packages(),
        install_requires=requirements_sycl,
        extras_require=extras_require,
        python_requires=">=3.8.0",
        **common_setup_kwargs
    )