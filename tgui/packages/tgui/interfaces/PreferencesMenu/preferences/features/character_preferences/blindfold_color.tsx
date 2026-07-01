import { type Feature, FeatureColorInput } from '../base';

export const blindfold_color: Feature<string> = {
  name: '眼罩颜色',
  component: FeatureColorInput,
};
