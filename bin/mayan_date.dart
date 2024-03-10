import 'package:mayan_date/maya_long_date.dart';

void main(List<String> args) {

	//   print('Hello world: ${mayan_date.calculate()}!');
	DateTime dt = DateTime.now();
	MayaLongDate mld = new MayaLongDate(dt);
	print("Current Date: " + mld.toString());
}