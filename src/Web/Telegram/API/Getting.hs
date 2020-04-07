{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

module Web.Telegram.API.Getting where

import Data.Text (Text)
import Servant.API
import Web.Telegram.API.Common
import Web.Telegram.Types

type GetMe =
  Base
    :> "getMe"
    :> Get '[JSON] (ReqResult User)

type GetUserProfilePhotos =
  Base
    :> "getUserProfilePhotos"
    :> QueryR "user_id" Integer
    :> QueryParam "offset" Integer
    :> QueryParam "limit" Integer
    :> Get '[JSON] (ReqResult UserProfilePhotos)

type GetFile =
  Base
    :> "getFile"
    :> QueryR "file_id" Text
    :> Get '[JSON] (ReqResult File)

type GetChat =
  Base
    :> "getChat"
    :> QueryR "chat_id" ChatId
    :> Get '[JSON] (ReqResult Chat)

type GetChatAdministrators =
  Base
    :> "getChatAdministrators"
    :> QueryR "chat_id" ChatId
    :> Get '[JSON] (ReqResult [ChatMember])

type GetChatMembersCount =
  Base
    :> "getChatMembersCount"
    :> QueryR "chat_id" ChatId
    :> Get '[JSON] (ReqResult Integer)

type GetChatMember =
  Base
    :> "getChatMember"
    :> QueryR "chat_id" ChatId
    :> QueryR "user_id" Integer
    :> Get '[JSON] (ReqResult ChatMember)

type GetMyCommands =
  Base
    :> "getMyCommands"
    :> Get '[JSON] (ReqResult [BotCommand])

type GetStickerSet =
  Base
    :> "getStickerSet"
    :> QueryR "name" Text
    :> Get '[JSON] (ReqResult StickerSet)
