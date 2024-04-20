"""Custom normalization layers."""
from typing import Optional, Tuple, Union

import torch
import torch.nn as nn

#import sycl_pytorch as ops
from torch.utils.cpp_extension import load

# Load the compiled library
ops = load(name='sycl_pytorch', sources="/home/majumder/seminar/sycl_with_pytorch/build/lib.linux-x86_64-cpython-39/sycl_pytorch.cpython-39-x86_64-linux-gnu.so" ,verbose=True)


DTYPES = [torch.half, torch.bfloat16, torch.float]
NUM_TOKENS = [7, 83, 4096]  # Arbitrary values for testing
HIDDEN_SIZES = [768, 5120, 8192]  # Arbitrary values for testing
ADD_RESIDUAL = [False, True]
SEEDS = [0]
DEVICES = ["xpu"]#, "cuda", "hip"

class RMSNorm(nn.Module):
    """Root mean square normalization.

    Computes x -> w * x / sqrt(E[x^2] + eps) where w is the learned weight.
    Refer to https://arxiv.org/abs/1910.07467
    """

    def __init__(
        self,
        hidden_size: int,
        eps: float = 1e-6,
    ) -> None:
        super().__init__()
        self.weight = nn.Parameter(torch.ones(hidden_size))
        self.variance_epsilon = eps

    def _forward(
        self,
        x: torch.Tensor,
        residual: Optional[torch.Tensor] = None,
    ) -> Union[torch.Tensor, Tuple[torch.Tensor, torch.Tensor]]:
        """PyTorch-native implementation equivalent to forward()."""
        orig_dtype = x.dtype
        x = x.to(torch.float32)
        if residual is not None:
            x = x + residual.to(torch.float32)
            residual = x.to(orig_dtype)

        variance = x.pow(2).mean(dim=-1, keepdim=True)
        x = x * torch.rsqrt(variance + self.variance_epsilon)
        x = x.to(orig_dtype) * self.weight
        if residual is None:
            return x
        else:
            return x, residual

    def forward(
        self,
        x: torch.Tensor,
        residual: Optional[torch.Tensor] = None,
    ) -> Union[torch.Tensor, Tuple[torch.Tensor, torch.Tensor]]:
        out = torch.empty_like(x)
        ops.rms_norm(
            out,
            x,
            self.weight.data,
            self.variance_epsilon,
        )
        return out
        
        
def rms_norm_pytorch_kernel(
    num_tokens: int,
    hidden_size: int,
    add_residual: bool,
    dtype: torch.dtype,
    seed: int,
    device: str,
) -> None:
    torch.random.manual_seed(seed)
    if torch.cuda.is_available():
        torch.cuda.manual_seed(seed)
    torch.set_default_device(device)
    layer = RMSNorm(hidden_size).to(dtype=dtype)
    layer.weight.data.normal_(mean=1.0, std=0.1)
    scale = 1 / (2 * hidden_size)
    x = torch.randn(num_tokens, hidden_size, dtype=dtype)
    x *= scale
    residual = torch.randn_like(x) * scale if add_residual else None
    print("Forward pass through layer normalization layer")
    ref_out = layer._forward(x, residual)
    out = layer(x, residual)
    print(f"Get the output of layernorm layer : {out}")
    
if __name__== '__main__':
    rms_norm_pytorch_kernel(NUM_TOKENS[0], HIDDEN_SIZES[0], ADD_RESIDUAL[0], DTYPES[0], SEEDS[0], DEVICES[0])
    