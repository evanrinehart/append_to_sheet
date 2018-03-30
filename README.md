Appends a row of data to a google spreadsheet. Specify which sheet and what
data to append on stdin in JSON form.

```
ruby -I. append_to_sheet.rb
{
  "sheet_id": "the sheet ID",
  "rows": ["apple", "pear", "banana", "blueberry"]
}
<CTRL+D>
```

Requires google-api-client gem, a client_secret.json file containing the
oauth2 client_id and client_secret for the user who has access to the sheet.
The file must be in the same directory as the program. Authorization will
store extra oauth credentials in a file tokens.yaml in the same directory.
