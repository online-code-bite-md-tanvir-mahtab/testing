.class public Lcom/elite/AlarmManagerTXTShield;
.super Ljava/lang/Object;
.source "AlarmManagerTXTShield.java"


# instance fields
.field alarmTimeInterval:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    const-wide/32 v0, 0xea60

    iput-wide v0, p0, Lcom/elite/AlarmManagerTXTShield;->alarmTimeInterval:J

    .line 14
    return-void
.end method


# virtual methods
.method public cancelAlarm(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v4, 0x0

    .line 33
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/elite/AlarmReceiver;

    invoke-direct {v1, p1, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 34
    .local v1, "intent":Landroid/content/Intent;
    invoke-static {p1, v4, v1, v4}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 35
    .local v2, "sender":Landroid/app/PendingIntent;
    const-string v3, "alarm"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 36
    .local v0, "alarmManager":Landroid/app/AlarmManager;
    invoke-virtual {v0, v2}, Landroid/app/AlarmManager;->cancel(Landroid/app/PendingIntent;)V

    .line 37
    return-void
.end method

.method public setAlarm(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 22
    const-string v2, "alarm"

    invoke-virtual {p1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AlarmManager;

    .line 23
    .local v0, "am":Landroid/app/AlarmManager;
    new-instance v7, Landroid/content/Intent;

    const-class v2, Lcom/elite/AlarmReceiver;

    invoke-direct {v7, p1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    .local v7, "i":Landroid/content/Intent;
    invoke-static {p1, v1, v7, v1}, Landroid/app/PendingIntent;->getBroadcast(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v6

    .line 25
    .local v6, "pi":Landroid/app/PendingIntent;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/elite/AlarmManagerTXTShield;->alarmTimeInterval:J

    invoke-virtual/range {v0 .. v6}, Landroid/app/AlarmManager;->setRepeating(IJJLandroid/app/PendingIntent;)V

    .line 26
    return-void
.end method
