import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class DetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Sponsor sponsor =
        ModalRoute.of(context)?.settings.arguments as Sponsor;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(sponsor),
          SliverList(
              delegate: SliverChildListDelegate([
            _PosterAndTitle(sponsor),
            _Overview(),
            //CastingCard()
          ])),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Sponsor sponsor;
  const _CustomAppBar(this.sponsor);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.red,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        /* title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
          color: Colors.black12,
          child: const Text(
            'movie.title',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ), */
        background: sponsor.image == null
                  ? Hero(
                    tag: sponsor.id ?? "",
                    child: const Image(
                        image: AssetImage('assets/no-image.jpg'),
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover),
                  )
                  : Hero(
                    tag: sponsor.id ?? "",
                    child: FadeInImage(
                        placeholder: const AssetImage('assets/loading.gif'),
                        image: NetworkImage(sponsor.image!),
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.fitHeight
                      ),
                  ),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  final Sponsor sponsor;
  const _PosterAndTitle(this.sponsor);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          /* ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage('https://picsum.photos/200/300'),
                height: 150,
                fit: BoxFit.cover),
          ),
          const SizedBox(width: 20), */
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 150),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FadeIn(
                  delay: const Duration(milliseconds: 300),
                  child: Text(sponsor.name,
                      style: textTheme.titleLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                ),
                /* Text('movie.title',
                    style: textTheme.titleSmall, overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text('movie.voteAverage', style: textTheme.bodySmall)
                  ],
                ), */
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: FadeIn(
        delay: const Duration(milliseconds: 300),
        child: Text(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce vitae diam feugiat, volutpat diam eget, mollis purus. Suspendisse et sagittis nibh, id vehicula loremDonec eget hendrerit augue. Donec et est porttitor, fringilla turpis eu, ultrices massa. Suspendisse commodo iaculis dignissim. Pellentesque ut iaculis metus, sed tincidunt enim. Nam ultricies erat urna, id semper urna fringilla id.',
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
