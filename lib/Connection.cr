class Connection

	def initialize(clientSocket : Socket)
		#Set the client socket
		@clientSocket = clientSocket;
	end

	#The handler for connection between the server and the client
	def handler()
		# TODO: Implement this
	end

	def handle()
		# TODO: Pass a pointer to the `handler()` function to the fiber object and start it
	end
	
end