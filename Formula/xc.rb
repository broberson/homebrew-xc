class Xc < Formula
  desc "Xcode project management for people who hate Xcode"
  homepage "https://github.com/broberson/homebrew-xc"
  url "https://github.com/broberson/homebrew-xc/releases/download/v0.1.4/xc-0.1.4.tar.gz"
  sha256 "8312903666e868f941310e6123a2d975383435f000d293b144122a8b4a6f5b21"
  license "MIT"

  depends_on "ruby" => ">= 4.0.2"

  # The xcodeproj gem is required
  resource "xcodeproj" do
    url "https://rubygems.org/downloads/xcodeproj-1.27.0.gem"
    sha256 "8cc7a73b4505c227deab044dce118ede787041c702bc47636856a2e566f854d3"
  end

  # The tty-spinner gem is required
  resource "tty-spinner" do
    url "https://rubygems.org/downloads/tty-spinner-0.9.3.gem"
    sha256 "0e036f047b4ffb61f2aa45f5a770ec00b4d04130531558a94bfc5b192b570542"
  end

  def install
    # Install the Ruby script
    script = Dir["**/xc"].first
    libexec.install script

    # Install xcodeproj gem into libexec
    resource("xcodeproj").stage do
      system Formula["ruby"].opt_bin/"gem", "install", Dir["*.gem"].first,
             "--install-dir", libexec,
             "--no-document"
    end

    # Install tty-spinner gem into libexec
    resource("tty-spinner").stage do
      system Formula["ruby"].opt_bin/"gem", "install", Dir["*.gem"].first,
             "--install-dir", libexec,
             "--no-document"
    end

    # Wrapper ensures the script uses the Homebrew Ruby + gems
    (bin/"xc").write <<~EOS
      #!/bin/bash
      export GEM_PATH="#{libexec}"
      exec "#{Formula["ruby"].opt_bin}/ruby" "#{libexec}/xc" "$@"
    EOS

    chmod 0755, bin/"xc"
  end

  test do
    assert_match "Usage: xc", shell_output("#{bin}/xc --help")
  end
end
