

# Makefile for deploying the Flutter web projects to GitHub

BASE_HREF = '/cv/'
# Replace this with your GitHub username
GITHUB_USER = obenkucuk
GITHUB_REPO = https://github.com/obenkucuk/cv.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:
	@echo "Clean existing repository..."
	flutter clean

	@echo "Getting packages..."
	flutter pub get

	@echo "Building for web..."
	flutter build web --base-href $(BASE_HREF) --release --release --target lib/main_production.dart

	@echo "Creating CNAME file..."
	echo "$(CUSTOM_DOMAIN)" > build/web/CNAME

	@echo "Deploying to git repository"
 
  # ssh-keyscan github.com >> ~/.ssh/known_hosts && \ #
	cd build/web && \
	git init && \
	git add . && \
	git commit -m "Deploy Version $(BUILD_VERSION)" && \
	git branch -M main && \
	git remote add origin $(GITHUB_REPO) && \
	git push -u --force origin main

	cd ../..
	@echo "🟢 Finished Deploy"

.PHONY: deploy-web