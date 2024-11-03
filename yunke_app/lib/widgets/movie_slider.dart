import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class MovieSlider extends StatelessWidget {
  final List<Sponsor> sponsors;

  const MovieSlider({super.key, required this.sponsors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Nuestros auspiciantes',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sponsors.length,
                itemBuilder: (_, int index) => _MoviePoster(
                      sponsor: sponsors[index],
                    )),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  final Sponsor sponsor;

  const _MoviePoster({required this.sponsor});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.85,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: sponsor),
            child: Hero(
              tag: sponsor.id ?? "",
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: sponsor.image == null
                    ? const Image(
                        image: AssetImage('assets/no-image.jpg'),
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover)
                    : FadeInImage(
                        placeholder: const AssetImage('assets/no-image.jpg'),
                        image: NetworkImage(sponsor.image!),
                        width: double.infinity,
                        height: 140,
                        fit: BoxFit.cover
                      ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(sponsor.name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: const TextStyle(fontWeight: FontWeight.bold)
              )
        ],
      ),
    );
  }
}
