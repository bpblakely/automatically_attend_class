# automatically_attend_class
Code to automatically attend your zoom classes on Windows.

What it looks like after setting it up:

  1. Task Scheduler automatically runs open_class.bat
  2. open_class.bat will attempt to join your zoom class twice (waiting 15 seconds for possible load times)
  3. If zoom.exe is detected, open_class.bat is finished
  4. If zoom.exe fails to launch (link is sometimes wonky), then execute call_cell_phone.py
  5. call_cell_phone.py uses [Twilio](https://www.twilio.com/console) in Python to automatically call your phone number (A Twilio account is free)
  6. You 'attend' class
  7. Task Scheduler automatically runs kill_zoom.bat 5 minutes before your class is scheduled to end
  8. kill_zoom.bat prompts you with an option to either kill zoom or extend the time by 5 minutes
    * If no option is selected within 3 minutes, automatically kill zoom. This lets the program automatically exit the meeting if I am not present.
  9. Never have to wake up at 8 am for the rest of the semester (excluding exams)

# Edit open_class.bat

  * Edit open_class.bat with notepad
  * Change the zoom link to the zoom link provided to you by your professor (in my case it's on Canvas)
    * Ideally you have 2 different zoom links. So you can try 2 different zoom links incase one doesn't work
  * Change your python executable and your call_cell_phone.py path location
  
# Edit call_cell_phone.py

  * Pip install twilio to your python environment
  * Create a twilio account and follow their docs to get your account_sid and auth_token.
  * Generate a twilio number
  * Change 'your_number' on line 9 to your cell phone number
  * Change your_twilio_number on line 10 to your generate twilio number

# Set up automation of these scripts using Windows Task Scheduler

Setting up task scheduler is really easy. The only thing that might give you trouble is when you make the task to execute a script. I've found that you need to provide a the file location of your script in the 'Start in (optional):' parameter and the program/script is "filename.bat" 

[picture of mentioned problem](https://i.imgur.com/PfeZHe7.png)

# Advice on how to set up multiple classes

If you want to set up multiple classes, then make multiple open_class.bat files where the only difference between them is zoom url.

However, you can just modify your task that kills zoom, to run at the end times of all your classes.

For example, I have classes that end at 9:20 am, 11:20 am, and 4:20 am.

 * Thus, my kill_zoom.bat task is scheduled to run at 9:15 am, 11:15 am, and 4:15 am on M, W, F.

[My Task Scheduler tasks for all my classes](https://i.imgur.com/EHcJNlE.png)

[My end class task triggers](https://i.imgur.com/MtUyQH5.png)

# Possible issues

If you are taking an exam, towards the end of the class you will get prompty to exit your class. If you don't respond in 3 minutes it will terminate zoom.exe. This is obviously not ideal while taking an exam. So, you can either set it to not run on the dates of your exams or once you get prompted to terminate zoom you can do the following to easily stop the script;
  
  1. Hit n to not terminate zoom and wait for 5 minutes
  2. Press Control + C to forcefully stop the waiting
  3. Then hit y when prompted about terminating all tasks. 
 
Likewise in step 3 you can hit n to repeat the loop of inputs and waiting 5 minutes.

You can also just hit the x button...
