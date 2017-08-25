#load your local sample of choice
juicy_sound = '/Users/markwiem/Documents/CODE/Sonic_Pi/Samples/TestSamples/BeNice.wav'

#select the start positions, scaled between 0-1, for the playback points, as many as you'd like
start_location = 0.25
start_location1 = 0.45
#desired play_length of sample play in seconds
play_length = 0.0125
play_length1 = 0.01

outro = start_location + play_length
outro1 = start_location1 + play_length1


live_loop :midi_piano do
  use_real_time
  samp, start = sync "/midi/microkontrol_port_b/2/1/control_change"
  if samp == 48 and (start == 0 or start == 127);
    sample juicy_sound, start: start_location, finish: outro, attack: 0.1, release: 0.1, rate: 1
  end
  if samp == 49 and (start == 0 or start == 127);
    sample juicy_sound, start: start_location1, finish: outro1, attack: 0.1, release: 0.1, rate: 0.9
  end
  
end


