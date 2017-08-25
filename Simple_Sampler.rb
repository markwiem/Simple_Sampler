# Simple Sampler v0.1
# Mark Wiem 2017/08/24
######################################
#16 Pad Sampler built using SonicPi 3.0

#load your local sample of choice
juicy_sound = '/Users/markwiem/Documents/CODE/Sonic_Pi/Samples/TestSamples/BeNice.wav'

#select the start positions, scaled between 0-1, for the playback points, as many as you'd like
start_location = [0.25, 0.45, 0.9, 0.0,
                  0.0, 0.0, 0.0, 0.0,
                  0.0, 0.0, 0.0, 0.0,
                  0.0, 0.0, 0.0, 0.0]

#desired play_length of sample play in seconds
play_length = [0.0125, 0.01, 0.01, 0.0,
               0.0, 0.0, 0.0, 0.0,
               0.0, 0.0, 0.0, 0.0,
               0.0, 0.0, 0.0, 0.0,]

#Define pads used in sampler by channel number
pad_channel = [48, 49, 50, 51,
               44, 45, 46, 47,
               40, 41, 42, 43,
               36, 37, 38, 39]

number_of_pads = 16

live_loop :midi_piano do
  use_real_time
  samp, start = sync "/midi/microkontrol_port_b/2/1/control_change"
  for i in range(0, number_of_pads+1);
    outro = start_location[i] + play_length[i]
    if samp == pad_channel[i] and (start == 0 or start == 127);
      sample juicy_sound, start: start_location[i], finish: outro, attack: 0.1, release: 0.1, rate: 1
    end
    
  end
end
