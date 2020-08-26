start "" zoomlink
timeout 15
tasklist | find /i "zoom.exe" && exit || echo first attempt failed.

start "" zoomlink2Ideally
timeout 15
tasklist | find /i "zoom.exe" && exit || echo second attempt failed, calling my cell to wake myself up.

D:\Anaconda\python.exe "G:\Python File Saves\Random Small Stuff\call_my_cell.py"