// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:fitness_dashboard_ui/screencheck.dart' as _i5;
import 'package:fitness_dashboard_ui/screenhomepagecheck.dart' as _i3;
import 'package:fitness_dashboard_ui/screens/main_screen.dart' as _i9;
import 'package:fitness_dashboard_ui/screens/mobile/pages/contactUs.page.dart'
    as _i2;
import 'package:fitness_dashboard_ui/screens/mobile/pages/moisture.page.dart'
    as _i1;
import 'package:fitness_dashboard_ui/screens/mobile/pages/servererrorpage.dart'
    as _i6;
import 'package:fitness_dashboard_ui/screens/mobile/pages/soilNPK.page.dart'
    as _i7;
import 'package:fitness_dashboard_ui/widgets/loginpage.dart' as _i10;
import 'package:fitness_dashboard_ui/widgets/mobileloginpage.dart' as _i4;
import 'package:fitness_dashboard_ui/widgets/moisture.page.dart' as _i8;
import 'package:fitness_dashboard_ui/widgets/soilNPK.page.dart' as _i11;
import 'package:flutter/material.dart' as _i13;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<CommonGraphPageArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    ContactPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContactPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    MobileLoginPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MobileLoginPage(),
      );
    },
    ResponsivePage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ResponsivePage(),
      );
    },
    ServerErrorPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ServerErrorPage(),
      );
    },
    SoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<SoilNpkPageArgs>(
          orElse: () => const SoilNpkPageArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SoilNpkPage(key: args.key),
      );
    },
    WebCommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<WebCommonGraphPageArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WebCommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    WebHomePage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.WebHomePage(),
      );
    },
    WebLoginPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.WebLoginPage(),
      );
    },
    WebSoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<WebSoilNpkPageArgs>(
          orElse: () => const WebSoilNpkPageArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.WebSoilNpkPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CommonGraphPage]
class CommonGraphPage extends _i12.PageRouteInfo<CommonGraphPageArgs> {
  CommonGraphPage({
    _i13.Key? key,
    required int index,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CommonGraphPage.name,
          args: CommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonGraphPage';

  static const _i12.PageInfo<CommonGraphPageArgs> page =
      _i12.PageInfo<CommonGraphPageArgs>(name);
}

class CommonGraphPageArgs {
  const CommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i13.Key? key;

  final int index;

  @override
  String toString() {
    return 'CommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i2.ContactPage]
class ContactPage extends _i12.PageRouteInfo<void> {
  const ContactPage({List<_i12.PageRouteInfo>? children})
      : super(
          ContactPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i12.PageRouteInfo<void> {
  const HomePage({List<_i12.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MobileLoginPage]
class MobileLoginPage extends _i12.PageRouteInfo<void> {
  const MobileLoginPage({List<_i12.PageRouteInfo>? children})
      : super(
          MobileLoginPage.name,
          initialChildren: children,
        );

  static const String name = 'MobileLoginPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ResponsivePage]
class ResponsivePage extends _i12.PageRouteInfo<void> {
  const ResponsivePage({List<_i12.PageRouteInfo>? children})
      : super(
          ResponsivePage.name,
          initialChildren: children,
        );

  static const String name = 'ResponsivePage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ServerErrorPage]
class ServerErrorPage extends _i12.PageRouteInfo<void> {
  const ServerErrorPage({List<_i12.PageRouteInfo>? children})
      : super(
          ServerErrorPage.name,
          initialChildren: children,
        );

  static const String name = 'ServerErrorPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SoilNpkPage]
class SoilNpkPage extends _i12.PageRouteInfo<SoilNpkPageArgs> {
  SoilNpkPage({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          SoilNpkPage.name,
          args: SoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SoilNpkPage';

  static const _i12.PageInfo<SoilNpkPageArgs> page =
      _i12.PageInfo<SoilNpkPageArgs>(name);
}

class SoilNpkPageArgs {
  const SoilNpkPageArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'SoilNpkPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i8.WebCommonGraphPage]
class WebCommonGraphPage extends _i12.PageRouteInfo<WebCommonGraphPageArgs> {
  WebCommonGraphPage({
    _i13.Key? key,
    required int index,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          WebCommonGraphPage.name,
          args: WebCommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'WebCommonGraphPage';

  static const _i12.PageInfo<WebCommonGraphPageArgs> page =
      _i12.PageInfo<WebCommonGraphPageArgs>(name);
}

class WebCommonGraphPageArgs {
  const WebCommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i13.Key? key;

  final int index;

  @override
  String toString() {
    return 'WebCommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i9.WebHomePage]
class WebHomePage extends _i12.PageRouteInfo<void> {
  const WebHomePage({List<_i12.PageRouteInfo>? children})
      : super(
          WebHomePage.name,
          initialChildren: children,
        );

  static const String name = 'WebHomePage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.WebLoginPage]
class WebLoginPage extends _i12.PageRouteInfo<void> {
  const WebLoginPage({List<_i12.PageRouteInfo>? children})
      : super(
          WebLoginPage.name,
          initialChildren: children,
        );

  static const String name = 'WebLoginPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i11.WebSoilNpkPage]
class WebSoilNpkPage extends _i12.PageRouteInfo<WebSoilNpkPageArgs> {
  WebSoilNpkPage({
    _i13.Key? key,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          WebSoilNpkPage.name,
          args: WebSoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WebSoilNpkPage';

  static const _i12.PageInfo<WebSoilNpkPageArgs> page =
      _i12.PageInfo<WebSoilNpkPageArgs>(name);
}

class WebSoilNpkPageArgs {
  const WebSoilNpkPageArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'WebSoilNpkPageArgs{key: $key}';
  }
}
