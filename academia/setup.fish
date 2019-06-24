#!/usr/bin/env fish

# Install latex, pandoc, pandoc-citeproc and pandoc-crossref

set PANDOC_VERSION "2.7.2"
set CROSSREF_VERSION "0.3.4.1"

sudo dnf install -y \
    texlive

cd /tmp

# pandoc and pandoc-citeproc
set baseurl "https://github.com/jgm/pandoc/releases/download"
wget "$baseurl/$PANDOC_VERSION/pandoc-$PANDOC_VERSION-linux.tar.gz"
tar -xzvf pandoc-$PANDOC_VERSION-linux.tar.gz
cd pandoc-$PANDOC_VERSION-linux
sudo mv bin/* /usr/local/bin/
sudo mv share/man/man1/*.gz /usr/local/share/man/man1/

# pandoc-crossref
mkdir -p /tmp/pandoc-crossref && cd /tmp/pandoc-crossref
set baseurl "https://github.com/lierdakil/pandoc-crossref/releases/download"
set PANDOC_VERSION (echo $PANDOC_VERSION | sed -e 's/\./_/g')
wget "$baseurl/v$CROSSREF_VERSION/linux-pandoc_$PANDOC_VERSION.tar.gz"
tar -xzvf linux-pandoc_$PANDOC_VERSION.tar.gz
sudo mv pandoc-crossref /usr/local/bin/
gzip "pandoc-crossref.1"
sudo mv pandoc-crossref.1.gz /usr/local/share/man/man1/

rm -r /tmp/pandoc*

exit 0
