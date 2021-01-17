main: hello_exec hello_test
	
hello_exec: main.cpp hello.cpp 
	g++ main.cpp hello.cpp -o hello_exec

hello_test: hello_test.cpp hello.cpp
	g++ -o hello_test -g -std=c++11  hello_test.cpp hello.cpp -lgtest

clean:
	rm -rf hello_exec hello_test
