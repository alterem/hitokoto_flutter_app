import 'package:flutter/material.dart';
import 'dart:math';

class ChineseColor {
  final String name;
  final Color color;

  const ChineseColor({required this.name, required this.color});
}

class ChineseColors {
  static final List<ChineseColor> colors = [
    // 红色系
    const ChineseColor(name: '朱砂红', color: Color(0xFFFF461F)),
    const ChineseColor(name: '赤城霞', color: Color(0xFFCF4813)),
    const ChineseColor(name: '唐菖蒲红', color: Color(0xFFDE1C31)),
    const ChineseColor(name: '烛光红', color: Color(0xFFFF4C00)),
    const ChineseColor(name: '鹅血石红', color: Color(0xFFAB372F)),
    const ChineseColor(name: '樱桃红', color: Color(0xFFC83C23)),
    const ChineseColor(name: '银朱', color: Color(0xFFFF3300)),
    const ChineseColor(name: '大红', color: Color(0xFFFF2121)),
    const ChineseColor(name: '绛紫', color: Color(0xFF8C4356)),
    const ChineseColor(name: '绯红', color: Color(0xFFC83C23)),
    const ChineseColor(name: '胭脂红', color: Color(0xFF9D2933)),
    const ChineseColor(name: '茜色', color: Color(0xFFCB3A56)),
    const ChineseColor(name: '火红', color: Color(0xFFFF2D51)),
    
    // 粉色系
    const ChineseColor(name: '牡丹粉红', color: Color(0xFFEEA2A4)),
    const ChineseColor(name: '山茶红', color: Color(0xFFED556A)),
    const ChineseColor(name: '海棠红', color: Color(0xFFF03752)),
    const ChineseColor(name: '粉红', color: Color(0xFFFFF2F1)),
    const ChineseColor(name: '藕荷色', color: Color(0xFFE4C6D0)),
    const ChineseColor(name: '水红', color: Color(0xFFF3D3E7)),
    const ChineseColor(name: '霞光红', color: Color(0xFFEF7A82)),
    const ChineseColor(name: '桃红', color: Color(0xFFF47983)),
    const ChineseColor(name: '酡红', color: Color(0xFFDC3023)),
    
    // 橙色系
    const ChineseColor(name: '琥珀黄', color: Color(0xFFCA6924)),
    const ChineseColor(name: '金红', color: Color(0xFFF2BE45)),
    const ChineseColor(name: '杏黄', color: Color(0xFFF0C239)),
    const ChineseColor(name: '橘黄', color: Color(0xFFFF8936)),
    const ChineseColor(name: '橙皮黄', color: Color(0xFFFC8C23)),
    const ChineseColor(name: '橘红', color: Color(0xFFFF7500)),
    const ChineseColor(name: '姜黄', color: Color(0xFFE8B004)),
    const ChineseColor(name: '褐色', color: Color(0xFF6E511E)),
    const ChineseColor(name: '赭石', color: Color(0xFF9C661F)),
    const ChineseColor(name: '雄黄', color: Color(0xFFFF9900)),
    
    // 黄色系
    const ChineseColor(name: '鹅黄', color: Color(0xFFFFF143)),
    const ChineseColor(name: '鸭黄', color: Color(0xFFFFB61E)),
    const ChineseColor(name: '枯黄', color: Color(0xFFD3A237)),
    const ChineseColor(name: '秋葵黄', color: Color(0xFFEEA243)),
    const ChineseColor(name: '姜黄', color: Color(0xFFE8B004)),
    const ChineseColor(name: '明黄', color: Color(0xFFFFB200)),
    const ChineseColor(name: '缃色', color: Color(0xFFD9B611)),
    const ChineseColor(name: '赤金色', color: Color(0xFFCB6920)),
    const ChineseColor(name: '金色', color: Color(0xFFEACD76)),
    const ChineseColor(name: '藤黄', color: Color(0xFFFFB61E)),
    const ChineseColor(name: '芒果黄', color: Color(0xFFFFD111)),
    
    // 绿色系
    const ChineseColor(name: '松花绿', color: Color(0xFF1A6840)),
    const ChineseColor(name: '蛙绿', color: Color(0xFF45B787)),
    const ChineseColor(name: '竹青', color: Color(0xFF789262)),
    const ChineseColor(name: '蓝绿', color: Color(0xFF1E9FB3)),
    const ChineseColor(name: '青矾绿', color: Color(0xFF2C9678)),
    const ChineseColor(name: '翡翠绿', color: Color(0xFF3DE1AD)),
    const ChineseColor(name: '玉髓绿', color: Color(0xFF41B349)),
    const ChineseColor(name: '松柏绿', color: Color(0xFF21A675)),
    const ChineseColor(name: '葱青', color: Color(0xFF0AA344)),
    const ChineseColor(name: '青翠', color: Color(0xFF00BC12)),
    const ChineseColor(name: '碧绿', color: Color(0xFF1BD1A5)),
    const ChineseColor(name: '豆青', color: Color(0xFF96CE54)),
    const ChineseColor(name: '石青', color: Color(0xFF1685A9)),
    const ChineseColor(name: '青碧', color: Color(0xFF48C0A3)),
    const ChineseColor(name: '碧色', color: Color(0xFF1BD1A5)),
    
    // 蓝色系
    const ChineseColor(name: '靛青', color: Color(0xFF177CB0)),
    const ChineseColor(name: '靛蓝', color: Color(0xFF065279)),
    const ChineseColor(name: '宝石蓝', color: Color(0xFF4B5CC4)),
    const ChineseColor(name: '天蓝', color: Color(0xFF1677B3)),
    const ChineseColor(name: '蔚蓝', color: Color(0xFF70F3FF)),
    const ChineseColor(name: '孔雀蓝', color: Color(0xFF0EB0C9)),
    const ChineseColor(name: '湖蓝', color: Color(0xFF30DFF3)),
    const ChineseColor(name: '月白', color: Color(0xFFEEF7F2)),
    const ChineseColor(name: '藏青', color: Color(0xFF2E4E7E)),
    const ChineseColor(name: '群青', color: Color(0xFF1C3764)),
    const ChineseColor(name: '蓝灰色', color: Color(0xFFA1AFC9)),
    const ChineseColor(name: '搪磁蓝', color: Color(0xFF177CB0)),
    const ChineseColor(name: '鸢尾蓝', color: Color(0xFF158BB8)),
    
    // 紫色系
    const ChineseColor(name: '紫罗兰', color: Color(0xFF525288)),
    const ChineseColor(name: '紫藤', color: Color(0xFF8B81C3)),
    const ChineseColor(name: '青莲', color: Color(0xFF8B2671)),
    const ChineseColor(name: '紫水晶', color: Color(0xFFCCA4E3)),
    const ChineseColor(name: '紫檀', color: Color(0xFF4C221B)),
    const ChineseColor(name: '紫色', color: Color(0xFF8D4BBB)),
    const ChineseColor(name: '紫酱', color: Color(0xFF815476)),
    const ChineseColor(name: '酱紫', color: Color(0xFF5D3F51)),
    const ChineseColor(name: '紫棠', color: Color(0xFF56004F)),
    const ChineseColor(name: '紫红', color: Color(0xFF8B2671)),
    const ChineseColor(name: '紫铜', color: Color(0xFF7A4E48)),
    const ChineseColor(name: '紫灰', color: Color(0xFF665757)),
    
    // 灰色系
    const ChineseColor(name: '银灰', color: Color(0xFFC0C0C0)),
    const ChineseColor(name: '苍色', color: Color(0xFF75878A)),
    const ChineseColor(name: '黛色', color: Color(0xFF494166)),
    const ChineseColor(name: '墨色', color: Color(0xFF50616D)),
    const ChineseColor(name: '铅灰', color: Color(0xFF7A7374)),
    const ChineseColor(name: '灰色', color: Color(0xFF808080)),
    const ChineseColor(name: '石板灰', color: Color(0xFF424C50)),
    const ChineseColor(name: '烟灰', color: Color(0xFF848484)),
    const ChineseColor(name: '水晶灰', color: Color(0xFFB9B1B0)),
    
    // 白色系
    const ChineseColor(name: '象牙白', color: Color(0xFFFFFFF0)),
    const ChineseColor(name: '缟色', color: Color(0xFFF2FDFF)),
    const ChineseColor(name: '素色', color: Color(0xFFF0F0F0)),
    const ChineseColor(name: '雪白', color: Color(0xFFF0FCFF)),
    const ChineseColor(name: '霜色', color: Color(0xFFE9F1F6)),
    const ChineseColor(name: '莹白', color: Color(0xFFE3F9FD)),
    const ChineseColor(name: '鱼肚白', color: Color(0xFFFCF6F5)),
    const ChineseColor(name: '瓷白', color: Color(0xFFF9F9F9)),
    
    // 黑色系
    const ChineseColor(name: '玄色', color: Color(0xFF622A1D)),
    const ChineseColor(name: '乌色', color: Color(0xFF392F41)),
    const ChineseColor(name: '漆黑', color: Color(0xFF161823)),
    const ChineseColor(name: '黑色', color: Color(0xFF000000)),
    const ChineseColor(name: '乌黑', color: Color(0xFF141414)),
    const ChineseColor(name: '玄青', color: Color(0xFF3D3B4F)),
    const ChineseColor(name: '乌紫', color: Color(0xFF4C1F24)),
    const ChineseColor(name: '青黑', color: Color(0xFF1E2732)),
    const ChineseColor(name: '鸦青', color: Color(0xFF424C50)),
  ];

  static ChineseColor getRandomColor() {
    final random = Random();
    return colors[random.nextInt(colors.length)];
  }
}