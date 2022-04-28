import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_app/constants/colors.dart';
import 'package:github_app/ui/home_page_ui/componets/list_view_item.dart';
import 'package:intl/intl.dart';
import 'componets/search_form_field.dart';
import 'home_cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int groupValue = 0;
  int numOfRepo = 100;

  Widget myRadioButton(title, value, onChanged) {
    return RadioListTile(
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
      title: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit()..getDate(),
        child: BlocConsumer<HomeCubit, HomeState>(
            listener: (context, state) {},
            builder: (context, state) {
              HomeCubit homeCubit = HomeCubit.get(context);
              return Scaffold(
                  appBar: AppBar(
                    backgroundColor: MyColors.myLightBlack,
                    title: const Text("GitHub App"),
                  ),
                  body: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: 80,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: loginTextFormField(
                                    homeCubit.searchController, context),
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.calendar_today,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2015),
                                    lastDate: DateTime(2025),
                                  ).then((selectedDate) {
                                    if (selectedDate != null) {
                                      homeCubit.getDateByDate(
                                          DateFormat('yyyy-MM-dd')
                                              .format(selectedDate));
                                    }
                                  });
                                },
                              )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: myRadioButton("100", 0, (_) {
                              setState(() {
                                groupValue = 0;
                                numOfRepo = 100;
                              });
                            }),
                          ),
                          Expanded(
                            child: myRadioButton("50", 1, (_) {
                              setState(() {
                                groupValue = 1;
                                numOfRepo = 50;
                              });
                            }),
                          ),
                          Expanded(
                            child: myRadioButton("10", 2, (_) {
                              setState(() {
                                groupValue = 2;
                                numOfRepo = 10;
                              });
                            }),
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: homeCubit.itemList.length >= numOfRepo
                                ? homeCubit.itemList
                                    .getRange(0, numOfRepo - 1)
                                    .length
                                : homeCubit.itemList.length,
                            itemBuilder: (context, index) {
                              return listViewItem(
                                homeCubit.itemList[index].owner!.avatarUrl,
                                homeCubit.itemList[index].name,
                                homeCubit.itemList[index].createdAt.toString().substring(0, 10),
                                homeCubit.itemList[index].language==null?"": homeCubit.itemList[index].language,
                              );
                            }),
                      ),
                    ],
                  ));
            }));
  }
}
