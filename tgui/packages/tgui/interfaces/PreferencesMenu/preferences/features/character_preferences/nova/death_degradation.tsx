// THIS IS A NOVA SECTOR UI FILE
import { CheckboxInput, type Feature, FeatureNumberInput } from '../../base';

export const dc_starting_degradation: Feature<number> = {
  name: 'A_初始衰退值',
  component: FeatureNumberInput,
  description: "你的初始衰退状态。",
};

export const dc_max_degradation: Feature<number> = {
  name: 'A_最大衰退值',
  component: FeatureNumberInput,
  description: "你的最大衰退程度。",
};

export const dc_living_degradation_recovery_per_second: Feature<number> = {
  name: 'B_存活期间每秒恢复值',
  component: FeatureNumberInput,
  description:
    "存活期间，每秒将减少此数值的衰退。",
};

export const dc_living_degradation_per_second: Feature<number> = {
  name: 'B_存活期间每秒衰退值',
  component: FeatureNumberInput,
  description:
    "存活期间，每秒将增加此数值的衰退。",
};

export const dc_dead_degradation_per_second: Feature<number> = {
  name: 'B_死亡状态下的每秒衰退值',
  component: FeatureNumberInput,
};

export const dc_degradation_on_death: Feature<number> = {
  name: 'B_死亡后立即衰退值',
  component: FeatureNumberInput,
  description: "死亡后约有5分钟的冷却时间。",
};

export const dc_stasis_dead_degradation_mult: Feature<number> = {
  name: 'B_静滞衰退值修正',
  component: FeatureNumberInput,
  description:
    "在静滞状态下，你所承受的任何被动衰退值修正。",
};

export const dc_formeldahyde_dead_degradation_mult: Feature<number> = {
  name: 'C_甲醛衰退值修正',
  component: FeatureNumberInput,
  description:
    "如果你是有机体且体内含有甲醛，你所承受的任何被动衰退值修正。",
};

export const dc_rezadone_living_degradation_reduction: Feature<number> = {
  name: 'C_纯Rezadone衰退减少',
  component: FeatureNumberInput,
  description:
    "如果你是有机体且体内含有纯rezadone，每秒所恢复的衰退值。",
};

export const dc_eigenstasium_degradation_reduction: Feature<number> = {
  name: 'C_Eigenstasium衰退减少',
  component: FeatureNumberInput,
  description:
    "如果你体内含有Eigenstasium，每秒所恢复的衰退值。此机制同样适用于合成人，且在死亡状态下仍有效。",
};

export const dc_crit_threshold_reduction_min_percent_of_max: Feature<number> = {
  name: '濒死阈值：开始衰退百分比',
  component: FeatureNumberInput,
  description:
    "在衰退值达到此百分比时候，濒死阈值降低开始。",
};

export const dc_crit_threshold_reduction_percent_of_max: Feature<number> = {
  name: '濒死阈值：终止衰退百分比',
  component: FeatureNumberInput,
  description:
    "在衰退值达到此百分比时候，濒死阈值降低达到最大。",
};

export const dc_max_crit_threshold_reduction: Feature<number> = {
  name: '濒死阈值：最大降低值',
  component: FeatureNumberInput,
  description:
    "当达到终止衰退百分比时，濒死阈值将按此比例降低\
  较低百分比导致等比例的削减，例如50%的衰退会导致其中50%被应用。",
};

export const dc_stamina_damage_min_percent_of_max: Feature<number> = {
  name: '耐力损伤：开始衰退百分比',
  component: FeatureNumberInput,
  description:
    "在衰退值达到此百分比时候，耐力损伤增加开始。",
};

export const dc_stamina_damage_percent_of_max: Feature<number> = {
  name: '耐力损伤：终止衰退百分比',
  component: FeatureNumberInput,
  description:
    "在衰退值达到此百分比时候，耐力损伤达到最大值。",
};

export const dc_max_stamina_damage: Feature<number> = {
  name: '耐力损伤：最大值',
  component: FeatureNumberInput,
  description:
    "当达到终止衰退百分比时，你的耐力损伤将始终不低于此值。\
  较低百分比导致等比例的削减，例如50%的衰退和80的最大值会导致40的耐力损伤",
};

export const dc_permakill_at_max: Feature<boolean> = {
  name: '永久死亡：永久幽灵的同时身体永久死亡',
  component: CheckboxInput,
  description:
    "若勾选，你会在衰退值达到最大时永久幽灵的同时身体永久死亡。",
};

export const dc_force_death_if_permakilled: Feature<boolean> = {
  name: 'PK: Force death if permaghosted',
  component: CheckboxInput,
  description: 'If true, you will be permanently killed on permaghost as well.',
};
