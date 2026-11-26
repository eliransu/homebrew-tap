# Homebrew formula for the enterplace CLI, for the tap eliransu/homebrew-tap (brew install eliransu/tap/enterplace).
# A template: the release workflow fills the @...@ fields with packaging/homebrew/render.sh and pushes the result to
# the tap as Formula/enterplace.rb. Do not edit the tap's copy by hand.
class Enterplace < Formula
  desc "Open source AI gateway built for governance"
  homepage "https://enterplace.dev"
  version "0.2.0"
  # The binary is the single Enterplace build: Apache-2.0 crates plus enterprise/ under its own license, which stays off
  # without a license key. Both license files are in the tarball.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v0.2.0/enterplace-0.2.0-2f3162676ba7-aarch64-apple-darwin.tar.gz"
      sha256 "2ab3643fef8b6d2bdf8051bc7ce5ba39cf5035bf55a63fc90f31b6e35f765022"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v0.2.0/enterplace-0.2.0-2f3162676ba7-x86_64-apple-darwin.tar.gz"
      sha256 "2b57d14b22c990042da750d6ea619dba1f81d0a2abd025d9ffea9f9667afd7e1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v0.2.0/enterplace-0.2.0-2f3162676ba7-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fa6198b2a2e70b9ad8548f28603388818ee6b78f274f97677ddd88f59d0f229e"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v0.2.0/enterplace-0.2.0-2f3162676ba7-x86_64-unknown-linux-musl.tar.gz"
      sha256 "16e661313f20ea4102f92d826041522a2d5a009bb5d8a7cca0477e9b9fbd3890"
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
