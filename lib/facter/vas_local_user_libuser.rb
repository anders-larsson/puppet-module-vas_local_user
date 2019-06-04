Facter.add('vas_local_user_libuser') do
  setcode do
    if File.executable?('/usr/sbin/luseradd') &&
       File.executable?('/usr/sbin/lgroupadd')
      'yes'
    else
      'no'
    end
  end
end
