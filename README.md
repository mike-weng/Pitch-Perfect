# Pitch-Perfect
<!--key: 4-->
<!--category: iOS Apps-->
<!--title: "Pitch Perfect iOS App"-->
<!--description: "Pitch Perfect iOS App - Created in Swift 2.0 using XCode for iOS 9"-->
<!--project-page: 'https://github.com/mmmk84512/Pitch-Perfect'-->
<!--downloads: -->
<!--build-info: ['Version: 1.0', 'iPhone: 4S or later', 'iPad: N/A', 'xCode: Version 7.3', 'iOS: 9.0', 'Swift: 2.0']-->
<!------->

## Summary

I really enjoyed making this application and I definitely went above and beyond in the process. I experimented with adding `motion` and `gesture recognition` controls for the audio playback and effects, I added several other effects (reverb & delay) and I added `UIKit animations` to the record view.

This app showcases my early Swift programming skills.  I followed best practices early on and, without knowing very much about the Swift programming language, I believe that I did a very good job and enjoyed it thoroughly.  I have come a long way since making this application and before I am done with the iOS Nanodegree, I will go back and add `Core Data`, among other things, to this application.

I went above and beyond the specifications of this app.

##__Test the App__
---
To run this app, please do the following:

 1.  Download it to your computer using one of the download links above, from the [GitHub project page]({{page.project-page}}) or from my [portfolio page]({{site.url}}{{page.url}}) on the right-hand side.  
 2.  Once downloaded, open the project folder and then open the Pitch Perfect.xcodeproj file.
    - Make sure that you are testing the application on a device that it will run efficiently on (see build information on the right.)  
    - I recommend running it on an iPhone 6 or newer, but it will run fine on anything newer than an iPhone 4S.
 3.  If you are using the iPhone Simulator, please run it on a newer device such as the iPhone 6 or 6S Plus.  It should be compiled with XCode 7.0 or 7.1 in Swift 2.0.  I will update it over time when new versions of XCode are released.

Below is a short video guide to illustrate how you could build and run the app on a Mac running OSX El Capitan.

If you don't want to run it or can't for some reason, take a look at the video at the top of the page or screenshots below.  You can follow along with the video, or read the instructions below.

##__Project Specifications__
---
The Pitch Perfect app allows users to record a sound using the device’s microphone. It then allows users to play the recorded sound back with six different sound effects / filters.  The application uses `AVFoundation` to record, play and apply sound effects to the recording.  The sound effects are enumerated below.
1. Snail (Slow Playback)
2. Rabbit (Fast Playback)
3. Chipmunk (High Pitch)
4. Darth Vader (Low Pitch)
5. Parrot (Echo)
6. Reverb

###__Record Sounds View__
---
The record sounds view is the initial view for the app, and consists of a button with a microphone image. A label indicates that you should tap the button to start recording is located beneath the image.

Tapping this microphone button starts an `AVAudio recording session`. The app uses code from `AVFoundation` to record sounds from the microphone.  As the app is recording, the microphone button animates, using a custom `UIKit animation` function called `FadeInAndOut`.  Adding this animation was my first attempt at utilizing `Swift class extensions`.

Tapping the button disables the record button, display a “recording” indicator label, and presenting a stop button. For extra credit, this app presents you with the ability to pause and restart recordings in addition to stopping them by interacting with the audio playback controls.

When the stop button is clicked, the app completes its recording and then pushes the second scene (described below under “Play Sounds View”) onto the `navigation stack`.
The title in the navigation bar appears as “Record”.

###__Play Sounds View__
---
The play sounds view has four buttons to play the recorded sound file and a button to stop the playback.

The buttons for playing the recorded sounds have images corresponding to their sound effect:

-  Chipmunk image → High-pitched sound
-  Darth Vader image →  Low-pitched sound
-  Snail image → Slow sound
-  Rabbit image → Fast sound
-  Parrot → Echo
-  Overlapping Waveforms → Reverb

Additional sound effects, such as reverb and echo, were implemented and added to this view for extra credit.

The play sounds view is pushed onto the `navigation stack`. At the top left of the screen, the navigation bar’s left button says “Record”. Clicking this button will pop the play sounds view off the stack and return you to the record sounds view.

At this point, the play sounds view will be in its original state. The microphone button will be enabled and the stop button will be hidden.

##__Images__
---
<figure class="third center">
	<a href="http://techrapport.com/assets/images/portfolio/pitch-perfect-1.png"><img src="http://techrapport.com/assets/images/portfolio/pitch-perfect-1.png" alt=""></a>
    <figcaption>Record Sounds View →</figcaption>
	<a href="http://techrapport.com/assets/images/portfolio/pitch-perfect-2.png"><img src="/assets/images/portfolio/pitch-perfect-2.png" alt=""></a>
    <figcaption>Recording in Progress →</figcaption>
	<a href="http://techrapport.com/assets/images/portfolio/pitch-perfect-3.png"><img src="/assets/images/portfolio/pitch-perfect-3.png" alt=""></a>
	<figcaption>Play Sounds View</figcaption>
</figure>
