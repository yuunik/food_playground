class UserInfo {
  // 1. 基础身份信息
  final String userId;
  final String nickname; // 昵称
  final String avatarUrl; // 头像链接
  final String? email; // 邮箱（可能是空的）

  // 2. 个人资料
  final String bio; // 个人简介（测试多行文本）
  final int age;
  final String gender; // 'male', 'female', 'other'

  // 3. 状态标识 (用于测试 UI 的显隐逻辑)
  final bool isVip; // 是否是会员
  final bool isOnline; // 是否在线

  // 4. 统计数据 (用于测试数字显示)
  final int followerCount; // 粉丝数
  final double balance; // 余额 (测试小数)

  // 5. 列表数据 (用于测试 ListView/Wrap)
  final List<String> tags; // 标签，如 ["开发者", "音乐"]

  UserInfo({
    required this.userId,
    required this.nickname,
    required this.avatarUrl,
    this.email,
    required this.bio,
    required this.age,
    required this.gender,
    required this.isVip,
    required this.isOnline,
    required this.followerCount,
    required this.balance,
    required this.tags,
  });

  // --- 模拟数据生成器 (方便你直接调用) ---
  static UserInfo mock() {
    return UserInfo(
      userId: '8823102',
      nickname: 'Flutter大施',
      avatarUrl:
          'https://robohash.org/flutter_user?set=set4', // 这是一个生成随机头像的免费服务
      email: 'flutter_master@example.com',
      bio: '热爱技术，热爱生活。Flutter 全栈开发者，正在学习 Provider 源码。',
      age: 26,
      gender: 'male',
      isVip: true,
      isOnline: true,
      followerCount: 12580,
      balance: 99.50,
      tags: ['技术控', '夜猫子', '咖啡爱好者', '开源'],
    );
  }

  // --- JSON 序列化 (模拟从后端获取数据) ---
  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json['user_id'] as String,
      nickname: json['nickname'] as String,
      avatarUrl: json['avatar_url'] as String,
      email: json['email'] as String?,
      bio: json['bio'] ?? '',
      age: json['age'] as int,
      gender: json['gender'] as String,
      isVip: json['is_vip'] as bool,
      isOnline: json['is_online'] ?? false,
      followerCount: json['follower_count'] as int,
      balance: (json['balance'] as num).toDouble(),
      tags: List<String>.from(json['tags'] ?? []),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'nickname': nickname,
      'avatar_url': avatarUrl,
      'email': email,
      'bio': bio,
      'age': age,
      'gender': gender,
      'is_vip': isVip,
      'is_online': isOnline,
      'follower_count': followerCount,
      'balance': balance,
      'tags': tags,
    };
  }

  // --- CopyWith (用于状态管理更新数据) ---
  // 当你需要修改某个字段（比如把 VIP 变成 false），但保持其他字段不变时使用
  UserInfo copyWith({
    String? nickname,
    String? avatarUrl,
    String? bio,
    bool? isVip,
    int? followerCount,
  }) {
    return UserInfo(
      userId: this.userId,
      nickname: nickname ?? this.nickname,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      email: this.email,
      bio: bio ?? this.bio,
      age: this.age,
      gender: this.gender,
      isVip: isVip ?? this.isVip,
      isOnline: this.isOnline,
      followerCount: followerCount ?? this.followerCount,
      balance: this.balance,
      tags: this.tags,
    );
  }
}
