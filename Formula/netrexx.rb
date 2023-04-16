class Netrexx < Formula
  desc "netrexx (The Rexx variant for the Java Virtual Machine)"
  homepage "https://www.netrexx.org"
  url "https://www.netrexx.org/packages/netrexx-4.05-20230416.tar.gz"
  sha256 "a22c6e085795a985762d9dd89f3b171005c23711f8a73aea00209a561efc081f"
  license "ICU"

  depends_on "openjdk" => :build
  depends_on "make" => :build
  #conflicts_with "nothing", because: "this reason"

  def install
    ENV.deparallelize
    system "make"
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
