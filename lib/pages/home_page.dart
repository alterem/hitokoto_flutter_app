import 'package:flutter/cupertino.dart';
import 'tabs/home_tab.dart';
import 'tabs/contacts_tab.dart';
import 'tabs/tools_tab.dart';
import 'tabs/profile_tab.dart';

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const HomePage({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final List<Widget> _tabContents;

  @override
  void initState() {
    super.initState();
    _tabContents = [
      const HomeTab(),
      const ContactsTab(),
      const ToolsTab(),
      ProfileTab(
        toggleTheme: widget.toggleTheme,
        isDarkMode: widget.isDarkMode,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_2),
            label: '通讯录',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.wrench),
            label: '工具',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.profile_circled),
            label: '我的',
          ),
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        return CupertinoTabView(
          builder: (context) {
            return _tabContents[index];
          },
        );
      },
    );
  }
}