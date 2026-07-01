import { CheckboxInput, type FeatureToggle } from '../base';

export const rds_limit: FeatureToggle = {
  name: '无限制幻觉',
  description:
    "勾选此框会解除对幻觉的限制，\
这将导致幻觉更频繁，更具侵入性并(通常)更离奇。",
  component: CheckboxInput,
};
