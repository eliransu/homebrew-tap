# Homebrew formula for the enterplace CLI, for the tap eliransu/homebrew-tap (brew install eliransu/tap/enterplace).
# A template: the release workflow fills the @...@ fields with packaging/homebrew/render.sh and pushes the result to
# the tap as Formula/enterplace.rb. Do not edit the tap's copy by hand.
class Enterplace < Formula
  desc "Open source AI gateway built for governance"
  homepage "https://enterplace.dev"
  version "0.3.0"
  # The binary is the single Enterplace build: Apache-2.0 crates plus enterprise/ under its own license, which stays off
  # without a license key. Both license files are in the tarball.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v0.3.0/enterplace-0.3.0-a97b6c98b4e2-aarch64-apple-darwin.tar.gz"
      sha256 "d0f5851dd751013b03d7be53e8155e44abf6c5b5448614e902982ecc4ded0773"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v0.3.0/enterplace-0.3.0-a97b6c98b4e2-x86_64-apple-darwin.tar.gz"
      sha256 "5a8ae1dedaa01e85c35045142c5eb45f4dbea60fa21fb6e364bbf552e01fdf78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v0.3.0/enterplace-0.3.0-a97b6c98b4e2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "4c6199fd569ab6d9a870700c0befc91ae827b2e4d3ec256a729f518795dcfdf4"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v0.3.0/enterplace-0.3.0-a97b6c98b4e2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "715082b1bdbf9a9dc43b8642b2fa25f2b33c29cfe4c413f13d71d8715ba9eb1a"
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
