import 'package:flutter/cupertino.dart';

class ProfileTab extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDarkMode;

  const ProfileTab({
    super.key,
    required this.toggleTheme,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('个人中心'),
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 20),
            // 头像和用户名
            Center(
              child: Column(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      color: CupertinoColors.activeBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      CupertinoIcons.person_solid,
                      size: 60,
                      color: CupertinoColors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    '用户名',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '用户ID: 12345678',
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            // 设置列表
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                '设置',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: CupertinoTheme.of(context).primaryColor,
                ),
              ),
            ),
            const SizedBox(height: 10),
            CupertinoListTile(
              leading: const Icon(CupertinoIcons.person),
              title: const Text('个人资料'),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                // 导航到个人资料页面
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('提示'),
                    content: const Text('个人资料功能待实现'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: 0.5,
              color: CupertinoColors.systemGrey4,
            ),
            CupertinoListTile(
              leading: const Icon(CupertinoIcons.bell),
              title: const Text('消息通知'),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                // 导航到消息通知页面
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('提示'),
                    content: const Text('消息通知功能待实现'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: 0.5,
              color: CupertinoColors.systemGrey4,
            ),
            CupertinoListTile(
              leading: const Icon(CupertinoIcons.shield),
              title: const Text('隐私设置'),
              trailing: const CupertinoListTileChevron(),
              onTap: () {
                // 导航到隐私设置页面
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('提示'),
                    content: const Text('隐私设置功能待实现'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                );
              },
            ),
            Container(
              height: 0.5,
              color: CupertinoColors.systemGrey4,
            ),
            CupertinoListTile(
              leading: Icon(
                isDarkMode ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill,
              ),
              title: const Text('外观设置'),
              trailing: CupertinoSwitch(
                value: isDarkMode,
                onChanged: (_) => toggleTheme(),
              ),
            ),
            Container(
              height: 0.5,
              color: CupertinoColors.systemGrey4,
            ),
            CupertinoListTile(
              leading: const Icon(CupertinoIcons.square_arrow_left),
              title: const Text('退出登录'),
              onTap: () {
                // 显示确认对话框
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('确认退出'),
                    content: const Text('您确定要退出登录吗？'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('取消'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () {
                          // 关闭对话框
                          Navigator.pop(context);
                          // 记录日志
                          print('用户退出登录: ${DateTime.now()}');
                          // 返回登录页面
                          Navigator.of(context, rootNavigator: true).pushReplacementNamed('/login');
                        },
                        isDestructiveAction: true,
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}