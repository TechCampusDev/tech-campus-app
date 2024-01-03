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
import { FUNCTIONS_URL, TECH_CAMPUS_ON_REQUEST_KEY } from './constants';
import { logSheet } from './logSheet';

// event.type === "message"
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const handleMessageEvent = (event: any) => {
  if (event.client_msg_id && event.bot_id === undefined) {
    logSheet('message', JSON.stringify(event));
    // onRequestArchiveSlackMessage を呼ぶ
    const { ts, channel } = event;
    const options: GoogleAppsScript.URL_Fetch.URLFetchRequestOptions = {
      method: 'post',
      contentType: 'application/x-www-form-urlencoded',
      headers: { Authorization: 'Bearer ' + TECH_CAMPUS_ON_REQUEST_KEY },
      payload: {
        ts: ts,
        channel: channel,
      },
    };

    const url = `${FUNCTIONS_URL}/onRequestArchiveSlackMessage`;
    UrlFetchApp.fetch(url, options);
  }
};
