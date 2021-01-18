export PATH=/home/vagrant/Downloads/third_party/llvm-build/release+asserts/bin:$PATH
export LD_LIBRARY_PATH=/home/vagrant/Downloads/third_party/llvm-build/release+asserts/lib:$LD_LIBRARY_PATH
fullPathTarget=hello_fuzz
target=$(basename $fullPathTarget )
mkdir -p cov_viz
mkdir -p corpus/${target}_corpus/ corpus/${target}_seeds/
LLVM_PROFILE_FILE="${target}.profraw"  ./${fullPathTarget}  corpus/${target}_corpus/ corpus/${target}_seeds/  -max_total_time=10
llvm-profdata merge -sparse  ${target}.profraw -o ${target}.profdata
llvm-cov show --format=html --output-dir=.  ./${fullPathTarget} -instr-profile=${target}.profdata
llvm-cov export -instr-profile ${target}.profdata ./${fullPathTarget}
llvm-cov export -instr-profile ${target}.profdata ./${fullPathTarget} > cov.json