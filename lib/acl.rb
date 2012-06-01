require 'open-uri'

class Acl
  def self.update_redis_cache(vendor_name, branch_name, url)
    repository = Repository.where(name: branch_name, vendor: vendor_name).first
    file = open(URI.escape(url)).read
    $redis.multi
    Maintainer.select('login').all.each do |maintainer|
      $redis.del("#{repository.name}:maintainers:#{maintainer.login}")
    end
    file.each_line do |line|
      package = line.split[0]
      $redis.del("#{repository.name}:#{package}:acls")
      for i in 1..line.split.count-1
        login = line.split[i]
        login = 'php-coder' if login == 'php_coder'
        login = 'p_solntsev' if login == 'psolntsev'
        login = '@vim-plugins' if login == '@vim_plugins'
        $redis.sadd("#{repository.name}:#{package}:acls", login)
        $redis.sadd("#{repository.name}:maintainers:#{login}", package)
      end
    end
    $redis.exec
  end
end
