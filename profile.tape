# Profile GIF with seamless loop
# Run locally: vhs profile.tape
# Run in CI: charmbracelet/vhs-action@v2

# -----------------------------------------------------------------------------
# Output Configuration
# -----------------------------------------------------------------------------
Output profile.gif

# -----------------------------------------------------------------------------
# Terminal Settings (matching your setup)
# -----------------------------------------------------------------------------
Set Shell bash
Set FontFamily "JetBrainsMono Nerd Font"
Set FontSize 12
Set Width 1200
Set Height 700
Set Padding 20
Set Framerate 30
Set LoopOffset 0%

# Use a dark background that works with catppuccin mocha
Set Theme "Catppuccin Mocha"

# -----------------------------------------------------------------------------
# Scene 1: Terminal Boot
# -----------------------------------------------------------------------------

Sleep 500ms

# Start tmux with a named session
Type "tmux new-session -s yousef"
Enter
Sleep 1500ms

# -----------------------------------------------------------------------------
# Scene 2: Create Split Layout
# -----------------------------------------------------------------------------

# Split vertically 50/50 using C-b |
Ctrl+b
Sleep 100ms
Type "|"
Sleep 800ms

# Split the right pane horizontally using C-b -
Ctrl+b
Sleep 100ms
Type "-"
Sleep 800ms

# -----------------------------------------------------------------------------
# Scene 3: Show activity stats in top-right pane
# -----------------------------------------------------------------------------

# Move to top-right pane
Ctrl+b
Sleep 100ms
Up
Sleep 300ms

Hide
Type "clear && termgraph data/activity.dat --title 'YTD Activity' --color green --width 20 --format '{:.0f}' && sleep 9999"
Show
Enter
Sleep 1500ms

# -----------------------------------------------------------------------------
# Scene 4: Show language stats in bottom-right pane
# -----------------------------------------------------------------------------

# Move to bottom-right pane
Ctrl+b
Sleep 100ms
Down
Sleep 300ms

Hide
Type "clear && termgraph data/languages.dat --title 'Top Languages (by commits)' --color cyan --width 20 --format '{:.0f}' --suffix ' commits' && sleep 9999"
Show
Enter
Sleep 1500ms

# -----------------------------------------------------------------------------
# Scene 5: Go back to main pane and open Neovim
# -----------------------------------------------------------------------------

# Go back to the main (left) pane
Ctrl+b
Sleep 100ms
Left
Sleep 500ms

# Open neovim (shows alpha dashboard with Palestine flag)
Type "nvim"
Enter
Sleep 3000ms

# Edit about.rb
Type ":e about.rb"
Enter
Sleep 500ms

# Disable auto-indent and auto-comment for clean typing
Type ":set paste"
Enter
Sleep 300ms

# Enter insert mode
Type "i"
Sleep 300ms

# Type the Ruby code with realistic typing speed
Type@80ms "class Yousef < SoftwareEngineer"
Enter
Type@80ms "  # Salam! I'm a Software Engineer II @ GitHub"
Enter
Enter
Type@80ms "  COMPANY = 'GitHub'"
Enter
Type@80ms "  TEAM = 'Observability Experience'"
Enter
Enter
Type@80ms "  def initialize"
Enter
Type@80ms "    @learning = %w[Go Ruby DataDog Splunk]"
Enter
Type@80ms "    @passion = 'Open Source & Neovim'"
Enter
Type@80ms "  end"
Enter
Enter
Type@80ms "  def fun_fact"
Enter
Type@80ms "    'I am Way older than I look 🙈'"
Enter
Type@80ms "  end"
Enter
Type@80ms "end"

Sleep 500ms

# Exit insert mode
Escape
Sleep 300ms

# -----------------------------------------------------------------------------
# Scene 6: Hold final view before loop
# -----------------------------------------------------------------------------

Sleep 3000ms

# Save and quit
Type ":wq"
Enter
Sleep 500ms

# -----------------------------------------------------------------------------
# Scene 7: Fade to loop - clear screen for clean transition
# -----------------------------------------------------------------------------

Hide
Type "clear"
Show
Enter
Sleep 500ms
