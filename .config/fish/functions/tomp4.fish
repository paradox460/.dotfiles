function tomp4 --description "Convert video file(s) to MP4 suitible for Telegram"
  argparse 'c/copy' -- $argv

  if set -q _flag_copy
    if test (count $argv) -gt 1
      echo "Copy only works with one file at a time, exiting"
      exit 1
    end
    if not command -sq file-to-clipboard
      echo "No file-to-clipboard command, will not copy"
      set -e _flag_copy
    end
  end
  for i in $argv
    set -l ext (string split --right --max 1 '.' -- $i)[-1]
    set -l newname (basename $i "."$ext)'.mp4'
    ffmpeg -hide_banner -i $i -c:v libx264 -c:a aac -pix_fmt yuv420p -map_metadata -1 $newname
    set -q _flag_copy; and file-to-clipboard (readlink -f $newname)
  end
end
