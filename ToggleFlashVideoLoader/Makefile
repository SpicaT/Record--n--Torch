TARGET = iphone:clang:latest:5.0
ARCHS = armv7 arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ToggleFlashVideo
ToggleFlashVideo_FILES = Tweak.xm
ToggleFlashVideo_EXTRA_FRAMEWORKS = Cephei

include $(THEOS_MAKE_PATH)/tweak.mk
