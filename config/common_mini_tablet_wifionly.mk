# Inherit mobile mini common Lineage stuff
$(call inherit-product, vendor/matrixx/config/common_mobile_mini.mk)

# Inherit tablet common Lineage stuff
$(call inherit-product, vendor/matrixx/config/tablet.mk)

$(call inherit-product, vendor/matrixx/config/wifionly.mk)
