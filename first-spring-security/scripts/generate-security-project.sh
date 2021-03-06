#!/bin/bash

#${ARCHETYPE_VERSION}=terasoluna-gfw-blank-archetype-version
#${VERSION}=tutorial pj version

# generate security apps
case "${ARCHETYPE_VERSION:0:5}" in
  5.2* | 5.1* | 5.0* )
    bash ./first-spring-security/scripts/generate-project-from-nexus.sh;;
  * )
    if test `echo ${ARCHETYPE_VERSION} | tail -c8 ` = "RELEASE"; then
      bash ./first-spring-security/scripts/generate-project-from-maven-central.sh
    else
      bash ./first-spring-security/scripts/generate-project-from-nexus.sh
    fi;;
esac

# delete unuse (or conflict) test sources in blank project
rm -rf ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-selenium/src/test/java/com/example/security/selenium/welcome/

# make app
mkdir -p ./first-spring-security-mybatis3/src/main/java/com/example/security/domain/model
mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/model

mkdir -p ./first-spring-security-mybatis3/src/main/java/com/example/security/domain/repository/account/
mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/repository/account/

mkdir -p ./first-spring-security-mybatis3/src/main/resources/com/example/security/domain/repository/account/
mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/resources/com/example/security/domain/repository/account/

mkdir -p ./first-spring-security-mybatis3/src/main/java/com/example/security/domain/service/account/
mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/service/account/

mkdir -p ./first-spring-security-mybatis3/src/main/java/com/example/security/domain/service/userdetails/
mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/service/userdetails/

mkdir -p ./first-spring-security-mybatis3/src/main/java/com/example/security/app/account/
mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-web/src/main/java/com/example/security/app/account/

mkdir -p ./first-spring-security-mybatis3/src/main/resources/database/
mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-env/src/main/resources/database/

mkdir -p ./first-spring-security-mybatis3/src/main/webapp/WEB-INF/views/account/
mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-web/src/main/webapp/WEB-INF/views/account/

mkdir -p ./first-spring-security-mybatis3/src/test/resources/META-INF/spring/
mkdir -p ./first-spring-security-mybatis3/src/test/java/com/example/security/selenium/security/

mkdir -p ./first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-selenium/src/test/java/com/example/security/selenium/security/

# create dir for complete app
mkdir target-project

# mv to target-project
mv ./first-spring-security-mybatis3 ./target-project
mv ./first-spring-security-mybatis3-multi ./target-project

# cp security sources
cp -p ./first-spring-security/src/main/java/com/example/security/domain/model/Account.java ./target-project/first-spring-security-mybatis3/src/main/java/com/example/security/domain/model
cp -p ./first-spring-security/src/main/java/com/example/security/domain/model/Account.java ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/model

cp -p ./first-spring-security/src/main/java/com/example/security/domain/repository/account/AccountRepository.java ./target-project/first-spring-security-mybatis3/src/main/java/com/example/security/domain/repository/account/
cp -p ./first-spring-security/src/main/java/com/example/security/domain/repository/account/AccountRepository.java ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/repository/account/

cp -p ./first-spring-security/src/main/resources/com/example/security/domain/repository/account/AccountRepository.xml ./target-project/first-spring-security-mybatis3/src/main/resources/com/example/security/domain/repository/account/
cp -p ./first-spring-security/src/main/resources/com/example/security/domain/repository/account/AccountRepository.xml ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/resources/com/example/security/domain/repository/account/

cp -p ./first-spring-security/src/main/java/com/example/security/domain/service/account/AccountSharedService.java ./target-project/first-spring-security-mybatis3/src/main/java/com/example/security/domain/service/account/
cp -p ./first-spring-security/src/main/java/com/example/security/domain/service/account/AccountSharedService.java ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/service/account/

cp -p ./first-spring-security/src/main/java/com/example/security/domain/service/account/AccountSharedServiceImpl.java ./target-project/first-spring-security-mybatis3/src/main/java/com/example/security/domain/service/account/
cp -p ./first-spring-security/src/main/java/com/example/security/domain/service/account/AccountSharedServiceImpl.java ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/service/account/

cp -p ./first-spring-security/src/main/java/com/example/security/app/account/AccountController.java ./target-project/first-spring-security-mybatis3/src/main/java/com/example/security/app/account/
cp -p ./first-spring-security/src/main/java/com/example/security/app/account/AccountController.java ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-web/src/main/java/com/example/security/app/account/

cp -p ./first-spring-security/src/main/java/com/example/security/domain/service/userdetails/SampleUserDetails.java ./target-project/first-spring-security-mybatis3/src/main/java/com/example/security/domain/service/userdetails/
cp -p ./first-spring-security/src/main/java/com/example/security/domain/service/userdetails/SampleUserDetails.java ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/service/userdetails/

cp -p ./first-spring-security/src/main/java/com/example/security/domain/service/userdetails/SampleUserDetailsService.java ./target-project/first-spring-security-mybatis3/src/main/java/com/example/security/domain/service/userdetails/
cp -p ./first-spring-security/src/main/java/com/example/security/domain/service/userdetails/SampleUserDetailsService.java ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-domain/src/main/java/com/example/security/domain/service/userdetails/

cp -p ./first-spring-security/src/main/resources/database/H2-*.sql ./target-project/first-spring-security-mybatis3/src/main/resources/database/
cp -p ./first-spring-security/src/main/resources/database/H2-*.sql ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-env/src/main/resources/database/

cp -p ./first-spring-security/src/main/webapp/WEB-INF/login.jsp ./target-project/first-spring-security-mybatis3/src/main/webapp/
cp -p ./first-spring-security/src/main/webapp/WEB-INF/login.jsp ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-web/src/main/webapp/

cp -p ./first-spring-security/src/main/webapp/WEB-INF/views/account/view.jsp ./target-project/first-spring-security-mybatis3/src/main/webapp/WEB-INF/views/account/
cp -p ./first-spring-security/src/main/webapp/WEB-INF/views/account/view.jsp ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-web/src/main/webapp/WEB-INF/views/account/

cp -p ./first-spring-security/src/test/java/com/example/security/selenium/FirstSpringSecurityTest.java ./target-project/first-spring-security-mybatis3/src/test/java/com/example/security/selenium/security/
cp -p -r ./common-test/java/selenium ./target-project/first-spring-security-mybatis3/src/test/java/com/example/security/

cp -p -r ./common-test/resources ./target-project/first-spring-security-mybatis3/src/test

cp -p ./first-spring-security/src/test/java/com/example/security/selenium/FirstSpringSecurityTest.java ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-selenium/src/test/java/com/example/security/selenium/security/
cp -f -p -r ./common-test/java/selenium ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-selenium/src/test/java/com/example/security/
cp -f -p -r ./common-test/resources ./target-project/first-spring-security-mybatis3-multi/first-spring-security-mybatis3-multi-selenium/src/test