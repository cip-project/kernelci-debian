cd ~
cd git-repos
git clone git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
cd linux-stable
git checkout -b cip_v4.4.27 v4.4.27
echo "Building ARMhf cip-tyrannosaurus Tree"
export TREE_NAME=cip-tyrannosaurus
export ARCH=arm
export CROSS_COMPILE=arm-linux-gnueabihf-
~/kernelci-build/build.py -c tinyconfig -p CIP-KernelCI
~/kernelci-build/build.py -c allnoconfig -p CIP-KernelCI
echo "Building ARMhf cip-stegosaurus Tree"
export TREE_NAME=cip-stegosaurus
~/kernelci-build/build.py -c sunxi_defconfig -p CIP-KernelCI
~/kernelci-build/build.py -c axm55xx_defconfig -p CIP-KernelCI
echo "Building ARM64 cip-triceratops Tree"
export TREE_NAME=cip-triceratops
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
~/kernelci-build/build.py -c tinyconfig -p CIP-KernelCI
~/kernelci-build/build.py -c allnoconfig -p CIP-KernelCI

