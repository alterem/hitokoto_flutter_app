import 'package:flutter/cupertino.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _login() {
    setState(() {
      _isLoading = true;
    });

    // 模拟网络延迟
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
      
      // 模拟登录成功，导航到主页
      Navigator.of(context).pushReplacementNamed('/home');
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('登录'),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(
                    CupertinoIcons.quote_bubble,
                    size: 80,
                    color: CupertinoColors.activeBlue,
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    '一言',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 48),
                  CupertinoTextField(
                    controller: _usernameController,
                    placeholder: '用户名',
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        CupertinoIcons.person,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemGrey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CupertinoTextField(
                    controller: _passwordController,
                    placeholder: '密码',
                    obscureText: true,
                    prefix: const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Icon(
                        CupertinoIcons.padlock,
                        color: CupertinoColors.systemGrey,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.systemGrey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 32),
                  CupertinoButton(
                    onPressed: _isLoading ? null : _login,
                    color: CupertinoColors.activeBlue,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: _isLoading
                        ? const CupertinoActivityIndicator(color: CupertinoColors.white)
                        : const Text(
                            '登录',
                            style: TextStyle(
                              fontSize: 16,
                              color: CupertinoColors.white,
                            ),
                          ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '点击登录按钮即可进入应用',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CupertinoColors.systemGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}