# LINE-Source<br>

Line Application Source<br>

----------------
<br>
LINE_POST_CONTENT_URL: https://os.line.naver.jp/talk/m/upload.nhn<br>
LINE_POST_PROFILE: 'https://obs-sg.line-apps.com/talk/p/upload.nhn'<br>
LINE_STICKER_URL: 'http://dl.stickershop.line.naver.jp/products/'<br>

----------------
<br><br>

/api/v33/comment/create.json (POST)<br>
> #GET_PARAM<br>
> homeId<br>
> sourceType<br>
> ruid<br>
> <br>
> #POST_REQUEST<br>
> commentText=comment <br>
> activityExternalId=postId<br>
> actorId=mid<br>
<br>
<br>

/api/v33/post/create.json (POST)<br>
> #GET_PARAM<br>
> homeId<br>
> sourceType<br>
> ruid<br>
> <br>
> #POST_REQUEST<br>
> serviceCode (optional) <br>
> contentId (optional)<br>
> actorId=mid<br>

<br><br>

/api/v33/post/sendPostToTalk.json (GET)<br>
> #GET_PARAM<br>
> postId<br>
> receiveMid<br>
> <br>
> #HEADER<br>
> X-Line-Mid<br>
> X-Line-ChannelToken<br>

<br><br>
/api/v33/relay/create.json<br>
/api/v33/relay/update.json<br>
/api/v33/relay/delete.json<br>
/api/v33/relay/members.json<br>
/api/v33/joinedrelay/create.json<br>
/api/v33/joinedrelay/update.json<br>
/api/v33/joinedrelay/list.json<br>
/api/v33/home/updateCover.json<br>
/api/v33/hashtag/search.json<br>
