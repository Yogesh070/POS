import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:pos/components/primary_button.dart';
import 'package:pos/components/secondary_button.dart';
import 'package:pos/controller/settings_controller.dart';
import 'package:pos/webview/components/header_container.dart';

import 'package:provider/provider.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({Key? key}) : super(key: key);

  @override
  _FeaturesPageState createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  @override
  Widget build(BuildContext context) {
    var _controller = Provider.of<SettingController>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 580,
      child: Column(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              children: [
                HeaderContainer(title: 'Features'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
                    child: ListView.builder(
                      itemCount: _controller.featureOptionList.length,
                      itemBuilder: (context, int index) {
                        return ListTile(
                          horizontalTitleGap: 0,
                          dense: true,
                          title: Text(
                            _controller.featureOptionList[index].title!,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          subtitle: Padding(
                            padding: EdgeInsets.only(top: 8),
                            child: Text(
                              _controller.featureOptionList[index].subtitle!,
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                          trailing: Transform.scale(
                            scale: 0.5,
                            child: CupertinoSwitch(
                              trackColor: Colors.black,
                              value: _controller.featureOptionList[index].isOn!,
                              onChanged: (val) {
                                _controller.changeSwitchValue(index);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SecondaryButton(
                  title: 'Cancel',
                  onPressed: () {},
                ),
                SizedBox(
                  width: 16,
                ),
                PrimaryButton(
                  title: 'Save',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
