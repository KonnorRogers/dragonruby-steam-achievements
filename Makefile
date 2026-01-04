.PHONY: all clean build watch

CC = clang
CXX = clang++
VERSION := $(shell cat ./mygame/VERSION.txt)

all: build

tag:
	git tag -a "v$(VERSION)" -m "Tag v$(VERSION)"

build:
	@mkdir -p build
	@cd build && cmake -DTARGET_ARCH=$(TARGET_ARCH) -DCMAKE_CXX_COMPILER=$(CXX) -DCMAKE_C_COMPILER=$(CC) .. && cmake --build .

clean:
	rm -rf build mygame/native

test: test-native test-non-native

test-native: build
	SDL_AUDIODRIVER="dummy" SDL_VIDEODRIVER="dummy" ./dragonruby mygame --test app/tests-native.rb

test-non-native:
	SDL_AUDIODRIVER="dummy" SDL_VIDEODRIVER="dummy" ./dragonruby mygame --test app/tests-non-native.rb

watch: build
	fswatch -o src/ steam-sdk/ include/ CMakeLists.txt | xargs -n1 sh -c 'make build'
