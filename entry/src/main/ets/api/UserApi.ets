import { Request } from "../utils/Request"

export const smsRegistry = (mobile: string, code: string) => {
  return Request.post<void>('/sms/registry', Object({ mobile, code }))
}

export const smsSend = (mobile: string, type: 'login' | 'registry' | 'other') => {
  return Request.post<void>('/sms/send', Object({ mobile, type }))
}

export const smsLogin = (mobile: string, code: string) => {
  return Request.post<User>('/sms/login', Object({ mobile, code }))
}

export interface User {
  nickname: string
  avatar: string
  mobile: string
  token: string
}