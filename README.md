# Pitch-Perfect

Pitch Perfect is a simple voice transformation app which allows you to record sounds using the device's microphone, and apply different effects on the recorded audio. The application uses AVFoundation to record, play and apply sound effects to the recording. There are a total of 6 different effects: 1. Snail (Slow Playback) 2. Rabbit (Fast Playback) 3. Chipmunk (High Pitch) 4. Darth Vader (Low Pitch) 5. Parrot (Echo) 6. Reverb

Pitch Perfect app one of my very first projects when I first started learning iOS development. This app showcases my early Swift programming skills. This is when I was first exposed to mobile application development and iOS Frameworks. During the process of this project, not only did I consolidate my existing knowledge on object-oriented concepts; I learned to read documentations and research online to solve my problems.

Overall this was an execellent beginner project for me to gain introductory knowledge in iOS development.

## Installation

1. git clone https://github.com/mmmk84512/Pitch-Perfect
2. open PitchPerfect.xcodeproj

## Features
- Record and replay audio
- Change the pitch of the audio
- Change the speed of the audio
- Add echo effect
- Add reverb effect
- Save the audio

## Project Overview

### Record Audio View

The record audio view is the initial view for the app, and consists of a button with a microphone image. A label indicates that you should tap the button to start recording is located beneath the image.

Tapping this microphone button starts an AVAudio recording session. The app uses code from AVFoundation to record sounds from the microphone. As the app is recording, the microphone button animates, using a custom UIKit animation function called FadeInAndOut. Adding this animation was my first attempt at utilizing Swift class extensions.

Tapping the button disables the record button, display a “recording” indicator label, and presenting a stop button. For extra credit, this app presents you with the ability to pause and restart recordings in addition to stopping them by interacting with the audio playback controls.

When the stop button is clicked, the app completes its recording and then pushes the second scene (described below under “Play Sounds View”) onto the navigation stack. The title in the navigation bar appears as “Record”.

### Play Sound View

The play sounds view has four buttons to play the recorded sound file and a button to stop the playback.

The buttons for playing the recorded sounds have images corresponding to their sound effect:

Chipmunk image → High-pitched sound
Darth Vader image → Low-pitched sound
Snail image → Slow sound
Rabbit image → Fast sound
Parrot → Echo
Overlapping Waveforms → Reverb
Additional sound effects, such as reverb and echo, were implemented and added to this view for extra credit.

The play sounds view is pushed onto the navigation stack. At the top left of the screen, the navigation bar’s left button says “Record”. Clicking this button will pop the play sounds view off the stack and return you to the record sounds view.

At this point, the play sounds view will be in its original state. The microphone button will be enabled and the stop button will be hidden.

## Contributing

1. Fork it!
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request
