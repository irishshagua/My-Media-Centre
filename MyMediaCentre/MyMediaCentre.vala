using Gtk;
using MyMediaCentre.Gui;

namespace MyMediaCentre {
	
	public class AppEntryPoint {
		
		public static int main (string[] args) {
			Gtk.init(ref args);
			var App = new MediaTrayIcon();
			App.hide();
			Gtk.main();
			return 0;
		}
	}
}
