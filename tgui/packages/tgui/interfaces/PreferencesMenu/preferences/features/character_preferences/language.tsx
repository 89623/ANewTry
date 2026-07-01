import {
  CheckboxInput,
  type FeatureChoiced,
  type FeatureToggle,
} from '../base';
import {
  FeatureDropdownInput,
  FeatureIconnedDropdownInput,
} from '../dropdowns';

export const language: FeatureChoiced = {
  name: '语言',
  component: FeatureIconnedDropdownInput,
};

export const language_speakable: FeatureToggle = {
  name: '会说该语言',
  description: "如果不勾选，你只能理解这个语言。",
  component: CheckboxInput,
};

export const language_skill: FeatureChoiced = {
  name: '语言理解程度',
  description: "你对这个语言的理解程度。",
  component: FeatureDropdownInput,
};

export const csl_strength: FeatureChoiced = {
  name: '通用语理解程度',
  description: "你对通用语的理解程度。",
  component: FeatureDropdownInput,
};
