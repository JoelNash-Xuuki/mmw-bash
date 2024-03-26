Welcome to MMW

* Multiple Media Workstation * 

A brief description the project and repo.
A project management tool for audio production. It includes 
functions for setting project parameters, creating project 
directories, configuring recording settings, recording audio, 
playing audio, building sheet music, creating sound design, 
rendering audio, moving audio files, and converting audio formats.

* Description * 
  The follow wil provide a more detailed overview of the project, 
  its purpose, and any key features.

  Key features of the project:
    - Setting project parameters such as project name, location, 
      and session.
    - Creating project directories with specific subdirectories 
      for audio files and sessions.
    - Configuring recording settings using ecasound commands.
    - Recording audio based on the configured settings.
    - Playing back recorded audio.
    - Building sheet music using a sheet builder tool.
    - Creating LilyPond score and MIDI files.
    - Generating sound design using a modsyn tool.
    - Rendering audio using Csound.
    - Moving rendered audio files to a specific directory for a 
      website.
    - Converting audio formats using FFmpeg.


* Installation * 
Instructions on how to install and set up the project.

* Usage * 
These functions provide a comprehensive set of tools for 
managing audio production projects efficiently.
How to use the project, including any commands or configurations.

  - Source the configuration file by running 
    `source $HOME/mmw/test/tmp/config`.
  - Use `setProj`, `setProjLoc`, and `setSession` functions to set 
    project parameters.
  - Use `createProj` to create a new project directory structure.
  - Use `configRec` to configure recording settings.
  - Use `rec` to start recording audio.
  - Use `play` to play back recorded audio.
  - Use `buildSheetMusic` to generate sheet music.
  - Use `createLyScoreAndMidiFile` to create LilyPond score and 
    MIDI files.
  - Use `createSoundDesign` to generate sound design.
  - Use `renderAudio` to render audio files.
  - Use `mvAudioToSite` to move audio files to a website directory.
  - Use `convertAudio` to convert audio formats.

* Contributing * Guidelines for contributing to the project, such as 
  how to report issues or submit pull requests.

* License * Specify the project's license and any terms or conditions 
  for use.

* Additional sections * Depending on the project, you may also 
  include sections for troubleshooting, acknowledgments, or contact 
  information.

To helps users and contributors verify that the project is 
functioning correctly and, provides guidance on how to test their 
own contributions. 

* Running Tests *

1. **Test requirements**: Mention any specific tools or libraries 
  needed to run the tests, and provide instructions on how to 
  install them.
2. **Test execution**: Explain how to execute the tests, 
  including any necessary commands or configurations. For example, 
  you might include a command like `npm test` or `pytest` to run 
  tests for JavaScript or Python projects, respectively.

$HOME/$USER/mmw/bin/run-mmw-project-tests

$HOME/$USER/mmw/bin/run-mmw-project-tests

3. **Test coverage**: Briefly mention what percentage of the 
  codebase is covered by the tests and whether there are any known 
  gaps in the test suite.

4. **Test results**: Explain how to interpret the test results, 
  including any relevant logs or reports generated during the test 
  execution.
