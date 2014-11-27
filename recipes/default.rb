unless ::File.exists?("/usr/local/lib/libvips.so")
  
  # Install dependencies
  packages = %w{ gettext libxml2-dev libglib2.0-dev libfftw3-dev build-essential libjpeg-dev 
    libtiff4-dev zlib1g-dev liblcms2-dev libpng12-dev libmagickcore-dev libmagickwand-dev 
    libfreetype6-dev libpango1.0-dev libfontconfig1-dev libice-dev pkg-config libexif-gtk-dev 
    python-all-dev liborc-0.4-dev libopenexr-dev libmatio-dev libxml2-dev libcfitsio3-dev
  }
  packages.each { |pkg| package pkg }

  vips_major_version = '7'
  vips_version = '7.40.11'
  

  # install vips from source
  bash "install vips" do
    cwd "/tmp"
    code <<-EOT
    wget http://www.vips.ecs.soton.ac.uk/supported/7.40/vips-7.40.11.tar.gz 
    tar zxf vips-7.40.11.tar.gz
    cd vips-7.26.8
    ./configure
    make
    make install
    ldconfig
    rm -rf vips-7.40.11*
    EOT
  end

end
