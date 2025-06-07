# FramePack-eichi LoRA Utilities
# 
# LoRAの適用、FP8最適化、LoRAフォーマット検出と変換のための機能を提供します。
#
# 20250606 FP8最適化部分を追加した
# しかし現状ではエラーで動かない　テンソルデータが必須だから

from .fp8_optimization_utils import (
    calculate_fp8_maxval,
    quantize_tensor_to_fp8,
    optimize_state_dict_with_fp8_on_the_fly,
    fp8_linear_forward_patch,
    apply_fp8_monkey_patch,
    check_fp8_support
)