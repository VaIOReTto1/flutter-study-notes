import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      //国际化
      localizationsDelegates: [
        //本地化代理
        CustomLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('zh', 'CN'),


      ],
      localeResolutionCallback: (locale,supportedLocales) {
        print('deviceLocale:${locale}');
        print('languageCode:${locale?.languageCode}');
        print('countryCode:${locale?.countryCode}');
        for(var supportedLocale in supportedLocales){
          if(supportedLocale.languageCode==locale?.languageCode&&supportedLocale.countryCode==locale?.countryCode){
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //title: const Text("learn1"),
        title: Text(Localizations.of(context, CustomLocalizations).t('title')),
        leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.settings)
        ],
        elevation: 10.0,
        centerTitle: true,
      ),
      body: Texti18n(),
    );
  }
}

class Texti18n extends StatelessWidget {
  const Texti18n({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        //'hello',
        //Localizations.of(context,CustomLocalizations).t("greet"),
        CustomLocalizations.of(context).t("greet").toString(),
        style: TextStyle(
          fontSize: 60
        ),
      ),
    );
  }
}

class CustomLocalizations{
  final Locale locale;

  CustomLocalizations(this.locale);

  // static final Map<String,Map<String,String>> _localizedValues={
  //   "en":{
  //     "title":"Home",
  //     "greet":"Hello"
  //   },
  //   "zh":{
  //     "title":"首页",
  //     "greet":"你好"
  //   },
  // };

  late Map<String,String> _localizedValues;

  Future<bool> loadJSON() async{
    String jsonString=await rootBundle.loadString('lang/${locale.languageCode}.json');
    Map<String,dynamic> jsonMap=json.decode(jsonString);

    _localizedValues=jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });

    return true;
  }

  String? t(String key){
    //_localizedValues['zh']['title']
    // return _localizedValues[locale.languageCode]![key!];
    return _localizedValues[key];
  }

  static CustomLocalizations of(BuildContext context){
    return Localizations.of(context,CustomLocalizations);
  }

  static CustomLocalizationsDelegate delegate=CustomLocalizationsDelegate();
}



class CustomLocalizationsDelegate extends LocalizationsDelegate<CustomLocalizations>{
  @override
  bool isSupported(Locale locale) {
    return ["en","zh"].contains(locale.languageCode);
  }

  @override
  Future<CustomLocalizations> load(Locale locale) async{
   //return SynchronousFuture(CustomLocalizations(locale));
    CustomLocalizations localizations=CustomLocalizations(locale);
    await localizations.loadJSON();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<CustomLocalizations> old) {
    return false;
  }
}