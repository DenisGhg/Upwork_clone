import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LoginWithIcloudOnandroidPage extends StatelessWidget {
  LoginWithIcloudOnandroidPage({super.key});

  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onHttpError: (HttpResponseError error) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
            return NavigationDecision.navigate;
        },
     ),
  )
  ..loadRequest(Uri.parse('https://www.icloud.com'));


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_sharp, color: Colors.white,),
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
