# Google Drive Restarter

## About

Restarts `GoogleDriveFS.exe` if it stops running. I wrote this because my users
regularly complained about their shortcuts not working. It was always because at
some point, Google Drive decided to close/crash, breaking all shortcuts pointing
to a `G:\...` path.

This is intended to be a scheduled task that runs very frequently, launching
`GoogleDriveFS.exe` if it is not running already.

## Setup

1. [Import `Start Google Drive Scheduled Task.xml` using Task 
   Scheduler][import-task].
2. Modify the task so it runs `runscheduled.vbs` from the correct directory.
3. Alternatively, you could use the scheduled task XML in this repository as a 
   template to help you [make a group policy to push it out to 
   all users][group-policy-task].

## FAQ

**Q: Why does it need to be a scheduled task?**

A: So it can reliably run at regular intervals to make sure Google Drive is
still working.

**Q: Why is there a `.bat` file _AND_ `.vbs` file?**

A: The `.bat` file checks whether `GoogleDriveFS.exe` is running, and runs it if
it isn't by calling the `launch.bat` that is in the Google Drive installation
directory. If you schedule this `.bat` file to run however, a command prompt
window opens and closes quickly which can be annoying.
Therefore, `runscheduled.vbs` runs the `.bat` file in a way that hides the
window. Now the user isn't bothered by a flashing command prompt window every
time this script runs.

**Q: Why not just schedule `%PROGRAMFILES%\Google\Drive File Stream\launch.bat`
or `GoogleDriveFS.exe` to run periodically?**

A: Because if Google Drive is already running, you get a notification "Google
Drive is already running..." That's probably the desired behavior from
double-clicking the Google Drive shortcut, but not something you want popping up
every minute.

**Q: What is `launch.bat`?**

A: `launch.bat` is a stable path you can use to run the currently 
installed version of Google Drive. Unlike *normal*, *sane* programs, Google 
creates a subfolder for every new version of Google Drive they release. So if 
you create a shortcut to 
`%PROGRAMFILES%\Google\Drive File Stream\51.0.9.0\GoogleDriveFS.exe`, it will 
break on the next update because the program will instead be at
`%PROGRAMFILES%\Google\Drive File Stream\51.0.9.1\GoogleDriveFS.exe` or 
something. Creating a shortcut to `%PROGRAMFILES%\Google\Drive File 
Stream\launch.bat` is more stable.

[import-task]: <https://docs.microsoft.com/en-us/windows/win32/taskschd/schtasks#_XML_xmlfile>
[group-policy-task]: <https://social.technet.microsoft.com/Forums/en-US/3f0ade25-acb1-4821-8a78-9384716850ff/#a6c6c263-9609-45cf-85d2-f243587b0322-isAnswer>
