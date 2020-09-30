.PHONY: pod_push
pod_push:
	@pod trunk push Box.swift.podspec

.PHONY: pod_lint
pod_lint:
	@pod spec lint Box.swift.podspec

.PHONY: build
build:
	@swift build --enable-test-discovery

.PHONY: test
test:
	@swift test --enable-test-discovery