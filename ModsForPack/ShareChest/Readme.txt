只在单机游戏中有效！/Only work in offline Game!
Mod version 1.9, for Game version v0.1.4.0
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


3.5.如果希望只有部分箱子共享，打开main.lua找到第二行"OnlyMergeCertainChest=0"，将0改为任意数字，例如改成24时，则只有原本为24格的箱子(即金属箱)会被共享;这不会影响饲料箱
If want only certain chests to be shared.Edit `main.lua` and find `OnlyMergeCertainChest=0` in the second line.Change `0` to a proper number so that only chests with that slot-number will be shared.
For example,if `OnlyMergeCertainChest=10` then only 10-slot chests(wooden box,etc) will be shared.
This won't affect feed box.

4.只要据点范围内有共享箱，该据点就可以使用共享空间中的资源建造/生产
但是在这次开始游戏之前就已经是共享箱的箱子才有这个效果
(换言之，进游戏后新敲一个箱子，它是共享箱但是不能用于据点间共享资源，小退(回到标题)一次之后才可以)
As long as at least one shared chest is in your camp,you CAN use resources in it to build/craft inside this camp.
BUT only refer to chests which has ALREADY been shared before last time you press "start game".
In another word,when a non-shared chest is turned into a shared chest,it is temporarily ignored by your camp until you return to title once.

5.拆除任意共享箱时内容物不会掉落；拆除所有共享箱不会导致存储空间内物品消失，再次建造任意箱子仍然可以访问
When any shared chest is dismantled ,the content WON'T drop.
When all shared chests are dismantled,the content WON'T drop or disappear.You can access them as long as you build another chest.


5.5如果你因为某种原因(例如因为旧版本mod的bug)，发现出现了两组共享箱子，依照如下步骤修复
If you found you have two groups of shared chest for some reason(such as you used a old version with known bug).
You can fix it by the following step:

a)找到正确的共享箱子组：新建一个箱子，这个箱子一定属于正确的共享组，找到和它不共享的箱子
Find the "right" group chest：Build a new chest,this chest must belong to the right group.Chests that aren't shared with it are in wrong group.
b)拆除另一组的一个箱子
Dismantle one chest that belongs to the wrong group.
(content should drop at this time,you won't lose items.)
c)新建一个箱子
Build a new chest.

5.7.打开箱子时略有卡顿属于正常现象，这是箱子大造成的，无法避免；其它情况卡顿属于bug
Slightly stuttering when opening a chest is normal.It's because the chest have many slots.This can't be avoid.
Other stuttering is bug.


6.共享箱子因攻击/起火被破坏时，内容物掉落，并且所有共享箱子失效！
但是不要惊慌，建造任意箱子就可以恢复(恢复后箱子为空，因为内容物之前已经掉地上了)
极少数情况下拆除箱子也会造成如同破坏箱子的效果，使用同样方法即可恢复
When any shared chest is destroyed by attack/corruption,all the content DROPS and all shared chests is BROKEN.
Don't be panic.Build a new chest,then all shared chests will RECOVER.
(Recovered chests will be empty,because the content dropped on the ground earlier)
In rare cases,when a chest is dismantled ,it will act like destroyed.You can use the above method to recover.

7.共享箱中的食物腐败速度降低(严格来讲是腐败更快但是腐败条也变长，总体而言更难腐败了)
Food in shared chest can hardly corrupt.
(Every shared chest speed up the corruption,but the total corrupt time is 1000 times longer.)


8.默认不影响饲料箱和配种农场; 影响冰箱
In default condition,Feed box and breeding farm won't be shared.
Cooler box Can be shared.

8.5.如果希望共享饲料箱，下载后用笔记本编辑ShareChest\Scripts\main.lua，把第一行"local bShareFoodBox = false"改成"local bShareFoodBox = true"
饲料箱和道具箱不共通
If you want the feed box be shared, edit `ShareChest\Scripts\main.lua` and modify the first line `local bShareFoodBox = false` to  `local bShareFoodBox = true` 
Feed boxes won't be shared with chests.

9.不能用于联机游戏
Don't use this in online games.

10.点击控制台的"Restart All Mod"之后需要小退才能生效
Need to return to title if you press "Restart All Mod" in console

11.卸载该mod后，箱子的容量和共享状态不变，但是之后拆除任意共享箱会导致所有共享箱失效并且内容物立刻掉落，如同第六条中提到的情况，可以再次安装该mod并使用第六条中的方法修复
If you uninstall this mod,chests won't lost slots or shared status.
But when a shared chest is dismantled after uninstalling the mod,the content will drop and all shared chest will be broken.
Just like the situation mentioned in Note.6.It can be recovered by the method in Note.6

12.和Bigger Chest冲突
Conflict with Bigger Chest


使用方法/Install:

0.注意该MOD分两部分！需要放到不同目录下！
Notice! This mod contains TWO parts which need to be placed in different dir.

1.安装UE4SS / Install UE4SS
下载/Download: https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v2.5.2/UE4SS_Xinput_v2.5.2.zip
解压上述文件至 / Extract the zip to: Palworld\Pal\Binaries\Win64\
目录结构如下所示 / Dir struct should be like:
务必安装2.5.2或以上版本UE4SS / Need UE4SS Version >= 2.5.2!!

-Palworld\Pal\Binaries\Win64
   - Mods
      - mods.txt
      - ....
   - UE4SS-settings.ini
   - ...

2.将ShareChest.7z解压至UE4SS所处的Mods目录,目录结构如下所示
Extract `ShareChest.7z` to UE4SS 'Mods' dir.Should be like: 

- Palworld\Pal\Binaries\Win64\Mods
   - ShareChest
	- Scripts
	   - main.lua
	- enable.txt
	- Readme.txt

3.修改文件Palworld\Pal\Binaries\Win64\Mods\mods.txt,确保其中包含如下内容
Edit File `Palworld\Pal\Binaries\Win64\Mods\mods.txt` to make sure following TWO LINES(NOT ONE) are in the file

BPModLoaderMod : 1
ShareChest: 1

4.下载ShareChest_Pak文件,解压后将ShareChest.pak文件拷贝至Palworld\Pal\Content\Paks\LogicMods
Download `ShareChest_Pak.7z`.Extract and copy `ShareChest.pak` to Palworld\Pal\Content\Paks\LogicMods

5.可选 / Optional
如果希望饲料箱共享，参考注意事项8.5操作
If you want feed boxes are also shared ,see Note 8.5
