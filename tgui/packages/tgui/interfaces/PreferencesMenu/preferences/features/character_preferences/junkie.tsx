import type { FeatureChoiced } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const junkie: FeatureChoiced = {
  name: '成瘾类型',
  component: FeatureDropdownInput,
};

export const smoker: FeatureChoiced = {
  name: '最爱的烟',
  component: FeatureDropdownInput,
};

export const alcoholic: FeatureChoiced = {
  name: '最爱的酒',
  component: FeatureDropdownInput,
};
