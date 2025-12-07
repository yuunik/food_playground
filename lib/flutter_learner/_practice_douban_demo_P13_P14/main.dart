import 'package:flutter/material.dart';

import 'app.dart';

/// RenderObjectWidget 中有一个未实现的方法createRenderObject, 需由继承类来实现
/// 则SingleChildRenderObjectWidget需实现, 可其为抽象类, 无法实现
/// 最终由SingleChildRenderObjectWidget的继承类来实现
///
/// Padding 最终会创建一个 RenderObject
///
/// 只要是一个 Widget, 里面必有一个 createElement 方法
/// 即所有的 Widget 都会创建一个对应的 Element 对象

/// ComponentElement: 当一个新的 Element 元素被创建且加入树中, 框架会主动去调用其实现的 mounted 方法
///
/// 而 mount 方法会调用 firstBuild 方法, firstBuild 又调用  rebuild, rebuild 又调用 performBuild,
/// performBuild 又调用 build, build 方法会拿到其子元素, 并调用子元素的build方法,
/// 即 StatelessWidget 或 StatefulWidget 的 build 方法
///
/// mount 方法 -> firstBuild -> rebuild -> performBuild -> build -> _widget.build
///
/// StatelessWidget 或 StatefulWidget 会把其继承类的元素层层传递至 _widget , 供 Element 元素调用

/// RenderObjectElement: mount 方法 --> _widget.createRenderObject
///
/// Element 中有两个属性 _widget 和 _renderObject, _state
///
/// StatefulElement:
///   * 其构造方法中调用了 widget.createState(), _state = widget.createState()
///   * _state._widget = widget;

/// 总结1:
///     * Widget 创建出来后, Flutter 会根据 Widget 创建出一个 Element, 每一个 Widget 都有一个对应的 Element。
///   创建出 Element 元素后, 会调用对应的 mount 方法, 其又会回头调用底层 Widget 的 build 方法。
///     * 如果 Element 对应的是一个 RenderElement的话, 则其不调用 build 方法, 它的职责是创建一个 RenderObject
///     * 如果 Element 对应的是一个 StatefulElement 的话, 则会创建出一个 _state , 去接收一个 widget.createState(),
///   此外, 还会 _state._widget = widget;

/// 总结2:
///     * StatefulElement 会调用 widget.build(this); 则 this 为 Element,
///     所以 StatelessWidget build(BuildContext context) 中的这个 context 就是 Element
///     * StatelessElement 会调用 state.build(this); 则 this 为 Element,
///     所以 说明了它只调用_state类中的build 方法, StatefulWidget 中的 build(BuildContext context) 中的这个 context 就是 Element

main(List<String> args) => runApp(const DouBanApp());
