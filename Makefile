.PHONY: build clean env

# Build DMG for Apple Silicon (M-series) Mac
# Output: src-tauri/target/release/bundle/dmg/
build:
	npm install
	npm run build
	npx tauri build --bundles dmg
	@echo "DMG built at: src-tauri/target/release/bundle/dmg/"

# Clean build artifacts
clean:
	cargo clean --manifest-path src-tauri/Cargo.toml
	rm -rf dist node_modules src-tauri/target

# Setup and align tauri dependencies
env:
	npm install @tauri-apps/plugin-dialog@2.7.1 @tauri-apps/plugin-fs@2.5.1
	cargo update --manifest-path src-tauri/Cargo.toml -p tauri --precise 2.11.5
	cargo update --manifest-path src-tauri/Cargo.toml -p tauri-plugin-fs --precise 2.5.1
	cargo update --manifest-path src-tauri/Cargo.toml -p tauri-plugin-dialog --precise 2.7.1
