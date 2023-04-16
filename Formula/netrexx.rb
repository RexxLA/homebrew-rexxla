class Netrexx < Formula
  desc "netrexx (The Rexx variant for the Java Virtual Machine)"
  homepage "https://www.netrexx.org"
  url "https://www.netrexx.org/packages/netrexx-4.05-20230416.tar.gz"
  sha256 "8176ed193a6af47d76f9f8049399d13ff70e2c503831e65c2716d35e0f4ac03c"
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
