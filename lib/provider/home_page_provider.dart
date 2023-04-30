import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

//Manejador de estados provider page home
class HomePageProvider extends ChangeNotifier {
  PageController scrollController = PageController();
  final List<String> _pages = [
    'home',
    'aboutMe',
    'skill',
    'training',
    'proyect',
    'contact',
  ];

  int _currentIndex = 0;

  //Método de control de la Url de la página con el index
  createScrollController(String routeName) {
    // Recibe el nombre de la página inicial
    scrollController = PageController(initialPage: getPageIndex(routeName));
    // Escucha y conocer en que página se encuntra para manejo del scroll
    scrollController.addListener(() {
      final index = (scrollController.page ?? 0).round();
      //Se evita que se genere el error de carga con el _currentIndex creación repetitiva
      if (index != _currentIndex) {
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        _currentIndex = index;
        // print(index);
      }
    });
  }

  //Método que obtiene el index de la página
  getPageIndex(String routeName) {
    //si la ruta no es correcta envia un -1 y el ternario lo redirige al 0
    return (!_pages.contains(routeName)) ? 0 : _pages.indexOf(routeName);
  }

  //Método de navegación con el index
  goTo(int index) {
    //Coloca el nombre de la página en la url --> uso Universal html
    html.window.history.pushState(null, 'none', '#/${_pages[index]}');
    //Redirección de la página
    scrollController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  //Configuración del Menú Mobile

  bool _isOpen = false; //Estado del menú
  get getIsOpen => _isOpen;
  set setIsOpen(bool isMenu) {
    _isOpen = isMenu;
    notifyListeners();
  }
}
