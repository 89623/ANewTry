// THIS IS A NOVA SECTOR UI FILE
import {
  CheckboxInput,
  type Feature,
  type FeatureChoiced,
  FeatureShortTextInput,
  FeatureTextInput,
  type FeatureToggle,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const entombed_skin: FeatureChoiced = {
  name: '模块服皮肤',
  component: FeatureDropdownInput,
};

export const entombed_hardlight_theme: FeatureChoiced = {
  name: '光盾颜色',
  component: FeatureDropdownInput,
};

export const entombed_mod_name: Feature<string> = {
  name: '模块服控制单元名字',
  component: FeatureShortTextInput,
};

export const entombed_mod_desc: Feature<string> = {
  name: '模块服控制单元介绍',
  component: FeatureTextInput,
};

export const entombed_mod_prefix: Feature<string> = {
  name: '模块服前缀',
  description:
    "这个前缀会出现在盖棺模块服的装备上如胸甲、头盔等。默认状态为“融合”，尽量使用形容词描述。",
  component: FeatureShortTextInput,
};

export const entombed_deploy_lock: FeatureToggle = {
  name: '模块服维持展开(软DNR)',
  description:
    "你的模块服会一直维持展开，任何人都无法收回除头盔以外的部件。警告：选择这个将会让你极难复活，可以被认定不复活。",
  component: CheckboxInput,
};
