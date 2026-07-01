// THIS IS A NOVA SECTOR UI FILE
import {
  CheckboxInput,
  type Feature,
  type FeatureChoiced,
  type FeatureChoicedServerData,
  FeatureColorInput,
  FeatureNumberInput,
  type FeatureNumeric,
  FeatureShortTextInput,
  FeatureSliderInput,
  FeatureTextInput,
  type FeatureToggle,
  FeatureTriBoolInput,
  FeatureTriColorInput,
  type FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const feature_leg_type: FeatureChoiced = {
  name: '腿部类型',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const feature_mcolor2: Feature<string> = {
  name: '变异颜色 2',
  component: FeatureColorInput,
};
export const feature_mcolor3: Feature<string> = {
  name: '变异颜色 3',
  component: FeatureColorInput,
};

export const flavor_text: Feature<string> = {
  name: '角色描述 (Flavor Text)',
  description:
    "当你的角色被观察时显示（但前提是他们身份可辨识——试试防毒面具）。请勿在此处填写色情内容——请将此类内容移至“角色描述 (NSFW)”。",
  component: FeatureTextInput,
};

export const flavor_text_nsfw: Feature<string> = {
  name: '角色描述 (NSFW)',
  description: "内容与“角色描述”相同，但需要点击特定标签页才能查看。",
  component: FeatureTextInput,
};

export const silicon_flavor_text: Feature<string> = {
  name: '角色描述 (硅基生命)',
  description:
    "仅在你扮演子体/AI时显示。请勿在此处填写色情内容——请将此类内容移至“角色描述 (硅基生命, NSFW)”。",
  component: FeatureTextInput,
};

export const silicon_flavor_text_nsfw: Feature<string> = {
  name: '角色描述 (硅基生命, NSFW)',
  description:
    "内容与“硅基生命角色描述”相同，但需要点击特定标签页才能查看。",
  component: FeatureTextInput,
};

export const ooc_notes: Feature<string> = {
  name: 'OOC 备注',
  description:
    "任何你想让其他玩家了解的信息都放在这里，例如反派角色(Antag)信息、OOC 触发雷点等。请勿在此处填写色情内容——请将此类内容移至“OOC 备注 (NSFW)”。",
  component: FeatureTextInput,
};

export const ooc_notes_nsfw: Feature<string> = {
  name: 'OOC 备注 (NSFW)',
  description: "内容与“OOC 备注”相同，但需要点击特定标签页才能查看。",
  component: FeatureTextInput,
};

export const character_ad: Feature<string> = {
  name: '角色广告/简介',
  description:
    "关于你角色的广告。为有兴趣的人提供如何接触你的信息，适用于普通角色扮演或色情角色扮演(ERP)。",
  component: FeatureTextInput,
};

export const attraction: FeatureChoiced = {
  name: '角色性取向',
  description:
    "你的角色被什么所吸引。这将显示在名录(Directory)中。",
  component: FeatureDropdownInput,
};

export const display_gender: FeatureChoiced = {
  name: '角色性别',
  description:
    "你的角色被归类为什么性别。这将显示在名录(Directory)中。",
  component: FeatureDropdownInput,
};

export const custom_species: Feature<string> = {
  name: '自定义种族名称',
  description:
    "显示在观察界面。如果留空，将使用默认种族名称（例如：人类、蜥蜴人）。",
  component: FeatureShortTextInput,
};

export const custom_species_lore: Feature<string> = {
  name: '自定义种族背景设定',
  description: "如果没有自定义种族，则不会显示。",
  component: FeatureTextInput,
};
export const general_record: Feature<string> = {
  name: '档案 - 普通',
  description:
    "拥有任何档案访问权限均可查看。\
    用于展示一般信息，如雇佣情况、资质证明等。",
  component: FeatureTextInput,
};

export const security_record: Feature<string> = {
  name: '档案 - 安保',
  description:
    "拥有安保权限可查看。\
  用于展示犯罪记录、逮捕历史等信息。",
  component: FeatureTextInput,
};

export const medical_record: Feature<string> = {
  name: '档案 - 医疗',
  description:
    "拥有医疗权限可查看。\
  用于展示医疗史、处方、拒绝心肺复苏(DNR)令等。",
  component: FeatureTextInput,
};

export const exploitable_info: Feature<string> = {
  name: '档案 - 可利用信息',
  description:
    "可以是 IC (角色内) 或 OOC (角色外)。可由某些反派角色/敌对玩家以及幽灵查看。通常包含\
  弱点、长处、重要背景、触发词等。它还可能包含\
  反派偏好，例如你是否希望被针对，被谁针对，以何种方式针对等。",
  component: FeatureTextInput,
};

export const background_info: Feature<string> = {
  name: '档案 - 背景',
  description:
    "仅由你自己和幽灵可见。你可以在这里填写任何内容——这可能有助于你定位自己的角色定位。",
  component: FeatureTextInput,
};

export const pda_ringer: Feature<string> = {
  name: 'PDA 铃声消息',
  description:
    "想让你的 PDA 在响铃时显示除了“哔哔”以外的内容吗？支持前 20 个字符。",
  component: FeatureShortTextInput,
};

export const allow_mismatched_parts_toggle: FeatureToggle = {
  name: '允许不匹配的身体部位',
  description: "允许选择来自任何种族的身体部位。",
  component: CheckboxInput,
};

export const allow_mismatched_hair_color_toggle: FeatureToggle = {
  name: '允许不匹配的发色',
  description:
    "允许通常具有固定发色的种族拥有不同的发色。这包括局内来源，如染发、形态变换等。目前仅适用于史莱姆。",
  component: CheckboxInput,
};

export const allow_genitals_toggle: FeatureToggle = {
  name: '允许生殖器官',
  description: "如果你希望在角色身上显示生殖器官，请开启此项。",
  component: CheckboxInput,
};

export const allow_emissives_toggle: FeatureToggle = {
  name: '允许发光效果',
  description: "发光部件会在黑暗中发光。",
  component: CheckboxInput,
};

export const eye_emissives: FeatureToggle = {
  name: '眼睛发光',
  description: "发光部件会在黑暗中发光。",
  component: CheckboxInput,
};

export const skin_tone_toggle: FeatureToggle = {
  name: 'Skin Tone',
  description:
    'If we should use skin tones (an array of options \
    close to human natural skin colors) or mutant \
    colors (free color selection).',
  component: CheckboxInput,
};

export const mutant_colors_color: Feature<string[]> = {
  name: '变异颜色',
  component: FeatureTriColorInput,
};

export const body_markings_toggle: FeatureToggle = {
  name: '身体斑纹',
  component: CheckboxInput,
};

export const feature_body_markings: Feature<string> = {
  name: '身体斑纹选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const body_markings_color: Feature<string[]> = {
  name: '身体斑纹颜色',
  component: FeatureTriColorInput,
};

export const body_markings_emissive: Feature<boolean[]> = {
  name: '身体斑纹发光',
  component: FeatureTriBoolInput,
};

export const tail_toggle: FeatureToggle = {
  name: '尾巴',
  component: CheckboxInput,
};

export const feature_tail: Feature<string> = {
  name: '尾巴选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const tail_color: Feature<string[]> = {
  name: '尾巴颜色',
  component: FeatureTriColorInput,
};

export const tail_emissive: Feature<boolean[]> = {
  name: '尾巴发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const snout_toggle: FeatureToggle = {
  name: '鼻吻部',
  component: CheckboxInput,
};

export const feature_snout: Feature<string> = {
  name: '鼻吻部选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const snout_color: Feature<string[]> = {
  name: '鼻吻部颜色',
  component: FeatureTriColorInput,
};

export const snout_emissive: Feature<boolean[]> = {
  name: '鼻吻部发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const horns_toggle: FeatureToggle = {
  name: '角',
  component: CheckboxInput,
};

export const feature_horns: Feature<string> = {
  name: '角选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const horns_color: Feature<string[]> = {
  name: '角颜色',
  component: FeatureTriColorInput,
};

export const horns_emissive: Feature<boolean[]> = {
  name: '角发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const ears_toggle: FeatureToggle = {
  name: '耳朵',
  component: CheckboxInput,
};

export const feature_ears: Feature<string> = {
  name: '耳朵选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ears_color: Feature<string[]> = {
  name: '耳朵颜色',
  component: FeatureTriColorInput,
};

export const ears_emissive: Feature<boolean[]> = {
  name: '耳朵发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const wings_toggle: FeatureToggle = {
  name: '翅膀',
  component: CheckboxInput,
};

export const feature_wings: Feature<string> = {
  name: '翅膀选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const wings_color: Feature<string[]> = {
  name: '翅膀颜色',
  component: FeatureTriColorInput,
};

export const wings_emissive: Feature<boolean[]> = {
  name: '翅膀发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const frills_toggle: FeatureToggle = {
  name: '褶边',
  component: CheckboxInput,
};

export const feature_frills: Feature<string> = {
  name: '褶边选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const frills_color: Feature<string[]> = {
  name: '褶边颜色',
  component: FeatureTriColorInput,
};

export const frills_emissive: Feature<boolean[]> = {
  name: '褶边发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const spines_toggle: FeatureToggle = {
  name: '棘刺/背刺',
  component: CheckboxInput,
};

export const feature_spines: Feature<string> = {
  name: '棘刺选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const spines_color: Feature<string[]> = {
  name: '棘刺颜色',
  component: FeatureTriColorInput,
};

export const spines_emissive: Feature<boolean[]> = {
  name: '棘刺发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const digitigrade_legs: FeatureChoiced = {
  name: '腿部',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const caps_toggle: FeatureToggle = {
  name: '蕈帽',
  component: CheckboxInput,
};

export const feature_caps: Feature<string> = {
  name: '蕈帽选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const caps_color: Feature<string[]> = {
  name: '蕈帽颜色',
  component: FeatureTriColorInput,
};

export const caps_emissive: Feature<boolean[]> = {
  name: '蕈帽发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const moth_antennae_toggle: FeatureToggle = {
  name: '蛾类触角',
  component: CheckboxInput,
};

export const feature_moth_antennae: Feature<string> = {
  name: '蛾类触角选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const moth_antennae_color: Feature<string[]> = {
  name: '蛾类触角颜色',
  component: FeatureTriColorInput,
};

export const moth_antennae_emissive: Feature<boolean[]> = {
  name: '蛾类触角发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const moth_markings_toggle: FeatureToggle = {
  name: '蛾类斑纹',
  component: CheckboxInput,
};

export const feature_moth_markings: Feature<string> = {
  name: '蛾类斑纹选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const moth_markings_color: Feature<string[]> = {
  name: '蛾类斑纹颜色',
  component: FeatureTriColorInput,
};

export const moth_markings_emissive: Feature<boolean[]> = {
  name: '蛾类斑纹发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const fluff_toggle: FeatureToggle = {
  name: '绒毛',
  component: CheckboxInput,
};

export const feature_fluff: Feature<string> = {
  name: '绒毛选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const fluff_color: Feature<string[]> = {
  name: '绒毛颜色',
  component: FeatureTriColorInput,
};

export const fluff_emissive: Feature<boolean[]> = {
  name: '绒毛发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const head_acc_toggle: FeatureToggle = {
  name: '头部饰品',
  component: CheckboxInput,
};

export const feature_head_acc: Feature<string> = {
  name: '头部饰品选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const head_acc_color: Feature<string[]> = {
  name: '头部饰品颜色',
  component: FeatureTriColorInput,
};

export const head_acc_emissive: Feature<boolean[]> = {
  name: '头部饰品发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const feature_ipc_screen: Feature<string> = {
  name: 'IPC 屏幕选择',
  description: "可以在局内更改。",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_screen_color: Feature<string> = {
  name: 'IPC 屏幕灰度颜色',
  component: FeatureColorInput,
};

export const ipc_screen_emissive: Feature<boolean> = {
  name: 'IPC 屏幕发光',
  description: "发光部件会在黑暗中发光。",
  component: CheckboxInput,
};

export const ipc_antenna_toggle: FeatureToggle = {
  name: '合成人天线',
  component: CheckboxInput,
};

export const feature_ipc_antenna: Feature<string> = {
  name: '合成人天线选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_antenna_color: Feature<string[]> = {
  name: '合成人天线颜色',
  component: FeatureTriColorInput,
};

export const ipc_antenna_emissive: Feature<boolean[]> = {
  name: '合成人天线发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const feature_ipc_chassis: Feature<string> = {
  name: '合成人底盘选择',
  description: "仅对合成人有效。",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_chassis_color: Feature<string> = {
  name: '合成人底盘颜色',
  description:
    "仅对合成人及支持灰度着色的底盘有效。",
  component: FeatureColorInput,
};

export const feature_ipc_head: Feature<string> = {
  name: '合成人头部选择',
  description: "仅对合成人有效。",
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const ipc_head_color: Feature<string> = {
  name: '合成人头部颜色',
  component: FeatureColorInput,
};

export const feature_hair_opacity_toggle: Feature<boolean> = {
  name: '头发透明度覆盖',
  component: CheckboxInput,
};

export const feature_hair_opacity: Feature<number> = {
  name: '头发透明度',
  component: FeatureNumberInput,
};

export const hair_emissive: Feature<boolean> = {
  name: '头发发光',
  description: "发光部件会在黑暗中发光。",
  component: CheckboxInput,
};

export const neck_acc_toggle: FeatureToggle = {
  name: '颈部饰品',
  component: CheckboxInput,
};

export const feature_neck_acc: Feature<string> = {
  name: '颈部饰品选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const neck_acc_color: Feature<string[]> = {
  name: '颈部饰品颜色',
  component: FeatureTriColorInput,
};

export const neck_acc_emissive: Feature<boolean[]> = {
  name: '颈部饰品发光',
  component: FeatureTriBoolInput,
};

export const skrell_hair_toggle: FeatureToggle = {
  name: 'Skrell 触手发辫',
  component: CheckboxInput,
};

export const feature_skrell_hair: Feature<string> = {
  name: 'Skrell 触手发辫选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const skrell_hair_color: Feature<string[]> = {
  name: 'Skrell 触手发辫颜色',
  component: FeatureTriColorInput,
};

export const skrell_hair_emissive: Feature<boolean[]> = {
  name: 'Skrell 触手发辫发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const taur_toggle: FeatureToggle = {
  name: '半人马形态',
  component: CheckboxInput,
};

export const feature_taur: Feature<string> = {
  name: '半人马形态选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const taur_color: Feature<string[]> = {
  name: '半人马形态颜色',
  component: FeatureTriColorInput,
};

export const taur_emissive: Feature<boolean[]> = {
  name: '半人马形态发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const naga_sole: FeatureToggle = {
  name: '半人马 (娜迦) 禁用硬化足底',
  description:
    "如果使用蛇形或鱼形半人马身体，决定你是否对碎玻璃及其他赤脚负面效果免疫。",
  component: CheckboxInput,
};

export const xenodorsal_toggle: FeatureToggle = {
  name: '异形背部部件',
  component: CheckboxInput,
};

export const feature_xenodorsal: Feature<string> = {
  name: '异形背部部件选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const xenodorsal_color: Feature<string[]> = {
  name: '异形背部部件颜色',
  component: FeatureTriColorInput,
};

export const xenodorsal_emissive: Feature<boolean[]> = {
  name: '异形背部部件发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const xenohead_toggle: FeatureToggle = {
  name: '异形头部部件',
  component: CheckboxInput,
};

export const feature_xenohead: Feature<string> = {
  name: '异形头部部件选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const xenohead_color: Feature<string[]> = {
  name: '异形头部部件颜色',
  component: FeatureTriColorInput,
};

export const xenohead_emissive: Feature<boolean[]> = {
  name: '异形头部部件发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const undershirt_color: Feature<string> = {
  name: '内衣颜色',
  component: FeatureColorInput,
};

export const socks_color: Feature<string> = {
  name: '袜子颜色',
  component: FeatureColorInput,
};

export const heterochromia_toggle: FeatureToggle = {
  name: '虹膜异色症 (异瞳)',
  component: CheckboxInput,
};

export const feature_heterochromia: Feature<string> = {
  name: '虹膜异色症选择',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const heterochromia_color: Feature<string[]> = {
  name: '虹膜异色症颜色',
  component: FeatureTriColorInput,
};

export const heterochromia_emissive: Feature<boolean[]> = {
  name: '虹膜异色症发光',
  description: "发光部件会在黑暗中发光。",
  component: FeatureTriBoolInput,
};

export const vox_bodycolor: Feature<string> = {
  name: 'Vox 肤色',
  component: (
    props: FeatureValueProps<string, string, FeatureChoicedServerData>,
  ) => {
    return <FeatureDropdownInput buttons {...props} />;
  },
};

export const pod_hair_color: Feature<string[]> = {
  name: '植物发色',
  component: FeatureTriColorInput,
};

export const pod_hair_emissive: Feature<boolean> = {
  name: '植物发色发光',
  description: "发光部件会在黑暗中发光。",
  component: CheckboxInput,
};

export const holo_color: Feature<string> = {
  name: 'Holosynth Color',
  component: FeatureColorInput,
};

export const holo_transparency: FeatureNumeric = {
  name: 'Holosynth Transparency',
  description:
    'How solid your hologram appears. 60 = most see-through, 100 = fully solid.',
  component: FeatureSliderInput,
};

export const holo_scanline: Feature<boolean> = {
  name: 'Holosynth Scanline Flicker',
  description:
    'Renders a faint scanline flicker across your body (not visible until you spawn).',
  component: CheckboxInput,
};
