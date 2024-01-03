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
import { SPREAD_SHEET_ID } from './constants';

export const logSheet = (type: string, message?: string) => {
  const spreadsheetId = SPREAD_SHEET_ID;

  const spreadsheet = SpreadsheetApp.openById(spreadsheetId!);
  const sheet = spreadsheet.getActiveSheet();

  const timestamp = new Date();

  const data = [timestamp, type, message];

  sheet.appendRow(data);
};
