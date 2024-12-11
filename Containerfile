# Base image from Red Hat registry
FROM registry.redhat.io/rhel9/support-tools

# Set working directory
WORKDIR /root

# Install the RPM package
RUN yum install -y kernel-tools

# Set default command
CMD ["bash"]
