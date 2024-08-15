#!/bin/bash

#rsync command to move data and output progress
#from https://unix.stackexchange.com/questions/215271/understanding-the-output-of-info-progress2-from-rsync
#and https://serverfault.com/questions/219013/showing-total-progress-in-rsync-is-it-possible


#################################
#calculate and record start time#
#################################

echo "start time was" >> "transfer_stats_01.txt"
date +%Y/%m/%d@%H:%M:%S >> "transfer_stats_01.txt"

####################################
#do rsync, recording stats with tee#
####################################

#EXAMPLE 1: Move a file (file_to_move.txt) from location 1 on Azimuth to location 2 on Azimuth

#rsync -avP --info=progress2 [/path_to_location_1/file_to_move.txt] [/path_to_location_2/] | tee transfer_stats_02.txt

#EXAMPLE 2: Move a file (file_to_move.txt) from location 1 on an external machine to location 2 on Azimuth

#rsync -avP --info=progress2 [username on external machine]@[external machine address]:[/path_to_location_1/file_to_move.txt] [/path_to_location_2/] | tee transfer_stats_02.txt

#WRITE YOUR TRANSFER LINE HERE:
rsync -avP --info=progress2 myname@my.machine.address:/location/of/my/data/mydata.txt /location/to/put/data/ | tee transfer_stats_02.txt

###############################
#calculate and record end time#
###############################

echo "end time was" >> "transfer_stats_01.txt"
date +%Y/%m/%d@%H:%M:%S >> "transfer_stats_01.txt"


