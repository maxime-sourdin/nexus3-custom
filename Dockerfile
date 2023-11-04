FROM sonatype/nexus3:3.61.0
USER root
RUN curl -vL https://github.com/groupe-edf/nexus-report-plugin/releases/download/0.2.1/nexus-report-plugin-0.2.1-bundle.kar -o /opt/sonatype/nexus/deploy/nexus-report-plugin-0.2.1-bundle.kar

EXPOSE 8081
USER nexus
ENV INSTALL4J_ADD_VM_PARAMS="-Xms2703m -Xmx2703m -XX:MaxDirectMemorySize=2703m -Djava.util.prefs.userRoot=${NEXUS_DATA}/javaprefs"
CMD ["/opt/sonatype/nexus/bin/nexus", "run"]