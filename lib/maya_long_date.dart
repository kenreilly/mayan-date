// Represents a date on the MLC calendar in format x.x.x.x.x
class MayaLongDate {

	// Number of days in each position
	static const List<int> moduli = [ 144000, 7200, 360, 20, 1 ];
	
	// Nunber of ms since 12/21/2012
	static DateTime MLC_EPOCH_13_START = DateTime.parse('2012-12-21T00:00:00+00:00');

	// Current date in MLC format - initialized to Baktun 13
	static List<int> mlc_date = [ 13, 0, 0, 0, 0 ];

	// Original DateTime object
	DateTime dt;

	MayaLongDate(this.dt) {
		
		DateTime normalized = DateTime(dt.year, dt.month, dt.day);
		Duration diff = normalized.difference(MLC_EPOCH_13_START);
		int days = diff.inDays;

		for (var i = 0; i != moduli.length; ++i) {

			if (days <= moduli[i]) continue;								
			mlc_date[i] += (days / moduli[i]).floor();
			days %= moduli[i];
		}
	}

	@override // Returns date in X.X.X.X.X format
	String toString() { return mlc_date.join('.'); }
}