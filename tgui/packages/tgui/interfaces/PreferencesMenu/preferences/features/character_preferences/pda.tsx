import {
  type Feature,
  type FeatureChoiced,
  FeatureShortTextInput,
} from '../base';
import { FeatureDropdownInput } from '../dropdowns';

export const pda_theme: FeatureChoiced = {
  name: 'PDA主题',
  category: 'GAMEPLAY',
  component: FeatureDropdownInput,
};

export const pda_ringtone: Feature<string> = {
  name: 'PDA铃声',
  component: FeatureShortTextInput,
};
