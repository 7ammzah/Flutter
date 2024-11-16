import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:read_track_ask/constants/theme.dart';
import 'package:read_track_ask/services/authentication_with_social.dart';
import 'package:read_track_ask/services/firebase_operations.dart';
import 'package:read_track_ask/view/widgets/button.dart';

class UploadPost with ChangeNotifier {
  TextEditingController description = TextEditingController();

  editPostSheet(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0)), //this right here
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.2,
                  child: TextField(
                    maxLines: 5,
                    textCapitalization: TextCapitalization.words,
                    //inputFormatters: [LengthLimitingTextInputFormatter(100)],
                    //maxLength: 100,
                    controller: description,
                    style: Themes().gettitleStyle(black),
                    decoration: InputDecoration(
                        hintText: 'what you think',
                        hintStyle: Themes().getsubTitleStyle(grey)),
                  ),
                ),
                const SizedBox(height: 100),
                MyButton(
                  label: 'Share',
                  textColor: white,
                  backgroundColor: beige,
                  onTap: () {
                    Provider.of<FireBaseOpreations>(context, listen: false)
                        .uploadPost(
                      description.text,
                      {
                        'user_id':
                            Provider.of<AuthenticationWithSocialMediaApp>(
                                    context,
                                    listen: false)
                                .getUserUid,
                        'first_name': Provider.of<FireBaseOpreations>(context,
                                listen: false)
                            .getInitFirstName,
                        'last_name': Provider.of<FireBaseOpreations>(context,
                                listen: false)
                            .getInitLastName,
                        'email': Provider.of<FireBaseOpreations>(context,
                                listen: false)
                            .getInitUserEmail,
                        'description': description.text,
                        'user_image': Provider.of<FireBaseOpreations>(context,
                                listen: false)
                            .getInitUserImage,
                        'time': '${DateFormat.yMMMEd().format(DateTime.now())}'
                      },
                    ).whenComplete(
                      () {
                        Navigator.pop(context);
                        print('The post has uploaded!!!!!!!');
                        print(DateFormat.yMd().add_jm());
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
