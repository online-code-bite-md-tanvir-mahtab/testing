.class public Lcom/elite/LockScreen;
.super Landroid/app/Activity;
.source "LockScreen.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 15
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 16
    const/high16 v0, 0x7f040000

    const v1, 0x7f040001

    invoke-virtual {p0, v0, v1}, Lcom/elite/LockScreen;->overridePendingTransition(II)V

    .line 17
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/elite/LockScreen;->setContentView(I)V

    .line 18
    return-void
.end method
