import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../provider/contact_form_provider.dart';
import '../../provider/home_page_provider.dart';
import '../shared/custom_decoration.dart';
import '../shared/custom_button_opt.dart';
import '../shared/custom_inputText.dart';
import '../shared/localization_translate.dart';

class ContactView extends StatelessWidget {
  const ContactView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //lista que obtiene las traducciones
    List<dynamic> option =
        LocalizationTranslate.of(context)!.translate('Contact');
    var items = List<String>.filled(5, '');
    for (var opt in option) {
      items[0] = opt['Title'];
      items[1] = opt['Message'];
      items[2] = opt['Button'];
      items[3] = opt['AlertText'];
      items[4] = opt['Alert'];
    }
    final contactFormProvider =
        Provider.of<ContactFormProvider>(context, listen: false);

    return Scaffold(
      body: Container(
        decoration: CustomDecoration.BoxDecorationContainerOpt1(),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              FittedBox(
                child: Text(
                  items[0],
                  style:
                      GoogleFonts.roboto(fontSize: 50, color: Colors.white70),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                  width: 1200,
                  height: 600,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Form(
                      //validación cuado se escribe
                      autovalidateMode: AutovalidateMode.always,
                      //llama al provider para tomar control del formulario
                      key: contactFormProvider.formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          FittedBox(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                items[1],
                                style: GoogleFonts.roboto(fontSize: 25),
                                maxLines: 2,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          //Nombre inputText
                          CustomInputText(
                            validatorTxt: (value) {
                              //Validación del ingreso del nombre
                              if (value == null || value.isEmpty) {
                                return 'Ingrese su nombre';
                              }
                              return null;
                            },
                            //Formato del inputText solo letras
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z-ñÑáÁéÉíÍóÓúÚ]')),
                            ],
                            keyboardType: TextInputType.name,
                            icon: const Icon(Icons.person),
                            hintText: 'Ingrese su Nombre',
                            labelText: 'Nombre | Name *',
                            onChanged: (value) =>
                                contactFormProvider.name = value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //Email inputText
                          CustomInputText(
                            //Validación del ingreso del email
                            validatorTxt: (value) {
                              if (!EmailValidator.validate(value ?? "")) {
                                return 'Email no válido';
                              }
                              return null;
                            },
                            //Formato del inputText restringe el ingreso de algunos datos
                            inputFormatters: [
                              FilteringTextInputFormatter.deny(
                                  RegExp(r'[ñÑáÁéÉíÍóÓúÚA-Z]'))
                            ],
                            keyboardType: TextInputType.emailAddress,
                            icon: const Icon(Icons.email),
                            hintText: 'Ingrese su e-mail',
                            labelText: 'E-mail *',
                            onChanged: (value) =>
                                contactFormProvider.email = value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          // Texto inputText
                          CustomInputText(
                            validatorTxt: (value) {
                              //Validación del ingreso del texto
                              if (value == null || value.isEmpty) {
                                return 'Ingrese el asunto';
                              }
                              return null;
                            },
                            //Formato del inputText solo letras
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[a-zA-Z-ñÑáÁéÉíÍóÓúÚ]')),
                            ],
                            keyboardType: TextInputType.text,
                            icon: const Icon(Icons.subject),
                            hintText: 'Ingrese el asunto',
                            labelText: 'Asunto | Subject *',
                            onChanged: (value) =>
                                contactFormProvider.subject = value,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          //Texto inputText
                          CustomInputText(
                            validatorTxt: (value) {
                              //Validación del ingreso del texto
                              if (value == null || value.isEmpty) {
                                return 'Ingrese su mensaje';
                              }
                              return null;
                            },
                            //Formato del inputText solo letras
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9a-zA-Z-ñÑáÁéÉíÍóÓúÚ ]')),
                            ],
                            keyboardType: TextInputType.text,
                            icon: const Icon(Icons.message),
                            hintText: 'Ingrese su mensaje',
                            labelText: 'Mensaje | Message*',
                            maxLines: 4,
                            onChanged: (value) =>
                                contactFormProvider.message = value,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          CustomButtonOpt(
                              text: items[2],
                              fontSizeText: 20,
                              sizeWidth: 200,
                              sizeHeight: 50,
                              borderRadius: 20,
                              onPressed: () async {
                                final isRegister =
                                    await contactFormProvider.validator();
                                if (isRegister) {
                                  // ignore: use_build_context_synchronously
                                  _alert(
                                      context, Text(items[3]), Text(items[4]));
                                  contactFormProvider.isRegister = false;
                                }
                              })
                        ],
                      ),
                    ),
                  )),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                color: Colors.white,
              ),
              SizedBox(
                width: double.infinity,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _ButtonCircle(
                            const AssetImage('images/logos/logo_github.png'),
                            'https://github.com/'),
                        const SizedBox(
                          width: 20,
                        ),
                        _ButtonCircle(
                            const AssetImage('images/logos/logo_linkedin.png'),
                            'https://www.linkedin.com/'),
                        const SizedBox(
                          width: 20,
                        ),
                        _ButtonCircle(
                            const AssetImage('images/icons/icon_email.png'),
                            'mailto:email@hotmail.com?subject=contacto portafolio&body=Gracias por contactarme.'),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Copyright © | Coded by Jimmy Muñoz',
                      style: GoogleFonts.roboto(
                          fontSize: 15, color: Colors.white70),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  _ButtonCircle(AssetImage urlImage, String url) {
    final Uri url0 = Uri.parse(url);
    return Material(
      color: Colors.white60,
      shape: const CircleBorder(),
      // borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () => url0.hasEmptyPath
            ? throw Exception('Error $url0')
            : launchUrl(url0),
        splashColor: Colors.blue[20],
        hoverColor: Colors.grey.withOpacity(0.4),
        child: Ink.image(
          image: urlImage,
          width: 30,
          height: 30,
          alignment: Alignment.bottomCenter,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  // alerta de registro
  _alert(BuildContext context, Text title, Text textAlert) {
    final homePageProvider =
        Provider.of<HomePageProvider>(context, listen: false);
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_sharp,
                  color: Colors.green,
                  size: 30,
                ),
                const SizedBox(
                  width: 15,
                ),
                title,
              ],
            ),
            titleTextStyle:
                GoogleFonts.roboto(fontSize: 22, color: Colors.black),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [textAlert],
            ),
            contentTextStyle:
                GoogleFonts.roboto(fontSize: 18, color: Colors.black),
            actions: [
              CustomButtonOpt(
                  text: 'Aceptar',
                  fontSizeText: 18,
                  sizeWidth: 120,
                  sizeHeight: 50,
                  borderRadius: 5,
                  onPressed: () {
                    Navigator.of(context).pop();
                    homePageProvider.goTo(0);
                  })
            ],
          );
        });
  }
}
