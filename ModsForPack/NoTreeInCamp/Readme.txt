Mod version 1.1, for Game version v0.1.4.0
Remove all trees near base camp. 移除基地附近所有树木。


注意/Note：

1.该MOD会永久改变存档!卸载后树不会回来
This Mod changes your save file Permanently!
Trees won't be back after uninstalling.

1.5.基地范围是3500，该mod会移除4500范围内的树
Base camp range is 3500.This mod removes trees in 4500 distance.

2.每次进入游戏时触发,新建立的基地需要回到标题再进入才会触发
Triggered when start a game.
After building a new camp,need to return to title and start game to trigger it.

3.对联机游戏无效，对房主或许有效，我没试过
Not work for online games.May work for host but IDK.

4.Vortex可能不能自动正确安装该mod
Vortex may not install this mod correctly


使用方法/Install:

0.注意该MOD分两部分！需要放到不同目录下！
Notice! This mod contains TWO parts which need to be placed in different dir.

1.安装UE4SS / Install UE4SS
下载/Download: https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v2.5.2/UE4SS_Xinput_v2.5.2.zip
解压上述文件至 / Extract the zip to: Palworld\Pal\Binaries\Win64\
目录结构如下所示 / Dir struct should be like:
需要安装2.5.2或以上版本/ Need UE4SS version > 2.5.2

-Palworld\Pal\Binaries\Win64
   - Mods
      - mods.txt
      - ....
   - UE4SS-settings.ini
   - ...

2.将ShareChest.7z解压至UE4SS所处的Mods目录,目录结构如下所示
Extract `ShareChest.7z` to UE4SS 'Mods' dir.Should be like: 

- Palworld\Pal\Binaries\Win64\Mods
   - NoTreeInCamp
	- Scripts
	   - main.lua
	- enable.txt
	- Readme.txt

3.修改文件Palworld\Pal\Binaries\Win64\Mods\mods.txt,确保其中包含如下内容
Edit File `Palworld\Pal\Binaries\Win64\Mods\mods.txt` to make sure following TWO LINES(NOT ONE) are in the file

BPModLoaderMod : 1
NoTreeInCamp: 1


4.下载NoTreeInCamp_Pak文件,解压后将ShareChest.pak文件拷贝至Palworld\Pal\Content\Paks\LogicMods
Download `NoTreeInCamp_Pak.7z`.Extract and copy `NoTreeInCamp.pak` to Palworld\Pal\Content\Paks\LogicMods


