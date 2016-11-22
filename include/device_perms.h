
#ifndef PROPERTY_PERMS_APPEND
#define PROPERTY_PERMS_APPEND \
    { "persist.storages.", AID_SYSTEM,   0 }, \
    { "persist.zram.",     AID_SYSTEM,   0 },
#endif

#ifndef CONTROL_PERMS_APPEND
#define CONTROL_PERMS_APPEND \
    { "ril-daemon1", AID_RADIO, AID_RADIO }, \
    { "ril-daemon2", AID_RADIO, AID_RADIO },
#endif
