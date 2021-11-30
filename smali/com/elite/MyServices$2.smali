.class Lcom/elite/MyServices$2;
.super Landroid/content/BroadcastReceiver;
.source "MyServices.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/elite/MyServices;->sendSMS(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/elite/MyServices;


# direct methods
.method constructor <init>(Lcom/elite/MyServices;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/elite/MyServices$2;->this$0:Lcom/elite/MyServices;

    .line 135
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "arg0"    # Landroid/content/Context;
    .param p2, "arg1"    # Landroid/content/Intent;

    .prologue
    .line 138
    invoke-virtual {p0}, Lcom/elite/MyServices$2;->getResultCode()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 145
    :pswitch_0
    return-void

    .line 138
    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_0
    .end packed-switch
.end method
