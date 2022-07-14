function tomp4 --description "Convert video file(s) to MP4 suitible for Telegram"
  for i in $argv
    set -l ext (string split --right --max 1 '.' -- $i)[-1]
    ffmpeg -i $i -c:v libx264 -c:a aac -pix_fmt yuv420p -map_metadata -1 (basename $i $ext).mp4
  end
end
