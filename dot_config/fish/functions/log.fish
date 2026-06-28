# functions/log.fish
function log --description 'open log with todays date header'
  set today "### "(date '+%Y-%m-%d')
  if not grep -qF "$today" ~/Sync/notes/log.md
    echo -e "\n$today" >> ~/Sync/notes/log.md
  end
  nvim + ~/Sync/notes/log.md
end
