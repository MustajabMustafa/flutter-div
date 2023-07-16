import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import '../views/DashBoard.dart';

@StackedApp(
  routes: [
    MaterialRoute(
      page: Dashboard,
      initial: true,
    ),
  ],
  dependencies: [
    Singleton(classType: NavigationService),
    //LazySingleton(classType: CounterService)
  ],
)
class App {}
