class Netrexx < Formula
  desc "netrexx (The Rexx variant for the Java Virtual Machine)"
  homepage "https://www.netrexx.org"
  url "https://www.netrexx.org/packages/netrexx-4.05-beta.tar.gz"
  sha256 "e52990c8b4d53f456f22df3f881bbcfc2b03ea9b0ae9ccbd49a3db88872d372c"
  license "ICU"

#  depends_on "make" => :build

  def install
    ENV.deparallelize
    (prefix/"lib").mkpath
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
    chmod 0755, "#{bin}/nrc"
    chmod 0755, "#{bin}/NetRexxC.sh"
    chmod 0755, "#{bin}/nr"
    chmod 0755, "#{bin}/pipe"
    chmod 0755, "#{bin}/pipc"
    chmod 0755, "#{bin}/nrws"
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

  def caveats
    on_macos do
      <<~EOS
      For running compiled NetRexx classes with java:
	export CLASSPATH=$CLASSPATH:#{prefix}/lib/NetRexxF.jar
      EOS
    end
  end
end
