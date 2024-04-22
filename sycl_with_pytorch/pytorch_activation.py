"""Custom activation layers."""
from typing import Optional, Tuple, Union

import torch
import torch.nn as nn
import intel_extension_for_pytorch

#from torch.utils.cpp_extension import load
import sycl_pytorch as ops



DTYPES = [torch.half, torch.bfloat16, torch.float]
NUM_TOKENS = [7, 83, 4096]  # Arbitrary values for testing
HIDDEN_SIZES = [768, 5120, 8192]  # Arbitrary values for testing
ADD_RESIDUAL = [False, True]
SEEDS = [0]
DEVICES = ["xpu"]#, "cuda", "hip"-> compile ptx/amdgcn targets

class SiluAndMul(nn.Module):
    """An activation function for SwiGLU.

    The function computes x -> silu(x[:d]) * x[d:] where d = x.shape[-1] // 2.

    Shapes:
        x: (batch_size, seq_len, 2 * d) or (num_tokens, 2 * d)
        return: (batch_size, seq_len, d) or (num_tokens, d)
    """

    def _forward(self, x: torch.Tensor) -> torch.Tensor:
        """PyTorch-native implementation equivalent to forward()."""
        d = x.shape[-1] // 2
        return F.silu(x[..., :d]) * x[..., d:]

    def forward(self, x: torch.Tensor) -> torch.Tensor:
        d = x.shape[-1] // 2
        output_shape = (x.shape[:-1] + (d, ))
        out = torch.empty(output_shape, dtype=x.dtype, device=x.device)
        ops.silu_and_mul(out, x)
        return out



# To do : Add gelu



def silu_activation_kernel(
    num_tokens: int,
    d: int,
    dtype: torch.dtype,
    seed: int,
    device: str,
) -> None:
    torch.random.manual_seed(seed)
    torch.set_default_device(device)
    x = torch.randn(num_tokens, d, dtype=dtype)
    print("Forward pass through layer activation layer")
    layer = SiluAndMul()
    out = layer(x)
    ref_out = layer._forward(x)
    print(f"Get the output of activation layer : {ref_out}")
    
if __name__=='__main__':
    silu_activation_kernel(NUM_TOKENS[0],2,DTYPES[0],SEEDS[0],DEVICES[0])