
fullPathTarget=hello_fuzz
target=$(basename $fullPathTarget )
mkdir -p cov_viz
mkdir -p corpus/${target}_corpus/ corpus/${target}_seeds/
LLVM_PROFILE_FILE="cov_viz/${target}.profraw"  ./${fullPathTarget}  corpus/${target}_corpus/ corpus/${target}_seeds/  -max_total_time=10
llvm-profdata merge -sparse  cov_viz/${target}.profraw -o cov_viz/${target}.profdata
llvm-cov show --format=html --output-dir=./cov_viz  ./${fullPathTarget} -instr-profile=cov_viz/${target}.profdata
llvm-cov export -format=text  ./${fullPathTarget} -instr-profile=cov_viz/${target}.profdata > cov_viz/cov.json