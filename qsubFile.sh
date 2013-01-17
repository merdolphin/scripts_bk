qsub -q tlong -S /bin/sh -pe namd 48 -e log-local-err.log -o log-local-out.log -cwd -N s_e << ENDINPUT
#!/bin/sh

/home/david/namd2/cvs/namd2/Linux-amd64-icc.cluster/charmrun /home/david/namd2/cvs/namd2/Linux-amd64-icc.cluster/namd2 ++nodelist \$TMPDIR/namd-machines +giga +p\$NSLOTS sin_eq.namd > sin_eq.log &
wait

ENDINPUT
