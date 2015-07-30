/*-
 * Copyright (c) 2015 Wingpanel Developers (http://launchpad.net/wingpanel)
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Library General Public License as published by
 * the Free Software Foundation, either version 2.1 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Library General Public License for more details.
 *
 * You should have received a copy of the GNU Library General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

public class Bluetooth.Widgets.PopoverWidget : Gtk.Stack {
	private Bluetooth.Widgets.MainView main_view;
	private Bluetooth.Widgets.DeviceView device_view;

	public PopoverWidget () {

		build_ui ();
		connect_signals ();
	}

	private void build_ui () {
		main_view = new Bluetooth.Widgets.MainView ();
		device_view = new Bluetooth.Widgets.DeviceView ();

		this.add_named (main_view, "main_view");
		this.add_named (device_view, "device_view");
	}

	private void connect_signals () {
		main_view.device_requested.connect ((device_service) => {
			this.device_view.refresh (device_service);
			this.set_visible_child_full ("device_view", Gtk.StackTransitionType.SLIDE_LEFT);
		});

		device_view.back_button.clicked.connect (() => {
			this.set_visible_child_full ("main_view", Gtk.StackTransitionType.SLIDE_RIGHT);
		});
	}
}
