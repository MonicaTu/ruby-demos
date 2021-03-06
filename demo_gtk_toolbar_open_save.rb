#!/usr/bin/env ruby

# ZetCode Ruby GTK tutorial
#
# This example shows a toolbar
# widget
#
# author: jan bodnar
# website: www.zetcode.com
# last modified: June 2009

require 'gtk2'


class RubyApp < Gtk::Window

    def initialize
        super
        
        set_title "Toolbar"
            signal_connect "destroy" do 
            Gtk.main_quit 
        end
        
        init_ui
        
        set_default_size 250, 200
        set_window_position Gtk::Window::POS_CENTER
        
        show_all
    end
    
    def init_ui
    
        toolbar = Gtk::Toolbar.new
        toolbar.set_toolbar_style Gtk::Toolbar::Style::ICONS
        
        newtb = Gtk::ToolButton.new Gtk::Stock::NEW
        opentb = Gtk::ToolButton.new Gtk::Stock::OPEN
        savetb = Gtk::ToolButton.new Gtk::Stock::SAVE
        sep = Gtk::SeparatorToolItem.new
        quittb = Gtk::ToolButton.new Gtk::Stock::QUIT
        
        toolbar.insert 0, newtb
        toolbar.insert 1, opentb
        toolbar.insert 2, savetb
        toolbar.insert 3, sep
        toolbar.insert 4, quittb
        
        opentb.signal_connect "clicked" do
            p "opentab clicked`"
            dialog = Gtk::FileChooserDialog.new("Open File",
                    window,
                    Gtk::FileChooser::ACTION_OPEN,
                    nil,
                    [Gtk::Stock::CANCEL, Gtk::Dialog::RESPONSE_CANCEL],
                    [Gtk::Stock::OPEN, Gtk::Dialog::RESPONSE_ACCEPT])
            
            
            if dialog.run == Gtk::Dialog::RESPONSE_ACCEPT
                puts "filename = #{dialog.filename}"
            end
            dialog.destroy
        end
        savetb.signal_connect "clicked" do
            p "savetb clicked"
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
        end
        quittb.signal_connect "clicked" do
        Gtk.main_quit
        end
        
        vbox = Gtk::VBox.new false, 2
        vbox.pack_start toolbar, false, false, 0
        
        add(vbox)
    end
end

Gtk.init
window = RubyApp.new
Gtk.main
