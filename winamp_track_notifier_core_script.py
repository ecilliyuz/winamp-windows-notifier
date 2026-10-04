import time
import ctypes
from win11toast import toast

# Native Windows API (Zero extra dependencies for window tracking)
user32 = ctypes.windll.user32

LAST_TRACK = ""

def get_winamp_track():
    """Retrieve the current playing track title from Winamp's main window handle."""
    # Winamp's window class name is standard across all releases: "Winamp v1.x"
    hwnd = user32.FindWindowW("Winamp v1.x", None)
    if not hwnd:
        return None

    length = user32.GetWindowTextLengthW(hwnd)
    if length == 0:
        return None

    buff = ctypes.create_unicode_buffer(length + 1)
    user32.GetWindowTextW(hwnd, buff, length + 1)
    title = buff.value

    # Winamp titles typically end with " - Winamp" or indicate "[Paused]"
    if " - Winamp" in title:
        track = title.replace(" - Winamp", "").strip()

        # Remove track index prefix if present (e.g., "01. Artist - Title")
        if ". " in track and track.split(". ")[0].isdigit():
            track = track.split(". ", 1)[1]

        return track

    return None

def main():
    global LAST_TRACK
    print("Winamp Track Notifier is active. Listening for track changes...")

    while True:
        try:
            current_track = get_winamp_track()

            if current_track and current_track != LAST_TRACK:
                LAST_TRACK = current_track
                toast(
                    "Now Playing",
                    current_track,
                    app_id="Winamp",
                    duration="short"
                )

        except Exception as err:
            # Prevent crashes on unexpected OS sleep/wake cycles
            print(f"Error checking window title: {err}")

        time.sleep(1)

if __name__ == "__main__":
    main()