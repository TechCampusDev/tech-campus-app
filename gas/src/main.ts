/**
 * Copyright 2023 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { handleMessageEvent } from './handle-message-event';

export const doPost = (
  e: { postData: { getDataAsString: () => string } } | null
) => {
  // Events APIからのPOSTを取得
  // 参考→https://api.slack.com/events-api
  const json = JSON.parse(e!.postData.getDataAsString());

  // Events APIを使用する初回、URL Verificationのための記述
  if (json.type === 'url_verification') {
    return ContentService.createTextOutput(json.challenge);
  }

  const event = json.event;

  // slackの3秒タイムアウトリトライ対策
  const cache = CacheService.getScriptCache();
  if (cache.get(event.event_ts) !== null) {
    return;
  } else {
    cache.put(event.event_ts, 'true', 600);
  }

  // メッセージのイベントだった際にhandleMessageに処理を任せる
  if (event && event.type === 'message') {
    handleMessageEvent(event);
  }
};
