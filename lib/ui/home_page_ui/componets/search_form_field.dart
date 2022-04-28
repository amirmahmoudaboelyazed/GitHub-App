import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../home_cubit/home_cubit.dart';


Widget loginTextFormField(TextEditingController searchController,BuildContext context) {
  return TextFormField(
    textAlign: TextAlign.right,
    controller: searchController,
    textDirection: TextDirection.rtl,
    keyboardType: TextInputType.emailAddress,
    onChanged: (v){
      HomeCubit.get(context).search(language: v);
    },
    decoration: const InputDecoration(
      prefixIcon: Icon(
        Icons.search,
        color: MyColors.myLightBlack,
      ),
      hintTextDirection: TextDirection.rtl,
      border: OutlineInputBorder(),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: MyColors.myLightBlack),
      ),
      labelText: "Search By programming language",
      labelStyle: TextStyle(color: MyColors.myLightBlack),
      alignLabelWithHint: true,
    ),
  );
}