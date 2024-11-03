import 'package:flutter/material.dart';
import 'package:yunke_app/models/models.dart';

class MatchSlider extends StatelessWidget {
  final List<Match> matchs;

  const MatchSlider({super.key, required this.matchs});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Text(
                'Proximos partidos',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: matchs.length,
                itemBuilder: (_, int index) => _MatchDetail(
                      match: matchs[index],
                    )),
          ),
        ],
      ),
    );
  }
}

class _MatchDetail extends StatelessWidget {
  final Match match;

  const _MatchDetail({required this.match});

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
            onTap: () => Navigator.pushNamed(context, 'calendar',
                arguments: match),
            child: 
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    margin: const EdgeInsets.only(top: 5, bottom: 5),
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                  match.category,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54
                                  ),
                                ),
                            const Text(
                              ' - ',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                              ),
                            ),
                            Text(
                              match.tournament,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          children: [
                            Text(
                              match.home,
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: -1,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700
                              ),
                            ),
                            const Spacer(),
                            Column(
                              children: [
                                match.homeImage == null
                                ? const Image(
                                    image: AssetImage('assets/no-image.jpg'),
                                    //width: 35,
                                    height: 35,
                                    fit: BoxFit.cover)
                                : FadeInImage(
                                    placeholder: const AssetImage('assets/no-image.jpg'),
                                    image: NetworkImage(match.homeImage!),
                                    //width: 35,
                                    height: 35,
                                    fit: BoxFit.cover
                                  ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                Text(
                                  match.hour,
                                  style: const TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            const SizedBox(width: 10),
                            Column(
                              children: [
                                match.awayImage == null
                                ? const Image(
                                    image: AssetImage('assets/no-image.jpg'),
                                    //width: 35,
                                    height: 35,
                                    fit: BoxFit.cover)
                                : FadeInImage(
                                    placeholder: const AssetImage('assets/no-image.jpg'),
                                    image: NetworkImage(match.awayImage!),
                                    //width: 35,
                                    height: 35,
                                    fit: BoxFit.cover
                                  ),
                                //Image.asset('assets/no-image.jpg', height: 45, width: 45),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              match.away,
                              style: TextStyle(
                                fontSize: 15,
                                letterSpacing: -1,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700
                              ),
                              ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Text(
                          match.date,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
          ),
        ],
      ),
    );
  }
}
