// THIS IS A NOVA SECTOR UI FILE
import type { FeatureChoiced } from '../../base';
import { FeatureDropdownInput } from '../../dropdowns';

export const antag_opt_in_status_pref: FeatureChoiced = {
  name: '成为反派目标',
  description:
    "这会被用作为反派目标生成和作为OOC同意的标准。\
    如果选择“Round Remove”就代表你允许在适当的情况下被移出回合(永久死亡)，包括非反派角色。 \
    激活任何的非幽灵复活的反派(复仇者、绑架者、契约特工) \
    会强制锁定你在最低“Temporarily Inconvenience”状态",
  component: FeatureDropdownInput,
};
