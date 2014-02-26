#!/usr/bin/env ruby

#--------------------------------------------------------------------------
# reference code (DEV-C++):
#   http://web.cogs.idv.tw/2010/11/dev-copencv-210-win32-vs2008psnr_26.html 
#
# psnr test images:
#   http://en.wikipedia.org/wiki/Peak_signal-to-noise_ratio
#   PSNR-example-base.png
#   PSNR-example-comp-90.jpg (45.53dB)
#   PSNR-example-comp-30.jpg (36.81dB)
#   PSNR-example-comp-10.jpg (31.45dB)
#--------------------------------------------------------------------------

require 'opencv'

filenameSrc = 'PSNR-example-base.png'
filenameDst = 'PSNR-example-comp-90.jpg'
#filenameDst = 'PSNR-example-comp-30.jpg'
#filenameDst = 'PSNR-example-comp-10.jpg'

if ARGV.size == 2
  filenameSrc = ARGV[0] 
  filenameDst = ARGV[1] 
end
puts "\nMeasue PSNR of lossy image #{filenameDst} based on #{filenameSrc}"
puts "-----------------------------------------------------------------------------"

totalValue=0;
psnr=0.0;
srcImage = OpenCV::IplImage.load(filenameSrc, 3);
dstImage = OpenCV::IplImage.load(filenameDst, 3);

nr=srcImage.height
nc=srcImage.width
puts "size: height x width = nr x nc = #{nr} x #{nc}"

if srcImage.width!=dstImage.width || srcImage.height!=dstImage.height
  puts "usage: Two images must have same size!"
  return FALSE;
elsif srcImage.channel!=dstImage.channel
  puts "usage:Two images must have same channels\n 1 dimension\n 3 dimension"
  return FALSE;
elsif srcImage.channel==1 || dstImage.channel==1 #若圖片是灰階，直接算totalValue
  for i in 0..nr-1
    for j in 0..nc-1
      s1 = srcImage[i,j][0] # Get image pixel.
      s2 = dstImage[i,j][0]
      sub = s1-s2
      totalValue = totalValue+sub**2
    end
  end
elsif srcImage.channel==3 || dstImage.channel==3 #若圖片是彩色，先轉灰階後，計算totalValue
  srcData = OpenCV::IplImage.new(nr, nc, 1)
  dstData = OpenCV::IplImage.new(nr, nc, 1)
  srcData = srcImage.BGR2GRAY 
  dstData = dstImage.BGR2GRAY 
  for i in 0..nr-1
    for j in 0..nc-1
      s1 = srcData[i,j][0] # Get image pixel.
      s2 = dstData[i,j][0]
#      p "s1: #{s1}; s2: #{s2}"
      sub = s1-s2;
      totalValue = totalValue+sub**2
    end
  end
end
puts "totalValue: #{totalValue}"

if totalValue.abs < 1e-6
    psnr = 0;
else 
    meanValue = totalValue/(nr*nc); # MSE
    puts "meanValue: #{meanValue}"
    psnr = 10*Math.log10((255*255)/meanValue);
end
puts "psnr: #{psnr}dB"
