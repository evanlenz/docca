#!/bin/bash

date

echo "Copying docca XSLT files..." && \
cp ../include/docca/* build && \

echo "Copying shell scripts..." && \
cp extract-xml-pages.sh \
   assemble-quickbook.sh \
   prepare-stage1.sh trace-stage1.sh render-stage1.sh \
   execute-stage2.sh \
build && \

cd build && \

# For customization, we should find a better way than textually manipulating the XSLT...
echo "Running the CONFIG_TEMPLATE and INCLUDES_FOOT_TEMPLATE replacements..." && \
sed -i -e "/<!-- CONFIG_TEMPLATE -->/{r ../../example/xsl/config.xsl" -e "d}" config.xsl && \
sed -i -e "/<!-- INCLUDES_FOOT_TEMPLATE -->/{r ../../example/xsl/includes.xsl" -e "d}" config.xsl && \

echo "Calling extract-xml-pages.sh..." && \
./extract-xml-pages.sh && \

echo "Running prepare-stage1.sh..." && \
./prepare-stage1.sh && \

echo "Running trace-stage1.sh..." && \
./trace-stage1.sh && \

echo "Running render-stage1.sh..." && \
./render-stage1.sh && \

echo "Running execute-stage2.sh..." && \
./execute-stage2.sh && \

echo "Calling assemble-quickbook.sh..." && \
./assemble-quickbook.sh && \

echo "Calling the example build to run the Quickbook -> BoostBook -> DocBook -> HTML conversion..." && \
cd .. && \
../../../b2.exe

date
