class OpenPorts < Formula
  desc "Terminal UI for listing open network ports"
  homepage "https://github.com/sinansonmez/open-ports"
  version "1.0.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sinansonmez/open-ports/releases/download/v1.0.0/open-ports_darwin_arm64.tar.gz"
      sha256 "11acc9a3e1904e4639d3c808f68c3e6e30e64f7b6c0cb8e5ea8279d9c0c5af1f"
    else
      url "https://github.com/sinansonmez/open-ports/releases/download/v1.0.0/open-ports_darwin_amd64.tar.gz"
      sha256 "125b2ebecf1013d6fedcd54f219eb84783ae5917ae89fecc3cc11b3fefac3076"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sinansonmez/open-ports/releases/download/v1.0.0/open-ports_linux_arm64.tar.gz"
      sha256 "5ce097ec5947ae97762bcdd57eb9dc69c2dbc4fef8e0e0ce01f7792b9ec1c866"
    else
      url "https://github.com/sinansonmez/open-ports/releases/download/v1.0.0/open-ports_linux_amd64.tar.gz"
      sha256 "f5906ebda238960cdfb30c2dfc88c6719a43e6d31582f597f366b69fe2520d67"
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
