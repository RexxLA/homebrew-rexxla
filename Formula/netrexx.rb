class Netrexx < Formula
  desc "netrexx (The Rexx variant for the Java Virtual Machine)"
  homepage "https://www.netrexx.org"
  url "https://www.netrexx.org/packages/netrexx-4.05-20230416.tar.gz"
  sha256 "cfcfe834e7893a01da18e1e5176d7671e8054254a80cf735edf1a8acba3089c5"
  license "ICU"

  depends_on "openjdk" => :build
  depends_on "make" => :build
  #conflicts_with "nothing", because: "this reason"

  def install
    ENV.deparallelize
    system "make"
    bin.install "bin/nrc" => "nrc"
    bin.install "bin/NetRexxC.sh" => "NetRexxC.sh"
    bin.install "bin/nr" => "nr"
    bin.install "bin/nrc.bat" => "nrc.bat"
    bin.install "bin/NetRexxC.bat" => "NetRexxC.bat"
    bin.install "bin/pipe" => "pipe"
    bin.install "bin/pipc" => "pipc"
    bin.install "bin/pipe.bat" => "pipe.bat"
    bin.install "bin/pipc.bat" => "pipc.bat"
    bin.install "bin/nrws.bat" => "nrws.bat"
    prefix.install "${buildpath}/build/lib/NetRexxF.jar" => "lib/NetRexxF.jar"
    #cd "./build" do
    #  system "make", "install"
    #end
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
