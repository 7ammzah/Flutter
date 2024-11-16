import 'package:flutter/material.dart';
import 'package:booking_calendar/booking_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(const BookingCalender()));
}

class BookingCalender extends StatefulWidget {
  const BookingCalender({
    Key? key,
    //required this.time_start,
    //required this.time_end,
  }) : super(key: key);

  @override
  State<BookingCalender> createState() => _BookingCalenderState();
}

class _BookingCalenderState extends State<BookingCalender> {
  final time_start = 9;
  final time_end = 10;

  //_BookingCalenderState({this.time_start, this.time_end});

  final now = DateTime.now();
  BookingService mockBookingService = BookingService(
    serviceName: 'Mock Service',
    serviceDuration: 30,
    bookingEnd: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 12, 0),
    bookingStart: DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 0),
  );

  @override
  void initState() {
    super.initState();
    mockBookingService = BookingService(
        serviceName: 'Mock Service',
        serviceDuration: 30,
        bookingEnd: DateTime(now.year, now.month + 1, now.day, time_start, 0),
        bookingStart: DateTime(now.year, now.month, now.day, time_end, 0));
  }

  Stream<dynamic>? getBookingStreamMock(
      {required DateTime end, required DateTime start}) {
    return Stream.value([]);
  }

  List<DateTimeRange> converted = [];

  Future<dynamic> uploadBookingMock(
      {required BookingService newBooking}) async {
    await Future.delayed(const Duration(seconds: 1));
    converted.add(DateTimeRange(
        start: newBooking.bookingStart, end: newBooking.bookingEnd));
  }

  List<DateTimeRange> convertStreamResultMock({required dynamic streamResult}) {
    DateTime first = now;
    DateTime second = now.add(const Duration(minutes: 55));
    DateTime third = now.subtract(const Duration(minutes: 240));
    DateTime fourth = now.subtract(const Duration(minutes: 500));
    converted.add(
        DateTimeRange(start: first, end: now.add(const Duration(minutes: 30))));
    converted.add(DateTimeRange(
        start: second, end: second.add(const Duration(minutes: 23))));
    converted.add(DateTimeRange(
        start: third, end: third.add(const Duration(minutes: 15))));
    converted.add(DateTimeRange(
        start: fourth, end: fourth.add(const Duration(minutes: 50))));
    return converted;
  }

  List<DateTimeRange> generatePauseSlots() {
    return [
      DateTimeRange(
        start: DateTime(now.year, now.month, now.day, 12, 0),
        end: DateTime(now.year, now.month, now.day, 13, 0),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Booking Calendar',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Booking Calendar '),
          ),
          body: Center(
            child: BookingCalendar(
              bookingService: mockBookingService,
              convertStreamResultToDateTimeRanges: convertStreamResultMock,
              getBookingStream: getBookingStreamMock,
              uploadBooking: uploadBookingMock,
              pauseSlots: generatePauseSlots(),
              loadingWidget: const Text('Fetching data ...'),
              uploadingWidget: const CircularProgressIndicator(),
              startingDayOfWeek: StartingDayOfWeek.monday,
              disabledDays: const [6, 7],
            ),
          ),
        ));
  }
}
