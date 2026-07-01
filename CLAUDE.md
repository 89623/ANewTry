# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 语言与工作重点

- 这份仓库指南默认使用中文。
- 如果任务和汉化、旧词库合并、注入回源码、黑名单、防止回归有关，优先关注 `tools/ss13_localization/`，不要先从通用构建流程入手。
- 这个仓库虽然是完整的 SS13/BYOND 项目，但本地化相关任务的主战场通常是：
  - `tools/ss13_localization/`
  - `code/` 与 `modular_nova/` 中被注入的 DM 源码
  - `strings/` 下的 `.txt` / `.json`
  - `tools/ss13_localization/ss13_merged_library.json`

## 本地化工具常用命令

- 查看 CLI：
  - `PYTHONPATH=tools python -m ss13_localization --help`
  - `PYTHONPATH=tools python -m ss13_localization extract --help`
  - `PYTHONPATH=tools python -m ss13_localization inject --help`
- 抽取词条到新词库：
  - `PYTHONPATH=tools python -m ss13_localization extract code modular_nova strings -o tools/ss13_localization/tmp/extract.json --source-root .`
- 基于旧词库做增量抽取：
  - `PYTHONPATH=tools python -m ss13_localization extract code modular_nova strings -o tools/ss13_localization/tmp/extract.json --source-root . --base-library tools/ss13_localization/ss13_merged_library.json`
- 合并旧 CSV 语料到主词库：
  - `PYTHONPATH=tools python -m ss13_localization merge tools/ss13_localization/ss13_merged_library.json <legacy_csv_dir>`
- 翻译词库：
  - `PYTHONPATH=tools python -m ss13_localization translate tools/ss13_localization/ss13_merged_library.json --config <config.json>`
  - 重试失败/待复核词条：`PYTHONPATH=tools python -m ss13_localization translate tools/ss13_localization/ss13_merged_library.json --config <config.json> --retry-failed`
- 注入回源码：
  - 预演：`PYTHONPATH=tools python -m ss13_localization inject tools/ss13_localization/ss13_merged_library.json . --dry-run`
  - 实际注入：`PYTHONPATH=tools python -m ss13_localization inject tools/ss13_localization/ss13_merged_library.json .`
- 差异复用旧译文：
  - `PYTHONPATH=tools python -m ss13_localization diff <old_library.json> <new_library.json> -o <merged_library.json>`
- 修复可疑词条：
  - 按目标文件重建：`PYTHONPATH=tools python -m ss13_localization repair-library tools/ss13_localization/ss13_merged_library.json . <targets...>`
  - 批量修复可疑文件：`PYTHONPATH=tools python -m ss13_localization repair-suspicious tools/ss13_localization/ss13_merged_library.json .`
- 从注入备份回滚：
  - `PYTHONPATH=tools python -m ss13_localization rollback tools/ss13_localization/ss13_merged_library.json <backup_root> .`

## 本地化回归测试

- 运行单个测试文件：
  - `PYTHONPATH=tools python tools/ss13_localization/tests/test_placeholders.py`
  - `PYTHONPATH=tools python tools/ss13_localization/tests/test_matcher.py`
  - `PYTHONPATH=tools python tools/ss13_localization/tests/test_extractor_injector.py`
  - `PYTHONPATH=tools python tools/ss13_localization/tests/test_translator.py`
  - `PYTHONPATH=tools python tools/ss13_localization/tests/test_diff.py`
- 如果改了 DM 注入后的源码文本，必要时再补跑整仓构建：
  - `BUILD.bat`
- 如果改了 TGUI，本仓库已有：
  - `npm run tgui:lint`
  - `npm run tgui:fix`

## 本地化工具的大图景

- `tools/ss13_localization/ss13_localizer.py`
  - CLI 入口，子命令包括 `extract`、`merge`、`translate`、`inject`、`diff`、`repair-library`、`repair-suspicious`、`rollback`、`gui`。
- `tools/ss13_localization/config.py`
  - 默认配置与 provider preset。默认翻译目标是简体中文；注入默认带 `backup=true`、`rollback_on_failure=true`。
- `tools/ss13_localization/extractor.py`
  - 负责遍历 DM / `strings/*.txt` / `strings/*.json`，生成 `TranslationLibrary`。支持 `--base-library` 增量抽取。
- `tools/ss13_localization/dm_lexer.py`
  - 决定什么字符串会被当作玩家可见文本抽出，并记录 `field_type`、`object_path`、`proc_path`、`source_fingerprint`。很多“为什么这条会/不会进词库”的答案都在这里。
- `tools/ss13_localization/legacy_loader.py`
  - 读取旧汉化 CSV，按 `*_text`/`*_tree` 配对；也支持 `_chat`、`_location`、`_json` 这类命名。
- `tools/ss13_localization/matcher.py`
  - 把旧 CSV 合并进当前词库，匹配顺序大致是：`文件+原文` -> `原文 fallback` -> `id_context fallback`。
- `tools/ss13_localization/translator.py`
  - 调用翻译 API，并在写回词库前修复/校验硬保护 token、插值、转义引号、文本宏间距等。失败时会把词条打到 `needs_review` 或 `translation_failed`。
- `tools/ss13_localization/injector.py`
  - 只把“允许注入”的词条写回 DM；优先按 byte offset 替换，失败后退化为搜索替换；默认备份到 `backup/`。
- `tools/ss13_localization/diff.py`
  - 用旧词库复用译文，也提供 `repair-library` / `repair-suspicious` 的重建流程。
- `tools/ss13_localization/schema.py`
  - 负责大词库的流式读取/保存。对 `ss13_merged_library.json` 做批量修改时，优先走这里或 CLI，不要手搓整文件覆盖。

## 词库与注入的重要规则

- `tools/ss13_localization/ss13_merged_library.json` 是主词库；它很大。查单条时优先按 `id`、`file`、`line`、`original` 精确搜索，不要整文件盲读。
- 某条文本“词库里有中文，但游戏里还是英文”时，先看这几个字段：
  - `status`
  - `review_flags`
  - `metadata.translation_validation`
  - `metadata.placeholder_validation`
  - `metadata.safe_for_injection`
- 注入器不会写回这些不安全词条：
  - `translation_validation.ok == false`
  - `placeholder_validation.ok == false`
  - `safe_for_injection == false`
  - 命中硬保护/黑名单/可疑代码片段
- 也就是说，“没注入”不一定是没翻译，常见原因是占位符、DM 插值、转义或内部键保护把它拦下来了。

## 黑名单与硬保护的判断顺序

- `tools/ss13_localization/legacy_blacklist.json`
  - 只拦“旧词库 merge 阶段”的精确 `(original, translated)` 对。
  - 它不是“只要原文相同就全部禁止”。如果问题是某个错误旧译文反复被旧 CSV 带回来，就加这里。
- `tools/ss13_localization/placeholders.py` + `tools/ss13_localization/dm_lexer.py`
  - 这里放结构性保护。凡是内部键、控制字面量、资源标识、危险字段，不该靠 `legacy_blacklist.json` 单条堵。
  - 当前工具会重点保护这类内容：
    - 各类 `icon_state` / 资源字段
    - `color_override`
    - `/obj/effect/landmark` 的内部 `name`
    - `/datum/laser_weapon_mode` 的模式名
    - DNA vault 相关 `/datum/mutation/*` 名称
    - AAS 映射键、文本宏、DM 插值、转义括号/引号等
- 经验规则：
  - 如果是“某个坏译文不该再从旧库回来”，改 `legacy_blacklist.json`
  - 如果是“这类字符串本来就不该被翻译/注入”，改 `placeholders.py` 或 `dm_lexer.py`

## 调试本地化问题时先看哪里

- 词条为什么被抽出来：看 `dm_lexer.py` + `extractor.py`
- 旧汉化为什么合并进来了：看 `legacy_loader.py` + `matcher.py`
- AI 译文为什么进了 `needs_review` / `translation_failed`：看 `translator.py`
- 为什么没有注入回源码：看 `injector.py` 和词条的 `metadata` / `review_flags`
- 为什么注入后游戏逻辑炸了：先确认它是不是内部键误翻译，再决定是加精确黑名单还是加结构性硬保护

## 汉化 bug 排查与修复流程

- 先定性问题属于哪一类：
  - `游戏里还是英文`：优先查主词库该词条的 `status`、`review_flags`、`metadata.translation_validation`、`metadata.placeholder_validation`、`metadata.safe_for_injection`
  - `注入后语法/运行时报错`：优先怀疑 DM 插值、转义、文本宏、内部键、资源字段被误翻译
  - `旧错误译文反复回来`：优先怀疑旧 CSV merge，而不是当前注入器
  - `整类内部键持续被翻译`：优先怀疑 extractor/placeholder 保护面不够
- 定位对应词条时，优先用这些键精确搜 `tools/ss13_localization/ss13_merged_library.json`：
  - `id`
  - `file`
  - `line`
  - `original`
- 如果词库里有译文但没注入：
  - 先看 `status` 是否是 `translated` / `legacy` / `injected`
  - 再看是否有 `placeholder_mismatch`、`text_macro_interpolation_collision`、`empty_translation`、`source_echo` 等 flag
  - 再看 `metadata.safe_for_injection` 是否为 `false`
  - 再看它是否命中 `is_translation_blacklisted()`、`should_preserve_literal_text()` 或注入器的可疑代码片段拦截
- 如果词条在 `needs_review` 或 `translation_failed`：
  - 常见原因是占位符不一致、DM 插值被改写、转义引号损坏、文本宏碰撞、模型回显源码、返回空字符串
  - 修单条时，先保证 `translated` 保留原有 DM 结构，再清掉对应的失败元数据，让词条重新变成可注入状态
  - 批量处理时可用：`translate --retry-failed`
- 如果注入后源码已经被写坏：
  - 先看本次注入是否有 `backup_root`
  - 需要整批回滚时，用 `rollback`
  - 只修局部可疑文件时，优先用 `repair-library` 或 `repair-suspicious`，不要直接整库重来
- 如果旧汉化 merge 导致坏译文进入词库：
  - 单条坏 pair：加到 `tools/ss13_localization/legacy_blacklist.json`
  - 重新跑 `merge`
  - 如果问题不是单条 pair，而是字段类别/内部键本来就不该翻译，不要只加 pair 黑名单，应该改 `placeholders.py` 或 `dm_lexer.py`
- 如果问题是“这类内部键根本不该被翻译”：
  - 在 `placeholders.py` 增加结构性黑名单或硬保护
  - 必要时在 `dm_lexer.py` 直接让它不要被抽出来
  - 典型例子：`color_override`、landmark 内部 `name`、武器模式名、DNA vault 变异名、AAS map key、`icon_state`/资源标识
- 修复后验证顺序：
  - 先跑最小测试：
    - `PYTHONPATH=tools python tools/ss13_localization/tests/test_placeholders.py`
    - `PYTHONPATH=tools python tools/ss13_localization/tests/test_matcher.py`
    - `PYTHONPATH=tools python tools/ss13_localization/tests/test_extractor_injector.py`
  - 若改了翻译/重试逻辑，再跑：
    - `PYTHONPATH=tools python tools/ss13_localization/tests/test_translator.py`
    - `PYTHONPATH=tools python tools/ss13_localization/tests/test_diff.py`
  - 若已经把文本注回 DM 且问题可能影响编译或运行，再补跑 `BUILD.bat`
- 实战判断规则：
  - `pair 级旧译文污染` -> `legacy_blacklist.json`
  - `整类内部键/控制字面量误翻译` -> `placeholders.py` / `dm_lexer.py`
  - `当前词条元数据坏了但修文案即可` -> 修 `ss13_merged_library.json` 对应 entry
  - `源码已被错误注入` -> 先回滚或直接修源码，再修词库，避免下次再次注坏

## 仓库级背景（只保留与本地化工作强相关的部分）

- `code/` 是上游 `/tg/` 主代码；`modular_nova/` 是 Nova 下游扩展。
- 需要回写源码时，常见目标文件在 `code/`、`modular_nova/`、`strings/`。
- 若不得不改核心 DM 逻辑，Nova 仓库约定仍然有效：核心文件上的下游修改使用 `NOVA EDIT ...` 注释标记。
- 构建完整游戏时使用仓库脚本，不要直接 DreamMaker 编译；本仓库 README 明确说明直接 DM 编译已不推荐。
