import 'package:exercicio/exercise_state_management/app_task/bloc/theme_cubit.dart';
import 'package:exercicio/exercise_state_management/app_task/componets/bottomsheet.dart';
import 'package:exercicio/exercise_state_management/app_task/componets/card.dart';
import 'package:exercicio/exercise_state_management/app_task/resouces/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeTask extends StatelessWidget {
  const HomeTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'My task',
            style: GoogleFonts.abel(),
          ),
          leading: const Icon(Icons.task),
          actions: [
            IconButton(
              splashRadius: 10,
              onPressed: BlocProvider.of<ThemeModeCubit>(context).changeTheme,
              icon: BlocBuilder<ThemeModeCubit, ThemeData>(
                builder: (context, themeState) {
                  return Icon(themeState == ThemeTask.taskThemeLigth
                      ? Icons.dark_mode
                      : Icons.light_mode);
                },
              ),
            )
          ],
        ),
        body: const CardTask(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showModalBottomSheet(
              useRootNavigator: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(40),
                ),
              ),
              context: context,
              builder: (context) {
                return const CardBottomSheet();
              }),
          child: const Icon(Icons.add),
        ));
  }
}