drc off
box 0 0 0 0
gds readonly true
gds rescale false
gds read /usr/local/share/qflow/tech/osu018/osu018_stdcells.gds2
load MUX_2X1
select top cell
expand
gds write MUX_2X1
quit
