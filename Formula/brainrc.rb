# Written by brainrc's release workflow (scripts/homebrew_formula.py in brainrc/brainrc).
# Edits here are overwritten on the next release.
class Brainrc < Formula
  include Language::Python::Virtualenv

  desc "Sync skills, agents, rules and guard hooks into AI coding tools"
  homepage "https://github.com/brainrc/brainrc"
  url "https://files.pythonhosted.org/packages/ed/d3/4a2e064eb7a82ee0e1df1af55588e1c518e139fb8c17105565cc94bf242c/brainrc-0.8.7.tar.gz"
  sha256 "50ab6cba713d614299c43a251d5db34966126912559375b62817fdc7fed7f2a6"
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
