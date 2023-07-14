import socket
import sys
sys.path.append('..')
from uarm.wrapper import SwiftAPI

swift = SwiftAPI(port='/dev/ttyACM0', callback_thread_pool_size=1)

def server_func():
    host = socket.gethostname()
    port = 6060
    response = ''

    server = socket.socket()
    server.bind((host, port))

    server.listen(1)
    connection, address = server.accept()
    print("Connection from: " + str(address))

    while True:
        data = connection.recv(1024).decode()
        if not data:
            break

        if data.startswith("exec: "):
            command = data[6:]
            try:
                exec(command)
                response = "Command executed: " + command
                
            except Exception as err:
                response = "Exception thrown: " + str(err)

        else:
            print("Received from client: " + str(data))

        connection.send(response.encode())
        
    connection.close()

if __name__ == '__main__':
    server_func()