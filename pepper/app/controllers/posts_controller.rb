class PostsController < ApplicationController

  require 'line/bot'
  protect_from_forgery :except => [:callback]

  def client
    @client ||= Line::Bot::Client.new { |config|
      config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
      config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
    }
  end

  def callback
    puts params[:events][0][:message][:text]
    post = Post.new
    post.name = params[:events][0][:message][:text]
    post.save
    body = request.body.read

    signature = request.env['HTTP_X_LINE_SIGNATURE']
    unless client.validate_signature(body, signature)
      head :bad_request
    end

    events = client.parse_events_from(body)

    events.each { |event|
      case event
      when Line::Bot::Event::Message
        case event.type
        when Line::Bot::Event::MessageType::Text
          message = {
            type: 'text',
            text: event.message['text']
          }
          client.reply_message(event['replyToken'], message)
        end
      end
    }
    head :ok
  end

  def index
    @post = Post.new
    @posts = Post.all
  end

  def search
     if params[:choice] == "true"
       @posts = Post.where(:choice => true)
     elsif params[:choice] == "false"
       @posts = Post.where(:choice => false)
     end
       @post = Post.new
       render :index
   end

  def show
    @post = Post.find(params[:id])
    @post_new = Post.new
    @comment = Comment.new
    @comments = @post.comments
  end

  def create
    @post = Post.new(post_params)
    @post.genre_id = params[:post][:genre_id]
    @post.choice = params[:post][:choice]
    @post.user_id = current_user.id
    if @post.save!
      redirect_to post_path(@post.id)
    else
      render "index"
    end
  end

  def destroy
  end

  def update
  end

  def edit
  end

  def new
  end

  private
  def post_params
    params.require(:post).permit(:title, :body ,:choice)
  end
end
