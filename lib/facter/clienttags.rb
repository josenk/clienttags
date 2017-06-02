# clienttags.rb


Facter.add(:clienttags) do
    setcode do
        Facter::Util::Resolution.exec('sed "s/.*/\'&\'/g" /etc/clienttags|grep "^\'[a-z|A-Z|0-9].*" 2>/dev/null || echo "NoTags"')
    end
end

