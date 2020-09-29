import 'dart:io';

///获取当前所在目录
String localePath() {
  final envVarMap = Platform.environment;
  return envVarMap['PWD'];
}

bool isDartFile(String path) {
  return path.endsWith('.dart');
}

///import 'package:crouter/src/bean/page_bean.dart';
String import(String package, String path) {
  return '''import \'package:${package}${path}\';\n''';
}

///author: cheng
///date: 2020/9/28
///time: 2:05 PM
///desc: 导入WidgetBuilder
String importWidgets() {
  return 'import \'package:flutter/widgets.dart\';\n';
}

String pageStr(String pageName, String className) {
  return '\'$pageName\':(context) => ${className}(),\n';
}

String moduleClassPage(String routeName) {
  return 'static const String ${routeName.split('/').last} = \'$routeName\';\n';
}

String moduleClass(String moduleName, String pages) {
  final first = moduleName.substring(0, 1);
  final name =  moduleName.replaceFirst(first, first.toUpperCase());
  return '''
  class $name{
  $name._();
  
  $pages
  
  }
  ''';
}

///author: cheng
///date: 2020/9/28
///time: 2:07 PM
///desc: class 字符串
String routeClass(String pages) {
  return '''
     ${importWidgets()}
    class RouteList{
     static final routeMap =<String,WidgetBuilder>{
       $pages
     };
    }
  ''';
}