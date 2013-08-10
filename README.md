computercraft-scripts
=====================

minecraftのmodの一つのcomputercraftで自分が書いたものをおいておくレポジトリです。
various lua scripts for minecraft mod, computercraft

##quarry.lua
普通のquarry(excavateとか)は横に動くので、移動時間がかかり遅くなります。
このスクリプトは、縦に回りながら掘ることにより、十字に早く掘ることができます。
タートルのことを気にしないでlogoutしても復旧できるようにstartupをつかってます。

Common quarry is horizontal, although it is too slow because turtle can't move quicky.
By this script, turtle dig vertical.
Turning and digging in vertical hole can reduce movement, so turtle can dig quicky.
This script uses startup for backup, when you logout without taking care for turtle.


