require "language/node"

class Mongosh < Formula
  desc "The MongoDB Shell"

  homepage "https://github.com/mongodb-js/mongosh#readme"
  url "https://registry.npmjs.org/@mongosh/cli-repl/-/cli-repl-0.5.2.tgz"
  version "0.5.2"

  # This is the checksum of the archive. Can be obtained with:
  # curl -s https://registry.npmjs.org/@mongosh/cli-repl/-/cli-repl-0.5.2.tgz | shasum -a 256
  sha256 "8702eb0ef44603f34c05e934cac9ce0adcd8596707a5ec4010746d549f825f5f"

  depends_on "node@12"

  def install
    system "#{Formula["node@12"].bin}/npm", "install", *Language::Node.std_npm_install_args(libexec)
    (bin/"mongosh").write_env_script libexec/"bin/mongosh", :PATH => "#{Formula["node@12"].opt_bin}:$PATH"
  end

  test do
    system "#{bin}/mongosh --version"
  end
end
