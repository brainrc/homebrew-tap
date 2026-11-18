# Written by brainrc's release workflow (scripts/homebrew_formula.py in brainrc/brainrc).
# Edits here are overwritten on the next release.
class Brainrc < Formula
  include Language::Python::Virtualenv

  desc "Sync skills, agents, rules and guard hooks into AI coding tools"
  homepage "https://github.com/brainrc/brainrc"
  url "https://files.pythonhosted.org/packages/e5/fd/60cccb475fb478b4671525e0d6519d4c34eeb608b1d01907408f1a40babd/brainrc-0.8.28.tar.gz"
  sha256 "608a15fc43c2736609a8612378c058584b09c42df8c36e875d8ea5136c74b8bc"
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
