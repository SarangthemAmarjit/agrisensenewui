// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:fitness_dashboard_ui/authcheck.dart' as _i1;
import 'package:fitness_dashboard_ui/screencheck.dart' as _i4;
import 'package:fitness_dashboard_ui/screens/main_screen.dart' as _i8;
import 'package:fitness_dashboard_ui/screens/mobile/pages/moisture.page.dart'
    as _i2;
import 'package:fitness_dashboard_ui/screens/mobile/pages/servererrorpage.dart'
    as _i5;
import 'package:fitness_dashboard_ui/screens/mobile/pages/soilNPK.page.dart'
    as _i6;
import 'package:fitness_dashboard_ui/widgets/loginpage.dart' as _i9;
import 'package:fitness_dashboard_ui/widgets/mobileloginpage.dart' as _i3;
import 'package:fitness_dashboard_ui/widgets/moisture.page.dart' as _i7;
import 'package:fitness_dashboard_ui/widgets/soilNPK.page.dart' as _i10;
import 'package:flutter/cupertino.dart' as _i13;
import 'package:flutter/material.dart' as _i12;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    AuthcheckPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.AuthcheckPage(),
      );
    },
    CommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<CommonGraphPageArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    MobileLoginPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MobileLoginPage(),
      );
    },
    ResponsivePage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ResponsivePage(),
      );
    },
    ServerErrorPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ServerErrorPage(),
      );
    },
    SoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<SoilNpkPageArgs>(
          orElse: () => const SoilNpkPageArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SoilNpkPage(key: args.key),
      );
    },
    WebCommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<WebCommonGraphPageArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WebCommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    WebHomePage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WebHomePage(),
      );
    },
    WebLoginPage.name: (routeData) {
      final args = routeData.argsAs<WebLoginPageArgs>(
          orElse: () => const WebLoginPageArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WebLoginPage(key: args.key),
      );
    },
    WebSoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<WebSoilNpkPageArgs>(
          orElse: () => const WebSoilNpkPageArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WebSoilNpkPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.AuthcheckPage]
class AuthcheckPage extends _i11.PageRouteInfo<void> {
  const AuthcheckPage({List<_i11.PageRouteInfo>? children})
      : super(
          AuthcheckPage.name,
          initialChildren: children,
        );

  static const String name = 'AuthcheckPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CommonGraphPage]
class CommonGraphPage extends _i11.PageRouteInfo<CommonGraphPageArgs> {
  CommonGraphPage({
    _i12.Key? key,
    required int index,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          CommonGraphPage.name,
          args: CommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonGraphPage';

  static const _i11.PageInfo<CommonGraphPageArgs> page =
      _i11.PageInfo<CommonGraphPageArgs>(name);
}

class CommonGraphPageArgs {
  const CommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i12.Key? key;

  final int index;

  @override
  String toString() {
    return 'CommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i3.MobileLoginPage]
class MobileLoginPage extends _i11.PageRouteInfo<void> {
  const MobileLoginPage({List<_i11.PageRouteInfo>? children})
      : super(
          MobileLoginPage.name,
          initialChildren: children,
        );

  static const String name = 'MobileLoginPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ResponsivePage]
class ResponsivePage extends _i11.PageRouteInfo<void> {
  const ResponsivePage({List<_i11.PageRouteInfo>? children})
      : super(
          ResponsivePage.name,
          initialChildren: children,
        );

  static const String name = 'ResponsivePage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ServerErrorPage]
class ServerErrorPage extends _i11.PageRouteInfo<void> {
  const ServerErrorPage({List<_i11.PageRouteInfo>? children})
      : super(
          ServerErrorPage.name,
          initialChildren: children,
        );

  static const String name = 'ServerErrorPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SoilNpkPage]
class SoilNpkPage extends _i11.PageRouteInfo<SoilNpkPageArgs> {
  SoilNpkPage({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SoilNpkPage.name,
          args: SoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SoilNpkPage';

  static const _i11.PageInfo<SoilNpkPageArgs> page =
      _i11.PageInfo<SoilNpkPageArgs>(name);
}

class SoilNpkPageArgs {
  const SoilNpkPageArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'SoilNpkPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.WebCommonGraphPage]
class WebCommonGraphPage extends _i11.PageRouteInfo<WebCommonGraphPageArgs> {
  WebCommonGraphPage({
    _i12.Key? key,
    required int index,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          WebCommonGraphPage.name,
          args: WebCommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'WebCommonGraphPage';

  static const _i11.PageInfo<WebCommonGraphPageArgs> page =
      _i11.PageInfo<WebCommonGraphPageArgs>(name);
}

class WebCommonGraphPageArgs {
  const WebCommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i12.Key? key;

  final int index;

  @override
  String toString() {
    return 'WebCommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i8.WebHomePage]
class WebHomePage extends _i11.PageRouteInfo<void> {
  const WebHomePage({List<_i11.PageRouteInfo>? children})
      : super(
          WebHomePage.name,
          initialChildren: children,
        );

  static const String name = 'WebHomePage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.WebLoginPage]
class WebLoginPage extends _i11.PageRouteInfo<WebLoginPageArgs> {
  WebLoginPage({
    _i13.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          WebLoginPage.name,
          args: WebLoginPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WebLoginPage';

  static const _i11.PageInfo<WebLoginPageArgs> page =
      _i11.PageInfo<WebLoginPageArgs>(name);
}

class WebLoginPageArgs {
  const WebLoginPageArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'WebLoginPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i10.WebSoilNpkPage]
class WebSoilNpkPage extends _i11.PageRouteInfo<WebSoilNpkPageArgs> {
  WebSoilNpkPage({
    _i12.Key? key,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          WebSoilNpkPage.name,
          args: WebSoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WebSoilNpkPage';

  static const _i11.PageInfo<WebSoilNpkPageArgs> page =
      _i11.PageInfo<WebSoilNpkPageArgs>(name);
}

class WebSoilNpkPageArgs {
  const WebSoilNpkPageArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'WebSoilNpkPageArgs{key: $key}';
  }
}
