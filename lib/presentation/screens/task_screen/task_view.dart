import 'package:flutter/material.dart';
import 'package:task_1_responsive/application/app_data.dart';
import 'package:task_1_responsive/presentation/managers/value_manager.dart';
import 'package:task_1_responsive/presentation/screens/task_screen/task_modules.dart';

class TaskView extends StatelessWidget {
  const TaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    int numbOfList = listOfIconsAndStringsBottoms.length;
    return SafeArea(
      child: Scaffold(
        appBar: appBarTask(),
        body: SingleChildScrollView(
          controller: scrollController,
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.all(AppSize.s12),
            child: Column(
              children: [
                sliderTask(context),
                const SizedBox(height: 25),
                gridViewWidget(context),
                ((listOfIconsAndStringsBottoms.length.isOdd &&
                    AppData(context).mediaQueryOf.orientation ==
                        Orientation.portrait) ||
                    (listOfIconsAndStringsBottoms.length.isOdd &&
                        AppData(context).mediaQueryOf.orientation ==
                            Orientation.landscape &&
                        listOfIconsAndStringsBottoms.length % 3 == 1))
                    ? bottomTask(
                  context: context,
                  text: listOfIconsAndStringsBottoms[numbOfList - 1]['text'],
                  icon: listOfIconsAndStringsBottoms[numbOfList - 1]['icon'],
                )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
