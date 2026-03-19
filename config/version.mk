PRODUCT_VERSION_MAJOR = 16
PRODUCT_VERSION_MINOR = 0

# Increase Lunaris Version with each major release.
MATRIXX_VERSION := 12.2.0

MATRIXX_RELEASE_CODE := Protium

MATRIXX_BUILD_TYPE := $(shell vendor/lineage/build/verifykeys.sh $(DEFAULT_SYSTEM_DEV_CERTIFICATE))

ifeq ($(WITH_GMS), true)
  MATRIXX_BUILD_VARIANT := Gapps
else
  MATRIXX_BUILD_VARIANT := Vanilla
endif

# Internal version
LINEAGE_VERSION := Matrixx$(MATRIXX_VARIANT)-v$(MATRIXX_VERSION)-$(MATRIXX_BUILD_TYPE)-$(LINEAGE_BUILD)-$(MATRIXX_BUILD_VARIANT)-$(shell date +%Y%m%d-%H%M)

# Display version
LINEAGE_DISPLAY_VERSION := Matrixx-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(LINEAGE_BUILD)-v$(MATRIXX_VERSION)

# LineageOS version properties
PRODUCT_PRODUCT_PROPERTIES += \
    ro.matrixx.build.version=$(MATRIXX_VERSION) \
    ro.matrixx.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.matrixx.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.matrixx.build.variant=$(MATRIXX_BUILD_VARIANT) \
    ro.matrixx.release.type=$(MATRIXX_BUILD_TYPE) \
    ro.matrixx.release.code=$(MATRIXX_RELEASE_CODE) \
    ro.matrixx.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(MATRIXX_VERSION)
