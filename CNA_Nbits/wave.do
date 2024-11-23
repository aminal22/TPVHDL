onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb/RESET
add wave -noupdate /tb/CLK50MHz
add wave -noupdate /tb/uut/CLK_Div
add wave -noupdate /tb/Enable
add wave -noupdate /tb/uut/Q(3)
add wave -noupdate -radix binary -radixshowbase 0 /tb/B
add wave -noupdate -radix binary -radixshowbase 0 /tb/uut/D
add wave -noupdate /tb/uut/CopyTristate/Sm
add wave -noupdate /tb/SORTIE
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 227
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {61660160 ps}
