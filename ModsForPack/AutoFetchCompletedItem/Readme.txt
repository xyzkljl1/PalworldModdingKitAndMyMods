只在单机游戏中有效！/Only work in offline Game!
Mod version 1.1, for Game version v0.1.4.0
道具制作完成后自动进入背包/transport crafted items to your bag automatically

注意/Note：
1.对各种农场、采石场、伐木场、配种牧场无效/Won't transport products from Logging Site/Stone Pit/Breeding Farm/all Plantation
2.一次制作多个物品时，全部制作完成时才转移/When crafting multiple items,they will be transported only once when all of them are done.
3.获取物品时屏幕左侧会有白字提示/White message in left when transporting
4.从制作完成到进入背包有数秒延迟/There is a little delay between craft-done and transpor 
5.背包中没有空格时，即使道具可以堆叠在既存的格子上，也不会进入背包/When the bag is full,even if a new item can be stacked in an existing slot,it won't be transported
6.如果一个物品制作完成时没有进入背包，之后也不会自动进入背包/If a item is not transported when it's done, it won't be transported again.
7.联机游戏中不会生效/No effect in online games
8.该Mod可能会导致你超重/Transported items may cause overweight

使用方法/Install:
1.安装UE4SS/Install UE4SS
下载/Download: https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v2.5.2/UE4SS_Xinput_v2.5.2.zip
解压上述文件至/Extract the zip to: Palworld\Pal\Binaries\Win64\
目录结构如下所示/Dir struct should be like:
-Palworld\Pal\Binaries\Win64
   - Mods
      - mods.txt
      - ....
   - UE4SS-settings.ini
   - ...

2.将该MOD解压至UE4SS所处的Mods目录/Extract this mod to 'Mods' dir
目录结构如下所示/Dir struct should be like: 
- Palworld\Pal\Binaries\Win64\Mods
   - AutoFetchCompletedItem
	- Scripts
	   - main.lua
	- enable.txt
	- Readme.txt

3.在Palworld\Pal\Binaries\Win64\Mods\mods.txt中添加/Add following line in Palworld\Pal\Binaries\Win64\Mods\mods.txt
AutoFetchCompletedItem:1