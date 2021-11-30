.class public Lcom/elite/IntentServiceClass;
.super Landroid/app/Service;
.source "IntentServiceClass.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/elite/IntentServiceClass$mainTask;
    }
.end annotation


# static fields
.field private static timer:Ljava/util/Timer;


# instance fields
.field private context:Landroid/content/Context;

.field private final toastHandler:Landroid/os/Handler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    sput-object v0, Lcom/elite/IntentServiceClass;->timer:Ljava/util/Timer;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 54
    new-instance v0, Lcom/elite/IntentServiceClass$1;

    invoke-direct {v0, p0}, Lcom/elite/IntentServiceClass$1;-><init>(Lcom/elite/IntentServiceClass;)V

    iput-object v0, p0, Lcom/elite/IntentServiceClass;->toastHandler:Landroid/os/Handler;

    .line 24
    return-void
.end method

.method static synthetic access$0(Lcom/elite/IntentServiceClass;)Landroid/content/Context;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/elite/IntentServiceClass;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1(Lcom/elite/IntentServiceClass;)Landroid/os/Handler;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/elite/IntentServiceClass;->toastHandler:Landroid/os/Handler;

    return-object v0
.end method

.method private startService()V
    .locals 6

    .prologue
    .line 41
    sget-object v0, Lcom/elite/IntentServiceClass;->timer:Ljava/util/Timer;

    new-instance v1, Lcom/elite/IntentServiceClass$mainTask;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/elite/IntentServiceClass$mainTask;-><init>(Lcom/elite/IntentServiceClass;Lcom/elite/IntentServiceClass$mainTask;)V

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x1f4

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 42
    iput-object p0, p0, Lcom/elite/IntentServiceClass;->context:Landroid/content/Context;

    .line 43
    return-void
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 28
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 0

    .prologue
    .line 33
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 34
    invoke-direct {p0}, Lcom/elite/IntentServiceClass;->startService()V

    .line 35
    return-void
.end method
