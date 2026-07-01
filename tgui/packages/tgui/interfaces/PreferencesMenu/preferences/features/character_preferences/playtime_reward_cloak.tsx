import { CheckboxInput, type FeatureToggle } from '../base';

export const playtime_reward_cloak: FeatureToggle = {
  name: '穿上玩家披风',
  description:
    "游戏时长突破5000小时的专属奖励。\
    披上这件唯有超级老玩家方能佩戴的华丽斗篷。",
  component: CheckboxInput,
};
