# Food Playground

一个用于学习 Dart 和 Flutter 开发的综合性项目，包含了从基础语法到实战应用的完整学习路径。

## 项目简介

Food Playground 是一个 Flutter 学习项目，旨在通过系统化的示例和实践项目帮助开发者掌握 Dart 语言和 Flutter 框架。项目包含了丰富的学习模块和实战案例。

## 技术栈

- **Flutter SDK**: ^3.8.1
- **Dart**: ^3.8.1
- **状态管理**: Provider
- **网络请求**: Dio
- **UI 组件库**: TDesign Flutter
- **地图功能**: Map Launcher

## 项目结构

```
lib/
├── dart_learner/          # Dart 语言学习模块
│   ├── 01_Dart的基础语法_P2/
│   ├── 02_Dart的函数使用_P2/
│   ├── 03_Dart特殊运算符_P2/
│   ├── 04_Dart的面向对象_P2_P3/
│   ├── 05_Dart中库的使用_P3/
│   └── 06_Dart中异步操作_P12/
│
├── flutter_learner/       # Flutter 框架学习模块
│   ├── _01_hello_flutter_P4/
│   ├── _02_stateless_stateful_widget_P5/
│   ├── _03_basic_widgets_P6/
│   ├── _04_layout_widgets_P8_P10/
│   ├── _05_scroll_widgets_P11/
│   ├── _06_source_P15/
│   ├── _12_animation_P18/
│   └── _practice_douban_demo/
│
├── flutter_test/          # Flutter 测试组件
├── core/                  # 核心功能模块
│   ├── extension/         # 扩展方法
│   ├── model/            # 数据模型
│   ├── router/           # 路由管理
│   ├── service/          # 服务层
│   └── utils/            # 工具类
│
├── ui/                    # UI 层
│   ├── pages/            # 页面
│   └── shared/           # 共享组件
│
├── app.dart              # 应用入口配置
└── main.dart             # 主入口文件
```

## 学习模块

### Dart 基础学习

1. **基础语法** - 变量、数据类型、控制流程
2. **函数使用** - 函数定义、参数传递、闭包
3. **特殊运算符** - 级联、条件、空安全运算符
4. **面向对象** - 类、继承、接口、混入
5. **库的使用** - 导入、导出、包管理
6. **异步操作** - Future、async/await、Stream

### Flutter 组件学习

1. **Hello Flutter** - Flutter 应用基础结构
2. **Widget 基础** - StatelessWidget 和 StatefulWidget
3. **基础组件** - Text、Image、Button 等常用组件
4. **布局组件** - Row、Column、Stack、Flex 等布局方式
5. **滚动组件** - ListView、GridView、CustomScrollView
6. **源码分析** - Flutter 框架源码解读
7. **动画系统** - 动画基础、动画控制器、过渡动画

### 实战项目

- **豆瓣 Demo** - 仿豆瓣应用的实践项目

## 快速开始

### 环境要求

- Flutter SDK 3.8.1 或更高版本
- Dart SDK 3.8.1 或更高版本
- Android Studio / VS Code / IntelliJ IDEA

### 安装依赖

```bash
flutter pub get
```

### 运行项目

```bash
flutter run
```

### 构建应用

```bash
# Android
flutter build apk

# iOS
flutter build ios

# Web
flutter build web
```

## 主要功能

- 📚 系统化的 Dart 语言学习示例
- 🎨 丰富的 Flutter 组件演示
- 🔄 状态管理实践（InheritedWidget、Provider）
- 🌐 网络请求和数据处理
- 🎭 动画效果实现
- 📱 实战项目案例

## 开发指南

### 代码规范

项目使用 `flutter_lints` 进行代码规范检查，确保代码质量和一致性。

### 资源管理

- 图片资源：`assets/images/`
- JSON 数据：`assets/json/`

## 学习建议

1. 按照模块顺序学习，先掌握 Dart 基础再学习 Flutter
2. 每个示例都包含详细注释，建议仔细阅读
3. 动手实践每个示例，修改参数观察效果
4. 完成基础学习后，尝试实战项目

## 相关资源

- [Flutter 官方文档](https://docs.flutter.dev/)
- [Dart 语言指南](https://dart.dev/guides)
- [Flutter 中文网](https://flutter.cn/)
- [Pub.dev 包管理](https://pub.dev/)

## 许可证

本项目仅用于学习目的，不用于商业发布。

## 贡献

欢迎提交 Issue 和 Pull Request 来改进这个学习项目。
