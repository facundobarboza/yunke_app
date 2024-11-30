import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yunke_app/models/models.dart';
import 'package:yunke_app/screens/screens.dart';
import 'package:yunke_app/services/services.dart';

class CalendarScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final calendarsService = Provider.of<CalendarsService>(context);

    if (calendarsService.isLoading) {
      return LoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calendario',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Agosto 2024',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: calendarsService.calendars.length,
                    itemBuilder: (_, int index) => _MatchDetailCalendar(
                          calendar: calendarsService.calendars[index],
                        ))),
          ],
        ),
      ),
    );
  }
}

class _MatchDetailCalendar extends StatelessWidget {
  final Calendar calendar;

  const _MatchDetailCalendar({required this.calendar});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Container(
      // width: size.width * 0.85,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              '${calendar.day} - ${calendar.month}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            )
          ]),
          Card(
              color: Colors.white,
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            calendar.homeTeamName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: -1,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700),
                          ),
                        )
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      calendar.homeTeamImage == null
                          ? const Image(
                              image: AssetImage('assets/no-image.jpg'),
                              //width: 35,
                              height: 45,
                              fit: BoxFit.cover)
                          : FadeInImage(
                              placeholder:
                                  const AssetImage('assets/no-image.jpg'),
                              image: NetworkImage(calendar.homeTeamImage!),
                              //width: 35,
                              height: 35,
                              fit: BoxFit.cover),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(3)),
                            margin: const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 2),
                        child: Text(
                          calendar.hour,
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      calendar.awayTeamImage == null
                          ? const Image(
                              image: AssetImage('assets/no-image.jpg'),
                              //width: 35,
                              height: 45,
                              fit: BoxFit.cover)
                          : FadeInImage(
                              placeholder:
                                  const AssetImage('assets/no-image.jpg'),
                              image: NetworkImage(calendar.awayTeamImage!),
                              //width: 35,
                              height: 35,
                              fit: BoxFit.cover),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            calendar.awayTeamName,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 15,
                                letterSpacing: -1,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade700),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
