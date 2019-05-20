#Main daemon code

require "server.cr";

#Start the daemon
def startDaemon(socketControlPath : String)
	print("Starting udsw daemon...");
	startServer(socketControlPath);
	print("udsw daemon ended.");
end

startDaemon("/var/udsw");