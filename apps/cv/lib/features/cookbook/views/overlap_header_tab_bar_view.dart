// ignore_for_file: omit_local_variable_types, prefer_final_locals

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/router/go_router_provider.dart';
import '../../../config/theme/text_styles.dart';

final _nestedScrollViewKey = GlobalKey<State<StatefulWidget>>(debugLabel: 'nestedScrollViewKey');

class OverlapHeaderTabBarView extends HookConsumerWidget {
  const OverlapHeaderTabBarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nestedScrollController = useScrollController();

    return Scaffold(
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          physics: const ClampingScrollPhysics(),
          floatHeaderSlivers: true,
          key: _nestedScrollViewKey,
          controller: nestedScrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: _AppBarWithTabBar(innerBoxIsScrolled: innerBoxIsScrolled),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              _ExampleListWidget(tabIndex: 1),
              _ExampleListWidget(tabIndex: 2),
              _ExampleListWidget(tabIndex: 3),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.small(
        elevation: 0,
        shape: const CircleBorder(),
        onPressed: ref.watch(goRouterProvider).pop,
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}

class _ExampleListWidget extends StatefulHookWidget {
  const _ExampleListWidget({
    required this.tabIndex,
  });

  final int tabIndex;

  @override
  State<_ExampleListWidget> createState() => _ExampleListWidgetState();
}

class _ExampleListWidgetState extends State<_ExampleListWidget> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final customScrollController = useScrollController();
    final scrollOffset = useState<double>(0);

    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        ScrollAbsorber.absorbScrollNotification(notification, _nestedScrollViewKey);
        scrollOffset.value = notification.metrics.pixels;
        return true;
      },
      child: CustomScrollView(
        controller: customScrollController,
        slivers: [
          DecoratedSliver(
            decoration: const BoxDecoration(color: Colors.transparent),
            sliver: SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
          ),
          _MySliverPullToRefreshWidget(
            scrollOffset: scrollOffset.value,
            onRefresh: () async {
              await Future<void>.delayed(const Duration(seconds: 2));
            },
          ),
          SliverList.builder(
            itemBuilder: (context, index) {
              return Card(
                color: Colors.primaries[(index + widget.tabIndex) % Colors.primaries.length],
                child: ListTile(
                  title: Text(
                    'Item $index',
                    style: s20W400,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class _MySliverPullToRefreshWidget extends HookWidget {
  const _MySliverPullToRefreshWidget({
    required this.scrollOffset,
    required this.onRefresh,
  });

  final Future<void> Function() onRefresh;
  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    final isRefresh = useState<bool>(false);
    final animationController = useAnimationController(duration: const Duration(milliseconds: 200));

    Future<void> _onRefresh(double scrollOffset) async {
      if (scrollOffset < -200 && !isRefresh.value) {
        isRefresh.value = true;
        await animationController.forward();
        await onRefresh();
        isRefresh.value = false;
        await animationController.reverse();
      }
    }

    useEffect(
      () {
        _onRefresh(scrollOffset);
        return null;
      },
      [scrollOffset],
    );

    return SliverToBoxAdapter(
      child: AnimatedBuilder(
        animation: animationController,
        builder: (context, _) {
          return AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 200),
            height: animationController.value * 100,
            child: Transform.translate(
              offset: Offset(0, -100 + animationController.value * 100),
              child: const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.red,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

@immutable
final class _AppBarWithTabBar extends ConsumerWidget {
  const _AppBarWithTabBar({required this.innerBoxIsScrolled});

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      forceElevated: innerBoxIsScrolled,
      automaticallyImplyLeading: false,
      titleSpacing: 10,
      floating: true,
      pinned: true,
      snap: true,
      expandedHeight: 100,
      titleTextStyle: s18W700.copyWith(color: Colors.white),
      title: const IgnorePointer(child: Text('Overlapping Tab Bar')),
      bottom: TabBar(
        unselectedLabelColor: Theme.of(context).canvasColor,
        labelColor: Colors.black,
        key: UniqueKey(),
        padding: EdgeInsets.zero,
        indicatorWeight: 3,
        indicator: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.orange,
              width: 5,
            ),
          ),
        ),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: const [
          Tab(text: 'Tab 1'),
          Tab(text: 'Tab 2'),
          Tab(text: 'Tab 3'),
        ],
      ),
    );
  }
}

class ScrollAbsorber {
  static void absorbScrollNotification(
    Notification notification,
    GlobalKey<State<StatefulWidget>> key,
  ) {
    NestedScrollView nestedScrollView = key.currentWidget! as NestedScrollView;
    double scrolled = 0;

    // We just need absorb the vertical scroll
    if (notification is OverscrollNotification) {
      if (notification.metrics.axis == Axis.vertical) {
        scrolled = notification.overscroll;
        // print('overscroll: $scrolled');
      }
    }

    final ScrollController primaryScrollController = nestedScrollView.controller!;

    if (notification is ScrollUpdateNotification) {
      if (notification.metrics.axis == Axis.vertical) {
        scrolled = notification.scrollDelta ?? 0;
        // print(
        //     ' primaryScrollController.offset: ${primaryScrollController.offset} ScrollUpdateNotification: $scrolled');
      }
    }

    // if (notification is ScrollEndNotification) {
    //   if (notification.metrics.axis == Axis.vertical) {
    //     primaryScrollController.jumpTo(primaryScrollController.offset);
    //     // scrolled = notification.metrics.pixels;
    //     // print('ScrollEndNotification: ${notification.metrics.pixels}');
    //   }
    // }

    primaryScrollController.jumpTo(primaryScrollController.offset + 1 * scrolled);
  }
}
