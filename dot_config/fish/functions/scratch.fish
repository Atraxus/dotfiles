# functions/scratch.fish
function scratch --description 'open timestamped scratch buffer'
  nvim "/tmp/scratch-$(date '+%Y%m%d-%H%M%S').md"
end
