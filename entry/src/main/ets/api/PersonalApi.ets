import { Request } from "../utils/Request"

export const changeNickName = (nickname: string) => {
  return Request.put<void>('/user/update', Object({
    nickname
  }))
}

interface ChangeNickNameDBO {
  nickname: string
}