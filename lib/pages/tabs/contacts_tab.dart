import 'package:flutter/cupertino.dart';

class ContactsTab extends StatelessWidget {
  const ContactsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('通讯录'),
      ),
      child: Stack(
        children: [
          SafeArea(
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return CupertinoListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: CupertinoColors.activeBlue.withOpacity((index % 3 + 1) * 0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        String.fromCharCode(65 + index % 26),
                        style: const TextStyle(color: CupertinoColors.white),
                      ),
                    ),
                  ),
                  title: Text('联系人 ${index + 1}'),
                  subtitle: Text('电话: 1380013${index.toString().padLeft(4, '0')}'),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () {
                    // 点击联系人的操作
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                        title: Text('联系人 ${index + 1}'),
                        message: Text('电话: 1380013${index.toString().padLeft(4, '0')}'),
                        actions: [
                          CupertinoActionSheetAction(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('拨打电话'),
                          ),
                          CupertinoActionSheetAction(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('发送短信'),
                          ),
                        ],
                        cancelButton: CupertinoActionSheetAction(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('取消'),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Positioned(
            right: 16,
            bottom: 80,
            child: CupertinoButton(
              padding: const EdgeInsets.all(16),
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(30),
              onPressed: () {
                // 添加联系人的操作
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text('提示'),
                    content: const Text('添加联系人功能待实现'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('确定'),
                      ),
                    ],
                  ),
                );
              },
              child: const Icon(
                CupertinoIcons.add,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}