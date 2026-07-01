import { type Feature, FeatureNumberInput } from '../base';

export const age: Feature<number> = {
  // name: 'Age', // ORIGINAL
  name: '年龄(生理)', // NOVA EDIT CHANGE - Chronological age
  // NOVA EDIT ADDITION BEGIN - Chronological age
  description:
    "生理年龄代表角色在身体和精神层面成长的程度。\
    包含“正常”衰老过程，例如导致身体机能衰退的经历，以及“抗衰老”医疗手段。\
    不包含冷冻睡眠期间的时间。",
  // NOVA EDIT ADDITION END
  component: FeatureNumberInput,
};
