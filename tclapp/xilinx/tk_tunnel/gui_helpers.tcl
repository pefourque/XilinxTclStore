####################################################################################################
# HEADER_BEGIN
# COPYRIGHT NOTICE
# Copyright 2001-2013 Xilinx Inc. All Rights Reserved.
# http://www.xilinx.com/support
# HEADER_END
####################################################################################################
# Company:        Xilinx, Inc.
# Created by:     Nik Cimino
# 
# Created Date:   11/20/12
# Script name:    gui_helpers.tcl
# 
# Getting Started:
#     http://www.tkdocs.com/tutorial/windows.html
#     These commands are nothing more than simple Tk helpers.
#     None of these helpers are required for the Tk Tunnel, as raw Tcl/Tk commands can be used,
#     These commands are simply meant to help ease dialogs and prompts.
#
####################################################################################################

namespace eval ::tclapp::xilinx::tk_tunnel {
	
	# Export procs that should be allowed for import into other namespaces
    namespace export ok
    namespace export ask
	namespace export msg 
	namespace export failed
	namespace export open_file 
	namespace export save_file 
	namespace export choose_dir
	namespace export choose_color
	namespace export ask_or_cancel
    namespace export hide_server_start


    proc hide_server_start {} {
		# Summary : Hides the Tk default window manager (opens via `package require Tk`)

		# Argument Usage:
		# none

		# Return Value: 
		# TCL_OK is returned if the procedure completed
		
		wm title . "Tk Tunnel Server"
		wm withdraw .
		# wm iconify .
		# wm deiconify .
        return 1
	}

	proc ask {msg} {
        
        # Summary : Opens a simple yes/no dialog

		# Argument Usage:
		# msg : the question asking the user a yes or no question

		# Return Value: 
		# answer : The users input / answer to the question is returned 
        
		set answer [tk_messageBox -type "yesno" -message "$msg" -icon question -title "Vivado Question"]
		broadcast "puts stdout {$answer}"
		return $answer
	}
    
    proc ok {msg} {
        
        # Summary : Opens a simple ok/cancel dialog

		# Argument Usage:
		# msg : the question asking the user a yes or no question

		# Return Value: 
		# answer : The users input / answer to the question is returned 
        
		set answer [tk_messageBox -type "okcancel" -message "$msg" -icon question -title "Vivado Noticication"]
		broadcast "puts stdout {$answer}"
		return $answer
	}
    
    proc failed {msg} {
        
        # Summary : Opens a simple retry/cancel dialog

		# Argument Usage:
		# msg : the question asking the user a yes or no question

		# Return Value: 
		# answer : The users input / answer to the question is returned 
        
		set answer [tk_messageBox -type "retrycancel" -message "$msg" -icon question -title "Vivado Failure Noticication"]
		broadcast "puts stdout {$answer}"
		return $answer
	}
    
    proc ask_or_cancel {msg} {
        
        # Summary : Opens a simple yes/no/cancel dialog

		# Argument Usage:
		# msg : the question asking the user a yes or no question

		# Return Value: 
		# answer : The users input / answer to the question is returned 
        
		set answer [tk_messageBox -type "yesnocancel" -message "$msg" -icon question -title "Vivado Questions"]
		broadcast "puts stdout {$answer}"
		return $answer
	}
          
    proc msg {msg} {
        
        # Summary : Opens a simple info dialog

		# Argument Usage:
		# msg : the question asking the user a yes or no question

		# Return Value: 
		# answer : The dialog creationg return 
        
		set answer [tk_messageBox -message "$msg" -title "Vivado Info"]
		broadcast "puts stdout {$answer}"
		return $answer
	}
    
    proc open_file {} {
        
        # Summary : Opens a simple 'Open File' dialog

		# Argument Usage:
		# none

		# Return Value: 
		# answer : The users input / selected file
        
		set answer [tk_getOpenFile]
		broadcast "puts stdout {$answer}"
		return $answer
	}
    
    proc save_file {} {
        
        # Summary : Opens a simple 'Save File' dialog

		# Argument Usage:
		# none

		# Return Value: 
		# answer : The users input / selected file
        
		set answer [tk_getSaveFile]
		broadcast "puts stdout {$answer}"
		return $answer
	}
    
    proc choose_dir {} {
        
        # Summary : Opens a simple 'Choose Directory' dialog

		# Argument Usage:
		# none

		# Return Value: 
		# answer : The users input / selected file
        
		set answer [tk_chooseDirectory]
		broadcast "puts stdout {$answer}"
		return $answer
	}
    
    proc choose_color {} {
        
        # Summary : Opens a simple 'Choose Color' dialog

		# Argument Usage:
		# none

		# Return Value: 
		# answer : The users input / selected file
        
		set answer [tk_chooseColor -initialcolor #ff0000]
		broadcast "puts stdout {$answer}"
		return $answer
	}

}