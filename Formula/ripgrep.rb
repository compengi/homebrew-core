class Ripgrep < Formula
  desc "Search tool like grep and The Silver Searcher."
  homepage "https://github.com/BurntSushi/ripgrep"
  url "https://github.com/BurntSushi/ripgrep/archive/0.2.6.tar.gz"
  sha256 "6170e5866b49759401e912bd59ffe5a764ee501a6056396f7a3c9f131a75af65"
  head "https://github.com/BurntSushi/ripgrep.git"

  bottle do
    cellar :any_skip_relocation
    sha256 "2e81abf5a9b425f9bac0be397cf8f661f6e5185b5118c7ddadea229c8ed1e179" => :sierra
    sha256 "21ef587ff3f4b78c3a40c5debb4f473a0795626cf1d1a9fbb942dd4b88bc7acc" => :el_capitan
    sha256 "f119ee70f91ed8edfa4ebf22fcd819083905a89114050f1f0ba8840c07e399a4" => :yosemite
  end

  depends_on "rust" => :build

  def install
    system "cargo", "build", "--release"

    bin.install "target/release/rg"
    man1.install "doc/rg.1"
  end

  test do
    (testpath/"Hello.txt").write("Hello World!")
    system "#{bin}/rg", "Hello World!", testpath
  end
end
