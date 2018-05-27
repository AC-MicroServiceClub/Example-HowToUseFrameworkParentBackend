# FrameworkHowtoUseParentBackend
How to use parentBackend to create your business micro service


<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <springProfile name="k8s">
        <include resource="org/springframework/boot/logging/logback/defaults.xml" />

        <property name="LOG_FILE" value="${LOG_FILE:-${LOG_PATH:-${LOG_TEMP:-${java.io.tmpdir:-/tmp}}}/spring.log}"/>
        <include resource="org/springframework/boot/logging/logback/file-appender.xml" />
        <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
            <encoder class="net.logstash.logback.encoder.LogstashEncoder" />
        </appender>
        <root level="ERROR">
            <appender-ref ref="FILE" />
            <appender-ref ref="CONSOLE" />
        </root>
        <logger name="au.gov.myhr" level="INFO"/>
    </springProfile>
    <springProfile name="ntt">
        <include resource="org/springframework/boot/logging/logback/defaults.xml" />

        <property name="LOG_FILE" value="${LOG_FILE:-${LOG_PATH:-${LOG_TEMP:-${java.io.tmpdir:-/tmp}}}/spring.log}"/>
        <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
            <encoder class="net.logstash.logback.encoder.LogstashEncoder" />
        </appender>
        <appender name="FILE"
                  class="ch.qos.logback.core.rolling.RollingFileAppender">
            <encoder class="net.logstash.logback.encoder.LogstashEncoder" />
            <file>${LOG_FILE}</file>
            <rollingPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedRollingPolicy">
                <fileNamePattern>${LOG_FILE}-%d{yyyyMMdd}.%i.log</fileNamePattern>
                <maxFileSize>50MB</maxFileSize>
                <maxHistory>100</maxHistory>
                <totalSizeCap>5GB</totalSizeCap>
            </rollingPolicy>
        </appender>
        <root level="ERROR">
            <appender-ref ref="FILE" />
            <appender-ref ref="CONSOLE" />
        </root>
        <logger name="au.gov.myhr" level="INFO"/>
    </springProfile>
    <springProfile name="dev">
        <include resource="org/springframework/boot/logging/logback/base.xml"/>
        <appender name="CONSOLE" class="ch.qos.logback.core.ConsoleAppender">
            <encoder>
                <pattern>%d{HH:mm:ss.SSS} [%thread] %-5level %logger{36} - %msg%n</pattern>
            </encoder>
        </appender>
        <root level="WARN">
            <appender-ref ref="CONSOLE" />
        </root>
        <logger name="au.gov.myhr" level="INFO"/>
    </springProfile>

</configuration>
