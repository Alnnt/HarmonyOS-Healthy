import { Request } from "../utils/Request"

export const smsRegistry = (mobile: number, code: string) => {
  Request.post<void>('/sms/registry', Object({ mobile, code }))
}

export const smsSend = (mobile: number, type: 'login' | 'registry' | 'other') => {
  Request.post<void>('sms/send', Object({ mobile, type }))
}

export const smsLogin = (mobile: number, code: string) => {
  Request.post<User>('/sms/login', Object({ mobile, code }))
}

export interface User {
  nickname: string
  avatar: string
  mobile: string
  token: string
}