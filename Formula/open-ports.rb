class OpenPorts < Formula
  desc "Terminal UI for listing open network ports"
  homepage "https://github.com/sinansonmez/open-ports"
  version "2.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sinansonmez/open-ports/releases/download/v2.0.0/open-ports_darwin_arm64.tar.gz"
      sha256 "20b91ea481c160da1b47c78246d61fe6384c7579d6306672074e785fa3ccd595"
    else
      url "https://github.com/sinansonmez/open-ports/releases/download/v2.0.0/open-ports_darwin_amd64.tar.gz"
      sha256 "807f85100c1109b339b5e2a2b002c87497d40cabd5bfe20d2b14f5d961707780"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sinansonmez/open-ports/releases/download/v2.0.0/open-ports_linux_arm64.tar.gz"
      sha256 "7558962f36a9d5b88bbc7c6d6fec3f8503864158c01aba2aff988d0594a476d0"
    else
      url "https://github.com/sinansonmez/open-ports/releases/download/v2.0.0/open-ports_linux_amd64.tar.gz"
      sha256 "3ec4e351796d60fe0a08f58be1de21b2ef1d906dae830c66bbab8de95f2a787a"
    end
  end

  def install
    executable = Dir["**/open-ports"].first
    odie "open-ports not found in tarball" unless executable
    bin.install executable => "open-ports"
  end

  test do
    system "#{bin}/open-ports", "-h"
  end
end
