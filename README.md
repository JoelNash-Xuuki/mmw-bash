# Welcome to Multiple Media Workstation Suite (MMWS)
# TODO
- run 'mmw-config h'.

# Description # 
  The follow wil provide a more detailed overview of the project, 
  its purpose, and any key features.

  Key features for mmm:
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
   Key features for ip:
    - Generate an image.

# Installation # 
Instructions on how to install and set up the project.

To build sheetbuilder, testsheetbuilder, modsyn and testmodyn:
```bash
make
```


FFMPEG required.
Image Magick

# Usage # 
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

# Contributing # 
  Guidelines for contributing to the project, such as 
  how to report issues or submit pull requests.

  - run tests: to confirm features.

  testsheetbuilder then the src/main  file to follow the  story for sheetbuilder.

# License # 
  Specify the project's license and any terms or conditions for use.

# Additional sections # 
Depending on the project, you may also include sections for 
troubleshooting, acknowledgments, or contact information.

To helps users and contributors verify that the project is 
functioning correctly and, provides guidance on how to test their 
own contributions. 

# Deploy 
```bash
sudo cp bin/mmw /usr/local/bin/mmw
```
# Tests #
Description of current testing method:

First run: 
```bash
,bin/mmw-config runTests
```
Test 1 fails if 'mmw-config runTest' is not run beforehand.
```bash
bats test/mmw.bats
```

```bash
./bin/ip.sh runTests
```



The tests will describe the features of mmw for the user

1. **Test requirements**: Mention any specific tools or libraries needed to 
run the tests, and provide instructions on how to install them.

2. **Test execution**: Explain how to execute the tests, 
  including any necessary commands or configurations. For example, 
  you might include a command like `npm test` or `pytest` to run 
  tests for JavaScript or Python projects, respectively.

  '$HOME/$USER/mmw/bin/run-mmw-project-tests'


3. **Test coverage**: Briefly mention what percentage of the 
  codebase is covered by the tests and whether there are any known 
  gaps in the test suite.

4. **Test results**: Explain how to interpret the test results, 
  including any relevant logs or reports generated during the test 
  execution.

# Trouble Shooting #
## EXPEDITION 1 ##
## SCOPE
After running 'sudo apt update && sudo apt install imagemagick' on the RPI the 
command installs imagemagick version (8:6.9.11.60+dfsg-1.3+deb11u3). Also written like 
'ImageMagick-im6.q16(1)' in its man page. This version doesn't contain magick command. 

When I run pacman on arch linux this installs imagemagick-7.1.1.29-2.
which does have the magick command. I feel more familiar with imagemagick-7.1.1.29-2.
The rpi install needs a version of imagemagick that has the magick option.

## COMPASS
To ensure a version of ImageMagick with the 'magick' command on your Raspberry 
Pi, try installing the 'imagemagick' package from the 'Raspbian backports'
repository. This repository often contains newer versions of software compared 
to the standard Raspbian repositories.

To enable the backports repository, you can add the following line to your 
/etc/apt/sources.list file:

'deb http://deb.debian.org/debian bullseye-backports main'

Before previous line is added review the file /etc/apt/sources.list 

The lines in the /etc/apt/sources.list file specify different software repositories 
that apt-get can use to download and install packages. Here is a breakdown of what each 
line means.

'deb http://raspbian.raspberrypi.org/raspbian/ bullseye main contrib non-free rpi'.
This line specifies the main Raspbian repository for the bullseye release. It includes 
the main, contrib, non-free, and rpi components, which provide different types of 
software packages.

The two lines '# Uncomment line below then 'apt-get update' to enable 'apt-get source' and
   #deb-src http://raspbian.raspberrypi.org/raspbian/ bullseye main contrib non-free rpi'
This second line is also a commented-out deb-src line, which is used for downloading source 
packages. Uncommenting this line and running 'apt-get update' would enable the ability 
to download source packages using 'apt-get source'.

deb http://deb.debian.org/debian bullseye-backports main
This line specifies the Debian backports repository for the bullseye release. 
Backports are newer versions of software packages that are not included in the main 
repositories. Adding this line allows you to access newer versions of software 
that may not be available in the standard repositories.

## LENS

After adding the backports repository, run 'sudo apt update' and then try 
installing ImageMagick again with 'sudo apt install -t bullseye-backports imagemagick'...

But, unfortunatly the last command results in "E: The value 'bullseye-backports' is 
invalid for APT::Default-Release as such a release is not available in the sources".

The error message means that the 'bullseye-backports' 
release is not available in the sources you have configured.

Run 'sudo apt update' to refresh the package lists and ensure that the backports 
repository is properly recognized.

The out is the following

Hit:1 http://archive.raspberrypi.org/debian bullseye InRelease
Get:2 http://deb.debian.org/debian bullseye-backports InRelease [49.0 kB]
Hit:4 http://raspbian.raspberrypi.org/raspbian bullseye InRelease
Hit:5 https://cli.github.com/packages stable InRelease
Get:6 https://download.docker.com/linux/debian bullseye InRelease [43.3 kB]
Get:7 https://deb.nodesource.com/node_16.x bullseye InRelease [4,586 B]
Get:3 http://apt.blokas.io rpi InRelease [3,922 B]
Err:2 http://deb.debian.org/debian bullseye-backports InRelease
The following signatures couldn't be verified because the public key 
is not available: NO_PUBKEY 0E98404D386FA1D9 NO_PUBKEY 6ED0E7B82643E131
Reading package lists... Done
W: GPG error: http://deb.debian.org/debian bullseye-backports InRelease: The following 
signatures couldn't be verified because the public key is not available: 
NO_PUBKEY 0E98404D386FA1D9 NO_PUBKEY 6ED0E7B82643E131
E: The repository 'http://deb.debian.org/debian bullseye-backports InRelease' is not signed.
N: Updating from such a repository can't be done securely, 
and is therefore disabled by default.
N: See apt-secure(8) manpage for repository creation and user configuration details.

This output indicates that there is an issue with the bullseye-backports repository 
due to missing public keys. This means that the repository is not signed, 
and updating from it is disabled by default for security reasons.

Regarding your question about installing a later version of ImageMagick, the 
issue with the bullseye-backports repository should not directly affect the 
installation of ImageMagick. However, if you are trying to install a newer version 
of ImageMagick from the bullseye-backports repository, you may encounter 
difficulties due to the repository not being properly signed.

To resolve the issue with the bullseye-backports repository, you can try to import 
the missing public keys using the following commands:
- sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
- sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131

After importing the keys, you can run 'sudo apt update' again to refresh the 
package lists and see if the issue is resolved.

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
Warning: apt-key is deprecated. Manage keyring files in trusted.gpg.d instead (see apt-key(8)).
Executing: /tmp/apt-key-gpghome.3qw0f0aU3N/gpg.1.sh --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
gpg: key 73A4F27B8DD47936: "Debian Archive Automatic Signing Key (11/bullseye) <ftpmaster@debian.org>" not changed
gpg: Total number processed: 1
gpg:              unchanged: 1

To manage keyring files in trusted.gpg.d, I ccould follow these steps:

Navigate to the directory where the trusted.gpg.d folder is located. This folder 
is typically found in /etc/apt/. List the contents of the trusted.gpg.d folder to i
see the existing keyring files. To add a new keyring file, you can use the 
command 'sudo cp /path/to/your/keyring/file.gpg /etc/apt/trusted.gpg.d/'. After copying 
the keyring file, you can run 'sudo apt update' to refresh the package lists and ensure 
the new keyring is recognized.

By managing keyring files in trusted.gpg.d, you can securely add and manage 
GPG keys for repositories on your system.

But we're not going to do that today. 

## WRENCH
Run the unit test with 'convert' instead of 'magick'

## CHISEL
And the test results in ...

## PLUMB

# QUILL

why is the following so? "'Raspbian backports'
repository. This repository often contains newer versions of software compared 
to the standard Raspbian repositories."

Whats distinctive about 'apt-get source'?

There might be a few reasons why you're having trouble with the `magick` 
command on your Raspberry Pi. Here are a few steps you can try:

**Update and Upgrade**: Make sure your Raspberry Pi is up to date by running: 
`sudo apt update` and `sudo apt upgrade`.

**Install ImageMagick**: Install ImageMagick using the package manager 
by running: `sudo apt install imagemagick`.

**Verify Installation**: Verify that ImageMagick is installed correctly by 
checking its version: `magick --version`.

If you still don't have the `magick` command available, you might need to 
use the legacy command, `convert`, instead. The `convert` command provides 
similar functionality to `magick` but with slightly different syntax.

If you've tried these steps and are still having issues, you might want to consider 
alternative image processing tools such as GraphicsMagick or the Python Imaging Library 

# Left over text

Instead of specifying the release with '-t bullseye-backports', you can try 
installing ImageMagick from the backports repository without specifying the 
release by running 'sudo apt install imagemagick'. This should automatically 
pull the package from the backports repository if it's available.

If the issue persists, you may need to troubleshoot further by checking 
your repository configurations and ensuring that the backports repository is correctly 
set up.



The hypothesis at this point is there should be access to install a newer version of 
ImageMagick that includes the 'magick' command on your Raspberry Pi.

# Documentation
https://imagemagick.org/Usage/

