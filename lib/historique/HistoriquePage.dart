import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:app_pointer/qrcode/QrCodeController.dart';
import 'package:app_pointer/qrcode/QrCodeModel.dart';

import 'package:table_calendar/table_calendar.dart';

import '../utils/ColorPage.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  var succesMessage = "";
  List<QrCodeModel> presencesDuMois = [];
  bool isVisible = false;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _firstDay = DateTime.utc(DateTime.now().year, 1, 1);
  DateTime _lastDay = DateTime.utc(DateTime.now().year, 12, 31);

  void _refreshPage() {
    setState(() {
      // Réinitialiser les données et recharger la page
      presencesDuMois = [];
      isVisible = false;
    });

    var presenceCtrl = context.read<QrCodeController>();
    presenceCtrl.getPresenceApi();
    PresencesDuMois(_focusedDay);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      var presenceCtrl = context.read<QrCodeController>();
      presenceCtrl.getPresenceApi();
      PresencesDuMois(_focusedDay);
    });
  }

  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd/MM/yyyy').format(now);
    return Scaffold(
      backgroundColor: Color(0XFFf5f3f8),
      body: Stack(
        children: [_body(formattedDate)],
      ),
    );
  }

  Widget _body(String dateFormatted) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorPages.COLOR_PRINCIPAL,
          ),
          height: 187,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                Text(
                  'POINTAGE',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 29.0,
                      fontFamily: "Schyler",
                      color: Colors.white),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 210,
                  height: 60,
                  margin: EdgeInsets.symmetric(horizontal: 70),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _text("Présences"),
                          _text("${presencesDuMois.length}"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 25),
        _tableCalendar(),
        ElevatedButton(
          onPressed: _refreshPage,
          child: Text('Actualiser la page',style: TextStyle(fontFamily: 'Schyler', color:ColorPages.COLOR_PRINCIPAL,fontWeight: FontWeight.bold),),
        ),
      ],
    );
  }

  Widget _tableCalendar() {
    var presenceCtrl = context.watch<QrCodeController>();
    var presence =
    presenceCtrl.presenceList.map((presence) => presence).toList();

    return Column(
      children: [
        TableCalendar(
          locale: 'fr_FR',
          calendarFormat: _calendarFormat,
          focusedDay: _focusedDay,
          firstDay: _firstDay,
          lastDay: _lastDay,
          eventLoader: (day) {
            List events = [];
            if (presence
                .any((presence) => isSameDay(day, presence.created_at))) {
              events.add('presences');
            }
            return events;
          },
          calendarBuilders: CalendarBuilders(
            selectedBuilder: (context, date, events) {
              return Container(
                margin: const EdgeInsets.all(4.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  date.day.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              );
            },
          ),
          startingDayOfWeek: StartingDayOfWeek.monday,
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(color: Colors.transparent),
            selectedDecoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            todayTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.black,
            ),
            holidayTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white,
            ),
            holidayDecoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            selectedTextStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
              color: Colors.white,
            ),
            markerDecoration: BoxDecoration(
              color: ColorPages.COLOR_ROUGE,
              shape: BoxShape.circle,
            ),
          ),
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
              fontSize: 24,
              color: ColorPages.COLOR_PRINCIPAL,
              fontWeight: FontWeight.bold,
            ),
            titleCentered: true,
            formatButtonVisible: false,
            formatButtonDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.redAccent, Colors.orange],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 5,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            formatButtonTextStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            formatButtonShowsNext: false,
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: ColorPages.COLOR_PRINCIPAL,
              size: 32,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: ColorPages.COLOR_PRINCIPAL,
              size: 32,
            ),
          ),
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
              PresencesDuMois(focusedDay);

            });
          },
        ),
      ],
    );
  }

  void PresencesDuMois(DateTime focusedDay) {
    presencesDuMois =
        context.read<QrCodeController>().presenceList.where((presence) {
      return presence.created_at!.month == focusedDay.month;
    }).toList();
  }

  Widget _text(String text) {
    return Text(text,
        style: TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15.0));
  }
}
