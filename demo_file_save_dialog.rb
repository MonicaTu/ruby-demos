#!/usr/bin/env ruby

require 'gtk2'

window = Gtk::Window.new("File Chooser Dialog")
window.border_width = 10
window.signal_connect('destroy') { Gtk.main_quit }

dialog = Gtk::FileChooserDialog.new("Save File",
        window,
        Gtk::FileChooser::ACTION_SAVE,
        nil,
        [Gtk::Stock::CANCEL, Gtk::Dialog::RESPONSE_CANCEL],
        [Gtk::Stock::SAVE, Gtk::Dialog::RESPONSE_ACCEPT])


if dialog.run == Gtk::Dialog::RESPONSE_ACCEPT
    puts "filename = #{dialog.filename}"
end
dialog.destroy

Gtk.main
