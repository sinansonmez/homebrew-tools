class EnvSync < Formula
  desc "Sync .env files using a source template"
  homepage "https://github.com/sinansonmez/env-sync"
  version "1.0.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/sinansonmez/env-sync/releases/download/v1.0.0/env-sync_darwin_arm64.tar.gz"
      sha256 "8be313b592edaa5270db651af629242bb10a4d2d5bff139833701d9bd129a27a"
    else
      url "https://github.com/sinansonmez/env-sync/releases/download/v1.0.0/env-sync_darwin_amd64.tar.gz"
      sha256 "bfe42d3f4bffc55ede11a4301566add5417d609d29cb341c8f5b115bcd03c59e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/sinansonmez/env-sync/releases/download/v1.0.0/env-sync_linux_arm64.tar.gz"
      sha256 "4c7be6adc31b44344c418488120dff2fb21264a5b5741b9ee47289d4c7e6cab0"
    else
      url "https://github.com/sinansonmez/env-sync/releases/download/v1.0.0/env-sync_linux_amd64.tar.gz"
      sha256 "4283eb6205b31f5694c9e75e5a04900ee55fbb3e53ef4820dff9a26c5a30f26b"
    end
  end

  def install
    executable = Dir["**/env-sync"].first
    odie "env-sync not found in tarball" unless executable
    bin.install executable => "env-sync"
  end

  test do
    system "#{bin}/env-sync", "-h"
  end
end
