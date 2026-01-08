class OpenPorts < Formula
  desc "Terminal UI for listing open network ports"
  homepage "https://github.com/sinansonmez/open-ports"
  version "2.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sinansonmez/open-ports/releases/download/v2.1.0/open-ports_darwin_arm64.tar.gz"
      sha256 "1d469c6693b34ba53c55b00e1cda520e437b2f28b4aafcd41ced2ee483c52f71"
    else
      url "https://github.com/sinansonmez/open-ports/releases/download/v2.1.0/open-ports_darwin_amd64.tar.gz"
      sha256 "020a2506a24eecee00cc8326d24b30c493349208dad082519294b509f51ec428"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sinansonmez/open-ports/releases/download/v2.1.0/open-ports_linux_arm64.tar.gz"
      sha256 "77e1a213bd0ecbe302d17255153f46f13789c81f54db69c57a49db8feea67eb7"
    else
      url "https://github.com/sinansonmez/open-ports/releases/download/v2.1.0/open-ports_linux_amd64.tar.gz"
      sha256 "d6b3eea713eafb5de89e1df02196fbbb43727dccb0d3a9201a4f1aad93326b14"
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
