# Stop if anything goes wrong, and show what we're doing. (This script is slow.)
#set -e
#set -x

# TODO: extract this from the .dat file's name.
ICU_VERSION=51

ANDROID_BUILD_TOP=`pwd`
ICU_BIN=$ANDROID_BUILD_TOP/prebuilts/misc/linux-x86_64/icu-$ICU_VERSION
ICU4C_DIR=$ANDROID_BUILD_TOP/external/icu4c
ICU_DAT=$ICU4C_DIR/stubdata/icudt${ICU_VERSION}l-all.dat
DATA_DIR=$ANDROID_BUILD_TOP/device/samsung/delos3geur/icu
TEMP_DIR=$ANDROID_BUILD_TOP/device/samsung/delos3geur/_tmp

if grep -q "Belarus Standard Time" $ICU_DAT
then
    echo '[icu4c] icudt51l-all.dat already patched';
else
    echo '[icu4c] icudt51l-all.dat patching ...';

# Make a temporary directory.
rm -rf $TEMP_DIR
mkdir $TEMP_DIR

# TODO: expand this to more than just the curr and region files.
data_kinds=""

cd $TEMP_DIR
for locale in *.txt ; do
  $ICU_BIN/genrb -d $TEMP_DIR $DATA_DIR/$locale		
done

if [ -n "$data_kinds" ]; then
	for data_kind in $data_kinds ; do
		mkdir $TEMP_DIR/$data_kind
		cd $DATA_DIR/$data_kind
		for locale in *.txt ; do
			$ICU_BIN/genrb -d $TEMP_DIR/$data_kind $DATA_DIR/$data_kind/$locale		
		done
	done
fi

# Create a copy of the .dat file that uses the new .res files.
cp $ICU_DAT $TEMP_DIR/icudt${ICU_VERSION}l.dat
cd $TEMP_DIR

for res in *.res ; do
  $ICU_BIN/icupkg -a $res icudt${ICU_VERSION}l.dat
done

if [ -n "$data_kinds" ]; then
	for data_kind in $data_kinds ; do
		for res in $data_kind/*.res ; do
			$ICU_BIN/icupkg -a $res icudt${ICU_VERSION}l.dat
		done
	done
fi

# Make the modified .dat file the canonical copy.
mv $TEMP_DIR/icudt${ICU_VERSION}l.dat $ICU_DAT

fi
