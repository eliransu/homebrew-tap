# Homebrew formula for the enterplace CLI, for the tap eliransu/homebrew-tap (brew install eliransu/tap/enterplace).
# A template: the release workflow fills the @...@ fields with packaging/homebrew/render.sh and pushes the result to
# the tap as Formula/enterplace.rb. Do not edit the tap's copy by hand.
class Enterplace < Formula
  desc "Open source AI gateway built for governance"
  homepage "https://enterplace.dev"
  version "0.5.0"
  # The binary is the single Enterplace build: Apache-2.0 crates plus enterprise/ under its own license, which stays off
  # without a license key. Both license files are in the tarball.
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v0.5.0/enterplace-0.5.0-1093bb8e12d5-aarch64-apple-darwin.tar.gz"
      sha256 "d5cfbd3cc630a490c32a01e3c5f5aa0034821cbf01434c2209b5055346dd9b8a"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v0.5.0/enterplace-0.5.0-1093bb8e12d5-x86_64-apple-darwin.tar.gz"
      sha256 "75c597f0dc7d6e560a36aa5cc9949a873f70ac23fb71ec9e53602a571cc0feff"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/eliransu/enterplace/releases/download/v0.5.0/enterplace-0.5.0-1093bb8e12d5-aarch64-unknown-linux-musl.tar.gz"
      sha256 "9943d6f729b53f8a463acb3e051bf7d187b003d9ed9018b7445c48cae96c0d63"
    end
    on_intel do
      url "https://github.com/eliransu/enterplace/releases/download/v0.5.0/enterplace-0.5.0-1093bb8e12d5-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9c26799c8197a8598a3475251d206e5aaf98be77b3b8639c3e87bdd7ad9a4357"
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
