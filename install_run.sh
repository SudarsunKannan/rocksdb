
sudo apt-get install libgflags-dev
sudo apt-get install zlib1g-dev
sudo apt-get install libbz2-dev

make clean
#Parallel compile does not fully work
make -j8
#So, finally make the compression synchronous
#so that all required benchmarks finish
# Note: db_test benchmark does not build
make 


./db_bench -max_background_compactions=16 -max_background_flushes=16 -compression_type=none
