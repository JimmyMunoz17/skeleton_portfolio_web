import 'package:fluro/fluro.dart';
import 'route_handler.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  static void configureRoute() {
    // Ruta Page home
    router.define('/:page',
        handler: homePageHandler, transitionType: TransitionType.fadeIn);
    //Ruta 404
    router.notFoundHandler = pageNotFoundHandler;
  }
}
