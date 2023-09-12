chroot /mnt/gentoo /bin/bash -c '
mount /dev/sda1 /boot &&\
emerge-webrsync &&\
emerge --verbose --update --deep --newuse @world &&\
emerge app-portage/cpuid2cpuflags &&\
echo "*/* $(cpuid2cpuflags)" > /etc/portage/package.use/00cpu-flags &&\
echo "Asia/Tokyo" > /etc/timezone &&\
emerge --config sys-libs/timezone-data &&\
emerge sys-kernel/linux-firmware &&\
emerge sys-kernel/gentoo-kernel &&\
emerge --depclean &&\
emerge @module-rebuild &&\
emerge --config sys-kernel/gentoo-kernel &&\
curl https://raw.githubusercontent.com/glacion/genfstab/master/genfstab | bash -s -- -U / >> /etc/fstab &&\
echo last-test > /etc/hostname &&\
emerge --noreplace net-misc/netifrc &&\
emerge app-admin/syslog-ng &&\
rc-update add syslog-ng default &&\
rc-update add sshd default &&\
emerge sys-boot/grub &&\
grub-install --target=x86_64-efi --efi-directory=/boot &&\
grub-mkconfig -o /boot/grub/grub.cfg
'
