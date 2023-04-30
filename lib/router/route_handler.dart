import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';
import '../provider/home_page_provider.dart';
import '../ui/pages/home_page.dart';

// Handlers --> Manejadores "ejecuta cuando el navegador ingrese a la ruta" y verificaciones de los elementos o parámetros
//Manejado de la ruta Home
final homePageHandler = Handler(handlerFunc: (context, parameters) {
  //Busca el parámetro del page
  final page = parameters['page']!.first;
  if (page != '/') {
    //Manejador del provider
    final homePageProvider =
        Provider.of<HomePageProvider>(context!, listen: false);
    //Asignación de página
    homePageProvider.createScrollController(page);
    return const HomePage();
  }
  return null;
});

//Manejador de la ruta 404
final pageNotFoundHandler = Handler(handlerFunc: (context, parameters) {
  //Busca el parámetro del page
  final page = parameters['page'];
  // ignore: unrelated_type_equality_checks
  if (page != '/' || page == null) {
    //Manejador del provider
    final homePageProvider =
        Provider.of<HomePageProvider>(context!, listen: false);
    //Asignación de página
    homePageProvider.createScrollController("homePage");
    return const HomePage();
  }
  return null;
});
