# cv

A new Flutter project.

## Deploying

flutter clean
flutter pub get
flutter build web --base-href /cv/ --release

cd build/web
git init
git add .
git commit -m "Deploy Web App"
git branch -M main
git remote add origin https://github.com/obenkucuk/cv.git
git push -u --force origin main