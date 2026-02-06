# anti idle v1.0 by style
# style on #ninja at Libera IRC Network
# email: fatal@error.rs
#
# based on the tcl made by JCFreak^
# adapted to work with eggdrop 1.8.4 in 2021 on any network :D
# credits: style & JCFreak^
#
# IMPORTANT! If it doesn't work after you restarted the eggdrop, do a rehash.

# version
set aidle.v "aidle.tcl v1.0 style"

# set time in minutes - default 5 mins
set aidle.t 5

# bot sends ping to himself
set aidle.w $botnick

# DO NOT CHANGE ANYTHING BELOW THIS
if {![info exists aidle.l]} {
  global aidle.w aidle.t
  set aidle.l 0
  timer ${aidle.t} {aidle.a}
  putlog "${aidle.v} loaded"
}

proc aidle.a {} {
  global aidle.w aidle.t
  putserv "PRIVMSG ${aidle.w}"
  putquick "PRIVMSG [lindex ${aidle.w} 0] :\001PING [expr {abs([clock clicks -milliseconds])}]\001"
  timer ${aidle.t} {aidle.a}
}

putlog "\[AntiIdle\] ${aidle.v} loaded!"

