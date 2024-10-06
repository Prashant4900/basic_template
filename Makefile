.PHONY: splash
splash:
	flutter pub get
	dart run flutter_native_splash:create

.PHONY: icon
icon:
	flutter pub get
	dart run flutter_launcher_icons

.PHONY: gen
gen:
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs

.PHONY: apk
apk:
	make clean
	flutter build apk --split-per-abi

.PHONY: get
get:
	flutter pub get

.PHONY: clean
clean:
	flutter clean
	make get

.PHONY: abb
abb:
	make clean
	flutter build appbundle

.PHONY: fix
fix:
	dart fix --apply

.PHONY: adb
adb:
	adb tcpip 5555
	sleep 1
	adb connect 192.0.0.2