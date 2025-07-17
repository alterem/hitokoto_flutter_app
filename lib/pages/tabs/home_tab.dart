import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/hitokoto.dart';
import '../../services/hitokoto_service.dart';
import '../../models/chinese_colors.dart';
import 'dart:math';

class HomeTab extends StatefulWidget {
  final bool showColorName;
  
  const HomeTab({
    super.key,
    this.showColorName = true
  });

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final HitokotoService _hitokotoService = HitokotoService();
  Hitokoto? _hitokoto;
  bool _isLoading = false;
  String? _errorMessage;
  ChineseColor _currentColor = ChineseColors.getRandomColor();
  DateTime _lastRefreshTime = DateTime.now().subtract(const Duration(seconds: 3));
  bool _isRefreshButtonEnabled = true;

  @override
  void initState() {
    super.initState();
    _fetchHitokoto();
  }

  Future<void> _fetchHitokoto() async {
    final now = DateTime.now();
    final difference = now.difference(_lastRefreshTime).inSeconds;
    
    if (difference < 3) {
      print('刷新过于频繁，请等待${3 - difference}秒后再试');
      return;
    }
    
    _lastRefreshTime = now;
    
    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _isRefreshButtonEnabled = false;
    });

    try {
      final hitokoto = await _hitokotoService.fetchHitokoto();
      setState(() {
        _hitokoto = hitokoto;
        _isLoading = false;
        _currentColor = ChineseColors.getRandomColor();
      });
      
      Future.delayed(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _isRefreshButtonEnabled = true;
          });
        }
      });
    } catch (e) {
      setState(() {
        _errorMessage = '获取一言失败: ${e.toString()}';
        _isLoading = false;
        _isRefreshButtonEnabled = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('一言'),
      ),
      backgroundColor: _currentColor.color.withOpacity(0.15),
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
              borderRadius: BorderRadius.circular(30),
              onPressed: _isRefreshButtonEnabled ? _fetchHitokoto : null,
              color: _isRefreshButtonEnabled
                  ? CupertinoColors.activeBlue
                  : CupertinoColors.activeBlue.withOpacity(0.5),
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
            color: _currentColor.color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: _currentColor.color.withOpacity(0.3),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
            border: Border.all(
              color: _currentColor.color.withOpacity(0.5),
              width: 1.5,
            ),
          ),
          child: Column(
            children: [
              Text(
                _hitokoto!.hitokoto,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // 根据背景颜色的亮度自动调整文字颜色
                  color: _getContrastingTextColor(_currentColor.color),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    '—— ${_hitokoto!.from}',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: _getContrastingTextColor(_currentColor.color),
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
                      style: TextStyle(
                        fontSize: 14,
                        color: _getContrastingTextColor(_currentColor.color),
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
            color: _getContrastingTextColor(_currentColor.color, opacity: 0.7),
            fontSize: 14,
          ),
        ),
        if (widget.showColorName) ...[
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: _currentColor.color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _currentColor.color.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Text(
              '当前颜色: ${_currentColor.name}',
              style: TextStyle(
                color: _getContrastingTextColor(_currentColor.color.withOpacity(0.2), opacity: 1.0),
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ],
    );
  }
  
  // 根据背景颜色计算对比度高的文字颜色
  Color _getContrastingTextColor(Color backgroundColor, {double opacity = 1.0}) {
    // 计算颜色的亮度（0-255）
    double brightness = (backgroundColor.red * 299 +
                        backgroundColor.green * 587 +
                        backgroundColor.blue * 114) / 1000;
    
    // 如果背景颜色较亮，返回深色文字；否则返回浅色文字
    if (brightness > 160) {
      return Colors.black.withOpacity(opacity);
    } else {
      return Colors.white.withOpacity(opacity);
    }
  }
}