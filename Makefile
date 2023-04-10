ARCH_LIST="linux/arm64/v8,linux/amd64,darwin/arm64"

image:
	@ docker buildx build --platform=$(ARCH_LIST) -t troydai/spire-toolbox:latest .

push:
	@ docker buildx build --platform=$(ARCH_LIST) -t troydai/spire-toolbox:`git describe --tags` --push .
