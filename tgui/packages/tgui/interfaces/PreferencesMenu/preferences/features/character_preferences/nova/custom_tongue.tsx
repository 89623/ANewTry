// THIS IS A NOVA SECTOR UI FILE
import { type Feature, FeatureShortTextInput } from '../../base';

export const custom_tongue_ask: Feature<string> = {
  name: '询问?',
  description: "自动询问修饰符。仅限A-Z字母，不包含空格。",
  component: FeatureShortTextInput,
};

export const custom_tongue_exclaim: Feature<string> = {
  name: '惊叹!',
  description: "自动惊叹修饰符。仅限A-Z字母，不包含空格。",
  component: FeatureShortTextInput,
};

export const custom_tongue_whisper: Feature<string> = {
  name: '低语',
  description: "自动低语修饰符。仅限A-Z字母，不包含空格。",
  component: FeatureShortTextInput,
};

export const custom_tongue_yell: Feature<string> = {
  name: '喊叫!!',
  description: "自动喊叫修饰符。仅限A-Z字母，不包含空格。",
  component: FeatureShortTextInput,
};

export const custom_tongue_say: Feature<string> = {
  name: '说话',
  description: "自动说话修饰符。仅限A-Z字母，不包含空格。",
  component: FeatureShortTextInput,
};
