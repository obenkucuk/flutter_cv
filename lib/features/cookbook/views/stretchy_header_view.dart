import 'package:faker/faker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../config/router/go_router_provider.dart';
import '../../../config/theme/text_styles.dart';

class StretchyHeaderView extends HookWidget {
  const StretchyHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    final scrollOffset = useState<double>(1);
    const maxAnimExtent = 200;

    useEffect(
      () {
        controller.addListener(() {
          final offset = controller.offset;
          scrollOffset.value = ((maxAnimExtent - offset) / maxAnimExtent).clamp(0, 1);
        });
        return null;
      },
      [],
    );

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: controller,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          DetailsAppBar(scrollOffset: scrollOffset.value),
          const _DummySliverList(),
        ],
      ),
    );
  }
}

class DetailsAppBar extends HookConsumerWidget {
  final double scrollOffset;
  const DetailsAppBar({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeigth = MediaQuery.sizeOf(context).height;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return SliverAppBar(
      backgroundColor: scaffoldBackgroundColor,
      title: Opacity(opacity: 1 - scrollOffset, child: const Text('Stretchy Header')),
      actions: [
        CupertinoButton(onPressed: () {}, child: const Icon(Icons.share_outlined)),
      ],
      stretch: true,
      pinned: true,
      expandedHeight: screenHeigth * .4,
      // floating: true,
      leading: CupertinoButton(
        onPressed: ref.watch(goRouterProvider).pop,
        child: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          'https://images.pexels.com/photos/13950012/pexels-photo-13950012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
          fit: BoxFit.cover,
        ),
        // collapseMode: CollapseMode.parallax,
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
          StretchMode.blurBackground,
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight + 24),
        child: Container(
          decoration: BoxDecoration(
            color: scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30 * scrollOffset),
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          width: MediaQuery.sizeOf(context).width,
          height: 80.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Text('Example Title', style: s24W700, maxLines: 1)),
                  Expanded(child: Text('Example Sub Title', style: s16W400, maxLines: 1)),
                ],
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 250),
                opacity: scrollOffset <= 0 ? 1 : 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Image.network(
                    'https://images.pexels.com/photos/13950012/pexels-photo-13950012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DummySliverList extends StatelessWidget {
  const _DummySliverList();

  @override
  Widget build(BuildContext context) {
    final faker = Faker();

    return SliverPadding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: MediaQuery.paddingOf(context).bottom),
      sliver: SliverList.separated(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.zero,
            child: ListTile(
              title: Text(faker.food.dish()),
              subtitle: Text(faker.food.cuisine()),
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Text('${index + 1}'),
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 10);
        },
      ),
    );
  }
}
