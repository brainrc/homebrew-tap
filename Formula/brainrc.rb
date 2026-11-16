# Written by brainrc's release workflow (scripts/homebrew_formula.py in brainrc/brainrc).
# Edits here are overwritten on the next release.
class Brainrc < Formula
  include Language::Python::Virtualenv

  desc "Sync skills, agents, rules and guard hooks into AI coding tools"
  homepage "https://github.com/brainrc/brainrc"
  url "https://files.pythonhosted.org/packages/77/68/1ea5a0ab2e81291b6db1b1212175c6af34ce717f47d7f8e3f6adac694bd8/brainrc-0.8.13.tar.gz"
  sha256 "b7baba0613d7c0b0be77aec3d43856194345108e536fcef133c306e73724eac6"
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
