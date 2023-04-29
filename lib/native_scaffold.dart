import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A native scaffold widget that adapts to different platforms (iOS and Android).
class NativeScaffold extends StatelessWidget {
  /// The title for the app bar or navigation bar.
  final String title;

  /// An action widget displayed at the end of the app bar or navigation bar.
  final Widget? action;

  /// A leading widget displayed at the start of the app bar or navigation bar.
  final Widget? leading;

  /// The main content of the scaffold.
  final Widget child;

  /// Whether to show a large title on iOS. This shall only be used on iOS.
  final bool showLoargeTitleInIOS;

  /// Whether to pin the SliverAppBar in place when scrolling. This shall only be used on Android.
  final bool sliverAppBarPinned;

  /// A function to be called when the refresh gesture is triggered.
  final Function? onRefresh;

  /// A custom SliverAppBar widget. This shall only be used on Android.
  final Widget? sliverAppBarWidget;

  /// A widget to be displayed in the center of the app bar.
  final Widget? appBarCenterWidget;

  /// The height of the custom SliverAppBar widget.
  final double? sliverAppBarWidgetHeight;

  /// A widget to be used as the bottom navigation bar.
  final Widget? bottomFloatingBar;

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// Whether the app bar should be enabled.
  final bool? appBarEnabled;

  /// Creates a native scaffold widget.
  const NativeScaffold({
    Key? key,
    required this.title,
    this.action,
    this.leading,
    required this.child,
    this.showLoargeTitleInIOS = false,
    this.sliverAppBarPinned = true,
    this.onRefresh,
    this.sliverAppBarWidget,
    this.sliverAppBarWidgetHeight = 160.0,
    this.bottomFloatingBar,
    this.backgroundColor,
    this.appBarCenterWidget,
    this.appBarEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoScaffold(
            backgroundColor: backgroundColor,
            showLoargeTitleInIOS: showLoargeTitleInIOS,
            appBarEnabled: appBarEnabled,
            appBarCenterWidget: appBarCenterWidget,
            title: title,
            action: action,
            leading: leading,
            onRefresh: onRefresh,
            sliverAppBarWidget: sliverAppBarWidget,
            bottomFloatingBar: bottomFloatingBar,
            child: child,
          )
        : AndroidScaffold(
            backgroundColor: backgroundColor,
            sliverAppBarWidget: sliverAppBarWidget,
            appBarEnabled: appBarEnabled,
            appBarCenterWidget: appBarCenterWidget,
            title: title,
            action: action,
            leading: leading,
            onRefresh: onRefresh,
            sliverAppBarPinned: sliverAppBarPinned,
            sliverAppBarWidgetHeight: sliverAppBarWidgetHeight,
            bottomFloatingBar: bottomFloatingBar,
            child: child,
          );
  }
}

/// A custom Cupertino scaffold widget that adapts to different platforms (iOS).
class CupertinoScaffold extends StatelessWidget {
  /// Creates a Cupertino scaffold widget.
  const CupertinoScaffold({
    Key? key,
    required this.backgroundColor,
    required this.showLoargeTitleInIOS,
    required this.appBarEnabled,
    required this.appBarCenterWidget,
    required this.title,
    required this.action,
    required this.leading,
    required this.onRefresh,
    required this.sliverAppBarWidget,
    required this.child,
    required this.bottomFloatingBar,
  }) : super(key: key);

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// Whether to show a large title on iOS.
  final bool showLoargeTitleInIOS;

  /// Whether the app bar should be enabled.
  final bool? appBarEnabled;

  /// A widget to be displayed in the center of the app bar.
  final Widget? appBarCenterWidget;

  /// The title for the app bar or navigation bar.
  final String title;

  /// An action widget displayed at the end of the app bar or navigation bar.
  final Widget? action;

  /// A leading widget displayed at the start of the app bar or navigation bar.
  final Widget? leading;

  /// A function to be called when the refresh gesture is triggered.
  final Function? onRefresh;

  /// A custom SliverAppBar widget.
  final Widget? sliverAppBarWidget;

  /// The main content of the scaffold.
  final Widget child;

  /// A widget to be used as the bottom navigation bar.
  final Widget? bottomFloatingBar;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: backgroundColor,
      navigationBar: showLoargeTitleInIOS || !appBarEnabled!
          ? null
          : CupertinoNavigationBar(
              border: Border.all(color: Colors.transparent),
              middle: appBarCenterWidget ??
                  Text(
                    title,
                  ),
              trailing: action,
              leading: leading,
            ),
      child: showLoargeTitleInIOS
          ? Stack(
              children: [
                CupertinoScrollbar(
                  child: CustomScrollView(
                    slivers: [
                      !appBarEnabled!
                          ? Container()
                          : CupertinoSliverNavigationBar(
                              largeTitle: Text(title),
                              trailing: action,
                              leading: leading,
                            ),
                      if (onRefresh != null)
                        CupertinoSliverRefreshControl(
                          onRefresh: onRefresh as Future<void> Function()?,
                        ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            if (sliverAppBarWidget != null) sliverAppBarWidget!,
                            child,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                if (bottomFloatingBar != null) bottomFloatingBar!,
              ],
            )
          : SafeArea(
              bottom: false,
              child: Stack(
                children: [
                  CupertinoScrollbar(
                    child: CustomScrollView(
                      slivers: [
                        if (onRefresh != null)
                          CupertinoSliverRefreshControl(
                            onRefresh: onRefresh as Future<void> Function()?,
                          ),
                        SliverFillRemaining(
                          child: CupertinoScrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (sliverAppBarWidget != null)
                                    sliverAppBarWidget!,
                                  child,
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  if (bottomFloatingBar != null) bottomFloatingBar!,
                ],
              ),
            ),
    );
  }
}

/// A custom Android scaffold widget that adapts to different platforms (Android).
class AndroidScaffold extends StatelessWidget {
  /// Creates an Android scaffold widget.
  const AndroidScaffold({
    Key? key,
    required this.backgroundColor,
    required this.sliverAppBarWidget,
    required this.appBarEnabled,
    required this.appBarCenterWidget,
    required this.title,
    required this.action,
    required this.leading,
    required this.onRefresh,
    required this.sliverAppBarPinned,
    required this.sliverAppBarWidgetHeight,
    required this.child,
    required this.bottomFloatingBar,
  }) : super(key: key);

  /// The background color of the scaffold.
  final Color? backgroundColor;

  /// A custom SliverAppBar widget.
  final Widget? sliverAppBarWidget;

  /// Whether the app bar should be enabled.
  final bool? appBarEnabled;

  /// A widget to be displayed in the center of the app bar.
  final Widget? appBarCenterWidget;

  /// The title for the app bar.
  final String title;

  /// An action widget displayed at the end of the app bar.
  final Widget? action;

  /// A leading widget displayed at the start of the app bar.
  final Widget? leading;

  /// A function to be called when the refresh gesture is triggered.
  final Function? onRefresh;

  /// Whether to pin the SliverAppBar in place when scrolling.
  final bool sliverAppBarPinned;

  /// The height of the custom SliverAppBar widget.
  final double? sliverAppBarWidgetHeight;

  /// The main content of the scaffold.
  final Widget child;

  /// A widget to be used as the bottom navigation bar.
  final Widget? bottomFloatingBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.transparent,
      appBar: sliverAppBarWidget != null || !appBarEnabled!
          ? null
          : AppBar(
              title: appBarCenterWidget ??
                  Text(
                    title,
                  ),
              centerTitle: appBarCenterWidget == null ? true : false,
              titleSpacing: appBarCenterWidget == null ? null : 0.0,
              actions: [
                action ?? const SizedBox.shrink(),
              ],
              leading: leading,
            ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              if (onRefresh != null)
                SliverToBoxAdapter(
                  child: RefreshIndicator(
                    onRefresh: onRefresh as Future<void> Function(),
                    child: const SizedBox.shrink(),
                  ),
                ),
              if (sliverAppBarWidget != null && appBarEnabled!)
                SliverAppBar(
                  pinned: sliverAppBarPinned,
                  snap: false,
                  floating: false,
                  expandedHeight: sliverAppBarWidgetHeight,
                  flexibleSpace: FlexibleSpaceBar(
                    background: sliverAppBarWidget,
                  ),
                  leading: leading,
                  actions: [
                    action ?? const SizedBox.shrink(),
                  ],
                  title: Text(
                    title,
                  ),
                ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => child,
                  childCount: 1,
                ),
              ),
            ],
          ),
          if (bottomFloatingBar != null) bottomFloatingBar!,
        ],
      ),
    );
  }
}
