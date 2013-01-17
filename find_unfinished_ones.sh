#!/bin/sh

for f in *_0.log

do

	!( grep -i -q finish $f ) && echo $f

done
