unless ::File.exists?("/usr/local/lib/libvips.so")
  
  # Install dependencies
  packages = %w{ gettext libxml2-dev libglib2.0-dev libfftw3-dev build-essential libjpeg-dev 
    libtiff4-dev zlib1g-dev liblcms2-dev libpng12-dev libmagickcore-dev libmagickwand-dev 
    libfreetype6-dev libpango1.0-dev libfontconfig1-dev libice-dev pkg-config libexif-gtk-dev 
    python-all-dev liborc-0.4-dev libopenexr-dev libmatio-dev libxml2-dev libcfitsio3-dev
  }
  packages.each { |pkg| package pkg }

  vips_major_version = '7'
  vips_minor_version = '40'
  vips_patch_version = '11'
  vips_version = '#{vips_major_version}.#{vips_minor_version}.#{vips_patch_version}'
  
  # install vips from source
  bash "install vips" do
    cwd "/tmp"
    code <<-EOT
    wget http://www.vips.ecs.soton.ac.uk/supported/#{vips_major_version}.#{vips_minor_version}/vips-#{vips_version}.tar.gz 
    tar zxf vips-#{vips_version}.tar.gz
    cd vips-#{vips_version}
    ./configure
    make
    make install
    ldconfig
    rm -rf vips-#{vips_version}*
    EOT
  end

end
