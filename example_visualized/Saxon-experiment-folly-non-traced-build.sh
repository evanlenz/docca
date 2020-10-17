#!/bin/bash

date

echo "Copying docca XSLT files..." && \
cp ../doc/docca/include/docca/* build && \

echo "Copying shell scripts..." && \
cp extract-xml-pages.sh \
   assemble-quickbook.sh \
   transform-without-visualizations.sh \
build && \

cd build && \

echo "Calling extract-xml-pages.sh..." && \
./extract-xml-pages.sh && \

echo "Running transform-without-visualizations.sh..." && \
./transform-without-visualizations.sh && \

echo "Calling assemble-quickbook.sh..." && \
./assemble-quickbook.sh stage2 && \

echo "Calling the Beast build to run the Quickbook -> BoostBook -> DocBook -> HTML conversion..." && \
cd .. && \
../../../b2.exe

date


# Everything below tries to replicate what the b2.exe call does above
#echo "Copying reference.qbk into qbk..." && \
#cp ../reference.qbk ../qbk && \

#echo "Converting QuickBook (main.qbk) to BoostBook (beast_doc.xml)..." && \
#../../../../bin.v2/tools/quickbook/src/msvc-14.2/release/cxxstd-0x-iso/link-static/threading-multi/quickbook.exe --output-file=beast_doc.xml ../qbk/main.qbk && \

#echo "Canonicalizing beast_doc.xml to get rid of DOCTYPE..." && \
#set XML_CATALOG_FILES=../../../../bin.v2/boostbook_catalog.xml && \
#xmllint --c14n beast_doc.xml >beast_doc_c14n.xml && \

#echo "Converting BoostBook (beast_doc.xml) to DocBook (beast_doc.docbook)..." && \
#/usr/bin/xsltproc --stringparam boost.defaults "Boost" --stringparam boost.root "../../../.." --stringparam chapter.autolabel "1" --stringparam chunk.first.sections "1" --stringparam chunk.section.depth "8" --stringparam generate.section.toc.level "8" --stringparam generate.toc "chapter toc,title section nop reference nop" --stringparam toc.max.depth "8" --stringparam toc.section.depth "8" --path "../../../../bin.v2" --xinclude -o beast_doc.docbook ../../../../tools/boostbook/xsl/docbook.xsl beast_doc.xml && \
#java -cp "c:/xml-commons-resolver-1.2/resolver.jar;c:/saxonb/saxon9.jar" \
#  -Dxml.catalog.files="c:/cygwin64/home/evanl/boost_FRESH_START/boost/bin.v2/boostbook_catalog.xml" \
#  -Dxml.catalog.verbosity=1 \
#  net.sf.saxon.Transform \
#  -r org.apache.xml.resolver.tools.CatalogResolver \
#  -x org.apache.xml.resolver.tools.ResolvingXMLReader \
#  -y org.apache.xml.resolver.tools.ResolvingXMLReader \
#  -s:beast_doc_c14n.xml \
#  -xsl:../../../../tools/boostbook/xsl/docbook.xsl \
#  -o:beast_doc.docbook \
#  boost.defaults="Boost" boost.root="../../../.." chapter.autolabel="1" chunk.first.sections="1" chunk.section.depth="8" generate.section.toc.level="8" generate.toc="chapter toc,title section nop reference nop" toc.max.depth="8" toc.section.depth="8"
#

#java -cp "c:/xml-commons-resolver-1.2/resolver.jar;c:/saxonb/saxon9.jar" net.sf.saxon.Transform -s:beast_doc.xml -xsl:../../../../tools/boostbook/xsl/docbook.xsl -o:beast_doc.docbook boost.defaults="Boost" boost.root="../../../.." chapter.autolabel="1" chunk.first.sections="1" chunk.section.depth="8" generate.section.toc.level="8" generate.toc="chapter toc,title section nop reference nop" toc.max.depth="8" toc.section.depth="8"
#java -cp "c:/xml-commons-resolver-1.2/resolver.jar;c:/saxon65/saxon.jar" -Dxml.catalog.verbosity=1 -Dxml.catalog.files=../../../../bin.v2/boostbook_catalog.xml com.icl.saxon.StyleSheet beast_doc.xml ../../../../tools/boostbook/xsl/docbook.xsl boost.defaults="Boost" boost.root="../../../.." chapter.autolabel="1" chunk.first.sections="1" chunk.section.depth="8" generate.section.toc.level="8" generate.toc="chapter toc,title section nop reference nop" toc.max.depth="8" toc.section.depth="8" >beast_doc.docbook


#echo "Converting DocBook (beast_doc.docbook) to HTML..." && \
#set XML_CATALOG_FILES=../../../../bin.v2/boostbook_catalog.xml && \
#/usr/bin/xsltproc --stringparam boost.defaults "Boost" --stringparam boost.root "../../../.." --stringparam chapter.autolabel "1" --stringparam chunk.first.sections "1" --stringparam chunk.section.depth "8" --stringparam generate.section.toc.level "8" --stringparam generate.toc "chapter toc,title section nop reference nop" --stringparam manifest "beast_HTML.manifest" --stringparam toc.max.depth "8" --stringparam toc.section.depth "8" --path "../../../../bin.v2" --xinclude -o ../html/ ../../../../tools/boostbook/xsl/html.xsl beast_doc.docbook
#java -cp "c:/xml-commons-resolver-1.2/resolver.jar;c:/saxonb/saxon9.jar" \
#  -Dxml.catalog.files="c:/cygwin64/home/evanl/boost_FRESH_START/boost/bin.v2/boostbook_catalog.xml" \
#  -Dxml.catalog.verbosity=1 \
#  net.sf.saxon.Transform \
#  -r org.apache.xml.resolver.tools.CatalogResolver \
#  -x org.apache.xml.resolver.tools.ResolvingXMLReader \
#  -y org.apache.xml.resolver.tools.ResolvingXMLReader \
#  -s:beast_doc.docbook \
#  -xsl:../../../../tools/boostbook/xsl/html.xsl \
#  -o:../html/dummy.html \
#  boost.defaults="Boost" boost.root="../../../.." chapter.autolabel="1" chunk.first.sections="1" chunk.section.depth="8" generate.section.toc.level="8" generate.toc="chapter toc,title section nop reference nop" manifest="beast_HTML.manifest" toc.max.depth="8" toc.section.depth="8"
