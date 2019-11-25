function FinalImage = loadTiffFast(path)
FileTif = path;
InfoImage = imfinfo(FileTif);
mImage = InfoImage(1).Width;
nImage = InfoImage(1).Height;
NumberImages = length(InfoImage);
FinalImage = zeros(nImage,mImage,NumberImages,'uint16');
t = Tiff(FileTif, 'r');
rps = getTag(t,Tiff.TagID.RowsPerStrip);
 
for i = 1:NumberImages
   setDirectory(t,i);
   % Go through each strip of data.
   rps = min(rps, nImage);
   for r = 1:rps:nImage
      row_inds = r:min(nImage, r+rps-1);
      stripNum = computeStrip(t,r);
      FinalImage(row_inds,:,i) = readEncodedStrip(t,stripNum);
   end
end
close(t);