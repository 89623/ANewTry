import { type Feature, FeatureColorInput } from '../base';

export const paint_color: Feature<string> = {
  name: '喷漆颜色',
  component: FeatureColorInput,
};
