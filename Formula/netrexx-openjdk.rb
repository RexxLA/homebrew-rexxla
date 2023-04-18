class Netrexx-openjdk < Formula
  desc "netrexx (The Rexx variant for the Java Virtual Machine)"
  homepage "https://www.netrexx.org"
  url "https://www.netrexx.org/packages/netrexx-4.05-20230416.tar.gz"
  sha256 "00795ea870fd4585465aef799433ecedec14d037da57abe574049b416c3475e1"
  license "ICU"

  depends_on "openjdk"
  depends_on "make" => :build

  def install
    ENV.deparallelize
    (prefix/"lib").mkpath
    system "make"
    bin.install "bin/nrc" => "nrc"
    bin.install "bin/NetRexxC.sh" => "NetRexxC.sh"
    bin.install "bin/nr" => "nr"
    bin.install "bin/nrc.bat" => "nrc.bat"
    bin.install "bin/NetRexxC.bat" => "NetRexxC.bat"
    bin.install "bin/NetRexxC.cmd" => "NetRexxC.cmd"
    bin.install "bin/pipe" => "pipe"
    bin.install "bin/pipc" => "pipc"
    bin.install "bin/pipe.bat" => "pipe.bat"
    bin.install "bin/pipc.bat" => "pipc.bat"
    bin.install "bin/nrws" => "nrws"
    bin.install "bin/nrws.bat" => "nrws.bat"
    chmod 0555, "#{bin}/nrc"
    chmod 0555, "#{bin}/NetRexxC.sh"
    chmod 0555, "#{bin}/nr"
    chmod 0555, "#{bin}/pipe"
    chmod 0555, "#{bin}/pipc"
    chmod 0555, "#{bin}/nrws"
    FileUtils.install Dir["#{buildpath}/build/lib/*.jar"], "#{prefix}/lib/"
  end

  test do
    # (testpath/"test").write <<~EOS
    #   #!#{bin}/rexx
    #   Parse Version ver
    #   Say ver
    # EOS
    # chmod 0755, testpath/"test"
    # assert_match version.to_s, shell_output(testpath/"test")
  end
end
