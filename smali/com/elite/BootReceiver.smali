.class public Lcom/elite/BootReceiver;
.super Landroid/content/BroadcastReceiver;
.source "BootReceiver.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 13
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "arg1"    # Landroid/content/Intent;

    .prologue
    .line 17
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/elite/IntentServiceClass;

    invoke-direct {v1, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 18
    .local v1, "msgIntent":Landroid/content/Intent;
    invoke-virtual {p1, v1}, Landroid/content/Context;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 20
    new-instance v0, Lcom/elite/AlarmManagerTXTShield;

    invoke-direct {v0}, Lcom/elite/AlarmManagerTXTShield;-><init>()V

    .line 21
    .local v0, "alarmManager":Lcom/elite/AlarmManagerTXTShield;
    invoke-virtual {v0, p1}, Lcom/elite/AlarmManagerTXTShield;->setAlarm(Landroid/content/Context;)V

    .line 22
    return-void
.end method
