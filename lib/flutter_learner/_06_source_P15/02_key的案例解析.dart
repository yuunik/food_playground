import 'dart:math';

import 'package:flutter/material.dart';

/// ==============================================================================
/// Flutter 核心渲染机制笔记：setState、Element 复用与 Diff 算法
/// ==============================================================================

/// 1. setState 与 树的更新机制
/// ------------------------------------------------------------------------------
/// 当 StatefulWidget 调用 setState() 时：
///   * Widget Tree (配置树): 会被重建。
///     - Widget 是不可变 (Immutable) 的，每次构建都会生成全新的 Widget 实例。
///   * Element Tree (上下文/实例树): 不会轻易重建，而是尽可能复用。
///     - Element 是可变 (Mutable) 的，它负责将新生成的 Widget 配置更新到自己身上。

/// 2. 复用核心规则: Widget.canUpdate
/// ------------------------------------------------------------------------------
/// Element 是否需要复用（保留），取决于静态方法 Widget.canUpdate(oldWidget, newWidget)。
/// 对比当前节点上的 旧Widget 和 新Widget：
///   * 对比条件:
///     1. runtimeType (类型，如都是 Text)
///     2. key (键值，如无 key 则都为 null)
///   * 结果判定:
///     - 结果为 true: 复用该 Element。
///         -> Element 会调用 update(newWidget) 方法。
///         -> 将内部的 _widget 属性指向新的 Widget。
///         -> 如果是 RenderObjectElement，还会同步更新底层的 RenderObject 属性（如颜色、字体）。
///     - 结果为 false: 无法复用。
///         -> 旧 Element 被移除 (deactivate -> unmount)。
///         -> 依据新 Widget 创建全新的 Element 并挂载。

/// 3. 列表更新与删除逻辑 (Diff 算法细节)
/// ------------------------------------------------------------------------------
/// 假设 Widget Tree 中有三个 Widget [A, B, C]，现在删除了 B，变成 [A, C]。
/// Flutter 框架通常采用“线性对比” (Linear Reconciliation)，除非使用了 Key。

/// 场景一：未使用 Key (默认行为)
/// 此时 Element Tree 只有三个位置。
///   * 位置 0: 对比 旧A 和 新A -> 类型一致 -> Element 复用 (无明显变化)。
///   * 位置 1: 对比 旧B 和 新C -> 类型若一致 -> Element 复用 (但在逻辑上，Element B 的内容被更新成了 C)。
///         !!! 注意: 此时 Element 持有的 State 对象如果不依赖 Key，还是 B 的旧 State，导致数据错乱。
///   * 位置 2: 旧C 存在，但新列表此处无 Widget -> 多余的 Element。
///         -> 触发销毁流程。
///   * 结论: 虽然你删了中间的 B，但框架看来是“更新了前两个，删掉了最后一个”。

/// 场景二：使用了 Key (推荐行为)
/// 此时引入了 GlobalKey 或 LocalKey。
///   * 框架会对照 Key 进行查找。
///   * 发现 新列表中的 A 对应 旧A (复用)。
///   * 发现 新列表中的 C 对应 旧C (复用，并将旧 Element C 移动到位置 1)。
///   * 发现 旧B 在新列表中找不到对应的 Key -> 销毁 旧B 的 Element。
///   * 结论: 只有真正被删除的那个 Element 会被销毁，状态得以正确保留。

/// 4. Element 的销毁生命周期
/// ------------------------------------------------------------------------------
/// 当一个 Element 确定不再被需要时（即 canUpdate 返回 false 或 新列表中无对应位置）：
///   1. deactivate():
///      Element 变为“不活跃”状态。此时它从树中被移除，但在当前帧结束前，仍有机会被重新插入到树的其他位置（例如配合 GlobalKey 使用时）。
///   2. unmount():
///      如果当前帧结束，该 Element 仍未被重新挂载，则调用 unmount。
///      -> 彻底释放资源。
///      -> 对应的 RenderObject 从渲染树移除。
///      -> 对应的 State 对象 (StatefulWidget) 调用 dispose() 并被销毁。

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AppHomePage());
  }
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  final List<String> _nameList = ["aaa", "bbb", "ccc"];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Key111 的使用"), centerTitle: true),
      body: ListView.builder(
        itemCount: _nameList.length,
        itemBuilder: (BuildContext context, int index) => ListStatefulItem(
          name: _nameList[index],
          key: ValueKey(_nameList[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _nameList.removeAt(0);
        }),
        child: Icon(Icons.delete),
      ),
    );
  }
}

class ListStatelessItem extends StatelessWidget {
  final String name;

  final Color _renderColor;

  /// key 分为 LocalKey 和 GlobalKey
  ///   * LocalKey 应用于具有相同父 Element 的 Widget 进行比较, 也是 diff 算法的核心所在
  ///     - ValueKey, 当我们以特定的值作为 key 时使用, 比如一个字符串、数字等等
  ///     - ObjectKey, 要求传入一个 Object, 若特定的值有可能重复时, 则使用这个 Key
  ///     - UniqueKey, 会生成一个唯一的 Key, 用于保证 key 的唯一性
  ///   * GlobalKey, 通常我们会使用其某个Widget 对应的 Widget 或 State 或 Element

  ListStatelessItem({super.key, required this.name})
    : _renderColor = Color.fromARGB(
        255,
        Random().nextInt(256),
        Random().nextInt(256),
        Random().nextInt(256),
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 52,
      color: _renderColor,
      child: Center(
        child: Text(name, style: TextStyle(fontSize: 24, color: Colors.white)),
      ),
    );
  }
}

/// 由于 state 中只保留了 颜色信息, 所以颜色的顺序依旧不变, 但是 文字内容会发生改变,
/// 并不是 Widget 在使用这些 Key, 而是 Element 在使用
/// 当加入 key时, Element tree 会比较 Widget tree 中一致的key, 则把多余的匹配不上的key的元素删除
class ListStatefulItem extends StatefulWidget {
  final String name;

  const ListStatefulItem({super.key, required this.name});

  @override
  State<ListStatefulItem> createState() => _ListStatefulItemState();
}

class _ListStatefulItemState extends State<ListStatefulItem> {
  final Color _renderColor = Color.fromARGB(
    255,
    Random().nextInt(256),
    Random().nextInt(256),
    Random().nextInt(256),
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      color: _renderColor,
      child: Center(
        child: Text(
          widget.name,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
