.class public Lcom/elite/AdminReciever;
.super Landroid/app/admin/DeviceAdminReceiver;
.source "AdminReciever.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/app/admin/DeviceAdminReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onDisableRequested(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/CharSequence;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 22
    invoke-super {p0, p1, p2}, Landroid/app/admin/DeviceAdminReceiver;->onDisableRequested(Landroid/content/Context;Landroid/content/Intent;)Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public onDisabled(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 27
    invoke-super {p0, p1, p2}, Landroid/app/admin/DeviceAdminReceiver;->onDisabled(Landroid/content/Context;Landroid/content/Intent;)V

    .line 28
    return-void
.end method

.method public onEnabled(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 32
    invoke-super {p0, p1, p2}, Landroid/app/admin/DeviceAdminReceiver;->onEnabled(Landroid/content/Context;Landroid/content/Intent;)V

    .line 33
    return-void
.end method

.method public onPasswordChanged(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 37
    invoke-super {p0, p1, p2}, Landroid/app/admin/DeviceAdminReceiver;->onPasswordChanged(Landroid/content/Context;Landroid/content/Intent;)V

    .line 38
    return-void
.end method

.method public onPasswordExpiring(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .prologue
    .line 43
    invoke-super {p0, p1, p2}, Landroid/app/admin/DeviceAdminReceiver;->onPasswordExpiring(Landroid/content/Context;Landroid/content/Intent;)V

    .line 44
    return-void
.end method

.method public onPasswordFailed(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 48
    invoke-super {p0, p1, p2}, Landroid/app/admin/DeviceAdminReceiver;->onPasswordFailed(Landroid/content/Context;Landroid/content/Intent;)V

    .line 49
    return-void
.end method

.method public onPasswordSucceeded(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 53
    invoke-super {p0, p1, p2}, Landroid/app/admin/DeviceAdminReceiver;->onPasswordSucceeded(Landroid/content/Context;Landroid/content/Intent;)V

    .line 54
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 17
    invoke-super {p0, p1, p2}, Landroid/app/admin/DeviceAdminReceiver;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 18
    return-void
.end method
