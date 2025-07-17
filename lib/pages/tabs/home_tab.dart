import 'package:flutter/cupertino.dart';
import '../../models/hitokoto.dart';
import '../../services/hitokoto_service.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final HitokotoService _hitokotoService = HitokotoService();
  Hitokoto? _hitokoto;
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchHitokoto();
  }

  Future<void> _fetchHitokoto() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final hitokoto = await _hitokotoService.fetchHitokoto();
      setState(() {
        _hitokoto = hitokoto;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '获取一言失败: ${e.toString()}';
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('一言'),
      ),
      child: Stack(
        children: [
          CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: _fetchHitokoto,
              ),
              SliverFillRemaining(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: _buildContent(),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 16,
            bottom: 80, // 增加底部边距，避免被底部导航栏遮挡
            child: CupertinoButton(
              padding: const EdgeInsets.all(16),
              color: CupertinoColors.activeBlue,
              borderRadius: BorderRadius.circular(30),
              onPressed: _fetchHitokoto,
              child: const Icon(
                CupertinoIcons.refresh,
                color: CupertinoColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_isLoading) {
      return const CupertinoActivityIndicator();
    }

    if (_errorMessage != null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.exclamationmark_triangle,
            color: CupertinoColors.destructiveRed,
            size: 60,
          ),
          const SizedBox(height: 16),
          Text(
            _errorMessage!,
            style: const TextStyle(color: CupertinoColors.destructiveRed),
            textAlign: TextAlign.center,
          ),
        ],
      );
    }

    if (_hitokoto == null) {
      return const Text('没有数据');
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(20.0),
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
            children: [
              Text(
                _hitokoto!.hitokoto,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '—— ${_hitokoto!.from}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
              if (_hitokoto!.fromWho.isNotEmpty)
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '「${_hitokoto!.fromWho}」',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Text(
          '下拉或点击刷新按钮获取新的一言',
          style: TextStyle(
            color: CupertinoColors.systemGrey,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}