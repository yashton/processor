#! bash
for image in `ls *.png`
do
	paletteFile=$image."palette.txt";
#	python2 palette.py $image > $paletteFile;
	convert -crop 8x8 $image out;

	for tile in `ls out*`
	do
		rawFile="tmp-raw.dat";
		rgbdatFile="tmp-rgb.dat";
		finalFile=$image.$tile"-.dat";
		stream -map rgb -storage-type char $tile $rawFile; 
		/cygdrive/c/Python31/python dat2ascii.py $rawFile > $rgbdatFile;
		/cygdrive/c/Python31/python rgb2index.py $rgbdatFile $paletteFile > $finalFile;
	done
	cat `ls $image."out-"* | sort -t\- -n +1 -2` > $image."dat"
	rm tmp*;
	rm out*;
done
