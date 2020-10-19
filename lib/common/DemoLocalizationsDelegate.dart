import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
// ignore: slash_for_doc_comments
/**
 * 本地化值由Localizations的 LocalizationsDelegates 列表加载 。 每个委托必须定义一个异步load() 方法，
 * 以生成封装了一系列本地化值的对象。通常这些对象为每个本地化值定义一个方法。
    在大型应用程序中，不同模块或Package可能会与自己的本地化值捆绑在一起。 这就是为什么要用Localizations 管理对象表的原因。 要使用由LocalizationsDelegate的load方法之一产生的对象，可以指定一个BuildContext和对象的类型来找到它。例如，Material 组件库的本地化字符串由MaterialLocalizations类定义，此类的实例由MaterialApp类提供的LocalizationDelegate创建， 它们可以如下方式获取到：

    Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    这个特殊的Localizations.of()表达式会经常使用，所以MaterialLocalizations类提供了一个便捷方法：

    static MaterialLocalizations of(BuildContext context) {
    return Localizations.of<MaterialLocalizations>(context, MaterialLocalizations);
    }
    // 可以直接调用便捷方法
    tooltip: MaterialLocalizations.of(context).backButtonTooltip,
 */
class DemoLocalizations {
  bool isZh = false;

  DemoLocalizations(this.isZh);

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  //Locale相关值，title为应用标题
  String get title {
    return isZh ? "Flutter应用" : "Flutter APP";
  }
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  @override
  bool isSupported(Locale locale) => ['en', 'zh'].contains(locale.languageCode);

  // Flutter会调用此类加载相应的Locale资源类
  @override
  Future<DemoLocalizations> load(Locale locale) {
    print("---------$locale");
    return SynchronousFuture<DemoLocalizations>(
        DemoLocalizations(locale.languageCode == 'zh'));
  }

  ///shouldReload的返回值决定当Localizations组件重新build时，是否调用load方法重新加载Locale资源。
  ///一般情况下，Locale资源只应该在Locale切换时加载一次，不需要每次在Localizations重新build时都加载，所以返回false即可。
  ///可能有些人会担心返回false的话在APP启动后用户再改变系统语言时load方法将不会被调用，所以Locale资源将不会被加载。
  ///事实上，每当Locale改变时Flutter都会再调用load方法加载新的Locale，无论shouldReload返回true还是false。
  @override
  bool shouldReload(LocalizationsDelegate old) => false;
}


