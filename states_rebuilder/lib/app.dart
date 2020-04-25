import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';
import 'package:states_rebuilder_sample/service/interfaces/i_todo_repository.dart';
import 'package:todos_app_core/todos_app_core.dart';
import 'localization.dart';
import 'service/todos_service.dart';
import 'ui/pages/add_edit_screen.dart/add_edit_screen.dart';
import 'ui/pages/home_screen/home_screen.dart';

class StatesRebuilderApp extends StatelessWidget {
  final ITodosRepository repository;

  const StatesRebuilderApp({Key key, this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //uncomment this line to consol log and see the notification timeline
    RM.printActiveRM = true;

    //
    //Injecting the TodoService globally before MaterialApp widget.
    //It will be available throughout all the widget tree even after navigation.
    return Injector(
      inject: [Inject(() => TodosService(repository))],
      builder: (_) => MaterialApp(
        title: StatesRebuilderLocalizations().appTitle,
        theme: ArchSampleTheme.theme,
        localizationsDelegates: [
          ArchSampleLocalizationsDelegate(),
          StatesRebuilderLocalizationsDelegate(),
        ],
        routes: {
          ArchSampleRoutes.home: (context) => HomeScreen(),
          ArchSampleRoutes.addTodo: (context) => AddEditPage(),
        },
      ),
    );
  }
}
