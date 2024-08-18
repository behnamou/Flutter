import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

@RoutePage()
class Useless1Page extends StatelessWidget {
  const Useless1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class UserInfoUseless1 {
  String name;
  String password;
  String city;
  String birthday;
  String imageURL;
  String num;

  UserInfoUseless1(
      {required this.name,
      required this.password,
      required this.city,
      required this.birthday,
      required this.imageURL,
      required this.num});

  String toFileString() {
    return 'Name: $name\nPassword: $password\nCity: $city\nBirthday: $birthday\nImage URL: $imageURL\nNumber: $num\n';
  }
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isChecked = false;
  String? _selectedCity = "Shiraz";
  String? _selectedBirthday;
  File? _image;
  String? _numberPicked;
  bool _isFormValid = false;
  GeoPoint _selectedLocation =
      GeoPoint(latitude: 0.0, longitude: 0.0); // Default location

  // final _mapController = MapController.withUserPosition(
  //   trackUserLocation: const UserTrackingOption(
  //     enableTracking: true,
  //     unFollowUser: false,
  //   ),
  //   useExternalTracking: true,
  // );
  final _mapController = MapController.customLayer(
    initPosition: GeoPoint(
      latitude: 47.4358055,
      longitude: 8.4737324,
    ),
    customTile: CustomTile(
      sourceName: "opentopomap",
      tileExtension: ".png",
      minZoomLevel: 2,
      maxZoomLevel: 19,
      urlsServers: [
        TileURLs(
          //"https://tile.opentopomap.org/{z}/{x}/{y}"
          url: "https://tile.opentopomap.org/",
          subdomains: [],
        )
      ],
      tileSize: 256,
    ),
  );

  void _updateFormValidState() {
    setState(() {
      _isFormValid = _nameController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _selectedCity != null &&
          _selectedBirthday != null &&
          _image != null &&
          _numberPicked != null &&
          _isChecked;
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    _mapController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
    _updateFormValidState();
  }

  void _pickDate(BuildContext context) async {
    final pickedDate = await showPersianDatePicker(
      initialDatePickerMode: PDatePickerMode.day,
      initialEntryMode: PDatePickerEntryMode.input,
      context: context,
      initialDate: Jalali.now(),
      firstDate: Jalali(1300, 1, 1),
      lastDate: Jalali.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            dialogTheme: DialogTheme(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
            // primaryColor: Colors.red,
            textTheme: const TextTheme(
              headlineSmall: TextStyle(
                  fontFamily: 'vazir', fontSize: 20, color: Colors.black),
              labelLarge: TextStyle(fontFamily: 'vazir', color: Colors.black),
              labelSmall: TextStyle(
                  fontFamily: 'vazir', fontSize: 14, color: Colors.black),
              bodyLarge: TextStyle(fontFamily: 'vazir', color: Colors.black),
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
        _selectedBirthday = pickedDate.formatFullDate();
      });
      _updateFormValidState();
    }
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final userInfo = UserInfoUseless1(
        name: _nameController.text,
        password: _passwordController.text,
        num: _numberPicked!,
        birthday: _selectedBirthday!,
        city: _selectedCity!,
        imageURL: _image!.path,
      );

      await saveToFile(userInfo);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Information saved successfully!')),
      );
    }
  }

  Future<void> saveToFile(UserInfoUseless1 userInfo) async {
    final directory = await getApplicationDocumentsDirectory();

    final file = File('${directory.path}/user_info.txt');

    print('Directory: ${directory.path}');
    await file.writeAsString(userInfo.toFileString());

    print('User info saved to file: ${file.path}');

    if (_image != null) {
      final imageFile = File('${directory.path}/profile_image.png');
      await imageFile.writeAsBytes(await _image!.readAsBytes());
      print('Image saved to file: ${imageFile.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    var myTextStyle = const TextStyle(
        fontFamily: 'sfpro',
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: Color(0xff536471));
    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: TextSelectionTheme(
                data: TextSelectionThemeData(
                  selectionColor: Colors.black.withOpacity(0.2),
                ),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                      onChanged: _updateFormValidState,
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15),
                          // carousel slider
                          CarouselSlider(
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              autoPlayCurve: Curves.easeInOut,
                              height: 400.0,
                              autoPlay: true,
                            ),
                            items: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Image.asset(
                                  'my_files/1.JPG',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Image.asset(
                                  'my_files/2.JPG',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Image.asset(
                                  'my_files/3.JPG',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Image.asset(
                                  'my_files/4.JPG',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.7,
                                child: Image.asset(
                                  'my_files/profile_header.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 15),
                          // name
                          TextFormField(
                            autocorrect: false,
                            cursorColor: const Color(0xff536471),
                            controller: _nameController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffEEF2F3),
                                hintText: 'Your Name',
                                hintStyle: const TextStyle(
                                    color: Color(0xff536471),
                                    fontFamily: 'vazir',
                                    fontWeight: FontWeight.w400),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffEEF2F3)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gapPadding: 4,
                                  borderSide: BorderSide(
                                      width: 0, color: Color(0xffEEF2F3)),
                                ),
                                counterText: '',
                                label: const Text(
                                  'Name',
                                  style: TextStyle(color: Color(0xff536471)),
                                ),
                                labelStyle: const TextStyle(
                                    color: Color(0xff536471),
                                    fontFamily: 'vazir',
                                    fontWeight: FontWeight.w400),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(height: 15),
                          // password
                          TextFormField(
                            obscureText: true,
                            autocorrect: false,
                            cursorColor: const Color(0xff536471),
                            controller: _passwordController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffEEF2F3),
                                hintText: 'Your Password',
                                hintStyle: const TextStyle(
                                    color: Color(0xff536471),
                                    fontFamily: 'vazir',
                                    fontWeight: FontWeight.w400),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xffEEF2F3)),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  gapPadding: 4,
                                  borderSide: BorderSide(
                                      width: 0, color: Color(0xffEEF2F3)),
                                ),
                                counterText: '',
                                label: const Text(
                                  'Password',
                                  style: TextStyle(
                                      color: Color(0xff536471),
                                      fontFamily: 'vazir',
                                      fontWeight: FontWeight.w400),
                                ),
                                labelStyle:
                                    const TextStyle(color: Color(0xff536471)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                          ),
                          const SizedBox(height: 15),
                          // image picker
                          SizedBox(
                            height: 50,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  overlayColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 178, 178, 178)),
                                  padding: WidgetStatePropertyAll(
                                      EdgeInsets.all(10)),
                                  alignment: Alignment.centerLeft,
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color(0xffEEF2F3))),
                              onPressed: _pickImage,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _image == null
                                      ? Text(
                                          'Select your profile photo',
                                          style: myTextStyle,
                                        )
                                      : Image.file(
                                          _image!,
                                          height: double.infinity * 0.8,
                                        ),
                                  Visibility(
                                    visible: _image != null,
                                    child: SizedBox(
                                      height: double.infinity,
                                      child: IconButton(
                                        padding: const EdgeInsets.all(0),
                                        color: const Color(0xff536471),
                                        onPressed: () {
                                          setState(() {
                                            _image = null;
                                          });
                                          _updateFormValidState();
                                        },
                                        icon: const Icon(
                                          Icons.clear,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // radio location
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffEEF2F3),
                                border: Border.all(
                                    width: 1, color: const Color(0xffEEF2F3))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Choose your location',
                                  style: TextStyle(
                                      fontFamily: 'vazir',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff536471)),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  title: Text(
                                    'Shiraz',
                                    style: myTextStyle,
                                  ),
                                  leading: Radio<String>(
                                    value: 'Shiraz',
                                    groupValue: _selectedCity,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedCity = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Tehran',
                                    style: myTextStyle,
                                  ),
                                  leading: Radio<String>(
                                    value: 'Tehran',
                                    groupValue: _selectedCity,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedCity = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text(
                                    'Yazd',
                                    style: myTextStyle,
                                  ),
                                  leading: Radio<String>(
                                    value: 'Yazd',
                                    groupValue: _selectedCity,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedCity = value;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  'Selected City: $_selectedCity',
                                  style: myTextStyle,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 15),
                          // maps choose location
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: MediaQuery.of(context).size.width,
                            child: OSMFlutter(
                              onLocationChanged: (GeoPoint location) {
                                setState(() {
                                  _selectedLocation = location;
                                });
                              },
                              controller: _mapController,
                              osmOption: OSMOption(
                                zoomOption: const ZoomOption(
                                  initZoom: 8,
                                  minZoomLevel: 3,
                                  maxZoomLevel: 19,
                                  stepZoom: 1.0,
                                ),
                                userLocationMarker: UserLocationMaker(
                                  personMarker: const MarkerIcon(
                                    icon: Icon(
                                      Icons.location_history_rounded,
                                      color: Colors.red,
                                      size: 48,
                                    ),
                                  ),
                                  directionArrowMarker: const MarkerIcon(
                                    icon: Icon(
                                      Icons.double_arrow,
                                      size: 48,
                                    ),
                                  ),
                                ),
                                roadConfiguration: const RoadOption(
                                  roadColor: Colors.yellowAccent,
                                ),
                              ),
                            ),
                          ),

                          // persian date picker
                          const SizedBox(height: 15),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                  overlayColor: WidgetStatePropertyAll(
                                      Color.fromARGB(255, 178, 178, 178)),
                                  padding: WidgetStatePropertyAll(
                                      EdgeInsets.all(10)),
                                  alignment: Alignment.centerLeft,
                                  shape: WidgetStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)))),
                                  backgroundColor: WidgetStatePropertyAll(
                                      Color(0xffEEF2F3))),
                              onPressed: () => _pickDate(context),
                              child: Text(
                                _selectedBirthday == null
                                    ? 'Select your birthday'
                                    : 'Selected Birthday: $_selectedBirthday',
                                style: myTextStyle,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          // select
                          SizedBox(
                            width: double.infinity,
                            child: DropdownButton(
                              dropdownColor: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              hint: Text(
                                'Select a number',
                                style: myTextStyle,
                              ),
                              isExpanded: true,
                              style: myTextStyle,
                              value: _numberPicked,
                              items: <String>['1', '2', '3', '4', '5']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  _numberPicked = value!;
                                });
                                _updateFormValidState();
                              },
                            ),
                          ),
                          // checkBox
                          Row(
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                  _updateFormValidState();
                                },
                              ),
                              Text(
                                'I confirm all the itmes.',
                                style: myTextStyle,
                              ),
                            ],
                          ),
                          //
                        ],
                      )),
                ),
              ),
            ),
          ),
          Container(
            padding:
                const EdgeInsets.only(right: 16, left: 16, bottom: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Color(0xffEEF2F3)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff536471)),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                    foregroundColor: WidgetStatePropertyAll(Color(0xff536471)),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    bool? exitConfirmed = await showDialog<bool>(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          backgroundColor: Colors.white,
                          title: const Text('Confirm Exit'),
                          titleTextStyle: const TextStyle(
                            fontFamily: 'sfpro',
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                          content:
                              const Text('Are you sure you want to go back?'),
                          contentTextStyle: const TextStyle(
                            fontFamily: 'sfpro',
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          actionsAlignment: MainAxisAlignment.center,
                          actionsPadding: const EdgeInsets.all(10),
                          actions: <Widget>[
                            TextButton(
                              style: const ButtonStyle(
                                overlayColor:
                                    WidgetStatePropertyAll(Color(0xffEEF2F3)),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(false);
                              },
                              child: const Text(
                                'No',
                                style: TextStyle(
                                    fontFamily: 'sfpro', color: Colors.black),
                              ),
                            ),
                            TextButton(
                              style: const ButtonStyle(
                                overlayColor:
                                    WidgetStatePropertyAll(Color(0xffEEF2F3)),
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.white),
                              ),
                              onPressed: () {
                                Navigator.of(context).pop(true);
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                    fontFamily: 'sfpro', color: Colors.black),
                              ),
                            ),
                          ],
                        );
                      },
                    );

                    if (exitConfirmed == true) {
                      AutoRouter.of(context).pop();
                    }
                  },
                  child: Text(
                    'back',
                    style: myTextStyle,
                  ),
                ),
                ElevatedButton(
                  onPressed: _isFormValid ? _submitForm : null,
                  style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Color(0xffEEF2F3)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        side: BorderSide(color: Color(0xff536471)),
                        borderRadius: BorderRadius.all(Radius.circular(10)))),
                    foregroundColor: WidgetStatePropertyAll(Color(0xff536471)),
                    backgroundColor: WidgetStatePropertyAll(
                      Colors.white,
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: myTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
