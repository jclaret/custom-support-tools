# Base image from Red Hat registry
FROM registry.redhat.io/rhel9/support-tools:9.2-4

# Set working directory
WORKDIR /root

# Install the RPM package
COPY  kernel-tools-5.14.0-284.86.1.el9_2.x86_64.rpm /tmp
COPY  kernel-tools-libs-5.14.0-284.86.1.el9_2.x86_64.rpm /tmp
RUN yum install -y /tmp/kernel-tools-libs-5.14.0-284.86.1.el9_2.x86_64.rpm
RUN yum install -y /tmp/kernel-tools-5.14.0-284.86.1.el9_2.x86_64.rpm

# Set default command
CMD ["bash"]
