// THIS IS A NOVA SECTOR UI FILE
import {
  CheckboxInput,
  type Feature,
  type FeatureChoiced,
  type FeatureChoicedServerData,
  FeatureNumberInput,
  type FeatureNumeric,
  type FeatureToggle,
  FeatureTriBoolInput,
  FeatureTriColorInput,
  type FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const feature_penis: Feature<string> = {
  name: '阴茎选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const penis_skin_tone: FeatureToggle = {
  name: '阴茎使用肤色 (Skin Tone)',
  component: CheckboxInput,
};

export const penis_skin_color: FeatureToggle = {
  name: '阴茎使用皮肤颜色 (Skin Color)',
  component: CheckboxInput,
};

export const penis_color: Feature<string[]> = {
  name: '阴茎颜色',
  component: FeatureTriColorInput,
};

export const penis_emissive: Feature<boolean[]> = {
  name: '阴茎发光 (Emissives)',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const penis_sheath: Feature<string> = {
  name: '阴茎包皮/鞘',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const penis_length: FeatureNumeric = {
  name: '阴茎长度',
  description:
    "数值单位为英寸。\
      对于体型 <= 1 或没有“超大(oversized)”特质的角色，此数值限制为 25。\
      最大允许值随角色的体型缩放，最高可达 86。",
  component: FeatureNumberInput,
};

export const penis_girth: FeatureNumeric = {
  name: '阴茎粗细',
  description:
    "数值为周长，单位为英寸。\
    对于体型 <= 1 或没有“超大(oversized)”特质的角色，此数值限制为 15。\
    最大允许值随角色的体型缩放，最高可达 35。",
  component: FeatureNumberInput,
};

export const penis_taur_mode_toggle: FeatureToggle = {
  name: '阴茎半人马模式',
  description:
    "如果所选的半人马(taur)身体拥有阴茎贴图，\
    则将使用该贴图而非通用贴图。",
  component: CheckboxInput,
};

export const feature_testicles: Feature<string> = {
  name: '睾丸选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const testicles_skin_tone: FeatureToggle = {
  name: '睾丸使用肤色 (Skin Tone)',
  component: CheckboxInput,
};

export const testicles_skin_color: FeatureToggle = {
  name: '睾丸使用皮肤颜色 (Skin Color)',
  component: CheckboxInput,
};

export const testicles_color: Feature<string[]> = {
  name: '睾丸颜色',
  component: FeatureTriColorInput,
};

export const testicles_emissive: Feature<boolean[]> = {
  name: '睾丸发光 (Emissives)',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const balls_size: FeatureNumeric = {
  name: '睾丸尺寸',
  component: FeatureNumberInput,
};

export const feature_vagina: Feature<string> = {
  name: '阴道选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const vagina_skin_tone: FeatureToggle = {
  name: '阴道使用肤色 (Skin Tone)',
  component: CheckboxInput,
};

export const vagina_skin_color: FeatureToggle = {
  name: '阴道使用皮肤颜色 (Skin Color)',
  component: CheckboxInput,
};

export const vagina_color: Feature<string[]> = {
  name: '阴道颜色',
  component: FeatureTriColorInput,
};

export const vagina_emissive: Feature<boolean[]> = {
  name: '阴道发光 (Emissives)',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const feature_womb: Feature<string> = {
  name: '子宫选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_breasts: Feature<string> = {
  name: '乳房选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const breasts_skin_tone: FeatureToggle = {
  name: '乳房使用肤色 (Skin Tone)',
  component: CheckboxInput,
};

export const breasts_skin_color: FeatureToggle = {
  name: '乳房使用皮肤颜色 (Skin Color)',
  component: CheckboxInput,
};

export const breasts_color: Feature<string[]> = {
  name: '乳房颜色',
  component: FeatureTriColorInput,
};

export const breasts_emissive: Feature<boolean[]> = {
  name: '乳房发光 (Emissives)',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const breasts_lactation_toggle: FeatureToggle = {
  name: '乳房泌乳',
  component: CheckboxInput,
};

export const breasts_size: Feature<string> = {
  name: '乳房尺寸',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_anus: Feature<string> = {
  name: '肛门选择',
  component: FeatureDropdownInput,
};

export const body_size: FeatureNumeric = {
  name: '体型大小',
  component: FeatureNumberInput,
};

export const erp_status_pref: FeatureChoiced = {
  name: 'ERP 状态',
  description:
    "所有 ERP 状态偏好仅作为向其他玩家展示你对各类 ERP 类别偏好的标记。\
  选择“否”实际上会将你从所有搜寻 ERP 中隔离。",
  component: FeatureDropdownInput,
};

export const erp_status_pref_nc: FeatureChoiced = {
  name: 'ERP 非自愿(Non-Con)状态',
  component: FeatureDropdownInput,
};

export const erp_status_pref_v: FeatureChoiced = {
  name: 'ERP 吞噬(Vore)状态',
  component: FeatureDropdownInput,
};

export const erp_status_pref_hypnosis: FeatureChoiced = {
  name: 'ERP 催眠状态',
  component: FeatureDropdownInput,
};

export const erp_status_pref_mechanics: FeatureChoiced = {
  name: 'ERP 机制状态',
  component: FeatureDropdownInput,
};
