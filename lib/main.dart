import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'api/api_google_sheets.dart';
import 'provider/contact_form_provider.dart';
import 'provider/home_page_provider.dart';
import 'router/router.dart';
import 'ui/shared/localization_translate.dart';

void main() async {
  //Inicio del widgets de Google Sheets
  WidgetsFlutterBinding.ensureInitialized();
  // Llamada del servicio de Google Sheets
  await ApiGoogleSheets.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);
  //Uso global del provider
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageProvider()),
        ChangeNotifierProvider(create: (_) => ContactFormProvider())
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();

  //clase que selecciona la traducción
  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state!.changeLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale.fromSubtags(languageCode: 'es');

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    final localizationTranslate = LocalizationTranslate();
    final localeKey = await localizationTranslate.readLocaleKey();
    if (localeKey == 'en') {
      _locale = const Locale('en', 'EN');
    } else {
      _locale = const Locale.fromSubtags(languageCode: 'es');
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    Flurorouter.configureRoute();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portafolio | Jimmy Muñoz',
      //Configuracón de idiomas
      supportedLocales: const [
        Locale('en', 'US'), //English
        Locale.fromSubtags(languageCode: 'es'), //Español
      ],
      localizationsDelegates: const [
        // delegate from localization package.
        LocalizationTranslate.delegate,
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocalesLanguage in supportedLocales) {
          if (supportedLocalesLanguage.languageCode == locale?.languageCode &&
              supportedLocalesLanguage.countryCode == locale?.countryCode) {
            return supportedLocalesLanguage;
          }
        }
        return supportedLocales.first;
      },
      // llama las rutas del routes inicial
      initialRoute: '/home',
      //Ruta y página
      // routes: {'/home': (_) => HomePage()},
      //uso del paquete Fluro para llamar las rutas de navegación 'views'
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}
