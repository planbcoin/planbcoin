package=native_mac_alias
$(package)_version=2.1.1
$(package)_download_path=https://github.com/planbcoin/mac_alias/archive
$(package)_download_file=v$($(package)_version).tar.gz
$(package)_file_name=$(package)-$($(package)_version).tar.gz
$(package)_sha256_hash=79d01241f1fc2a3f733084ace93fb57b976229eed143214492015a7a961a0ce4
$(package)_install_libdir=$(build_prefix)/lib/python/dist-packages
$(package)_patches=python3.patch

define $(package)_preprocess_cmds
  patch -p1 < $($(package)_patch_dir)/python3.patch
endef

define $(package)_build_cmds
    python setup.py build
endef

define $(package)_stage_cmds
    mkdir -p $($(package)_install_libdir) && \
    python setup.py install --root=$($(package)_staging_dir) --prefix=$(build_prefix) --install-lib=$($(package)_install_libdir)
endef
