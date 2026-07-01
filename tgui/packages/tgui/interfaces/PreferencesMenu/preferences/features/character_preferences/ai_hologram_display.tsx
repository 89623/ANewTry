import {
  FeatureIconnedDropdownInput,
  type FeatureWithIcons,
} from '../dropdowns';

export const preferred_ai_hologram_display: FeatureWithIcons<string> = {
  name: 'AI成像图像',
  description: '当你使用全息板时呈现的全息形态。',
  component: FeatureIconnedDropdownInput,
};
