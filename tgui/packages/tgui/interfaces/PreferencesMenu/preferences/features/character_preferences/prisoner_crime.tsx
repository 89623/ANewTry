import type { FeatureChoiced } from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const prisoner_crime: FeatureChoiced = {
  name: '囚犯罪名',
  description:
    "你作为囚犯时，这将作为你的逮捕理由被记录在安保记录。",
  component: FeatureDropdownInput,
};
