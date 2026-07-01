import { useBackend } from 'tgui/backend';
import { Button, Stack } from 'tgui-core/components';

import {
  CheckboxInput,
  type Feature,
  type FeatureChoiced,
  type FeatureChoicedServerData,
  FeatureNumberInput,
  type FeatureNumeric,
  FeatureSliderInput,
  type FeatureToggle,
  type FeatureValueProps,
} from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

const FeatureBlooperDropdownInput = (
  props: FeatureValueProps<string, string, FeatureChoicedServerData>,
) => {
  const { act } = useBackend();

  return (
    <Stack g={0.5}>
      <Stack.Item grow>
        <FeatureDropdownInput {...props} />
      </Stack.Item>
      <Stack.Item>
        <Button
          onClick={() => {
            act('play_blooper');
          }}
          icon="play"
          width="100%"
          height="100%"
        />
      </Stack.Item>
    </Stack>
  );
};

export const voice_type: FeatureChoiced = {
  name: '角色声音',
  description:
    '当你的角色说话时会播放什么声音？',
  component: FeatureDropdownInput,
};

export const fallback_to_blooper: FeatureToggle = {
  name: '吠声系统替补',
  description: '如果TTS功能不可用，使用吠声系统替补。',
  component: CheckboxInput,
};

export const blooper_pitch_range: FeatureNumeric = {
  name: '吠声语调变化',
  description:
    '[0.1 - 0.8] 数值越低，变化范围越小。数值越高，变化范围越大。',
  component: FeatureNumberInput,
};

export const blooper_speech: FeatureChoiced = {
  name: '吠声系统',
  component: FeatureBlooperDropdownInput,
};

export const blooper_speech_speed: FeatureNumeric = {
  name: '吠声语速',
  description:
    '[2 - 16] 数值越小，语速越快。数值越大，语速越慢。',
  component: FeatureNumberInput,
};

export const blooper_speech_pitch: FeatureNumeric = {
  name: '吠声声调',
  description:
    '[0.4 - 2] 数值越低，声调越低。数值越高，声调越高。',
  component: FeatureNumberInput,
};

export const hear_sound_blooper: FeatureToggle = {
  name: '吠声系统',
  category: 'SOUND',
  description:
    '字转声替代功能：启用后，可以听到玩家说话时的语音提示(包括你自己的)。',
  component: CheckboxInput,
};

export const sound_blooper_volume: Feature<number> = {
  name: '吠声音量',
  category: 'SOUND',
  description: '吠声播放时的音量大小。',
  component: FeatureSliderInput,
};
