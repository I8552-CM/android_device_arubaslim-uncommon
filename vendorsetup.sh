/bin/cp device/samsung/delos3geur/post_process_props_hook.py build/tools/
chmod  0775 build/tools/post_process_props_hook.py

add_lunch_combo cm_delos3geur-eng
add_lunch_combo cm_delos3geur-userdebug
add_lunch_combo cm_delos3geur-user dist

sh device/samsung/delos3geur/patches/apply.sh
#croot

#rm -rf out/target/product/delos3geur/obj/PACKAGING/target_files_intermediates
#rm -f out/target/product/delos3geur/system/build.prop
#rm -f out/target/product/delos3geur/root/default.prop 

function delos3geur
{
lunch cm_delos3geur-userdebug
make -j4 bacon
}
function delos3geur_select
{
lunch cm_delos3geur-userdebug
make -j4 bacon
}
