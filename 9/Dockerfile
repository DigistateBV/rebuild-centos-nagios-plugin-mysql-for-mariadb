from centos:9

VOLUME /output

COPY MariaDB.repo /etc/yum.repos.d/
RUN rpm --import https://mirror.ehv.weppel.nl/mariadb/yum/RPM-GPG-KEY-MariaDB && \
	dnf install rpm-build epel-release -y && \
	rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-9

RUN dnf install cowsay sendmail openssh-clients fping autoconf automake freeradius-client-devel gcc gettext libdbi-devel libpq-devel net-snmp-devel net-snmp-devel net-snmp-utils openldap-devel perl-generators samba-client bind-utils make MariaDB-devel -y

RUN groupadd mock && useradd -m -G mock mockbuild

WORKDIR /root

ADD https://download-ib01.fedoraproject.org/pub/epel/9/Everything/x86_64/Packages/n/nagios-plugins-2.4.6-1.el9.x86_64.rpm /root/nagios-plugins.src.rpm

RUN rpmbuild --rebuild nagios-plugins.src.rpm

RUN rm -f /output/rpms/* && mkdir /output/rpms/ && cp rpmbuild/RPMS/x86_64/*.rpm /output/rpms/

ENTRYPOINT ["cowsay", "Your packages are done, and placed in output/rpms/"] 