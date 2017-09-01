ARCHS = armv7 arm64
SDK = iPhoneOS8.1
TARGET = iphone:clang:latest
THEOS_BUILD_DIR = DEBs

include theos/makefiles/common.mk

TWEAK_NAME = SBDashBoardGif
SBDashBoardGif_FILES = Tweak.xm
SBDashBoardGif_FILES += UIImageanimatedGIF.m
SBDashBoardGif_FRAMEWORKS = UIKit CoreGraphics QuartzCore ImageIO
SBDashBoardGif += -Wl,-segalign,4000
SBDashBoardGif_CFLAGS = -Wno-deprecated -Wno-deprecated-declarations -Wno-error -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
