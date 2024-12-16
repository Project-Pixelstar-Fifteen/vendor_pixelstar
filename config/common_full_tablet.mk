# Inherit mobile full common Pixelstar stuff
$(call inherit-product, vendor/pixelstar/config/common_mobile_full.mk)

# Inherit tablet common Pixelage stuff
$(call inherit-product, vendor/pixelstar/config/tablet.mk)

$(call inherit-product, vendor/pixelstar/config/telephony.mk)
