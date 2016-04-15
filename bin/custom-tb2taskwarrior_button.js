/*CODE*/
// tb2taskwarrior v0.1
// Pedram Hayati (Pi3cH)
// https://github.com/pi3ch/tb2taskwarrior

//Path to xterm
var taskPath = "/usr/bin/bash";

var messageUri = gFolderDisplay.selectedMessageUris[0];
var msgHdr = messenger.messageServiceFromURI(messageUri).messageURIToMsgHdr(messageUri);
var today = new Date();
var year = today.getFullYear();

var box = custombuttons.promptBox("Add task", "Modify the title or add more attributes \n(e.g. due:tomorrow, pro:Party)", '"' + msgHdr.mime2DecodedSubject + '" project:misc');
tlink = ThunderLinkChromeNS.GetThunderlink()


if(box[0])
{
	// change arguments to task
	var topicName = "add +email Email: " + box[1];
	var args = [ "-c", "task "+topicName+"" ];
	
	var file = Components.classes["@mozilla.org/file/local;1"].createInstance(Components.interfaces.nsILocalFile);
	file.initWithPath(taskPath);
	 
	var process = Components.classes["@mozilla.org/process/util;1"].createInstance(Components.interfaces.nsIProcess);
	process.init(file);
	 
	process.run(true, args, args.length);
	
	args = [ "-c", "id=$(task newest limit:1 rc.verbose=nothing limit:1 | cut -f1 -d' '); task $id annotate "+tlink+""];
	process.run(true, args, args.length);
	
	//MsgMoveMessage(GetMsgFolderFromURI("imap://fieldad1@imap.jhuapl.edu/Archives/"+now.getFullYear()+"");
	custombuttons.alertSlide("Add task", "Task "+box[1]+" added successfully.");
} else {
	custombuttons.alertSlide("Add task", "Task "+box[1]+" has NOT added.");
}
