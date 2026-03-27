# Inherit mobile full common Lineage stuff
$(call inherit-product, vendor/matrixx/config/common_mobile_full.mk)

# Inherit tablet common Lineage stuff
$(call inherit-product, vendor/matrixx/config/tablet.mk)

$(call inherit-product, vendor/matrixx/config/wifionly.mk)
