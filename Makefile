include theos/makefiles/common.mk

LOCAL_INSTALL_PATH = /Library/UISettings/
LIBRARY_NAME = UISFlashlight
UISFlashlight_FILES = UISFlashlight.mm
UISFlashlight_FRAMEWORKS = AVFoundation
UISFlashlight_PRIVATE_FRAMEWORKS = UIKit CoreGraphics 

include $(THEOS_MAKE_PATH)/library.mk
