// THIS IS A NOVA SECTOR UI FILE
import { type Feature, FeatureNumberInput } from '../../base';

export const chrono_age: Feature<number> = {
  name: '年龄(历法)',
  description:
    "历法年龄代表角色自出生以来在宇宙中实际存在的时间长度。\
    包括在低温睡眠状态下 及/或 处于 重力/速度 诱导的时间膨胀区域所花费的时间。",
  component: FeatureNumberInput,
};
