--
--  Copyright (C) 2007 Adenu UNED
--
--  This file is part of dotLRN.
--
--  dotLRN is free software; you can redistribute it and/or modify it under the
--  terms of the GNU General Public License as published by the Free Software
--  Foundation; either version 2 of the License, or (at your option) any later
--  version.
--
--  dotLRN is distributed in the hope that it will be useful, but WITHOUT ANY
--  WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
--  FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
--  details.
--

create function inline_0()
returns integer as '
begin
	-- create the implementation
	perform acs_sc_impl__new (
		''dotlrn_applet'',
		''dotlrn_ils'',
		''dotlrn_ils''
	);

	-- add all the hooks

	-- GetPrettyName
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''GetPrettyName'',
	       ''dotlrn_ils::get_pretty_name'',
	       ''TCL''
	);

	-- AddApplet
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''AddApplet'',
	       ''dotlrn_ils::add_applet'',
	       ''TCL''
	);

	-- RemoveApplet
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''RemoveApplet'',
	       ''dotlrn_ils::remove_applet'',
	       ''TCL''
	);

	-- AddAppletToCommunity
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''AddAppletToCommunity'',
	       ''dotlrn_ils::add_applet_to_community'',
	       ''TCL''
	);

	-- RemoveAppletFromCommunity
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''RemoveAppletFromCommunity'',
	       ''dotlrn_ils::remove_applet_from_community'',
	       ''TCL''
	);

	-- AddUser
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''AddUser'',
	       ''dotlrn_ils::add_user'',
	       ''TCL''
	);

	-- RemoveUser
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''RemoveUser'',
	       ''dotlrn_ils::remove_user'',
	       ''TCL''
	);

	-- AddUserToCommunity
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''AddUserToCommunity'',
	       ''dotlrn_ils::add_user_to_community'',
	       ''TCL''
	);

	-- RemoveUserFromCommunity
	perform acs_sc_impl_alias__new (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''RemoveUserFromCommunity'',
	       ''dotlrn_ils::remove_user_from_community'',
	       ''TCL''
	);

    -- AddPortlet
	perform acs_sc_impl_alias__new (
        	''dotlrn_applet'',									-- impl_contract_name
	        ''dotlrn_ils'', 									-- impl_name
 	      	''AddPortlet'',										-- impl_operation_name
  	      	''dotlrn_ils::add_portlet'',						-- impl_alias
   	     	''TCL''												-- impl_pl
    	);
	
    -- RemovePortlet
	perform acs_sc_impl_alias__new (
     	   	''dotlrn_applet'',
      	  	''dotlrn_ils'',
       	 	''RemovePortlet'',
        	''dotlrn_ils::remove_portlet'',
        	''TCL''
    );

    -- Clone
    	perform acs_sc_impl_alias__new (
        	''dotlrn_applet'',
        	''dotlrn_ils'',
        	''Clone'',
        	''dotlrn_ils::clone'',
        	''TCL''
    	);

    perform acs_sc_impl_alias__new (
        ''dotlrn_applet'',
        ''dotlrn_ils'',
        ''ChangeEventHandler'',
        ''dotlrn_ils::change_event_handler'',
        ''TCL''
    );

	-- Add the binding
	perform acs_sc_binding__new (
	    	''dotlrn_applet'',
	    	''dotlrn_ils''
	);
	return 0;
end;' language 'plpgsql';

select inline_0();

drop function inline_0();

