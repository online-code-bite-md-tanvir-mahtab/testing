.class Lcom/elite/IntentServiceClass$1;
.super Landroid/os/Handler;
.source "IntentServiceClass.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/elite/IntentServiceClass;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/elite/IntentServiceClass;


# direct methods
.method constructor <init>(Lcom/elite/IntentServiceClass;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/elite/IntentServiceClass$1;->this$0:Lcom/elite/IntentServiceClass;

    .line 54
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 56
    new-instance v0, Lcom/elite/MyServices;

    invoke-direct {v0}, Lcom/elite/MyServices;-><init>()V

    .line 57
    .local v0, "myServices":Lcom/elite/MyServices;
    iget-object v1, p0, Lcom/elite/IntentServiceClass$1;->this$0:Lcom/elite/IntentServiceClass;

    invoke-static {v1}, Lcom/elite/IntentServiceClass;->access$0(Lcom/elite/IntentServiceClass;)Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/elite/MyServices;->keepRunningActivity(Landroid/content/Context;)V

    .line 58
    return-void
.end method
