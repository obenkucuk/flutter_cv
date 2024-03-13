import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:markdown/markdown.dart' as md;

import '../../../components/my_markdown_widget.dart';
import '../../../config/router/go_router_provider.dart';
import '../../../config/theme/text_styles.dart';
import 'cookbook_view.dart';

class StretchyHeaderView extends HookWidget {
  const StretchyHeaderView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    final scrollOffset = useState<double>(1);
    const maxAnimExtent = 300;
    final floating = useState<bool>(false);

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

    return UnconstrainedBox(
      constrainedAxis: Axis.vertical,
      child: SizedBox(
        width: 500,
        height: double.infinity,
        child: Scaffold(
          extendBodyBehindAppBar: true,
          body: CustomScrollView(
            controller: controller,
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            slivers: [
              _DetailsAppBar(
                scrollOffset: scrollOffset.value,
                floating: floating.value,
              ),
              SliverPadding(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  bottom: MediaQuery.paddingOf(context).bottom,
                ),
                sliver: const SliverToBoxAdapter(
                  child: MyMarkdownWidget(example: CookbookExamples.stretchyHeader),
                ),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            splashColor: Colors.transparent,
            onPressed: () => floating.value = !floating.value,
            label: Text('Floating: ${floating.value}'),
          ),
        ),
      ),
    );
  }
}

class _DetailsAppBar extends HookConsumerWidget {
  final bool floating;
  final double scrollOffset;

  const _DetailsAppBar({
    required this.scrollOffset,
    required this.floating,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenHeigth = MediaQuery.sizeOf(context).height;
    final scaffoldBackgroundColor = Theme.of(context).scaffoldBackgroundColor;
    const image =
        'https://images.pexels.com/photos/13950012/pexels-photo-13950012.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';

    return SliverAppBar(
      automaticallyImplyLeading: false,
      backgroundColor: scaffoldBackgroundColor,
      title: floating
          ? null
          : Opacity(
              opacity: 1 - scrollOffset,
              child: Text(
                'Stretchy Header',
                style: s24W700.copyWith(color: Colors.black),
              ),
            ),
      actions: floating
          ? []
          : [
              CupertinoButton(onPressed: () {}, child: const Icon(Icons.ios_share_outlined)),
            ],
      leading: floating
          ? null
          : CupertinoButton(
              onPressed: ref.watch(goRouterProvider).pop,
              child: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
      expandedHeight: screenHeigth * .4,
      stretch: true,
      pinned: true,
      floating: floating,
      flexibleSpace: FlexibleSpaceBar(
        background: ColoredBox(
          color: scaffoldBackgroundColor,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 1),
            child: Image.network(image, fit: BoxFit.cover),
          ),
        ),
        collapseMode: CollapseMode.parallax,
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(30 * scrollOffset)),
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
                  Expanded(child: Text('Sliver App Bar', style: s24W700, maxLines: 1)),
                  Expanded(
                    child: Text('Make Sticky Stretchy Header', style: s16W400, maxLines: 1),
                  ),
                ],
              ),
              if (!floating)
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: scrollOffset >= 0.5 ? 0 : 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500),
                    child: Image.network(
                      image,
                      fit: BoxFit.cover,
                      height: 50,
                      width: 50,
                    ),
                  ),
                )
              else
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 250),
                  opacity: scrollOffset <= 0 ? 1 : 0,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.grey.shade300,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      child: const Icon(
                        Icons.close_rounded,
                        color: Colors.black,
                      ),
                      onPressed: () => ref.read(goRouterProvider).pop(),
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
