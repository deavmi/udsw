#Defines an instance of the server

require "socket";
require "fiber";

class Controller


	def initialize(socketControlPath : String)
		# Setup the control socket
		setupControlSocket(socketControlPath);

		# Start management state machine
		manage();
	end

	def setupControlSocket(socketControlPath : String)
		# Create a new UNIX Domain socket
		@controlSocket = Socket.new(Socket::Family::UNIX, Socket::Type::STREAM, Socket::Protocol::RAW);

		# Bind it to the path indicated by `socketControlPath`
		@controlSocket.bind(Socket::UNIXAddress.new(socketControlPath).to_unsafe());
	end

	def manage()

		#Loop for processing incoming connections
		while true
			#Accept the queued connection
			incomingSocket = @controlSocket.accept();

			#Create a new Connection object that represents the Controller <-> Client management Socket
			connection = Connection.new(incomingSocket);

			#Start the Connection manager fiber
			connection.handle();
		end		

	end

end