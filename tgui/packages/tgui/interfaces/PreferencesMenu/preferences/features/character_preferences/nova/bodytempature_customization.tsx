import { type Feature, FeatureNumberInput } from '../../base';

export const bodytemp: Feature<number> = {
  name: '体温修正',
  description: `您的体温设置可与标准值不同\
    最高温度70度相当于一个斯克鲁人(Skrell)\
    最低温度-20度则相当于一个等离子人(plasmaman)\
    注意，在极端设置中无法保证您的安全，请时刻警惕自身处境。`,
  component: FeatureNumberInput,
};
