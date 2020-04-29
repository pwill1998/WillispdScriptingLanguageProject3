# WillispdScriptingLanguageProject3
This is the final project Scripting language

Patrick Willison

Project 3

Due: 4/28/2020

Willispd@mail.uc.edu 

Project 3 builds on project 1 and 2. The goal of this script is to take hardware information and potentially upload it to a secure server/website or even another computer. In the case of this project it simply takes your system stats, overrides the widgets.json file and then runs node and api. To access localhost simply go to a internet browser and type in localhost:3000/. only the proccessors will be shown

As a side note if you place any of the files outside of my virtual machine you will most likely have to change the directory to run it. The lines to change this are located at 28,41 and line 6 in the api.js file


###########Requirements#############

Nodejs must be installed. This is done via the gui installer from https://nodejs.org/en/download/ just follow the steps and it should install correctly

SysInfo v1.2.0 is shown on powershellgallery.com and the code to install it is "install-module -name sysinfo". Make sure you hit yes on both questions in order to install correctly.
Notes: The data listed is unrounded so that you have a more accurate representation of how much space you have used, and stored.
