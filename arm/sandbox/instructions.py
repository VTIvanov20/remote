import sys
sys.path.append('..')
from uarm.wrapper import SwiftAPI

# todo: document which port is needed for the user (device manager -> ports -> COM port number (usually 3 or 4))
swift = SwiftAPI(port="COM4", callback_thread_pool_size=1)

swift.set_position(20, 0, 20)
swift.reset()
swift.set_position(150, 0, 150)

print(swift.get_position())