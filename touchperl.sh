#!/bin/sh

touch $1 

echo '#!/usr/bin/env perl

use strict;
use warnings;

' >> $1



