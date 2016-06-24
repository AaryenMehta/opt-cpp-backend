# Docker-specific targets

# build a docker container
all:
	docker build -t="pgbovine/opt-cpp-backend:v1" .

test:
	docker run -t -i --rm --user=netuser --net=none --cap-drop all pgbovine/opt-cpp-backend:v1 python /tmp/opt-cpp-backend/run_cpp_backend.py "int main() {int x=12345;}" c

regtest:
	docker run -t -i --rm --user=netuser --net=none --cap-drop all -w /tmp/opt-cpp-backend/tests pgbovine/opt-cpp-backend:v1 python golden_test.py --all

bash:
	docker run -t -i --rm --user=netuser --net=none --cap-drop all pgbovine/opt-cpp-backend:v1 bash


# older targets

build:
	./auto-everything.sh

rawtest:
	python $(HOME)/opt-cpp-backend/run_cpp_backend.py "int main() {int x=12345;}" c
