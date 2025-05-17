// lib/features/home/presentation/widgets/popular_carousel.dart
import 'dart:async';
import 'package:clubhub_mobile/features/home/presentation/widgets/club_promo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../clubs/presentation/vm_clubs.dart';
import 'club_image_mapper.dart';
import 'package:go_router/go_router.dart';

class PopularCarousel extends ConsumerStatefulWidget {
  const PopularCarousel({super.key});

  @override
  ConsumerState<PopularCarousel> createState() => _PopularCarouselState();
}

class _PopularCarouselState extends ConsumerState<PopularCarousel> {
  late final PageController _controller = PageController(viewportFraction: 0.8);
  late Timer _timer;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 5), (_) {
      if (_controller.hasClients) {
        final itemCount = ref
            .read(clubsVmProvider)
            .maybeWhen(data: (list) => list.length, orElse: () => 0);
        if (itemCount > 0) {
          _page = (_page + 1) % itemCount;
          _controller.animateToPage(
            _page,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final asyncClubs = ref.watch(clubsVmProvider);

    return asyncClubs.when(
      loading:
          () => const SizedBox(
            height: 220,
            child: Center(child: CircularProgressIndicator()),
          ),
      error:
          (e, _) =>
              SizedBox(height: 220, child: Center(child: Text('Error: $e'))),
      data: (clubs) {
        if (clubs.isEmpty) {
          return const SizedBox(height: 220);
        }
        return SizedBox(
          height: 220,
          child: PageView.builder(
            controller: _controller,
            itemCount: clubs.length,
            itemBuilder: (context, index) {
              final club = clubs[index];
              return AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  double scale = 1.0;
                  if (_controller.position.hasPixels) {
                    final page = _controller.page ?? _page.toDouble();
                    final diff = (page - index).abs();
                    scale = (1 - (diff * 0.2)).clamp(0.8, 1.0);
                  }
                  return Center(
                    child: Transform.scale(scale: scale, child: child),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: ClubPromoCard(
                    name: club.name,
                    description: club.description,
                    imagePath: getClubImagePath(club.id),
                    onTap: () => context.push('/clubs/${club.id}'),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
