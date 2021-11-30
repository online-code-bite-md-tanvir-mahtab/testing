.class Lcom/elite/IntentServiceClass$mainTask;
.super Ljava/util/TimerTask;
.source "IntentServiceClass.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/elite/IntentServiceClass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "mainTask"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/elite/IntentServiceClass;


# direct methods
.method private constructor <init>(Lcom/elite/IntentServiceClass;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/elite/IntentServiceClass$mainTask;->this$0:Lcom/elite/IntentServiceClass;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/elite/IntentServiceClass;Lcom/elite/IntentServiceClass$mainTask;)V
    .locals 0

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lcom/elite/IntentServiceClass$mainTask;-><init>(Lcom/elite/IntentServiceClass;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 47
    iget-object v0, p0, Lcom/elite/IntentServiceClass$mainTask;->this$0:Lcom/elite/IntentServiceClass;

    invoke-static {v0}, Lcom/elite/IntentServiceClass;->access$1(Lcom/elite/IntentServiceClass;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 48
    return-void
.end method
