using Gtk;
	
namespace MyMediaCentre.Gui {
	
	public class AboutMediaCentre : AboutDialog {
		private string VERSION_NUMBER = "0.0.2";
		
		public AboutMediaCentre() {
			set_version (VERSION_NUMBER);
			set_program_name (MyMediaCentre.APPLICATION_NAME);
		}	
		
		public void display_dialog () {
			this.run();
			//this.hide();
		}
	}
}
