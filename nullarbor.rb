class Nullarbor < Formula
  desc "Public health microbiology reports from sequenced isolates"
  homepage "https://github.com/tseemann/nullarbor"
  # doi ""
  # tag "bioinformatics"
  url "https://github.com/tseemann/nullarbor/archive/v0.7.tar.gz"
  sha256 "7dbff1ae6255b5e4f1e0a9bbb0104af34ecf2a07d28d771bd584fb7a5409c34b"

  depends_on "Bio::Perl" => :perl
  depends_on "Time::Piece" => :perl
  depends_on "Moo" => :perl
  depends_on "Data::Dumper" => :perl
  depends_on "Spreadsheet::Read" => :perl
  depends_on "Bio::Roary" => :perl

  depends_on "tseemann/bioinformatics-linux/snippy"
  depends_on "prokka"
  depends_on "trimal"
  depends_on "fasttree"
  depends_on "megahit"
  depends_on "spades"
  depends_on "kraken"
  depends_on "mlst"
  depends_on "abricate"
  depends_on "newick-utils"
  depends_on "imagemagick" => "with-librsvg"
  depends_on "pandoc" unless OS.linux? # GHC won't build

  def install
    prefix.install Dir["*"]
  end

  def caveats
    if OS.linux?
      <<-EOS.undent
        You need to install the Linux system package for pandoc:
        - Debian/Ubuntu: sudo apt-get install pandoc
        - Fedora/RHEL: sudo yum install pandoc
      EOS
    end
  end

  test do
    system "#{bin}/nullarbor.pl", "--version"
  end
end
