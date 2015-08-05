class MessagesController < ApplicationController
  def index
    #Messageを全て取得する
    @messages = Message.all
    @message = Message.new
  end
  
  ##ここから追記
   def create
    @message = Message.new(message_params)
    if @message.save
        redirect_to root_path , notice: 'メッセージを保存しました'
    else
        #メッセージが保存できなかった場合
        @messages = Message.all
        flash.now[:alert] = "メッセージの保存に失敗しました。"
        render 'index'
    end
  end

  
  # ここから下はprivateメソッドとなる
  private
  def message_params
    # params[:message]のパラメータで name , bodyのみを許可する。
    # 返り値は ex:) {name: "入力されたname" , body: "入力されたbody" }
     params.require(:message).permit(:name, :body)
  end
  ##ここまで
end