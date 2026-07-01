import { CheckboxInput, type FeatureToggle } from '../base';

export const persistent_scars: FeatureToggle = {
  name: '保留伤疤',
  description:
    "勾选后，当你存活至回合结束时，伤疤将保留到后续的回合。",
  component: CheckboxInput,
};
