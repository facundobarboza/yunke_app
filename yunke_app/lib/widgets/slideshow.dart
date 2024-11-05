import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class Slideshow extends StatelessWidget {
  final List<Sponsor> sponsors;

  const Slideshow({super.key, required this.sponsors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        pagination: const SwiperPagination(
          margin: EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: Colors.black12,
            color: Colors.black26
          )
        ),
        itemCount: sponsors.length,
        itemBuilder: (context, index) => _Slide(sponsor: sponsors[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Sponsor sponsor;

  const _Slide({required this.sponsor});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(color: Colors.black45, blurRadius: 5, offset: Offset(0, 5))
        ]);

    return Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 30),
        child: DecoratedBox(
            decoration: decoration,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: sponsor.image == null
                  ? const Image(
                      image: AssetImage('assets/no-image.jpg'),
                      width: double.infinity,
                      height: 130,
                      fit: BoxFit.cover)
                  : FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(sponsor.image!),
                      width: double.infinity,
                      height: 130,
                      fit: BoxFit.cover),
            )));
  }
}
