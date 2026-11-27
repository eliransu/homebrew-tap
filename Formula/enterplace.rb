# Homebrew formula for the enterplace CLI, for the tap eliransu/homebrew-tap (brew install eliransu/tap/enterplace).
# A template: the release workflow fills the @...@ fields with packaging/homebrew/render.sh and pushes the result to
# the tap as Formula/enterplace.rb. Do not edit the tap's copy by hand.
class Enterplace < Formula
  desc "Open source AI gateway built for governance"
  homepage "https://enterplace.dev"
  version "0.4.0"
  # The binary is the single Enterplace build: Apache-2.0 crates plus enterprise/ under its own license, which stays off
  # without a license key. Both license files are in the tarball.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v0.4.0/enterplace-0.4.0-49c09c70f033-aarch64-apple-darwin.tar.gz"
      sha256 "6a7a7dad8ec98282085f467096be0757a7cef7c3e2cea3dae3b3f8adec31d5d6"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v0.4.0/enterplace-0.4.0-49c09c70f033-x86_64-apple-darwin.tar.gz"
      sha256 "ed153f758ff50da98c0fd777b56aa8cebb9ca6e721f5131cf352093af85f75ff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v0.4.0/enterplace-0.4.0-49c09c70f033-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c00fc8ef90c557b028be07f6839153e45559d12ee565313e4552d0952897823"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v0.4.0/enterplace-0.4.0-49c09c70f033-x86_64-unknown-linux-musl.tar.gz"
      sha256 "175be339b47d98cb30be7a9dc724adb9e1b64d8ea0ba4950ec92428a473c9ab8"
    end
  end

  def install
    bin.install "enterplace"
  end

  def caveats
    "Start the gateway with: enterplace start"
  end

  test do
    assert_match "enterplace #{version}", shell_output("#{bin}/enterplace version")
  end
end
