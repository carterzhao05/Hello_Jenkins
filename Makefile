main: hello_exec hello_test  hello_fuzz
	
hello_exec: main.cpp hello.cpp 
	g++ main.cpp hello.cpp -o hello_exec

hello_test: hello_test.cpp hello.cpp
	g++ -o hello_test -g -std=c++11  hello_test.cpp hello.cpp -lgtest -lpthread

hello_fuzz:
	/home/vagrant/Downloads/third_party/llvm-build/release+asserts/bin/clang++ -o hello_fuzz -lstdc++ -fsanitize=fuzzer -fsanitize=address  -g -stdlib=libc++ -fprofile-instr-generate -fcoverage-mapping -std=c++11  hello_fuzz.cpp hello.cpp 
clean:
	rm -rf hello_exec hello_test hello_fuzz
