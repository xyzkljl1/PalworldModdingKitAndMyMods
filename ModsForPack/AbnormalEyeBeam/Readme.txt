只在单机游戏中有效！/Only for offline Game!
Mod version 1.01, for Game version v0.1.4.0
Whenever you see a pal,enchant it with ABNORMAL passive./你总是对视线内的帕鲁赋予"一反常态"特性.


注意/Note：

1.该mod会影响存档，卸载后已获得的特性不会消失
This mod affects your save file.Pals won't lost gained passive after uninstalling this mod. 

2.对已经有四个特性的帕鲁无效
Won't affect pals that already have four passive skills.

3."视线"有一定的射程，无视障碍物
Any obstacle can't prevent pals from being enchanted.Only distance can.


4.不能用于联机游戏（如果你是房主，或许可以生效，我没试过）
Won't work for online games.
(May work if you are host.IDK.Never tried.)


5.如果你希望赋予其它特性，打开/Scripts/main.lua编辑第一行，把SKILL = "ElementResist_Normal_1_PAL" 中的 ElementResist_Normal_1_PAL换成你想要的技能代码即可
技能代码在该mod附带的文件SkillName.json中查看
例如，该文件中有一行写着 "ElementResist_Normal_1_PAL": "Abnormal", 意味着Abnormal(一反常态)特性的代码为ElementResist_Normal_1_PAL
注意,只有游戏中本来就可以出现在帕鲁上的特性才有效

If you want to enchant another passive skill, edit first line in `/Scripts/main.lua` and replace `ElementResist_Normal_1_PAL` to any skill code you want.
You can find the skill code in `SkillName.json` file of this mod.
For example,you can find ` "ElementResist_Normal_1_PAL": "Abnormal"` in SkillName.json. This means the skill code of `Abnormal` is `ElementResist_Normal_1_PAL`
Notice if you write a passive which can never appears on a pal without this mod ,it won't work.

6.对你自己的帕鲁赋予特性时，它会立刻获得特性，但是攻防面板可能不会立刻刷新，小退或者将帕鲁存入终端再取出后就会刷新
When enchanting a passive to your own pal,the pal gets the passive immediately.
But the attack/defense/works speed/hp stats may not refresh immediately.
After you reopen the game or save pal to palbox&get it out,the stats will refresh.

6.5.该mod赋予的稀有/传说特性不会改变体型
Lucky/Legend passive enchanted by this mod won't change the size of pal.

7.Vortex可能无法自动正确安装，如果Vortex安装后不生效，请按照下方步骤手动安装!
Vortex MAY NOT install this mod correctly!
If it doesn't work,please manually install by following instructions.


使用方法/Install:

0.注意该MOD分两部分！需要放到不同目录下！
Notice! This mod contains TWO parts which need to be placed in different dir.

1.安装UE4SS/Install UE4SS
下载/Download: https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v2.5.2/UE4SS_Xinput_v2.5.2.zip
解压上述文件至 / Extract the zip to: Palworld\Pal\Binaries\Win64\
目录结构如下所示 / Dir struct should be like:
-Palworld\Pal\Binaries\Win64
   - Mods
      - mods.txt
      - ....
   - UE4SS-settings.ini
   - ...

2.将AbnormalEyeBeam.7z解压至UE4SS所处的Mods目录,完成后目录结构应当如下所示:
Extract `AbnormalEyeBeam.7z` to 'Mods' dir,It should be like:

- Palworld\Pal\Binaries\Win64\Mods
   - AbnormalEyeBeam
	- Scripts
	   - main.lua
	- enable.txt
	- Readme.txt

3.修改文件Palworld\Pal\Binaries\Win64\Mods\mods.txt确保其中包含如下 *两行* 内容 
Edit File `Palworld\Pal\Binaries\Win64\Mods\mods.txt` to make sure the following TWO line(NOT ONE) is in the file:

AbnormalEyeBeam:1
BPModLoaderMod : 1

4.解压AbnormalEyeBeam_Pak.7z,将其中的AbnormalEyeBeam.pak文件（注意不是整个文件夹）拷贝至Palworld\Pal\Content\Paks\LogicMods
Extract AbnormalEyeBeam_Pak.7z,copy ONLY `AbnormalEyeBeam.pak` to Palworld\Pal\Content\Paks\LogicMods

