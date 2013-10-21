#!/usr/bin/env ruby

# ZetCode Ruby GTK tutorial
#
# This program shows how to work
# with colors in Cairo
#
# author: jan bodnar
# website: www.zetcode.com
# last modified: June 2009

require 'gtk2'
#require 'cairo'


class RubyApp < Gtk::Window

def initialize
    super
    
    set_title "Colors"
    signal_connect "destroy" do 
    Gtk.main_quit 
    end
    
    init_ui
    
    set_default_size 360, 100
    set_window_position Gtk::Window::POS_CENTER
    
    show_all
end

def init_ui
    @darea = Gtk::DrawingArea.new  
#    @darea.add_events(Gdk::Event::EXPOSE) 
    @darea.add_events(Gdk::Event::MOTION_NOTIFY) 
#    @darea.add_events(Gdk::Event::ENTER_NOTIFY) 
    @darea.signal_connect "expose_event" do |event| 
        on_expose(window, event)
    end
    @darea.signal_connect "motion_notify_event" do |event|  
        on_motion_notify_event(window, event)
    end
    @darea.signal_connect "enter_notify_event" do |event| 
        on_enter_notify_event(window, event)
    end
    add(@darea)
end

def on_expose(window, event)
    p "on_expose"
#    cr = @darea.window.create_cairo_context  
#    draw_colors cr
    p window.pointer
end 

def on_motion_notify_event(window, event)
    p "on_motion_notify_event"
    p window.pointer
end 

def on_enter_notify_event
    p "on_enter_notify_event"
    p window.pointer
end 

#def draw_colors cr

#    cr.set_source_rgb 0.2, 0.23, 0.9
#    cr.rectangle 10, 15, 90, 60
#    cr.fill

#    cr.set_source_rgb 0.9, 0.1, 0.1
#    cr.rectangle 130, 15, 90, 60
#    cr.fill

#    cr.set_source_rgb 0.4, 0.9, 0.4
#    cr.rectangle 250, 15, 90, 60
#    cr.fill
#end
end

Gtk.init
window = RubyApp.new
Gtk.main
