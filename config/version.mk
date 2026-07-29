PRODUCT_VERSION_MAJOR = 16
PRODUCT_VERSION_MINOR = 0

# Increase Matrixx Version with each major release.
MATRIXX_BASE_VERSION := 12.7

MATRIXX_CODENAME := Nebula

MATRIXX_BUILD_TYPE := $(shell vendor/matrixx/build/verifykeys.sh $(DEFAULT_SYSTEM_DEV_CERTIFICATE))

ifeq ($(WITH_GMS), true)
  MATRIXX_BUILD_VARIANT := Gapps
else
  MATRIXX_BUILD_VARIANT := Vanilla
endif

# Internal version
MATRIXX_VERSION := Matrixx-v$(MATRIXX_BASE_VERSION)-$(MATRIXX_CODENAME)-$(MATRIXX_BUILD_TYPE)-$(MATRIXX_BUILD)-$(MATRIXX_BUILD_VARIANT)-$(shell date +%Y%m%d-%H%M)

# Display version
MATRIXX_DISPLAY_VERSION := v$(MATRIXX_BASE_VERSION)-$(MATRIXX_CODENAME)

# Matrixx version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.matrixx.build.version=$(MATRIXX_VERSION) \
    ro.matrixx.display.version=$(MATRIXX_DISPLAY_VERSION) \
    ro.matrixx.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.matrixx.build.variant=$(MATRIXX_BUILD_VARIANT) \
    ro.matrixx.release.type=$(MATRIXX_BUILD_TYPE) \
    ro.matrixx.release.code=$(MATRIXX_RELEASE_CODE) \
    ro.matrixx.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(MATRIXX_VERSION) \
    ro.matrixx.codename=$(MATRIXX_CODENAME) \
    ro.matrixx.maintainer=$(MATRIXX_MAINTAINER) \
    ro.matrixx.processor=$(MATRIXX_PROCESSOR)
