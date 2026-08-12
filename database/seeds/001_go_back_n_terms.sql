INSERT INTO terms (
    canonical_term,
    term_type,
    term_language_code,
    definition_language_code
)
VALUES
(
    'Go-Back-N',
    'PROTOCOL',
    '一種 pipelined reliable data transfer protocol，sender 可同時傳送多個尚未確認的封包。',
    'en',
    'zh-TW'
),
(
    'Stop-and-Wait',
    'PROTOCOL',
    'Sender 傳送一個封包後等待 ACK，再繼續傳送下一個封包。',
    'en',
    'zh-TW'
),
(
    'Pipelining',
    'CONCEPT',
    '允許多個尚未完成確認的封包同時存在於傳輸中的機制。',
    'en',
    'zh-TW'
),
(
    'Sender Window',
    'CONCEPT',
    'Sender 在目前狀態下允許傳送且尚未完全確認的 sequence number 範圍。',
    'en',
    'zh-TW'
),
(
    'SendBase',
    'VARIABLE',
    'Sender 尚未收到確認的最舊封包之 sequence number。',
    'en',
    'zh-TW'
),
(
    'NextSeqNum',
    'VARIABLE',
    'Sender 下一個準備使用的 sequence number。',
    'en',
    'zh-TW'
),
(
    'ACK',
    'ACRONYM',
    'Acknowledgment，用來表示 receiver 對已收到資料的確認。',
    'en',
    'zh-TW'
),
(
    'Duplicate ACK',
    'TECHNICAL_TERM',
    'Receiver 重複傳送相同 acknowledgment number 的 ACK。',
    'en',
    'zh-TW'
),
(
    'Cumulative ACK',
    'TECHNICAL_TERM',
    'ACK N 表示 N 以及之前連續的封包皆已收到。',
    'en',
    'zh-TW'
),
(
    'Timeout',
    'CONCEPT',
    'Sender 等待 acknowledgment 超過設定時間後觸發的事件。',
    'en',
    'zh-TW'
),
(
    'Retransmission',
    'CONCEPT',
    '重新傳送先前已傳送但需要再次傳輸的封包。',
    'en',
    'zh-TW'
),
(
    'ExpectedSeqNum',
    'VARIABLE',
    'Receiver 下一個預期依序收到的 sequence number。',
    'en',
    'zh-TW'
)
ON CONFLICT (canonical_term, term_language_code)
DO NOTHING;