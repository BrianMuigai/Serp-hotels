// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:buenro_hotels/features/hotels/presentation/pages/full_image_screen.dart'
    as _i1;
import 'package:buenro_hotels/main_screen.dart' as _i2;
import 'package:flutter/material.dart' as _i4;

/// generated route for
/// [_i1.FullImageScreen]
class FullImageRoute extends _i3.PageRouteInfo<FullImageRouteArgs> {
  FullImageRoute({
    _i4.Key? key,
    required _i1.FullImageViewArgs args,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          FullImageRoute.name,
          args: FullImageRouteArgs(
            key: key,
            args: args,
          ),
          initialChildren: children,
        );

  static const String name = 'FullImageRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FullImageRouteArgs>();
      return _i1.FullImageScreen(
        key: args.key,
        args: args.args,
      );
    },
  );
}

class FullImageRouteArgs {
  const FullImageRouteArgs({
    this.key,
    required this.args,
  });

  final _i4.Key? key;

  final _i1.FullImageViewArgs args;

  @override
  String toString() {
    return 'FullImageRouteArgs{key: $key, args: $args}';
  }
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i3.PageRouteInfo<void> {
  const MainRoute({List<_i3.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return const _i2.MainScreen();
    },
  );
}
