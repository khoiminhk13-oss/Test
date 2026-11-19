cat << 'EOF' > setup.sh

#!/usr/bin/env bash
set -e

mkdir -p .github/workflows
mkdir -p gradle/wrapper
mkdir -p src/main/resources
mkdir -p src/main/java/com/example/autobuild/modules

cat << 'EOF' > settings.gradle
pluginManagement {
    repositories {
            maven {
                        name = 'Fabric'
                                    url = 'https://maven.fabricmc.net/'
                                            }
                                                    gradlePluginPortal()
                                                        }
                                                        }

                                                        rootProject.name = 'meteor-autobuild'
                                                        EOF

                                                        cat << 'EOF' > gradle.properties
                                                        org.gradle.jvmargs=-Xmx2G
                                                        org.gradle.parallel=true

                                                        minecraft_version=1.21.11
                                                        yarn_mappings=1.21.11+build.1
                                                        loader_version=0.16.10
                                                        meteor_version=1.21.11-SNAPSHOT

                                                        mod_version=1.0.0
                                                        maven_group=com.example
                                                        archives_base_name=meteor-autobuild
                                                        EOF

                                                        cat << 'EOF' > build.gradle
                                                        plugins {
                                                            id 'fabric-loom' version '1.9-SNAPSHOT'
                                                                id 'maven-publish'
                                                                }

                                                                version = project.mod_version
                                                                group = project.maven_group

                                                                base {
                                                                    archivesName = project.archives_base_name
                                                                    }

                                                                    repositories
                                                                    