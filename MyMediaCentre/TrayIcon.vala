using Gtk;

namespace MyMediaCentre.Gui {
	
	class MediaTrayIcon : Window {
		private StatusIcon trayicon;
		private Menu trayIconPopupMenu;
		private MainWindow mainWindow;
		private AboutMediaCentre aboutDialog;
		
		public MediaTrayIcon() {
			/* Init Windows but don't show them yet */
			mainWindow = new MainWindow();
			aboutDialog = new AboutMediaCentre();
			
			/* Create tray icon */
			trayicon = new StatusIcon.from_stock(Stock.MEDIA_PLAY);
			trayicon.set_tooltip_text (MyMediaCentre.APPLICATION_NAME);
			trayicon.set_visible(true);

			trayicon.activate.connect(mainWindow.show_all);

			create_menuSystem();
			trayicon.popup_menu.connect(menuSystem_popup);
		}


		/* Create menu for right button */
		public void create_menuSystem() {
			trayIconPopupMenu = new Menu();
			var menuAbout = new ImageMenuItem.from_stock(Stock.ABOUT, null);
			menuAbout.activate.connect(aboutDialog.display_dialog);
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
	}
}
