import socket

def client_func():
    host = socket.gethostname()
    port = 6060

    client = socket.socket()
    client.connect((host, port))

    message = input(" -> ")
    
    while message.lower().strip() != "end":
        client.send(message.encode())
        message = input(" -> ")

    client.close()

if __name__ == "__main__":
    client_func()
