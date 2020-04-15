# Warframe Proton Setup On Linux
This is a small shell script that will download the latest GloriousEggroll
proton version from his repository
(https://github.com/GloriousEggroll/proton-ge-custom) and extract it on
/HOME/user/.steam/root/compatibilitytools.d , leaving it ready to be used on
steam for playing Warframe (and other titles that may require it).

## Getting Started

**VERY IMPORTANT: YOU MUST HAVE LAUNCHED STEAM AT LEAST ONCE BEFORE EXECUTING
THIS SCRIPT. OTHERWISE IT MIGHT NOT WORK**

Just download the repository and enter the folder.

```
git clone https://github.com/rgomez96/Warframe-Linux-Setup
cd Warframe-Linux-Setup
```

after that, this script will require permission to execute.

```
chmod +x setupwarframe.sh
```

Check the prerrequisites section to see if you have all the packages required
to run this script and finally, execute it:

```
./setupwarframe.sh
```

### Prerrequisites

As mentioned on the Getting Started section, you must open steam at least once
before executing the script.

You will require the following packages:
> git, curl, wget, tar

You can install all those packages on Arch executing
```
sudo pacman -S git curl wget tar
```

and on Debian/Ubuntu/Other debian derivatives with
```
sudo apt install git curl wget tar
```

## FAQ
**I installed everything correctly, but when i'm playing i randomly get
a hardware fail error and i'm redirected to this page** (https://www.warframe.com/en/hardwarefail).

This can happen because you have an incorrect version of the NVIDIA driver. I had this problem using Manjaro because i needed the nvidia_440x driver and Manjaro installed nvidia_418x. 

**What if i dont want to play on Steam? I'd rather have the standalone
launcher**

Don't worry, [Lutris gotcha covered](https://lutris.net/games/warframe/), check
their site for more info.

**What if i use a non Debian/Arch/SUSE/ distro?**

You should have no problem as long as you have your proper drivers installed.

**The launcher says it no longer provides support for DirectX9, what do i do?**
If you get DirectX errors, it means you're missing 32 bit vulkan libraries and/or 32 bit graphic drivers. You need both 32 bit and 64 bit vulkan libraries installed on your system. The reason is because the game is 64 bit but the launcher is 32 bit so the launcher checks for 32 bit. See:

https://github.com/lutris/lutris/wiki/Installing-drivers

(i just copied that part from Lutris' website haha)

## Acknowledgements

- GloriousEggrolls' custom proton version: https://github.com/GloriousEggroll/proton-ge-custom
