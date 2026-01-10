import 'package:flutter/material.dart';
import 'package:flutter_template/const/r.dart';
import 'package:flutter_template/utils/build_util.dart';

class SnapAppBar extends StatelessWidget {
  const SnapAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                floating: true,
                snap: true,
                expandedHeight: 200,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(R.ASSETS_APP_LOGO_WEBP, fit: BoxFit.cover),
                ),
                forceElevated: innerBoxIsScrolled,
              ),
            ),
          ];
        },
        body: Builder(
          builder: (BuildContext context) {
            return CustomScrollView(
              slivers: <Widget>[
                SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                ),
                buildSliverList(100),
              ],
            );
          },
        ),
      ),
    );
  }
}
