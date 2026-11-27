# Homebrew formula for the enterplace CLI, for the tap eliransu/homebrew-tap (brew install eliransu/tap/enterplace).
# A template: the release workflow fills the @...@ fields with packaging/homebrew/render.sh and pushes the result to
# the tap as Formula/enterplace.rb. Do not edit the tap's copy by hand.
class Enterplace < Formula
  desc "Open source AI gateway built for governance"
  homepage "https://enterplace.dev"
  version "1.0.1"
  # The binary is the single Enterplace build: Apache-2.0 crates plus enterprise/ under its own license, which stays off
  # without a license key. Both license files are in the tarball.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v1.0.1/enterplace-1.0.1-4597341fe07b-aarch64-apple-darwin.tar.gz"
      sha256 "43bda7f80b6172872f2b90e3c890b747b544430f985262a0dac0c1e197bf89e4"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v1.0.1/enterplace-1.0.1-4597341fe07b-x86_64-apple-darwin.tar.gz"
      sha256 "f47294f26e40b8b6ae9f60b508c44fe4250a0a0e5005fea888a967c59ead0a77"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v1.0.1/enterplace-1.0.1-4597341fe07b-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8f98edd276d8cacc2ae2b6238498e043f7f2d3389d99c9ae95c3a8aebbfbf40b"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v1.0.1/enterplace-1.0.1-4597341fe07b-x86_64-unknown-linux-musl.tar.gz"
      sha256 "46cc4550300b1efd01254f970cb0f5a9dbd73f337660612afd4dbc3123c7001c"
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
