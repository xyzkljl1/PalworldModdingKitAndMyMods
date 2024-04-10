帕鲁升星每次只需要一只素材 Only One pal/per-rank needed for pal rank up/condense.
Mod version v1.1,for Game version v1.4.0

注意/Note：
1.不适用于联机(有可能对联机的房主有效但是我没试过)
It won't work for online games.
(It may work if you are the host.I never tried.)

2.卸载后升级所需帕鲁数量恢复(已升级过的帕鲁不会变)
Rank-up-need-num returns to normal after uninstalling this mod.
(Existing pals won't lose their rank.)

3.只需要从三个文件中选一个下载,三个文件分别把升级素材数量变为1/1/1/1,1/2/4/8, 2/4/16/32
Only need to download one file in the three.
Three files set the rank up requirement to 1/1/1/1 , 1/2/4/8, 2/24/16/32 each.


使用方法/Install:

1.安装UE4SS / Install UE4SS
下载https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v2.5.2/UE4SS_Xinput_v2.5.2.zip 并解压至 Palworld\Pal\Binaries\Win64\ ，完成后目录结构应当如下所示
Download `https://github.com/UE4SS-RE/RE-UE4SS/releases/download/v2.5.2/UE4SS_Xinput_v2.5.2.zip` and Extract it to `Palworld\Pal\Binaries\Win64\`.Dir strcut should be like:

-Palworld\Pal\Binaries\Win64
   - Mods
      - mods.txt
      - ....
   - UE4SS-settings.ini
   - ...

2.编辑Palworld\Pal\Binaries\Win64\Mods\mods.txt,确保BPModLoaderMod后面的数字为1
Edit`Palworld\Pal\Binaries\Win64\Mods\mods.txt` to make sure `BPModLoaderMod` is followed by `1`

3.解压该MOD，将EasyRankUp.pak拷贝至Palworld\Pal\Content\Paks\LogicMods
Extract this mod. Copy `EasyRankUp.pak` to `Palworld\Pal\Content\Paks\LogicMods`