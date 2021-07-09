import 'package:flutter/material.dart';
import 'package:pos/components/receiptBody.dart';
import 'package:pos/webview/components/header_container.dart';

class ReceiptPage extends StatelessWidget {
  const ReceiptPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 300,
        minWidth: 500,
        maxWidth: 600,
        maxHeight: 500,
      ),
      // height: 300,
      child: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          showReceiptList(context),
        ],
      ),
    );
  }

  Container showReceiptList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderContainer(
            title: 'Receipt',
          ),
          Expanded(
            child: ReceiptBody(),
          ),
        ],
      ),
    );
  }
}
