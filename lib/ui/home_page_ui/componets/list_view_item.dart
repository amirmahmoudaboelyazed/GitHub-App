import 'package:flutter/material.dart';

import '../../../constants/colors.dart';

Widget listViewItem(avatarUrl, name, date,  language) {
  return Container(
    padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
    height: 120,
    child: Card(
      color: MyColors.myGray,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(avatarUrl),
              backgroundColor: Colors.transparent,
            ),
            const SizedBox(width: 30),
            Expanded(flex:2,child: Text(name,style: const TextStyle(color: MyColors.myLightBlack))),
            const SizedBox(width: 30),

            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Text(date,style: const TextStyle(color: MyColors.myLightBlack)),
                Text(language,style: const TextStyle(color: MyColors.myLightBlack)),


              ],),
            )
          ],
        ),
      ),
    ),
  );
}
