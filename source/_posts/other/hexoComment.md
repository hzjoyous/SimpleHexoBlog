---
title: hexo 点评系统
p: php/comment
date: 2019-06-16 18:44:17
tags: other
categories: other 
---

周末两天用 symfony 写了个小的点评系统，接入到 hexo 搭建的博客上，下面放上 git 地址

`https://github.com/hzjoyous/api.nonodi.com`
前端代码 --baseUri要替换成自己的--
```html

<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <title>blog</title>
</head>

<body>

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
        <div class="commment">
            <div v-for="comment in info" class="comment">
                <div class="avatar"><img :src="comment.avatarUri" alt="nihao avatar"></div>
                <div class="comment-info">
                    <div class="nickname">${comment.nickname}</div>
                    <div class="time">${comment.createTime}</div>
                    <div class="content">${comment.content}</div>
                    <a class="reply" herf="#submit4hzj">回复</a>
                </div>
            </div>
        </div>
        <div style="clear: both; height: 30px;"></div>
        <div class="submit">
            <input type="text" class="nickname" v-model="submit.nickname" placeholder="nickname（必填）">
            <input type="text" class="email" v-model="submit.email" placeholder="email">
            <input type="text" class="website" v-model="submit.website" placeholder="website">
            <br>
            <textarea name="" id="submit4hzj" cols="30" rows="10" class="content" v-model="submit.content"
                placeholder="content（必填）"></textarea>
            <button v-on:click="submitComment()">提交评论</button>
        </div>
    </div>
    <!-- <script src="https://cdn.jsdelivr.net/npm/vue"></script> -->
    <script src="https://vuejs.org/js/vue.js"></script>
    <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    <script>
        $app = new Vue({
            delimiters: ['${', '}'],
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
                baseUri: 'https://xxx.xxx.com',
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
                    .catch(error => console.log(error))

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
                    })
                        .then(response => (console.log(response.data)))
                        .catch(error => console.log(error))

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
</body>

</html>
```
