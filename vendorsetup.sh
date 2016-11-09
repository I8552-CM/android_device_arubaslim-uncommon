add_lunch_combo carbon_arubaslim-userdebug
sh device/samsung/arubaslim/patches/apply.sh

sh device/samsung/arubaslim/update-icu.sh
croot
function arubaslim 
{
lunch carbon_arubaslim-userdebug
make -j4 otapackage
}
