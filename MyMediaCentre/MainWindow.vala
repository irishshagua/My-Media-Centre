using Gtk;

namespace MyMediaCentre.Gui {
	public class MainWindow : Window {
		
		public MainWindow() {
			this.title = MyMediaCentre.APPLICATION_NAME;
			this.border_width = 0;
			this.window_position = WindowPosition.CENTER;
			
			set_decorated(false);
			set_default_size (2800, 2000);
			set_opacity (0.78);
		
			// Attach a listener
			this.destroy.connect (Gtk.main_quit);
		}
	}
}
