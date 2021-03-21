#!/bin/bash

# Copyright (c) 2021, go-cpu-high-load, Ionut Nechita.
# All rights reserved.
# SPDX-License-Identifier: BSD-3-Clause

for (( i=1; i<=60; i++ ))
do
        echo "Stress loop: $i"
        for (( j=1; j<=60; j++ ))
        do
                echo "Step number: $j"
                stress-ng --timer 60 --timer-freq 1900000 --aggressive -t 60s &
                sleep 0.4
        done
        sleep 0.1
        killall -s 9 stress-ng
        for k in $(ps ax | grep stress-ng | awk '{ print $1 }'); do kill -s 9 $k; done
done
