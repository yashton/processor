#! bash
for image in `ls *.png`
do
	paletteFile=$image."palette.txt";
	python2 palette.py $image > $paletteFile;
	convert -crop 8x8 $image out;

	for tile in `ls out*`
	do
		rawFile="tmp-raw.dat";
		rgbdatFile="tmp-rgb.dat";
		finalFile=$image.$tile."dat";
		stream -map rgb -storage-type char $tile $rawFile; 
		python3 dat2ascii.py $rawFile > $rgbdatFile;
		python3 rgb2index.py $rgbdatFile $paletteFile > $finalFile;
	done
	rm tmp*;
	rm out*;
done
