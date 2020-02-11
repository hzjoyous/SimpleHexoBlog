{%- if page.comments %}
  {%- if theme.injects.comment.length == 1 %}
    {%- set inject_item = theme.injects.comment[0] %}
    {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
  {%- elif theme.injects.comment.length > 1 %}
    {%- if theme.comments.style == 'buttons' %}
      <div class="comment-button-group">
        {%- for inject_item in theme.injects.comment %}
          <a class="btn comment-button {{ inject_item.locals.class }}">{{ inject_item.locals.button }}</a>
        {%- endfor %}
      </div>
      {%- for inject_item in theme.injects.comment %}
        <div class="comment-position {{ inject_item.locals.class }}">
          {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
        </div>
      {%- endfor %}
      <script{{ pjax }}>
        (function() {
          let commentButton = document.querySelectorAll('.comment-button');
            commentButton.forEach(element => {
            let commentClass = element.classList[2];
            element.addEventListener('click', () => {
              commentButton.forEach(rmActive => rmActive.classList.remove('active'));
              element.classList.add('active');
              document.querySelectorAll('.comment-position').forEach(rmActive => rmActive.classList.remove('active'));
              document.querySelector(`.comment-position.${commentClass}`).classList.add('active');
              if (CONFIG.comments.storage) {
                localStorage.setItem('comments_active', commentClass);
              }
            });
          });
          let activeClass = CONFIG.comments.activeClass;
          if (CONFIG.comments.storage) {
            activeClass = localStorage.getItem('comments_active') || activeClass;
          }
          if (activeClass) {
            let activeButton = document.querySelector(`.comment-button.${activeClass}`);
            if (activeButton) {
              activeButton.click();
            }
          }
        })();
      </script>
    {%- elif theme.comments.style == 'tabs' %}
      <div class="tabs tabs-comment">
        <ul class="nav-tabs">
          {%- for inject_item in theme.injects.comment %}
            <li class="tab"><a href="#comment-{{ inject_item.locals.class }}">{{ inject_item.locals.button }}</a></li>
          {%- endfor %}
        </ul>
        <div class="tab-content">
          {%- for inject_item in theme.injects.comment %}
            <div class="tab-pane {{ inject_item.locals.class }}" id="comment-{{ inject_item.locals.class }}">
              {{ partial(inject_item.layout, inject_item.locals, inject_item.options) }}
            </div>
          {%- endfor %}
        </div>
      </div>
    {%- endif %}
  {%- endif %}
  
  <style type="text/css">
        @charset "utf-8";

        #commentsProvidedHzj {
            padding: 10px;
            border-top: 2px solid #cccccc;
            border-bottom: 2px solid #cccccc;
            font-family: "Helvetica Neue", Helvetica, Arial, "Hiragino Sans GB", "Hiragino Sans GB W3", "WenQuanYi Micro Hei", "Microsoft YaHei UI", "Microsoft YaHei", sans-serif;
            letter-spacing: 0.05em;
        }

        #commentsProvidedHzj .avatar {
            width: 10%;
            float: left;
            padding-top: 7px;
        }

        #commentsProvidedHzj .comment-info {
            width: 85%;
            float: left;
            line-height: 1em;
            margin-left: 10px;
        }

        #commentsProvidedHzj .comment-info .nickname {
            font-size: 18px;
            font-weight: bold;
            line-height: 1.5em;
        }

        #commentsProvidedHzj .comment-info .time {
            font-size: 13px;
            color: #999999;
        }

        #commentsProvidedHzj .comment-info .content {
            border-top: 2px dotted #cccccc;
            padding-top: 5px;
            font-size: 15px;
            font-weight: 300;
            line-height: 1.5em;
            width: auto;
        }

        #commentsProvidedHzj .comment-info a.reply {
            display: block;
            float: right;
            font-size: 14px;
            color: #999999;
            cursor: pointer;
        }

        #commentsProvidedHzj input,
        #commentsProvidedHzj textarea,
        #commentsProvidedHzj button {
            border: none;
            box-shadow: 0px 1px 2px 0px rgba(0, 0, 0, 0.25);
            border-radius: 2px;
        }

        #commentsProvidedHzj input {
            width: 28%;
            margin: 0;
            padding: 5px;
            margin-right: 2%;
            height: 32px;
            font-size: 18px;
            line-height: 32px;
        }

        @media only screen and (max-width: 720px) {

            #commentsProvidedHzj input,
            #commentsProvidedHzj textarea {
                border: 1px solid #cccccc;
            }

            #commentsProvidedHzj input {
                width: 27%;
            }
        }

        @media only screen and (max-width: 400px) {
            #commentsProvidedHzj input {
                margin-right: 1%;
            }
        }

        @media only screen and (max-width: 350px) {
            #commentsProvidedHzj input {
                margin-right: 0;
            }
        }

        #commentsProvidedHzj textarea {
            width: 96%;
            font-size: 18px;
            line-height: 24px;
            margin-top: 10px;
            padding: 5px;
        }

        #commentsProvidedHzj button {
            width: 10%;
            margin-left: 5px;
            margin-top: 10px;
            appearance: button;
            cursor: pointer;
            color: #fff;
            background-color: #5cb85c;
            border-color: #4cae4c;
            height: 32px;
            min-width: 80px;
        }
    </style>

    <div id="commentsProvidedHzj">
        <div class="comment">
          <div v-for="comment in info" class="comment">
            <div class="avatar"><img :src="comment.avatarUri" alt="nihao avatar"></div>
            <div class="comment-info">
                <div class="nickname"  v-text="comment.nickname">nickname</div>
                <div class="time"  v-text="comment.createTime">createTime</div>
                <div class="content"  v-text="comment.content">content</div>
                <!--<a class="reply" herf="#submit4hzj">回复</a> -->
            </div>
          </div>
        </div>

        <div style="clear: both; height: 30px;"></div>
        <div class="submit">
            <input type="text" class="nickname" v-model="submit.nickname" placeholder="nickname（必填）">
            <input type="text" class="email" v-model="submit.email" placeholder="email">
            <input type="text" class="website" v-model="submit.website" placeholder="website">
            <br>
            <textarea name="" id="" cols="30" rows="10" class="content" v-model="submit.content"
                placeholder="content（必填）"></textarea>
            <button v-on:click="submitComment()">提交评论</button>
        </div>
    </div>
    <!--<script src="https://cdn.jsdelivr.net/npm/vue"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/vue@2.6.11/dist/vue.min.js"></script>
    <!--<script src="https://vuejs.org/js/vue.js"></script>-->
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
        $app = new Vue({
            delimiters:['${', '}'],
            el: '#commentsProvidedHzj',
            data: {
                info: null,
                submit: {
                    'nickname': '',
                    'email': '',
                    'website': '',
                    'uuid': '',
                    'content': ''
                },
                baseUri: 'https://api.nonodi.com'
            },
            mounted() {
                var identity = window.location.href;
                
                axios.get(this.baseUri + '/comments', {
                    params: {
                        uuid: this.submit.uuid,
                        identity: identity
                    }
                }).then(response => (
                  this.info = response.data.value.comments,
                  this.submit.uuid = response.data.value.uuid
                  ))

            },
            methods: {
                submitComment: function () {
                    axios.get(this.baseUri + '/addComment', {
                        params: {
                            nickname: this.submit.nickname,
                            email: this.submit.email,
                            website: this.submit.website,
                            uuid: this.submit.uuid,
                            content: this.submit.content
                        }
                    }).then(response => (console.log(response.data)))

                    var identity = window.location.href;
                    axios.get(this.baseUri + '/comments', {
                        params: {
                            uuid: this.submit.uuid,
                            identity: identity
                        }
                    }).then(response => (
                        this.info = response.data.value.comments,
                        this.submit.uuid = response.data.value.uuid
                    ))
                        .catch(error => console.log(error))
                }
            }
        });
    </script>

{%- endif %}

<script>
  window.addEventListener('tabs:register', () => {
    let activeClass = CONFIG.comments.activeClass;
    if (CONFIG.comments.storage) {
      activeClass = localStorage.getItem('comments_active') || activeClass;
    }
    if (activeClass) {
      let activeTab = document.querySelector(`a[href="#comment-${activeClass}"]`);
      if (activeTab) {
        activeTab.click();
      }
    }
  });
  if (CONFIG.comments.storage) {
    window.addEventListener('tabs:click', event => {
      if (!event.target.matches('.tabs-comment .tab-content .tab-pane')) return;
      let commentClass = event.target.classList[1];
      localStorage.setItem('comments_active', commentClass);
    });
  }
</script>
