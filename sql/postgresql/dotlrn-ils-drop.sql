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

	perform acs_sc_impl__delete(
	   ''dotlrn_applet'',		-- impl_contract_name
     ''dotlrn_ils''		-- impl_name
  );


-- delete all the hooks

-- GetPrettyName
	perform  acs_sc_impl_alias__delete (
	    ''dotlrn_applet'',
	    ''dotlrn_ils'',
	    ''GetPrettyName''
 );


	-- AddApplet
	perform  acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''AddApplet''
	);



	-- RemoveApplet
	perform  acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''RemoveApplet''
	);

	-- AddAppletToCommunity
	perform  acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''AddAppletToCommunity''
	);


	-- RemoveAppletFromCommunity
	perform  acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''RemoveAppletFromCommunity''
	);

	-- AddUser
	perform  acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''AddUser''
	);

	-- RemoveUser
	perform  acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''RemoveUser''
	);

	-- AddUserToCommunity
	perform  acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''AddUserToCommunity''
	);

	-- RemoveUserFromCommunity
	perform  acs_sc_impl_alias__delete (
	       ''dotlrn_applet'',
	       ''dotlrn_ils'',
	       ''RemoveUserFromCommunity''
	);

    -- AddPortlet
	perform  acs_sc_impl_alias__delete (
        	''dotlrn_applet'',									-- impl_contract_name
	        ''dotlrn_ils'',									-- impl_name
 	      	''AddPortlet''  										-- impl_operation_name
    	);
	
    -- RemovePortlet
	perform  acs_sc_impl_alias__delete (
     	   	''dotlrn_applet'',
     	  	''dotlrn_ils'',
       	 	''RemovePortlet''
    );

    -- Clone
	perform  acs_sc_impl_alias__delete (
        	''dotlrn_applet'',
        	''dotlrn_ils'',
        	''Clone''
    	);


	-- Remove the binding
	perform acs_sc_binding__delete (
	    ''dotlrn_applet'',
	    ''dotlrn_ils''
		);

	RAISE NOTICE '' Finished deleting dotlrn-ils sc....'';
	
return 0;
end;' language 'plpgsql';

select inline_0();

drop function inline_0();

