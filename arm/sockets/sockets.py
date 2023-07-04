import sys
import socket
sys.path.append('..')
from uarm.wrapper import SwiftAPI

def process_coordinates(x, y, z):
    print(f"Received coordinates: x={x}, y={y}, z={z}")

server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_address = ('localhost', 12345)
server_socket.bind(server_address)
server_socket.listen(1)

print('Waiting for connection...')

client_socket, client_address = server_socket.accept()
print('Client connected:', client_address)

while True:
    data = client_socket.recv(1024).decode()
    if not data:
        break

    command, *values = data.split(',')
    if command == 'position':
        x, y, z = map(float, values)

        swift = SwiftAPI(port="COM4", callback_thread_pool_size=1)
        swift.set_position(x, y, z)
        swift.reset()
        print(swift.get_position())

        process_coordinates(x, y, z)

client_socket.close()
server_socket.close()