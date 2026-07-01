import {
  FeatureIconnedDropdownInput,
  type FeatureWithIcons,
} from '../dropdowns';

export const preferred_ai_emote_display: FeatureWithIcons<string> = {
  name: 'AI屏幕显示',
  description:
    '若您是AI，则该图像将作为默认图像显示在空间站所有AI显示屏上。',
  component: FeatureIconnedDropdownInput,
};
