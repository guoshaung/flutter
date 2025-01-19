import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  late final WebViewController controller;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('Web资源加载错误: ${error.description}');
          },
        ),
      )
      ..loadRequest(
        Uri.parse('您的Streamlit应用URL'), // 替换为实际的Streamlit应用URL
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI助手'),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
