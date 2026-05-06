# functions/cap.fish
function cap --description 'capture to inbox'
  echo "- $argv" >> ~/Sync/notes/inbox.md
end
