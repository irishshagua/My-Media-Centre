using Gtk;

namespace MyMediaCentre.Gui {
	
	class MediaTrayIcon : Window {
		private StatusIcon trayicon;
		private Menu trayIconPopupMenu;
		private MainWindow mainWindow;

		public MediaTrayIcon() {
			/* Init MainWindow but don't show it yet */
			mainWindow = new MainWindow();
			
			/* Create tray icon */
			trayicon = new StatusIcon.from_stock(Stock.MEDIA_PLAY);
			trayicon.set_tooltip_text ("My Media Centre");
			trayicon.set_visible(true);

			trayicon.activate.connect(mainWindow.show_all);

			create_menuSystem();
			trayicon.popup_menu.connect(menuSystem_popup);
		}


		/* Create menu for right button */
		public void create_menuSystem() {
			trayIconPopupMenu = new Menu();
			var menuAbout = new ImageMenuItem.from_stock(Stock.ABOUT, null);
			menuAbout.activate.connect(about_clicked);
			trayIconPopupMenu.append(menuAbout);
			var menuQuit = new ImageMenuItem.from_stock(Stock.QUIT, null);
			menuQuit.activate.connect(Gtk.main_quit);
			trayIconPopupMenu.append(menuQuit);
			trayIconPopupMenu.show_all();
		}

		
		/* Show popup menu on right button */
		private void menuSystem_popup(uint button, uint time) {
			trayIconPopupMenu.popup(null, null, null, button, time);
		}

		private void about_clicked() {
			var about = new AboutDialog();
			about.set_version("0.0.0");
			about.set_program_name("My Media Centre");
			about.set_comments("Some details about Media Centre");
			about.set_copyright("Brian Mooney");
			about.run();
			about.hide();
		}
	}
}
