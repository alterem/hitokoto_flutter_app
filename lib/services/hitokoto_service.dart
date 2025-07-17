import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/hitokoto.dart';

class HitokotoService {
  // 提供多个API端点，如果一个不可用，可以尝试另一个
  static const List<String> apiUrls = [
    'https://v1.hitokoto.cn/',
    'https://international.v1.hitokoto.cn/',
  ];

  Future<Hitokoto> fetchHitokoto() async {
    Exception? lastException;
    
    // 尝试所有API端点
    for (final apiUrl in apiUrls) {
      try {
        print('尝试连接到: $apiUrl');
        
        // 设置超时时间
        final response = await http.get(
          Uri.parse(apiUrl),
          headers: {
            'User-Agent': 'HitokotoFlutterApp/1.0',
            'Accept': 'application/json',
          },
        ).timeout(const Duration(seconds: 10));

        if (response.statusCode == 200) {
          print('成功从 $apiUrl 获取数据');
          return Hitokoto.fromJson(json.decode(response.body));
        } else {
          print('服务器返回错误: ${response.statusCode} - ${response.body}');
          lastException = Exception('服务器返回错误: ${response.statusCode}');
        }
      } catch (e) {
        print('连接 $apiUrl 时出错: $e');
        lastException = e is Exception ? e : Exception(e.toString());
        
        // 如果是SocketException，可能是网络权限问题
        if (e is SocketException) {
          print('网络连接错误，可能是权限问题: ${e.message}');
        }
      }
    }
    
    // 所有API端点都失败了
    throw lastException ?? Exception('所有API端点都无法连接');
  }
}