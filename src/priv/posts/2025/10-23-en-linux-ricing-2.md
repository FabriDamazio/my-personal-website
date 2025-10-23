%{
    title: "A Linux to Call My Own",
    author: "Fabricio Damazio",
    tags: ~w(linux),
    description: "The incredible experience of my first Linux Ricing from scratch."
}
---

<img src="/images/posts/2025/10-23-fastfetch.png" alt="Desktop and fastfetch" width="1280" height="720">

I don't remember the first time I used Linux. Over the past two decades, 
I tried many times to leave Windows behind, but I always ended up coming back. 
Last year, I finally switched to the Linux world for good, and the distro I chose was Ubuntu.
It's a spectacular distro for those migrating because it's stable, beautiful, and everything just works.

A few months ago, I watched a PewDiePie video about
Linux Ricing. Back then, I thought it was really cool, and the idea of customizing Linux
really stuck with me. Two weeks ago, I decided to get my hands dirty 
and give it a try. As a complete beginner, I started by researching which distro to choose.

## Arch Linux and Hyprland - Why and How

During my research on the r/unixporn community, many people didn't recommend Arch Linux
for beginners in ricing. Just as I was almost convinced to choose a more
user-friendly distro, one comment changed my perspective on this choice. It explained
that distros like Arch Linux would make you understand and learn more about Linux during
the Ricing process. Exactly what I was looking for.

My first approach was to install Arch Linux using its installer script called
archinstall. It was super smooth, almost like installing Ubuntu. I installed it
with Hyprland pre-configured, and within minutes everything was ready to start ricing.

I chose [Hyprland](https://hypr.land/) because I fell in love with its aesthetics
and dynamic tiling. Another relevant reason was the fact that it's not a complete
desktop environment, which forces me to customize and learn even more about
the inner workings of Linux.

## The Magic of Ricing

With Arch Linux and Hyprland installed, it was time to start Ricing. My first instinct
was to find a way to have a bar to display the clock, date, and other
useful information. For this, I chose [Waybar](https://github.com/Alexays/Waybar).

With Waybar working, the next step was to choose a way to display
notifications sent by the system. I installed the notification center [SwayNC](https://github.com/ErikReider/SwayNotificationCenter) and
gradually started customizing its look.

<img src="/images/posts/2025/10-23-waybar.png" alt="Notification Center" width="384" height="544">

As I used the system, I discovered many things I had to create
because they simply didn't exist. A lock screen? Doesn't exist. A shutdown
button? Doesn't exist. For everything I wanted that wasn't there, I researched and
discovered countless options and possibilities. And so I went about implementing, customizing,
and documenting each one of them in my [dotfiles repository](https://github.com/FabriDamazio/dotfiles).

## "Finished", Time to Automate

"Finished" is a very strong word. Ricing never really ends. There's always something
to be improved or implemented. After a whole weekend of this,
I started thinking that if I needed to reinstall or switch machines, I'd have to
do all of this manually again. To be honest, I didn't even really remember everything
I had done. That's when I made the following decision: start everything over from scratch and
take notes on what I did, creating a shell script to repeat everything in case I needed to
rebuild my system from zero.

I wiped the disk and restarted the installation process. This time I didn't use archinstall
and did everything manually to understand the process even better. As I installed
and configured things, I added the steps to the shell script for automation. I used
[GNOME Boxes](https://github.com/GNOME/gnome-boxes) to create a fresh Arch Linux installation
and test the script. After each change, I reverted the machine to the
initial state (a clean Arch Linux installation) and ran the script again.
The result was this [script here](https://github.com/FabriDamazio/dotfiles/blob/master/install.sh)
which is in the dotfiles repository.

Problem solved. If I need to rebuild the entire system from scratch, I'm covered.

<img src="/images/posts/2025/10-23-full.png" alt="Complete Linux Ricing" width="1280" height="720">

## Conclusion

The whole process was incredibly fun and enjoyable. I highly recommend it
if you fit one or more of the following criteria:

- You want to learn more about Linux.
- You're looking for a fun project.
- You're bored.
- You don't have enough problems in your life.

---

Note: AI-assisted translation, human-reviewed. Feedback welcome.
