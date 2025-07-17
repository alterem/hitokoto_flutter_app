# 一言 Flutter 应用

一个简洁优雅的一言（Hitokoto）Flutter应用，随机展示一句来自网络的句子、诗词、歌词等，每次刷新都会随机更换中国传统颜色作为背景。

## 功能特点

- 从一言API获取随机名言、诗句、歌词等内容
- 优雅的UI设计，展示内容、来源和作者
- 使用中国传统色彩作为背景，每次刷新随机更换
- 支持下拉刷新和按钮刷新两种方式获取新内容
- 自动适应深色/浅色文字以提高可读性
- 多API端点支持，提高可用性

## 技术实现

- 使用Flutter框架开发，支持跨平台部署
- 采用Cupertino风格UI组件
- 实现了中国传统色彩库，包含100多种传统颜色
- 使用HTTP请求获取一言API数据
- 响应式设计，适配不同屏幕尺寸

## 安装与使用

### 环境要求

- Flutter 3.0.0 或更高版本
- Dart 2.17.0 或更高版本

### 安装步骤

1. 克隆仓库
   ```bash
   git clone https://github.com/alterem/hitokoto_flutter_app.git
   cd hitokoto_flutter_app
   ```

2. 获取依赖
   ```bash
   flutter pub get
   ```

3. 运行应用
   ```bash
   flutter run
   ```

## 截图

![img1](/imgs/Alterem-2025-07-17_15-51-19.jpg)

![img2](/imgs/Alterem-2025-07-17_16-16-34.jpg)

![img3](/imgs/Alterem-2025-07-17_15-51-32.jpg)

![img4](/imgs/Alterem-2025-07-17_15-51-43.jpg)

## API来源

本应用使用的一言API来自：
- 主API: https://v1.hitokoto.cn/
- 备用API: https://international.v1.hitokoto.cn/

感谢一言开发团队提供的API服务。

## 贡献指南

欢迎提交问题和功能请求！如果您想贡献代码：

1. Fork 本仓库
2. 创建您的特性分支 (`git checkout -b feature/amazing-feature`)
3. 提交您的更改 (`git commit -m 'Add some amazing feature'`)
4. 推送到分支 (`git push origin feature/amazing-feature`)
5. 打开一个 Pull Request

## 许可证

本项目采用 MIT 许可证 - 详情请参阅 [LICENSE](LICENSE) 文件