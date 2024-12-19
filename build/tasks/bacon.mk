# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# -----------------------------------------------------------------
# Pixelstar OTA update package

PIXELSTAR_TARGET_PACKAGE := $(PRODUCT_OUT)/$(PIXELSTAR_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon:  $(DEFAULT_GOAL) $(BUILT_TARGET_FILES_PACKAGE) $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(PIXELSTAR_TARGET_PACKAGE)
	$(hide) $(SHA256) $(PIXELSTAR_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(PIXELAGE_TARGET_PACKAGE).sha256sum
	$(hide) ./vendor/pixelstar/build/tools/createjson.sh $(TARGET_DEVICE) $(PRODUCT_OUT) $(PIXELSTAR_VERSION).zip $(PLATFORM_VERSION)
	$(hide) ./vendor/pixelstar/build/tools/ascii_output.sh
	@echo "Package Complete: $(PIXELSTAR_TARGET_PACKAGE)" >&2
