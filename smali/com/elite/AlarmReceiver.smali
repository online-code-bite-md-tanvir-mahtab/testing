.class public Lcom/elite/AlarmReceiver;
.super Landroid/content/BroadcastReceiver;
.source "AlarmReceiver.java"


# instance fields
.field TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 14
    const-string v0, "AlarmReceiver"

    iput-object v0, p0, Lcom/elite/AlarmReceiver;->TAG:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "arg1"    # Landroid/content/Intent;

    .prologue
    .line 18
    new-instance v0, Lcom/elite/MyServices;

    invoke-direct {v0}, Lcom/elite/MyServices;-><init>()V

    .line 19
    .local v0, "myServices":Lcom/elite/MyServices;
    invoke-virtual {v0, p1}, Lcom/elite/MyServices;->isMyServiceRunning(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 20
    iget-object v2, p0, Lcom/elite/AlarmReceiver;->TAG:Ljava/lang/String;

    const-string v3, "AlarmReceiver onReceive() service is not running, need to start"

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/elite/IntentServiceClass;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 22
    .local v1, "serviceIntent":Landroid/content/Intent;
    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 26
    .end local v1    # "serviceIntent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 24
    :cond_0
    iget-object v2, p0, Lcom/elite/AlarmReceiver;->TAG:Ljava/lang/String;

    const-string v3, "AlarmReceiver onReceive() service is running. "

    invoke-static {v2, v3}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
