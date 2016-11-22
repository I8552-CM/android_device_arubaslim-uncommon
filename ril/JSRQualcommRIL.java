/*
 * Copyright (C) 2014 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.android.internal.telephony;

import static com.android.internal.telephony.RILConstants.*;

import android.content.Context;
import android.os.AsyncResult;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
import android.os.Parcel;
import android.telephony.SmsMessage;
import android.os.SystemProperties;
import android.telephony.Rlog;
import android.telephony.SignalStrength;
import android.text.TextUtils;
import android.util.Log;

import com.android.internal.telephony.RILConstants;
import com.android.internal.telephony.gsm.SmsBroadcastConfigInfo;
import com.android.internal.telephony.gsm.SsData;
import com.android.internal.telephony.cdma.CdmaInformationRecords;

import com.android.internal.telephony.dataconnection.DataCallResponse;
import com.android.internal.telephony.dataconnection.DcFailCause;
import com.android.internal.telephony.dataconnection.DataProfile;

import com.android.internal.telephony.uicc.IccCardApplicationStatus;
import com.android.internal.telephony.uicc.IccCardStatus;

import java.util.ArrayList;


public class JSRQualcommRIL extends RIL implements CommandsInterface {
    boolean RILJ_LOGV = true;
    boolean RILJ_LOGD = true;

    static final int RIL_REQUEST_GET_UICC_SUBSCRIPTION  = 10120;   // deprecated
    static final int RIL_REQUEST_GET_DATA_SUBSCRIPTION  = 10121;   // deprecated
    static final int RIL_REQUEST_SET_SUBSCRIPTION_MODE  = 10122;
    
    protected HandlerThread mIccThread;
    protected String mAid;
    protected boolean mUSIM = false;
    protected String[] mLastDataIface = new String[20];
    boolean skipCdmaSubcription = needsOldRilFeature("skipCdmaSubcription");

    public JSRQualcommRIL(Context context, int networkMode, int cdmaSubscription) {        
        super(context, networkMode, cdmaSubscription);
        mQANElements = 5;
        Rlog.w(RILJ_LOG_TAG, "[JSR] Create JSRQualcommRIL");
    }

    public JSRQualcommRIL(Context context, int networkMode, int cdmaSubscription, Integer instanceId) {
        super(context, networkMode, cdmaSubscription, instanceId);
        mQANElements = 5;
        Rlog.w(RILJ_LOG_TAG, "[JSR] Create JSRQualcommRIL [" + instanceId + "]");
    }

// ------------------------------------------------------------------------------------
 
    public void reqNotSupported(Message result) {
        if (result != null) {
            CommandException ex = new CommandException(CommandException.Error.REQUEST_NOT_SUPPORTED);
            AsyncResult.forMessage(result, null, ex);
            result.sendToTarget();
        }
    }
 
    @Override
    public void getCellInfoList(Message result) {
        if (RILJ_LOGD) riljLog("[JSR] > getCellInfoList [NOT SUPPORTED] RIL_REQUEST_GET_CELL_INFO_LIST");
        reqNotSupported(result);
    }

    @Override
    public void setCellInfoListRate(int rateInMillis, Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > setCellInfoListRate [NOT SUPPORTED] RIL_REQUEST_SET_UNSOL_CELL_INFO_LIST_RATE");
        reqNotSupported(response);
    }

    @Override
    public void setInitialAttachApn(String apn, String protocol, int authType, String username, String password, Message result) {
        if (RILJ_LOGD) riljLog("[JSR] > setInitialAttachApn [NOT SUPPORTED] RIL_REQUEST_SET_INITIAL_ATTACH_APN");
        reqNotSupported(result);
    }

    @Override
    public void nvReadItem(int itemID, Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > nvReadItem [NOT SUPPORTED] RIL_REQUEST_NV_READ_ITEM");
        reqNotSupported(response);
    }

    @Override
    public void nvWriteItem(int itemID, String itemValue, Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > nvWriteItem [NOT SUPPORTED] RIL_REQUEST_NV_WRITE_ITEM");
        reqNotSupported(response);
    }

    @Override
    public void nvWriteCdmaPrl(byte[] preferredRoamingList, Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > nvWriteCdmaPrl [NOT SUPPORTED] RIL_REQUEST_NV_WRITE_CDMA_PRL");
        reqNotSupported(response);
    }

    @Override
    public void nvResetConfig(int resetType, Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > nvResetConfig [NOT SUPPORTED] RIL_REQUEST_NV_RESET_CONFIG");
        reqNotSupported(response);
    }

    @Override
    public void getHardwareConfig (Message result) {
        if (RILJ_LOGD) riljLog("[JSR] > getHardwareConfig [NOT SUPPORTED] RIL_REQUEST_GET_HARDWARE_CONFIG");
        reqNotSupported(result);
    }

    @Override
    public void requestIccSimAuthentication(int authContext, String data, String aid, Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > requestIccSimAuthentication [NOT SUPPORTED] RIL_REQUEST_SIM_AUTHENTICATION");
        reqNotSupported(response);
    }

    @Override
    public void requestShutdown(Message result) {
        if (RILJ_LOGD) riljLog("[JSR] > requestShutdown [NOT SUPPORTED] RIL_REQUEST_SHUTDOWN");
        reqNotSupported(result);
    }

    @Override
    public void startLceService(int reportIntervalMs, boolean pullMode, Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > startLceService [NOT SUPPORTED] RIL_REQUEST_START_LCE");
        reqNotSupported(response);
    }

    @Override
    public void stopLceService(Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > stopLceService [NOT SUPPORTED] RIL_REQUEST_STOP_LCE");
        reqNotSupported(response);
    }

    @Override
    public void pullLceData(Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > pullLceData [NOT SUPPORTED] RIL_REQUEST_PULL_LCEDATA");
        reqNotSupported(response);
    }

// ------------------------------------------------------------------------------------

    @Override
    public void getRadioCapability(Message response) {
        if (RILJ_LOGD) riljLog("[JSR] > getRadioCapability [NOT SUPPORTED] RIL_REQUEST_GET_RADIO_CAPABILITY");
        if (response != null) {
            String rafString = mContext.getResources().getString(com.android.internal.R.string.config_radio_access_family);
            riljLog("getRadioCapability: returning static radio capability <" + rafString + ">");
            Object ret = makeStaticRadioCapability();
            AsyncResult.forMessage(response, ret, null);
            response.sendToTarget();
        }
    }

    protected Object
    responseFailCause(Parcel p) {
        int numInts;
        int response[];

        numInts = p.readInt();
        response = new int[numInts];
        for (int i = 0 ; i < numInts ; i++) {
            response[i] = p.readInt();
        }
        LastCallFailCause failCause = new LastCallFailCause();
        failCause.causeCode = response[0];
        if (p.dataAvail() > 0) {
          failCause.vendorCause = p.readString();
        }
        return failCause;
    }

// ------------------------------------------------------------------------------------

    @Override public void
    supplyIccPin2(String pin, Message result) {
        supplyIccPin2ForApp(pin, mAid, result);
    }

    @Override public void
    changeIccPin2(String oldPin2, String newPin2, Message result) {
        changeIccPin2ForApp(oldPin2, newPin2, mAid, result);
    }

    @Override public void
    supplyIccPuk(String puk, String newPin, Message result) {
        supplyIccPukForApp(puk, newPin, mAid, result);
    }

    @Override public void
    supplyIccPuk2(String puk2, String newPin2, Message result) {
        supplyIccPuk2ForApp(puk2, newPin2, mAid, result);
    }

    @Override
    public void
    queryFacilityLock(String facility, String password, int serviceClass, Message response) {
        queryFacilityLockForApp(facility, password, serviceClass, mAid, response);
    }

    @Override
    public void
    setFacilityLock (String facility, boolean lockState, String password, int serviceClass, Message response) {
        setFacilityLockForApp(facility, lockState, password, serviceClass, mAid, response);
    }

    @Override
    public void
    getIMSI(Message result) {
        RILRequest rr = RILRequest.obtain(RIL_REQUEST_GET_IMSI, result);

        rr.mParcel.writeInt(1);
        rr.mParcel.writeString(mAid);

        if (RILJ_LOGD) riljLog(rr.serialString() +
                              "> getIMSI:RIL_REQUEST_GET_IMSI " +
                              RIL_REQUEST_GET_IMSI +
                              " aid: " + mAid +
                              " " + requestToString(rr.mRequest));

        send(rr);
    }

    @Override
    public void
    setNetworkSelectionModeManual(String operatorNumeric, Message response) {
        RILRequest rr = RILRequest.obtain(RIL_REQUEST_SET_NETWORK_SELECTION_MANUAL, response);

        if (RILJ_LOGD) riljLog(rr.serialString() + "> " + requestToString(rr.mRequest) + " " + operatorNumeric);

        rr.mParcel.writeInt(2);
        rr.mParcel.writeString(operatorNumeric);
        rr.mParcel.writeString("NOCHANGE");

        send(rr);
    }
    
    @Override
    public void
    iccIO (int command, int fileid, String path, int p1, int p2, int p3,
            String data, String pin2, Message result) {
        iccIOForApp(command, fileid, path, p1, p2, p3, data, pin2, mAid, result);
    }

    @Override
    protected Object
    responseIccCardStatus(Parcel p) {
        IccCardApplicationStatus appStatus;

        int cardState = p.readInt(); 
        // Standard stack doesn't recognize REMOVED and SIM_DETECT_INSERTED,
        // so convert them to ABSENT and PRESENT to trigger the hot-swapping check 
        if (cardState > 2)
            cardState -= 3;

        IccCardStatus cardStatus = new IccCardStatus();
        cardStatus.setCardState(cardState);
        cardStatus.setUniversalPinState(p.readInt());
        cardStatus.mGsmUmtsSubscriptionAppIndex = p.readInt();
        cardStatus.mCdmaSubscriptionAppIndex = p.readInt();
        cardStatus.mImsSubscriptionAppIndex = p.readInt();

        int numApplications = p.readInt();
        // limit to maximum allowed applications
        if (numApplications > IccCardStatus.CARD_MAX_APPS) {
            numApplications = IccCardStatus.CARD_MAX_APPS;
        }
        cardStatus.mApplications = new IccCardApplicationStatus[numApplications];

        for (int i = 0; i < numApplications; i++) {
            appStatus = new IccCardApplicationStatus();
            appStatus.app_type = appStatus.AppTypeFromRILInt(p.readInt());
            appStatus.app_state = appStatus.AppStateFromRILInt(p.readInt());
            appStatus.perso_substate = appStatus.PersoSubstateFromRILInt(p.readInt());
            appStatus.aid = p.readString();
            appStatus.app_label = p.readString();
            appStatus.pin1_replaced = p.readInt();
            appStatus.pin1 = appStatus.PinStateFromRILInt(p.readInt());
            if (!needsOldRilFeature("skippinpukcount")) {
                p.readInt(); //remaining_count_pin1
                p.readInt(); //remaining_count_puk1
            }
            appStatus.pin2 = appStatus.PinStateFromRILInt(p.readInt());
            if (!needsOldRilFeature("skippinpukcount")) {
                p.readInt(); //remaining_count_pin2
                p.readInt(); //remaining_count_puk2
            }
            cardStatus.mApplications[i] = appStatus;
        }
        int appIndex = -1;
        if (mPhoneType == RILConstants.CDMA_PHONE && !skipCdmaSubcription) {
            appIndex = cardStatus.mCdmaSubscriptionAppIndex;
            Rlog.w(RILJ_LOG_TAG, "[JSR] This is a CDMA PHONE " + appIndex);
        } else {
            appIndex = cardStatus.mGsmUmtsSubscriptionAppIndex;
            Rlog.w(RILJ_LOG_TAG, "[JSR] This is a GSM PHONE " + appIndex);
        }
        
        if (cardState == RILConstants.SIM_ABSENT)
            return cardStatus;

        if (appIndex >= 0 && numApplications > 0) {
            IccCardApplicationStatus application = cardStatus.mApplications[appIndex];
            mAid = application.aid;
            mUSIM = (application.app_type == IccCardApplicationStatus.AppType.APPTYPE_USIM);

            if (TextUtils.isEmpty(mAid))
               mAid = "";
            Rlog.w(RILJ_LOG_TAG, "mAid = '" + mAid + "'");
        }

        return cardStatus;
    }

}

