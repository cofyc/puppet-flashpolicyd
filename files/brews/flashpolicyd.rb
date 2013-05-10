require 'formula'

class Flashpolicyd < Formula
  url 'https://github.com/Cofyc/flashpolicyd/archive/1.0.0.tar.gz'
  sha1 '17416cf56bef4bff5db127e2aa77e469bcf95fa7'
  homepage 'http://flashpolicyd.org/'
  version '1.0.0-boxen1'

  def install
    bin.install 'flashpolicyd.py'
  end
end
