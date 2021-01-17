main: hello_exec  hello_fuzz
	
hello_exec: main.cpp hello.cpp 
	g++ main.cpp hello.cpp -o hello_exec

hello_test: hello_test.cpp hello.cpp
	g++ -o hello_test -g -std=c++11  hello_test.cpp hello.cpp -lgtest

hello_fuzz:
	clang++ -o hello_fuzz -fsanitize-coverage=trace-pc-guard -fsanitize=address -g -fprofile-instr-generate -fcoverage-mapping -std=c++11  hello_fuzz.cpp hello.cpp -lgtest ../lib/mac/x86_64/libFuzzer.a
clean:
	rm -rf hello_exec hello_test hello_fuzz
