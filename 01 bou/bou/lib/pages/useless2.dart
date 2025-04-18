import 'package:auto_route/auto_route.dart';
import 'package:bou/pages/separator_line.dart';
import 'package:bou/services/app_router.gr.dart';
import 'package:bou/utils/numberInputFormatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';

@RoutePage()
class Useless2Page extends StatelessWidget {
  const Useless2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyUseless2Form(),
    );
  }
}

var myButtonStyle = ButtonStyle(
  overlayColor: WidgetStatePropertyAll(Color.fromARGB(255, 178, 178, 178)),
  padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
  alignment: Alignment.centerLeft,
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)))),
  backgroundColor: WidgetStatePropertyAll(
    Color(0xffEEF2F3),
  ),
);

var myTextStyle = const TextStyle(
  fontFamily: 'sfpro',
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Color(0xff536471),
);

var myHeaderTextStyle = const TextStyle(
  fontFamily: 'sfpro',
  fontSize: 20,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

class MyUseless2Form extends StatefulWidget {
  const MyUseless2Form({super.key});

  @override
  MyUseless2State createState() => MyUseless2State();
}

class MyUseless2State extends State<MyUseless2Form> {
  final _currencyFormattingController = TextEditingController();
  final _dateFormattingController = TextEditingController();
  final _phoneNumberFormattingController = TextEditingController();

  @override
  void dispose() {
    _currencyFormattingController.dispose();
    _dateFormattingController.dispose();
    _phoneNumberFormattingController.dispose();
    super.dispose();
  }

  Widget _mySpacing() {
    return SizedBox(height: 16);
  }

  Widget _currencyFormatting() {
    return TextFormField(
      keyboardType: TextInputType.number,
      autocorrect: false,
      cursorColor: const Color(0xff536471),
      controller: _currencyFormattingController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffEEF2F3),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEEF2F3)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gapPadding: 4,
          borderSide: BorderSide(width: 0, color: Color(0xffEEF2F3)),
        ),
        counterText: '',
        label: const Text(
          'Price',
          style: TextStyle(color: Color(0xff536471)),
        ),
        labelStyle: const TextStyle(
            color: Color(0xff536471),
            fontFamily: 'sfpro',
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _dateFormatting() {
    return TextFormField(
      keyboardType: TextInputType.number,
      autocorrect: false,
      cursorColor: const Color(0xff536471),
      controller: _dateFormattingController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        DateInputFormatter(),
      ],
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffEEF2F3),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEEF2F3)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gapPadding: 4,
          borderSide: BorderSide(width: 0, color: Color(0xffEEF2F3)),
        ),
        counterText: '',
        label: const Text(
          'Date',
          style: TextStyle(color: Color(0xff536471)),
        ),
        labelStyle: const TextStyle(
            color: Color(0xff536471),
            fontFamily: 'sfpro',
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _qrCodeScanner() {
    // final tabsRouter = AutoTabsRouter.of(context);
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          overlayColor:
              WidgetStatePropertyAll(Color.fromARGB(255, 178, 178, 178)),
          padding: WidgetStatePropertyAll(EdgeInsets.all(10)),
          alignment: Alignment.centerLeft,
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
          backgroundColor: WidgetStatePropertyAll(
            Color(0xffEEF2F3),
          ),
        ),
        onPressed: () {
          // AutoRouter.of(context).push(QRScanRoute());
          context.router.push(QRScanRoute());
          // tabsRouter.setActiveIndex(12);
        },
        child: Text(
          'QR code Scanner',
          style: myTextStyle,
        ),
      ),
    );
  }

  Widget _persianDatePicker(BuildContext context) {
    return _MyPersianDatePicker();
  }

  Widget _phoneNumberEntry() {
    final phoneMask = MaskTextInputFormatter(
        mask: '0### ###-####', filter: {"#": RegExp(r'[0-9]')});

    return TextFormField(
      keyboardType: TextInputType.phone,
      inputFormatters: [
        phoneMask,
      ],
      autocorrect: false,
      cursorColor: const Color(0xff536471),
      controller: _phoneNumberFormattingController,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffEEF2F3),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEEF2F3)),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          gapPadding: 4,
          borderSide: BorderSide(width: 0, color: Color(0xffEEF2F3)),
        ),
        counterText: '',
        label: const Text(
          'Phone Number',
          style: TextStyle(color: Color(0xff536471)),
        ),
        labelStyle: const TextStyle(
            color: Color(0xff536471),
            fontFamily: 'sfpro',
            fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        hintText: '912 345-6789',
        hintStyle: const TextStyle(
            color: Color(0xff536471),
            fontFamily: 'sfpro',
            fontWeight: FontWeight.w400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // final tabsRouter = AutoTabsRouter.of(context);
    return SafeArea(
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                AutoRouter.of(context).pop();
              },
              icon: Icon(CupertinoIcons.back),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Formatting', style: myHeaderTextStyle),
                  _mySpacing(),
                  _currencyFormatting(),
                  _mySpacing(),
                  _dateFormatting(),
                  _mySpacing(),
                  _phoneNumberEntry(),
                  _mySpacing(),
                  SeparatorLineWidget(),
                  _mySpacing(),
                  Text(
                    'QR Code Scanner',
                    style: myHeaderTextStyle,
                  ),
                  _mySpacing(),
                  _qrCodeScanner(),
                  _mySpacing(),
                  SeparatorLineWidget(),
                  _mySpacing(),
                  Text('Persian Date Picker', style: myHeaderTextStyle),
                  _mySpacing(),
                  _persianDatePicker(context),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class _MyPersianDatePicker extends StatefulWidget {
  @override
  _MyPersianDatePickerState createState() => _MyPersianDatePickerState();
}

class _MyPersianDatePickerState extends State<_MyPersianDatePicker> {
  String _selectedDate = 'Please enter your birthday.';

  void showDatePicker(BuildContext context) async {
    final pickedDate = await showPersianDatePicker(
      initialDatePickerMode: PersianDatePickerMode.day,
      initialEntryMode: PersianDatePickerEntryMode.calendar,
      context: context,
      locale: Locale('fa', 'IR'),
      initialDate: Jalali.now(),
      firstDate: Jalali(1300, 1, 1),
      lastDate: Jalali.now(),
      keyboardType: TextInputType.numberWithOptions(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            // primaryColor: Colors.red,
            textTheme: const TextTheme(
              headlineSmall: TextStyle(
                  fontFamily: 'sfpro', fontSize: 20, color: Colors.black),
              labelLarge: TextStyle(fontFamily: 'sfpro', color: Colors.black),
              labelSmall: TextStyle(
                  fontFamily: 'sfpro', fontSize: 14, color: Colors.black),
              bodyLarge: TextStyle(fontFamily: 'sfpro', color: Colors.black),
            ),
            colorScheme: const ColorScheme.light(
              primary: Color(0xff536471),
              onPrimary: Color(0xffEEF2F3),
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = 'Your Birthday: ${pickedDate.formatFullDate()}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton(
        style: myButtonStyle,
        onPressed: () {
          showDatePicker(context);
        },
        child: Text(
          _selectedDate,
          style: myTextStyle,
        ),
      ),
    );
  }
}
