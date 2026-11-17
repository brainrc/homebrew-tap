# Written by brainrc's release workflow (scripts/homebrew_formula.py in brainrc/brainrc).
# Edits here are overwritten on the next release.
class Brainrc < Formula
  include Language::Python::Virtualenv

  desc "Sync skills, agents, rules and guard hooks into AI coding tools"
  homepage "https://github.com/brainrc/brainrc"
  url "https://files.pythonhosted.org/packages/8e/3d/06c16d1ed05fb1a4c9ba26b5706a39212ccea06cafa43ec312ad8346a8ff/brainrc-0.8.23.tar.gz"
  sha256 "b6d1709f571b811b3a480121dd546e1e6413857ed5c4f19e7c0e26000500674a"
  license "MIT"

  depends_on "python@3.13"

  def install
    virtualenv_install_with_resources
  end

  def caveats
    <<~EOS
      Each version installs to its own directory, and links into the old one break when Homebrew
      cleans it up. After `brew upgrade brainrc`, run `brainrc apply --repair`.
    EOS
  end

  test do
    assert_equal "brainrc #{version}", shell_output("#{bin}/brainrc --version").strip
  end
end
