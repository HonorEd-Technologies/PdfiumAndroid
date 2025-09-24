APP_STL := c++_shared
APP_CPPFLAGS += -fexceptions

#For ANativeWindow support
APP_PLATFORM = android-21

# Add 16KB page size support globally
APP_LDFLAGS += -Wl,-z,max-page-size=16384

APP_ABI :=  armeabi-v7a \
            arm64-v8a
