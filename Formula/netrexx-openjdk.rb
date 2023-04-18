class NetrexxOpenjdk < Formula
  desc "netrexx (The Rexx variant for the Java Virtual Machine)"
  homepage "https://www.netrexx.org"
  url "https://www.netrexx.org/packages/netrexx-4.05-beta.tar.gz"
  sha256 "83e58e2461114a6734835ac34a41c6a2492e3970aa2e29e3805e7f26d1b7d08b"
  license "ICU"

  depends_on "openjdk" => :build
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
