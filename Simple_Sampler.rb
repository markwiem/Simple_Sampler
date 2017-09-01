# Simple Sampler v0.1
# Mark Wiem 2017/08/24
######################################
#16 Pad Sampler built using SonicPi 3.0
#loads a sample bank equal to the number of sample pads used,
#should the number of samples in the bank be less than the number of pads,
#the index will roll over to the beginning of the sample list again

#load your local sample bank
juicy_sound = '/Users/markwiem/Documents/CODE/Sonic_Pi/Samples/TestSamples/'

#print sample_groups(juicy_sound)

#select the start positions, scaled between 0-1, for the playback points, as many as you'd like
start_location = [0.25, 0.45, 0.9, 0.78,
                  0.0, 0.0, 0.0, 0.0,
                  0.0, 0.0, 0.0, 0.0,
                  0.0, 0.0, 0.0, 0.0]

#desired play_length of sample play in seconds
play_length = [0.0125, 0.01, 0.01, 0.01,
               0.0, 0.0, 0.0, 0.0,
               0.0, 0.0, 0.0, 0.0,
               0.0, 0.0, 0.0, 0.0,]

#Define pads used in sampler by channel number
pad_channel = [48, 49, 50, 51,
               44, 45, 46, 47,
               40, 41, 42, 43,
               36, 37, 38, 39]

#Number of pads the sampler has
number_of_pads = 16

live_loop :midi_piano do
  use_real_time
  samp, trigger = sync "/midi/microkontrol_port_b/2/1/control_change"
  for i in range(0, number_of_pads+1);
    if samp == pad_channel[i] and (trigger == 0 or trigger == 127);
      sample juicy_sound, i.round, start: start_location[i], finish: (start_location[i] + play_length[i]),
        attack: 0.1, release: 0.1, rate: 1
    end
  end
end
