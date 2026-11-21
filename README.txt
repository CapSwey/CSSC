================================================================================
CapSwey's Sync Calculator (CSSC)
================================================================================

CSSC is a lightweight, offline Windows batch utility for calculating exact audio,
subtitle, and Dolby Vision RPU sync delays between two video sources of the
same frame rate. Built specifically for MKVToolNix and DDVT (Dolby Vision Tool)
workflows.


WHAT IT DOES
--------------------------------------------------------------------------------
When muxing an audio track, subtitle track, or Dolby Vision RPU metadata from
Movie B onto a target video from Movie A, differences in studio logos, black
leader frames, or intro cuts often cause the tracks to start out of sync.

By comparing the frame number of a matching hard cut (scene change) in both
releases, cssc.bat calculates:

  1. Delay Direction: Whether you need a Positive or Negative delay.
  2. Frame Difference: The exact offset in frames (for frame-based tools like
     DDVT).
  3. Millisecond Delay: The exact offset in milliseconds using true broadcast
     frame-rate fractions (for MKVToolNix).
  4. Auto-Clipboard: Automatically copies the clean millisecond value (e.g.,
     -1001 or 1001) to your Windows clipboard so you can paste it directly
     with Ctrl+V.


SUPPORTED FRAME RATES
--------------------------------------------------------------------------------
At startup, select your source frame rate (or simply press Enter for the
default 23.976 fps):

  [1] 23.976 fps (Default)  - NTSC Film (24000/1001)  -> (diff * 1001) / 24
  [2] 24.000 fps            - True 24p Cinema         -> (diff * 1000) / 24
  [3] 25.000 fps            - PAL                     -> (diff * 1000) / 25
  [4] 29.970 fps            - NTSC Video (30000/1001) -> (diff * 1001) / 30
  [5] 50.000 fps            - PAL High Frame Rate     -> (diff * 1000) / 50
  [6] 59.940 fps            - NTSC HFR (60000/1001)   -> (diff * 1001) / 60


HOW TO USE
--------------------------------------------------------------------------------
1. Find a matching hard cut:
   Open both videos in a frame-accurate player or editor (such as Avidemux,
   VirtualDub2, Media Player Classic, Vapoursynth/AviSynth etc.) and note the exact frame number
   where the same scene starts in both files:
     * Movie A: Your target video track.
     * Movie B: The source file containing the audio, subtitles, or RPU you
       want to sync.

2. Run cssc.bat:
   Double-click cssc.bat to launch CapSwey's Sync Calculator.

3. Select Frame Rate:
   Press Enter for 23.976 fps, or type 2-6 and press Enter.

4. Enter Frame Numbers:
   Type the frame number for Movie A, press Enter, then type the frame number
   for Movie B and press Enter.

5. Paste into your tool:
   * In MKVToolNix: Select the audio or subtitle track from Movie B, click the
     "Delay (in ms)" field under "Timestamps and default duration", and press
     Ctrl+V.
   * In DDVT: Use either the Frame Diff or Delay (ms) output depending on
     whether your DDVT step expects frames or milliseconds.

6. Repeat:
   Press any key to clear the screen and calculate your next file.


EXAMPLE CALCULATION
--------------------------------------------------------------------------------
  * Frame Rate:                          23.976 fps
  * Movie A (Target Video) scene start:  Frame 7405
  * Movie B (Source Audio) scene start:  Frame 7429

  Output:
  * Direction:   NEGATIVE DELAY (Movie B is behind)
  * Frame Diff:  -24 frames
  * Delay (ms):  -1001 ms  (automatically copied to clipboard as -1001)

(Note: Always verify sync near both the beginning and the end of the film. If
the two releases have different edits or extra frames mid-movie, a single start
delay will not keep the entire runtime in sync.)


REQUIREMENTS & SAFETY
--------------------------------------------------------------------------------
  * OS: Windows 10 / Windows 11 (uses built-in Windows Command Prompt and
    PowerShell - no external dependencies or internet connection required).
  * Transparent Code: Distributed as a plain .bat script so anyone can
    right-click and open it in Notepad to inspect the code before running.



ENJOY AND HAPPY SYNCING! :)

