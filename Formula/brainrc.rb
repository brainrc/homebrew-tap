# Written by brainrc's release workflow (scripts/homebrew_formula.py in brainrc/brainrc).
# Edits here are overwritten on the next release.
class Brainrc < Formula
  include Language::Python::Virtualenv

  desc "Sync skills, agents, rules and guard hooks into AI coding tools"
  homepage "https://github.com/brainrc/brainrc"
  url "https://files.pythonhosted.org/packages/d5/71/13755040083bbd26ea779d8a8d2da11a444cbd59a750c3650da9ad01117f/brainrc-0.8.21.tar.gz"
  sha256 "99833059f1c00e157063874c851a354512d86d391115ccb8faeb62f14295d4e7"
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
