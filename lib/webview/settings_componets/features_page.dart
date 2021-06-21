import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pos/webview/features%20model/features_items_model.dart';

class FeaturesPage extends StatefulWidget {
  const FeaturesPage({Key? key}) : super(key: key);

  @override
  _FeaturesPageState createState() => _FeaturesPageState();
}

class _FeaturesPageState extends State<FeaturesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      height: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 18, top: 16, bottom: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xffE0E0E0),
                ),
              ),
            ),
            child: Text(
              'Features',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              padding: EdgeInsets.only(left: 40, right: 40, top: 6),
              child: ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: featuresItems.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: ListTile(
                      contentPadding: EdgeInsets.only(bottom: 2),
                      dense: true,
                      title: Text(
                        featuresItems[index].featureItem,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          featuresItems[index].featureDescription,
                          style: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      trailing: Transform.scale(
                        scale: 0.4,
                        child: CupertinoSwitch(
                          trackColor: Colors.black,
                          value: featuresItems[index].statusFeature,
                          onChanged: (bool value) {
                            setState(() {
                              featuresItems[index].statusFeature =
                                  !featuresItems[index].statusFeature;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(right: 50, top: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xffDADADA),
                      onPrimary: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                    ),
                    onPressed: () {},
                    child: Text('Cancel'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff30B700),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    ),
                    onPressed: () {},
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
