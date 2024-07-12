// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:fitness_dashboard_ui/screencheck.dart' as _i4;
import 'package:fitness_dashboard_ui/screens/mobile/pages/contactUs.page.dart'
    as _i2;
import 'package:fitness_dashboard_ui/screens/mobile/pages/dashboard.dart'
    as _i3;
import 'package:fitness_dashboard_ui/screens/mobile/pages/moisture.page.dart'
    as _i1;
import 'package:fitness_dashboard_ui/screens/mobile/pages/servererrorpage.dart'
    as _i5;
import 'package:fitness_dashboard_ui/screens/mobile/pages/soilNPK.page.dart'
    as _i6;
import 'package:fitness_dashboard_ui/widgets/moisture.page.dart' as _i7;
import 'package:fitness_dashboard_ui/widgets/soilNPK.page.dart' as _i8;
import 'package:flutter/material.dart' as _i10;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<CommonGraphPageArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.CommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    ContactPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ContactPage(),
      );
    },
    HomePage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
    ResponsivePage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.ResponsivePage(),
      );
    },
    ServerErrorPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.ServerErrorPage(),
      );
    },
    SoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<SoilNpkPageArgs>(
          orElse: () => const SoilNpkPageArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.SoilNpkPage(key: args.key),
      );
    },
    WebCommonGraphPage.name: (routeData) {
      final args = routeData.argsAs<WebCommonGraphPageArgs>();
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.WebCommonGraphPage(
          key: args.key,
          index: args.index,
        ),
      );
    },
    WebSoilNpkPage.name: (routeData) {
      final args = routeData.argsAs<WebSoilNpkPageArgs>(
          orElse: () => const WebSoilNpkPageArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WebSoilNpkPage(key: args.key),
      );
    },
  };
}

/// generated route for
/// [_i1.CommonGraphPage]
class CommonGraphPage extends _i9.PageRouteInfo<CommonGraphPageArgs> {
  CommonGraphPage({
    _i10.Key? key,
    required int index,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CommonGraphPage.name,
          args: CommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'CommonGraphPage';

  static const _i9.PageInfo<CommonGraphPageArgs> page =
      _i9.PageInfo<CommonGraphPageArgs>(name);
}

class CommonGraphPageArgs {
  const CommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i10.Key? key;

  final int index;

  @override
  String toString() {
    return 'CommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i2.ContactPage]
class ContactPage extends _i9.PageRouteInfo<void> {
  const ContactPage({List<_i9.PageRouteInfo>? children})
      : super(
          ContactPage.name,
          initialChildren: children,
        );

  static const String name = 'ContactPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i9.PageRouteInfo<void> {
  const HomePage({List<_i9.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.ResponsivePage]
class ResponsivePage extends _i9.PageRouteInfo<void> {
  const ResponsivePage({List<_i9.PageRouteInfo>? children})
      : super(
          ResponsivePage.name,
          initialChildren: children,
        );

  static const String name = 'ResponsivePage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.ServerErrorPage]
class ServerErrorPage extends _i9.PageRouteInfo<void> {
  const ServerErrorPage({List<_i9.PageRouteInfo>? children})
      : super(
          ServerErrorPage.name,
          initialChildren: children,
        );

  static const String name = 'ServerErrorPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SoilNpkPage]
class SoilNpkPage extends _i9.PageRouteInfo<SoilNpkPageArgs> {
  SoilNpkPage({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          SoilNpkPage.name,
          args: SoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SoilNpkPage';

  static const _i9.PageInfo<SoilNpkPageArgs> page =
      _i9.PageInfo<SoilNpkPageArgs>(name);
}

class SoilNpkPageArgs {
  const SoilNpkPageArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SoilNpkPageArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.WebCommonGraphPage]
class WebCommonGraphPage extends _i9.PageRouteInfo<WebCommonGraphPageArgs> {
  WebCommonGraphPage({
    _i10.Key? key,
    required int index,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          WebCommonGraphPage.name,
          args: WebCommonGraphPageArgs(
            key: key,
            index: index,
          ),
          initialChildren: children,
        );

  static const String name = 'WebCommonGraphPage';

  static const _i9.PageInfo<WebCommonGraphPageArgs> page =
      _i9.PageInfo<WebCommonGraphPageArgs>(name);
}

class WebCommonGraphPageArgs {
  const WebCommonGraphPageArgs({
    this.key,
    required this.index,
  });

  final _i10.Key? key;

  final int index;

  @override
  String toString() {
    return 'WebCommonGraphPageArgs{key: $key, index: $index}';
  }
}

/// generated route for
/// [_i8.WebSoilNpkPage]
class WebSoilNpkPage extends _i9.PageRouteInfo<WebSoilNpkPageArgs> {
  WebSoilNpkPage({
    _i10.Key? key,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          WebSoilNpkPage.name,
          args: WebSoilNpkPageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'WebSoilNpkPage';

  static const _i9.PageInfo<WebSoilNpkPageArgs> page =
      _i9.PageInfo<WebSoilNpkPageArgs>(name);
}

class WebSoilNpkPageArgs {
  const WebSoilNpkPageArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'WebSoilNpkPageArgs{key: $key}';
  }
}
