import 'package:flutter/cupertino.dart';

class ToolsTab extends StatelessWidget {
  const ToolsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('工具'),
      ),
      child: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.0,
          ),
          itemCount: _tools.length,
          itemBuilder: (context, index) {
            return _buildToolItem(context, _tools[index]);
          },
        ),
      ),
    );
  }

  Widget _buildToolItem(BuildContext context, ToolItem tool) {
    return GestureDetector(
      onTap: () {
        // 点击工具的操作
        showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text(tool.name),
            content: Text('${tool.name}功能待实现'),
            actions: [
              CupertinoDialogAction(
                onPressed: () => Navigator.pop(context),
                child: const Text('确定'),
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoDynamicColor.resolve(
            CupertinoColors.systemBackground,
            context,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              tool.icon,
              size: 48,
              color: CupertinoColors.activeBlue,
            ),
            const SizedBox(height: 16),
            Text(
              tool.name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 工具列表
  final List<ToolItem> _tools = const [
    ToolItem(name: '天气查询', icon: CupertinoIcons.cloud),
    ToolItem(name: '日历', icon: CupertinoIcons.calendar),
    ToolItem(name: '计算器', icon: CupertinoIcons.number_square),
    ToolItem(name: '翻译', icon: CupertinoIcons.text_bubble),
    ToolItem(name: '备忘录', icon: CupertinoIcons.doc_text),
    ToolItem(name: '扫一扫', icon: CupertinoIcons.qrcode),
    ToolItem(name: '闹钟', icon: CupertinoIcons.alarm),
    ToolItem(name: '录音', icon: CupertinoIcons.mic),
  ];
}

// 工具项模型
class ToolItem {
  final String name;
  final IconData icon;

  const ToolItem({
    required this.name,
    required this.icon,
  });
}