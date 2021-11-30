.class public Lcom/elite/DeviceManager;
.super Ljava/lang/Object;
.source "DeviceManager.java"


# static fields
.field public static final REQUEST_CODE_ENABLE_ADMIN:I = 0x3e8

.field public static isActive:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-boolean v0, Lcom/elite/DeviceManager;->isActive:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public activateDeviceAdmin(Landroid/app/Activity;I)V
    .locals 6
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "resultCode"    # I

    .prologue
    .line 23
    :try_start_0
    new-instance v0, Landroid/content/ComponentName;

    const-class v3, Lcom/elite/AdminReciever;

    invoke-direct {v0, p1, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    .local v0, "comp":Landroid/content/ComponentName;
    new-instance v2, Landroid/content/Intent;

    const-string v3, "android.app.action.ADD_DEVICE_ADMIN"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 25
    .local v2, "intent":Landroid/content/Intent;
    const-string v3, "android.app.extra.DEVICE_ADMIN"

    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 26
    const-string v3, "android.app.extra.ADD_EXPLANATION"

    invoke-virtual {p1}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const v5, 0x7f080004

    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/CharSequence;)Landroid/content/Intent;

    .line 27
    const/high16 v3, 0x40000000    # 2.0f

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 28
    invoke-virtual {p1, v2, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .end local v0    # "comp":Landroid/content/ComponentName;
    .end local v2    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 29
    :catch_0
    move-exception v1

    .line 30
    .local v1, "e":Ljava/lang/Exception;
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public deactivateDeviceAdmin(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 39
    :try_start_0
    new-instance v0, Landroid/content/ComponentName;

    const-class v3, Lcom/elite/AdminReciever;

    invoke-direct {v0, p1, v3}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    .local v0, "comp":Landroid/content/ComponentName;
    const-string v3, "device_policy"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/DevicePolicyManager;

    .line 41
    .local v1, "devicePolicyManager":Landroid/app/admin/DevicePolicyManager;
    invoke-virtual {v1, v0}, Landroid/app/admin/DevicePolicyManager;->removeActiveAdmin(Landroid/content/ComponentName;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .end local v0    # "comp":Landroid/content/ComponentName;
    .end local v1    # "devicePolicyManager":Landroid/app/admin/DevicePolicyManager;
    :goto_0
    return-void

    .line 42
    :catch_0
    move-exception v2

    .line 43
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public isDeviceAdminActive(Landroid/content/Context;)Z
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 52
    const/4 v3, 0x0

    .line 54
    .local v3, "flag":Z
    :try_start_0
    const-string v4, "device_policy"

    invoke-virtual {p1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/admin/DevicePolicyManager;

    .line 55
    .local v1, "devicePolicyManager":Landroid/app/admin/DevicePolicyManager;
    new-instance v0, Lcom/elite/AdminReciever;

    invoke-direct {v0}, Lcom/elite/AdminReciever;-><init>()V

    .line 56
    .local v0, "adminReciver":Lcom/elite/AdminReciever;
    invoke-virtual {v0, p1}, Lcom/elite/AdminReciever;->getWho(Landroid/content/Context;)Landroid/content/ComponentName;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/admin/DevicePolicyManager;->isAdminActive(Landroid/content/ComponentName;)Z

    move-result v3

    .line 57
    sput-boolean v3, Lcom/elite/DeviceManager;->isActive:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .end local v0    # "adminReciver":Lcom/elite/AdminReciever;
    .end local v1    # "devicePolicyManager":Landroid/app/admin/DevicePolicyManager;
    :goto_0
    return v3

    .line 58
    :catch_0
    move-exception v2

    .line 59
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
