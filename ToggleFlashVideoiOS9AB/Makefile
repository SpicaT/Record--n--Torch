TARGET = iphone:clang:latest:9.0
ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

LIBRARY_NAME = ToggleFlashVideoiOS9AB
ToggleFlashVideoiOS9AB_FILES = Tweak.xm
ToggleFlashVideoiOS9AB_EXTRA_FRAMEWORKS = CydiaSubstrate
ToggleFlashVideoiOS9AB_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries/RecordNTorch

include $(THEOS_MAKE_PATH)/library.mk
