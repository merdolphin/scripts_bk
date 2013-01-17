FC="gfortran -ffree-line-length-none"

$FC wham.f90 -o wham.x

$FC kinetic_basins.f90 -llapack -o kinetic_basins.x
