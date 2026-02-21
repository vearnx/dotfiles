if status is-interactive
    # Commands to run in interactive sessions can go here
fastfetch 
starship init fish | source
abbr --add poweroff systemctl\ poweroff
abbr --add reboot systemctl\ reboot
abbr --add backup bash\ ~/backups/use-this-script.sh
abbr --add sleep 'systemctl suspend'
end

# Added by LM Studio CLI (lms)
set -gx PATH $PATH /home/vearnx/.lmstudio/bin

# OpenClaw CLI (npm global prefix)
# Ensures `openclaw` is available in Fish.
if test -d $HOME/.npm-global/bin
    set -gx PATH $PATH $HOME/.npm-global/bin
end

# OpenClaw Completion
source "/home/vearnx/.openclaw/completions/openclaw.fish"
