/bin/cp device/samsung/arubaslim/post_process_props_hook.py build/tools/
chmod  0775 build/tools/post_process_props_hook.py

add_lunch_combo cm_arubaslim-eng
add_lunch_combo cm_arubaslim-userdebug
add_lunch_combo cm_arubaslim-user dist

sh device/samsung/arubaslim/patches/apply.sh
#croot

#rm -rf out/target/product/arubaslim/obj/PACKAGING/target_files_intermediates
#rm -f out/target/product/arubaslim/system/build.prop
#rm -f out/target/product/arubaslim/root/default.prop 

function arubaslim
{
lunch cm_arubaslim-userdebug
make -j4 bacon
}
function arubaslim_select
{
lunch cm_arubaslim-userdebug
make -j4 bacon
}
