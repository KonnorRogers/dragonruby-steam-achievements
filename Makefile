.PHONY: all clean build watch

CC = clang
CXX = clang++

all: build

build:
	@mkdir -p build
	@cd build && cmake -DCMAKE_CXX_COMPILER=$(CXX) -DCMAKE_C_COMPILER=$(CC) .. && cmake --build .

clean:
	rm -rf build mygame/native

watch: build
	fswatch -o src/ steam-sdk/ include/ CMakeLists.txt | xargs -n1 sh -c 'make build'
