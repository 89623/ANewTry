# 天关模块化开发说明

本说明用于天关源码的下游开发。天关基于 Nova Sector 继续维护，因此本仓库会同时保留上游 Nova 的 `modular_nova/` 结构，以及天关自己的 `modular_tianguan/` 结构。

`modular_nova/` 是 Nova Sector 的下游模块目录，除非是在同步、修复或整理 Nova 上游内容，否则不要把天关新增内容放进去。天关新增功能、资源、覆盖和本地维护代码应优先放在 `modular_tianguan/`。

## 基本原则

- 天关改动优先模块化，尽量不要直接改 `code/`、`icons/`、`sound/` 等核心目录。
- 能放进 `modular_tianguan/modules/` 的功能，不要散落到核心文件里。
- 必须修改核心文件时，要使用清晰的编辑标记，并在对应模块说明里记录原因和范围。
- 不要修改 `modular_nova/` 来承载天关专属功能；那会增加以后同步 Nova 上游时的冲突。
- 提交前必须做必要测试，不要把未验证的功能当作可合并内容提交。

## 目录结构

`modular_tianguan/` 下的常用目录如下：

| 目录 | 用途 |
| --- | --- |
| `modules/` | 天关功能模块。每个模块应有自己的目录，例如 `modules/example_module/`。 |
| `master_files/` | 对核心文件的模块化覆盖，目录结构应镜像核心路径。 |
| `code/` | 不属于单一模块的天关共享 DM 代码。 |
| `icons/` | 不属于单一模块的天关共享图标资源。 |
| `sound/` | 不属于单一模块的天关共享音频资源。 |
| `tools/` | 与天关模块化流程相关的辅助脚本。 |

普通功能优先放在 `modules/<module_id>/`。只有确实属于全局共享内容，或者无法归入某个明确模块时，才使用顶层 `code/`、`icons/`、`sound/`。

## 模块命名

新增模块时先确定一个稳定的模块 ID，例如：

- `shuttle_toggle`
- `new_job_items`
- `tianguan_clothing`

模块 ID 应该简短、可搜索，并在目录、注释和文档中保持一致。不要频繁改名，否则后续追踪历史和解决冲突会变得困难。

推荐模块结构：

```text
modular_tianguan/modules/example_module/
├── readme.md
├── code/
├── icons/
└── sound/
```

如果模块包含 DM 代码，放在 `code/`；DMI 图标放在 `icons/`；音频资源放在 `sound/`。不要在模块里复制完整核心目录结构。

示例：

```text
# 推荐
modular_tianguan/modules/example_module/code/example_item.dm
modular_tianguan/modules/example_module/icons/example_item.dmi

# 不推荐
modular_tianguan/modules/example_module/code/modules/items/example_item.dm
modular_tianguan/modules/example_module/icons/obj/items/example_item.dmi
```

## 模块说明文件

非极小模块都应包含 `readme.md`，用于说明这个模块为什么存在、改了什么、影响哪些核心文件。

模块说明建议包含：

- 模块简介
- 主要功能
- 新增或修改的文件
- 是否修改核心文件
- 测试方式
- 维护备注或来源说明

可以参考 [模块模板](./module_template.md)。

## 资源文件

图标、音频、二进制资源比普通代码更难合并冲突，因此天关新增资源应尽量放在对应模块目录中。

示例：

```dm
/obj/item/example
	icon = 'modular_tianguan/modules/example_module/icons/example_item.dmi'
	icon_state = "example"
```

不要为了一个天关专属物品去修改核心资源文件，除非确实无法模块化，或者该资源必须和核心资源打包在一起。

## `master_files/` 覆盖

当你需要对核心路径中的类型或 proc 做模块化覆盖时，把文件放入 `modular_tianguan/master_files/`，并镜像核心目录结构。

示例：

```text
code/modules/mob/living/living.dm
modular_tianguan/master_files/code/modules/mob/living/living.dm
```

这类文件用于集中记录“天关对核心文件行为的覆盖”，方便以后同步 Nova 或 /tg/station 时快速检查差异。

不要在不同模块里重复覆盖同一个 proc。若多个功能都需要影响同一核心逻辑，应集中整理到 `master_files/` 或一个明确的共享模块中。

## 直接修改核心文件

有些改动无法完全模块化，例如热路径性能问题、编译顺序限制、宏定义、初始化顺序或非常底层的行为修改。遇到这种情况可以改核心文件，但必须清楚标记。

天关核心编辑标记统一使用 `TIANGUAN EDIT`。

新增代码：

```dm
// TIANGUAN EDIT ADDITION START - EXAMPLE_MODULE
var/example_flag = FALSE
// TIANGUAN EDIT ADDITION END
```

删除代码：

```dm
/* // TIANGUAN EDIT REMOVAL START - EXAMPLE_MODULE
old_proc_call()
*/ // TIANGUAN EDIT REMOVAL END
```

单行修改：

```dm
if(example_flag || original_flag) // TIANGUAN EDIT CHANGE - EXAMPLE_MODULE - ORIGINAL: if(original_flag)
```

核心改动应尽量小，并在对应模块 `readme.md` 里记录：

- 改了哪个核心文件
- 为什么不能模块化
- 同步上游时需要注意什么

## Defines

BYOND 的加载顺序会影响宏定义。天关新增的全局 define 优先放在天关自己的 define 文件中，避免和 Nova 上游混在一起。

如果某个 define 会被多个文件使用，应放在天关模块化 define 区域；如果只在单个文件内使用，可以在该文件顶部定义，并在文件底部 `#undef`，避免污染全局自动补全和编译上下文。

## TGUI 修改

新增天关专属 TGUI 文件时，应在文件顶部标明来源：

```js
// THIS IS A TIANGUAN UI FILE
```

修改上游 TGUI 文件时，遵循和 DM 核心修改类似的规则，使用 `TIANGUAN EDIT` 标记。能写在同一行的改动尽量写在同一行；多行改动使用 start/end 标记。

示例：

```js
<Button
  icon="rat" // TIANGUAN EDIT ADDITION - EXAMPLE_MODULE
  onClick={() => act('example')}
/>
```

## 同步上游时的注意事项

天关需要同时面对 Nova Sector 和 /tg/station 的上游变化。为了降低冲突：

- 天关专属内容不要放进 `modular_nova/`。
- 修改核心文件时保持编辑标记完整。
- 不要复制整段上游 proc 只改一两行；能前后追加逻辑时优先用 override。
- 冲突解决后检查天关模块是否仍然被正确加载。
- 涉及批量同步时参考 [天关镜像与同步说明](./mirroring_guide.md)。

## 测试要求

提交前至少完成和改动范围相匹配的测试：

- DM 代码改动：确认能编译，必要时运行 `BUILD.bat`。
- TGUI 改动：运行相关 TGUI lint 或本地启动检查界面。
- 地图或资源改动：在本地服务器中确认资源路径和显示效果。
- 本地化改动：运行对应的 `tools/ss13_localization/tests/` 测试。

测试结果应写入 PR 或提交说明，方便维护者判断改动是否安全。

## 维护建议

模块化不是为了把代码藏起来，而是为了让下游长期维护更容易。写代码时优先考虑以后同步上游的人能不能快速看懂：这个改动属于哪个模块、为什么存在、是否还能删、冲突时应该保留哪一边。
