#!/usr/bin/lua

Home = os.getenv("HOME");

File = io.open(".save_time.txt", "r");
Last = File:read("*a");
Last = string.gsub(Last, "\n", "");

Hour = os.date("%H");
Minute = os.date("%M");
Time = os.date("%S");
Time = (Hour * 60 + Minute) * 60 + Time;
if (Time - Last <= 60) then
    os.exit();
end

os.execute("diff save.txt _save.txt > tmp");
ContentFile = io.open("tmp", "r");
Content = ContentFile:read("*a"); 
io.close(ContentFile);
os.execute("rm tmp");
Content = string.gsub(Content, arg[1] .. ":", "Me");
if (not string.find(Content, ":")) then
    os.exit();
end

os.execute("zenity --info --text \"收到信息\" ");
io.close(File);
File = io.open(".save_time.txt", "w");
File:write(Time);
