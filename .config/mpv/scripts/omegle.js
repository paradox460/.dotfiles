var timer;
var cmd = {
  name: "subprocess",
  args: ["/Applications/Keyboard\ Maestro.app/Contents/MacOS/keyboardmaestro", "85F829D2-7A6B-4226-89C4-ACC171AD0475"],
  playback_only: false,
  detach: true
}

var options = {
  enable: false,
  blackscreen: true
}

mp.options.read_options(options);

function onLoop() {
  if (mp.get_property_native("playback-time") < 0.1 && !timer) {
    mp.msg.info("skipping omegle");
    mp.command_native_async(cmd);
    endPlayback();
  }
  resetTimer();
}

function resetTimer() {
  clearTimeout(timer);
  timer = setTimeout(function() {
    timer = undefined;
  }, 1000);
}

function blackScreen(enable) {
  if (enable && options.blackscreen) {
    mp.set_property_native("pause", "yes");
    mp.set_property_native("brightness", -100)
  } else {
    mp.set_property_native("pause", "no");
    mp.set_property_native("brightness", 0)
  }
}

function endPlayback() {
  resetTimer();
  var startTime = mp.get_property_number("ab-loop-a") || 0;
  mp.set_property_native("time-pos", startTime);
  blackScreen(true);
}

function startPlayback(instant) {
  var delay = instant? 0 : 1000;
  setTimeout(function() {
    blackScreen(false);
  }, delay);
}

function setUpListener() {
  if (mp.get_property_native("loop-file")) {
    mp.register_event('eof-reached', function() {

    })
  }
}

function cleanup() {
  mp.set_property_native("ab-loop-a", null);
  mp.set_property_native("ab-loop-b", null);
  mp.set_property_native("vf", null);
  mp.set_property_native("video-rotate", 0);
}


if (options.enable) {
  mp.msg.info("enabling");
  mp.register_event('file-loaded', startPlayback);
  mp.register_event('seek', onLoop);
  mp.register_event("end-file", cleanup)
  mp.register_script_message("endPlayback", endPlayback);
  mp.register_script_message("startPlayback", startPlayback);
  mp.add_key_binding('a', function() {
    startPlayback(true);
  })
}
