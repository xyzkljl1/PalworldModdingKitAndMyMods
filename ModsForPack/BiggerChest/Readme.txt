只在单机游戏中有效！/Only for offline Game!
Mod version 1.3, for Game version v0.1.4.0
All Chest is expanded to 199 slots/提升所有箱子容量至199


注意/Note：

1.该MOD会永久改变存档!
This Mod changes your save file Permanently!

2.每次进入游戏及建造完成时，扩容所有既存且容量不足199的箱子至199格
When you start the game or finish building something,all chests are expanded to 199 slots

3.卸载该MOD不会影响已经扩容的箱子
Uninstall this mod won't affect existing bigger chests.

4.不能用于联机游戏
Don't use this in online games

5.如果你需要更大的箱子，打开Scripts/main.lua将199手动修改为更大的数字
If you need even bigger chest,Edit Scripts/main.lua and modify 199 to whatever you want

6.和ShareChest冲突
Conflict with SharedChest mod.


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

2.将BiggerChest.7z解压至UE4SS所处的Mods目录,完成后目录结构应当如下所示:
Extract `BiggerChest.7z` to 'Mods' dir,It should be like:

- Palworld\Pal\Binaries\Win64\Mods
   - BiggerChest
	- Scripts
	   - main.lua
	- enable.txt
	- Readme.txt

3.修改文件Palworld\Pal\Binaries\Win64\Mods\mods.txt确保其中包含如下 *两行* 内容 
Edit File `Palworld\Pal\Binaries\Win64\Mods\mods.txt` to make sure the following TWO line(NOT ONE) is in the file:

BiggerChest:1
BPModLoaderMod : 1

4.解压BiggerChestPak.7z,将其中的BiggerChest.pak文件（注意不是整个文件夹）拷贝至Palworld\Pal\Content\Paks\LogicMods
Extract BiggerChestPak.7z,copy ONLY `BiggerChest.pak` to Palworld\Pal\Content\Paks\LogicMods

