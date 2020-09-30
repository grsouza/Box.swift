.PHONY: pod_push
pod_push:
	@pod trunk push Box.swift.podspec

.PHONY: pod_lint
pod_lint:
	@pod spec lint Box.swift.podspec