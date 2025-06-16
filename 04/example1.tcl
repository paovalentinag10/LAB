set ns [new Simulator]
set nf [open out.nam w]
$ns namtrace-all $nf
set out [open out.tr w]
$ns trace-all $out 

set N 30 
for {set i 0} {$i < $N} {incr i} {set src_($i) [$ns node] }
for {set i 0} {$i < $N} {incr i} {set dst_($i) [$ns node] }

set node_(r1) [$ns node]
set node_(r2) [$ns node]

for {set i 0} {$i < $N} {incr i} { $ns duplex-link $src_($i) $node_(r1) 100Mb 20ms DropTail } 
for {set i 0} {$i < $N} {incr i} { $ns duplex-link $dst_($i) $node_(r2) 100Mb 20ms DropTail }

$ns simplex-link $node_(r1) $node_(r2) 20Mb 15ms RED
Queue/RED set trash 75
Queue/RED set maxthresh_ 150
Queue/RED set q_weight_ 0.002
Queue/RED set linterm_ 10

$ns simplex-link $node_(r2) $node_(r1) 15Mb 20ms DropTail

for {set i 0} {$i < $N} {incr i} {
 set tcp($i) [$ns create-connection TCP/Reno $src_($i) TCPSink $dst_($i) 1] 
 $tcp($i) set window_ 32 
 set cbr($i) [new Application/Traffic/CBR]
 $cbr($i) set packetSize_ 500
 $cbr($i) attach-agent $tcp($i)
 set ftp($i) [$tcp($i) attach-source FTP]
 $ftp($i) set class_ 1
}

$ns color 1 Blue
set windowVsTime [open WindowVsTime w]
set windowVsTime2 [open WindowVsTime2 w]
set qmon [$ns monitor-queue $src_(0) $node_(r1) [open qm.out w] 0.01];
[$ns link $src_(0) $node_(r1)] queue-sample-timeout;

set redq [[$ns link $node_(r1) $node_(r2)] queue]
set tchan_ [open old.q w]
$redq trace curq_
#$redq trace awe_
$redq attach $tchan_

proc plotWindow { tcpSource file } {
global ns
set time 0.01
set now [$ns now]
set cwnd [$tcpSource set cwnd_]
puts $file "$now $cwnd"
$ns at [expr $now+$time] "plotWindow $tcpSource $file"
} 
for {set i 0} {$i < $N} {incr i} {
$ns at 0.0 "$ftp($i) start"
}
proc finish {} {
global ns out nf tchan_
set awkCode {{
if ($1=="Q" && NF>2)
print $2,$3 >> "temp.a";
}}
set f [open temp.queue w]
puts $f "TittleText: red"
puts $f "Device: Postscript"
if {[info exists tchan_]} {
close $tchan_
}
if {![file exists old.q]} {
puts "Error: old.q no existe. Verifica que se haya generado correctamente."
close $f
return
}
exec rm -f temp.q temp.a 
exec touch temp.a temp.q  
puts "Ejecutando awk..."
exec awk $awkCode old.q  
if {[file size temp.q] == 0} {
puts "Advertencia: temp.q está vacío, el análisis de old.q podría haber fallado."
}
puts "Concatenando archivos..."
puts $f "queue"
exec cat temp.q >> $f; 
puts $f "\nawe_queue"
exec cat temp.a >> $f
close $f
exec xgraph -bb -bg white -scale -tk -x time -t "TCP Window" WindowVsTime &
exec xgraph -bb -bg white -scale -tk -x time -t "TCP Window" WindowVsTime2 &
exec xgraph -bb -bg white -scale -tk -x time -y queue temp.queue &
$ns flush-trace
close $out
close $nf
exec nam out.nam &
exit 0
}


for {set i 0} {$i < $N} {incr i} {
$ns at 0.0 "plotWindow $tcp($i) $windowVsTime"
}

$ns at 0.0 "plotWindow $tcp(0) $windowVsTime2"
$ns at 20.0 "finish"
$ns run