.class public Lcom/elite/UninstallAdminDevice;
.super Landroid/app/Activity;
.source "UninstallAdminDevice.java"


# instance fields
.field private final UNINSTALL_PACKAGE_EXISTED:I

.field private final UNINSTALL_PACKAGE_EXISTED_PWD:I

.field isCallfromPasswordScreen:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 14
    const/16 v0, 0x138a

    iput v0, p0, Lcom/elite/UninstallAdminDevice;->UNINSTALL_PACKAGE_EXISTED:I

    .line 15
    const/16 v0, 0x138c

    iput v0, p0, Lcom/elite/UninstallAdminDevice;->UNINSTALL_PACKAGE_EXISTED_PWD:I

    .line 12
    return-void
.end method


# virtual methods
.method public AdminSettingCheckPackageExisted(Ljava/lang/String;)V
    .locals 6
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 31
    :try_start_0
    iget-boolean v4, p0, Lcom/elite/UninstallAdminDevice;->isCallfromPasswordScreen:Z

    if-nez v4, :cond_0

    .line 32
    new-instance v0, Lcom/elite/DeviceManager;

    invoke-direct {v0}, Lcom/elite/DeviceManager;-><init>()V

    .line 33
    .local v0, "deviceManager":Lcom/elite/DeviceManager;
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/elite/DeviceManager;->isDeviceAdminActive(Landroid/content/Context;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 34
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/elite/DeviceManager;->deactivateDeviceAdmin(Landroid/content/Context;)V

    .line 37
    .end local v0    # "deviceManager":Lcom/elite/DeviceManager;
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "package:"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 38
    .local v2, "packageURI":Landroid/net/Uri;
    new-instance v3, Landroid/content/Intent;

    const-string v4, "android.intent.action.DELETE"

    invoke-direct {v3, v4, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 39
    .local v3, "uninstallIntent":Landroid/content/Intent;
    iget-boolean v4, p0, Lcom/elite/UninstallAdminDevice;->isCallfromPasswordScreen:Z

    if-nez v4, :cond_1

    .line 40
    const/16 v4, 0x138a

    invoke-virtual {p0, v3, v4}, Lcom/elite/UninstallAdminDevice;->startActivityForResult(Landroid/content/Intent;I)V

    .line 48
    .end local v2    # "packageURI":Landroid/net/Uri;
    .end local v3    # "uninstallIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 43
    .restart local v2    # "packageURI":Landroid/net/Uri;
    .restart local v3    # "uninstallIntent":Landroid/content/Intent;
    :cond_1
    const/16 v4, 0x138c

    invoke-virtual {p0, v3, v4}, Lcom/elite/UninstallAdminDevice;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 44
    .end local v2    # "packageURI":Landroid/net/Uri;
    .end local v3    # "uninstallIntent":Landroid/content/Intent;
    :catch_0
    move-exception v1

    .line 45
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public checkAdminPermission()V
    .locals 2

    .prologue
    .line 76
    new-instance v0, Lcom/elite/DeviceManager;

    invoke-direct {v0}, Lcom/elite/DeviceManager;-><init>()V

    .line 77
    .local v0, "deviceManager":Lcom/elite/DeviceManager;
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/elite/DeviceManager;->isDeviceAdminActive(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 78
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->showAdminSetting()V

    .line 84
    :goto_0
    return-void

    .line 82
    :cond_0
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->finish()V

    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 52
    sparse-switch p1, :sswitch_data_0

    .line 70
    :goto_0
    return-void

    .line 55
    :sswitch_0
    new-instance v0, Lcom/elite/DeviceManager;

    invoke-direct {v0}, Lcom/elite/DeviceManager;-><init>()V

    .line 56
    .local v0, "deviceManager":Lcom/elite/DeviceManager;
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/elite/DeviceManager;->isDeviceAdminActive(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 57
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f080005

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 61
    :cond_0
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->checkAdminPermission()V

    goto :goto_0

    .line 64
    .end local v0    # "deviceManager":Lcom/elite/DeviceManager;
    :sswitch_1
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->checkAdminPermission()V

    goto :goto_0

    .line 67
    :sswitch_2
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->finish()V

    .line 68
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    goto :goto_0

    .line 52
    nop

    :sswitch_data_0
    .sparse-switch
        0x3e8 -> :sswitch_0
        0x138a -> :sswitch_1
        0x138c -> :sswitch_2
    .end sparse-switch
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 19
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 20
    const v1, 0x7f030002

    invoke-virtual {p0, v1}, Lcom/elite/UninstallAdminDevice;->setContentView(I)V

    .line 21
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 22
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "isCallfromPasswordScreen"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    iput-boolean v1, p0, Lcom/elite/UninstallAdminDevice;->isCallfromPasswordScreen:Z

    .line 23
    invoke-virtual {p0}, Lcom/elite/UninstallAdminDevice;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/elite/UninstallAdminDevice;->AdminSettingCheckPackageExisted(Ljava/lang/String;)V

    .line 24
    return-void
.end method

.method public showAdminSetting()V
    .locals 3

    .prologue
    .line 91
    :try_start_0
    new-instance v0, Lcom/elite/DeviceManager;

    invoke-direct {v0}, Lcom/elite/DeviceManager;-><init>()V

    .line 92
    .local v0, "deviceManager":Lcom/elite/DeviceManager;
    const/16 v2, 0x3e8

    invoke-virtual {v0, p0, v2}, Lcom/elite/DeviceManager;->activateDeviceAdmin(Landroid/app/Activity;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .end local v0    # "deviceManager":Lcom/elite/DeviceManager;
    :goto_0
    return-void

    .line 93
    :catch_0
    move-exception v1

    .line 94
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
