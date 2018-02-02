# Import needed modules from osc4py3
from osc4py3.as_eventloop import *
from osc4py3 import oscbuildparse

# Start the system.
osc_startup()

# Make client channels to send packets.
osc_udp_client("192.168.0.4", 2781, "aclientname")

# Build a simple message and send it.
msg = oscbuildparse.OSCMessage("/test/me", ",sif", ["text", 672, 8.871])
osc_send(msg, "aclientname")

# Build a message with autodetection of data types, and send it.
msg = oscbuildparse.OSCMessage("/test/me", None, ["text", 672, 8.871])
osc_send(msg, "aclientname")

# Buils a complete bundle, and postpone its executions by 10 sec.
exectime = time.time() + 10   # execute in 10 seconds
msg1 = oscbuildparse.OSCMessage("/sound/levels", None, [1, 5, 3])
msg2 = oscbuildparse.OSCMessage("/sound/bits", None, [32])
msg3 = oscbuildparse.OSCMessage("/sound/freq", None, [42000])
bun = oscbuildparse.OSCBundle(oscbuildparse.unixtime2timetag(exectime),
                    [msg1, msg2, msg3])
osc_send(bun, "aclientname")

# Periodically call osc4py3 processing method in your event loop.
finished = False
while not finished:
    # You can send OSC messages from your event loop too…
    # …
    osc_process()
    # …

# Properly close the system.
osc_terminate()