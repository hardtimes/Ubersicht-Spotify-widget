
command: """
## Checks if spotify is open before querying it, preventing the script from opening spotify by query, and only displays information if spotify is open
IFS='|' read -r theArtist theName <<<"$(osascript <<<'
tell application "System Events" to (name of processes) contains "Spotify"
set spotifyisrunning to the result
if spotifyisrunning = true then
		tell application "Spotify"
        set theTrack to current track
        set theArtist to artist of theTrack
        set theName to name of theTrack
        return theArtist & "|" & theName
    end tell
end if
')"
if [[ $theArtist != ""  ]]; then echo "$theArtist - $theName"; fi

"""

refreshFrequency: 2000

style: """
  top: 10px
  left: 10px
  color: #fff

  .some-class
    font-family: Helvetica Neue
    font-size: 30px
    font-weight: 100
    text-shadow: 0 3px 5px #000000;
"""

render: (output) -> """
	<div class="some-class">#{output}</div>
"""
