只在单机游戏中有效！/Only work in offline Game!
Mod version 1.3, for Game version v0.1.4.0
所有空的/新建的箱子变为共享箱、共享同一存储空间(237格)，共享空间可用于据点内建造和生产/All empty chests and new chests share one storage space.（Means `If each camp has a shared chest, resources are naturally shared between camps.`)



注意/Note：

1.该MOD会永久改变存档!
This Mod changes your save file Permanently!

2.每次进入游戏及建造完成时，所有空箱子会自动成为共享箱；开启此mod后新建的箱子一定会成为共享箱
When you start the game or finish building something,all empty chests will become shared chests.
Therefore,chests built after installing this mod will definitely become shared chests.

3.首次使用该Mod时，既存箱子中的一个会变为共享箱子，该箱子的原内容物自动进入共享空间，该空间固定具有237个格子
First time you use this mod,one exist chest will become shared chest.Existing content won't disappear.
All shared chests share the same 237 slots.

4.只要据点范围内有共享箱，该据点就可以使用共享空间中的资源建造/生产
但是在这次开始游戏之前就已经是共享箱的箱子才有这个效果
(换言之，进游戏后新敲一个箱子，它是共享箱但是不能用于据点间共享资源，小退(回到标题)一次之后才可以)
As long as at least one shared chest is in your camp,you CAN use resources in it to build/craft inside this camp.
BUT only refer to chests which has ALREADY been shared before last time you press "start game".
In another word,when a non-shared chest is turned into a shared chest,it is temporarily ignored by your camp until you return to title once.

5.拆除任意共享箱时内容物不会掉落；拆除所有共享箱不会导致存储空间内物品消失，再次建造任意箱子仍然可以访问
When any shared chest is dismantled ,the content WON'T drop.
When all shared chests are dismantled,the content WON'T drop or disappear.You can access them as long as you build another chest.

6.共享箱子因攻击/起火被破坏时，内容物掉落，并且所有共享箱子失效！
但是不要惊慌，只要小退(返回标题)再进入游戏后建造任意箱子就可以恢复(恢复后箱子为空，因为内容物之前已经掉地上了)
极少数情况下拆除箱子也会造成如同破坏箱子的效果，使用同样方法即可恢复
When any shared chest is destroyed by attack/corruption,all the content DROPS and all shared chests is BROKEN.
Don't be panic.Return to title,start the game again and build a new chest,then all shared chests will RECOVER.
(Recovered chests will be empty,because the content dropped on the ground earlier)
In rare cases,when a chest is dismantled ,it will act like destroyed.You can use the above method to recover.

7.共享箱中的食物腐败速度降低(严格来讲是腐败更快但是腐败条也变长，总体而言更难腐败了)
Food in shared box can hardly corrupt.

8.默认不影响食物箱和配种农场; 影响冰箱
Feed box and breeding farm won't be shared.(May or may not support feed box in further version)
Cooler box Can be shared.

9.不能用于联机游戏
Don't use this in online games.

10.点击控制台的"Restart All Mod"之后需要小退才能生效
Need to return to title if you press "Restart All Mod" in console

11.Vortex用户可能需要手动安装
Vortex users may or may not need to install it manually

12.和Bigger Chest冲突
Conflict with Bigger Chest



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

2.将该MOD解压至UE4SS所处的Mods目录 / Extract this mod to 'Mods' dir
目录结构如下所示 / Dir struct should be like: 
- Palworld\Pal\Binaries\Win64\Mods
   - ShareChest
	- Scripts
	   - main.lua
	- enable.txt
	- Readme.txt
	- ShareChest.pak

3.修改文件Palworld\Pal\Binaries\Win64\Mods\mods.txt  / Edit File: Palworld\Pal\Binaries\Win64\Mods\mods.txt
确保其中包含如下内容 / Make Sure following code is in the file
BPModLoaderMod : 1
ShareChest: 1

4.将ShareChest.pak拷贝至Palworld\Pal\Content\Paks\LogicMods
Copy ShareChest.pak to Palworld\Pal\Content\Paks\LogicMods
