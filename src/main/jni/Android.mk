LOCAL_PATH := $(call my-dir)

# New consolidated pdfium library (16KB page-size safe)
include $(CLEAR_VARS)
LOCAL_MODULE := pdfium
LOCAL_SRC_FILES := $(LOCAL_PATH)/../jniLibs/$(TARGET_ARCH_ABI)/libpdfium.so
# Add 16KB page size support
LOCAL_LDFLAGS += -Wl,-z,max-page-size=16384
include $(PREBUILT_SHARED_LIBRARY)

# Main JNI library (your bridge code)
include $(CLEAR_VARS)
LOCAL_MODULE := jniPdfium

LOCAL_CFLAGS += -DHAVE_PTHREADS
LOCAL_C_INCLUDES += $(LOCAL_PATH)/include
LOCAL_SHARED_LIBRARIES += pdfium
LOCAL_LDLIBS += -llog -landroid -ljnigraphics
# Add 16KB page size support for the JNI bridge
LOCAL_LDFLAGS += -Wl,-z,max-page-size=16384

LOCAL_SRC_FILES := $(LOCAL_PATH)/src/mainJNILib.cpp

include $(BUILD_SHARED_LIBRARY)
