#
#  Copyright (C) 2007 Adenu UNED
#
#  This file is part of dotLRN.
#
#  dotLRN is free software; you can redistribute it and/or modify it under the
#  terms of the GNU General Public License as published by the Free Software
#  Foundation; either version 2 of the License, or (at your option) any later
#  version.
#
#  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
#  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
#  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
#  details.
#

ad_library {
    
    Procs for the dotLRN Ils applet
    
    @author arjun@openforce.net
    @version $Id: dotlrn-ils-procs.tcl,v 1.3 2007-07-03 14:10:04 emma Exp $
}

namespace eval dotlrn_ils {
    
    ad_proc -private my_package_key {
    } {
        return "dotlrn-ils"
    }

    ad_proc -public applet_key {} {
        What's my key?
    } {
        return "dotlrn_ils"
    }

    ad_proc -public package_key {
    } {
        Get the package_key this applet deals with. 
    } {
        return "ils"
    }

    ad_proc -public get_pretty_name {
    } {
        returns the pretty name
    } {
        return "ILS Applet"
    }

    ad_proc -private pretty_name_key {

    } {
        return "dotlrn-ils.Ils_HTML_Data"
    }

    ad_proc -public add_applet {
    } {
        Add the ils applet to dotlrn - for one-time init
        Must be repeatable!
    } {

        if {![dotlrn_applet::applet_exists_p -applet_key [applet_key]]} {

            db_transaction {
                dotlrn_applet::mount \
                    -package_key [package_key] \
                    -url [package_key] \
                    -pretty_name "ILS Applet"

                dotlrn_applet::add_applet_to_dotlrn \
                    -applet_key [applet_key] \
                    -package_key [my_package_key]
            }

        }
    }

    ad_proc -public remove_applet {
        package_id
    } {
        remove the applet from dotlrn
    } {
        ad_return_complaint 1 "[applet_key] remove_applet not implemented!"
    }

    ad_proc -public add_applet_to_community {
        community_id
    } {
        Add the ils applet to a dotlrn community
    } {

        # Mount the package for admin purpose
        set package_id [dotlrn::instantiate_and_mount $community_id [package_key]]

        # set up admin portlet
        set admin_portal_id [dotlrn_community::get_admin_portal_id -community_id $community_id]
        ils_admin_portlet::add_self_to_page \
            -portal_id $admin_portal_id \
            -package_id $community_id
         # set up admin portlet  

      set portal_id [dotlrn_community::get_portal_id \
                        -community_id $community_id]
        ils_user_portlet::add_self_to_page \
            -portal_id $portal_id \
            -package_id $community_id
}

    ad_proc -public remove_applet_from_community {
        community_id
    } {
        Remove ils applet from a dotlrn community
    } {
        ad_return_complaint 1 "[applet_key] remove_applet not implemented!"
    }

    ad_proc -public add_user {
        community_id
    } {
        Called when the user is initially added as a dotlrn user.
    } {
        # noop
    }

    ad_proc -public remove_user {
        user_id
    } {
    } {
        # noop
    }

    ad_proc -public add_user_to_community {
        community_id
        user_id
    } {
        Add a user to a specific dotlrn community
    } {
        # noop
    }

    ad_proc -public remove_user_from_community {
        community_id
        user_id
    } {
        Remove a user from a community. Since this applet is not shown 
        on a user's portal, no action is required here.
    } {
        # noop
    }

    ad_proc -public add_portlet {
        portal_id
    } {
        A helper proc to add the underlying portlet to the given portal. 
        
        @portal_id
    } {
        # noop
    }

    ad_proc -public remove_portlet {
        args
    } {
        A helper proc to remove the underlying portlet from the given portal. 
        
        @param args a list-ified array of args defined in remove_applet_from_community
    } {
        ad_return_complaint 1 "[applet_key] remove_portlet not implemented!"
    }

    ad_proc -public clone {
        old_community_id
        new_community_id
    } {
        Clone this applet's content from the old community to the new one
    } {
        # noop
    }

    ad_proc -public change_event_handler {
        community_id
        event
        old_value
        new_value
    } { 
        listens for the following events: 
    } { 
        # noop
    }   
}
