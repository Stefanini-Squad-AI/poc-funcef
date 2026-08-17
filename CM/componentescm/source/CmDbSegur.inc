             DbInt := TDataBase.Create(Application);
             DbInt.loginprompt := False;
             DbInt.Databasename := 'BaseParamReports'; 
             DbInt.DriverName := 'ORACLE';
             DbInt.Params.Add('SERVER NAME=PREVSEGUR');
             DbInt.Params.Add('USER NAME=CMDBA');
             DbInt.Params.Add('NET PROTOCOL=TNS');
             DbInt.Params.Add('OPEN MODE=READ/WRITE');
             DbInt.Params.Add('SCHEMA CACHE SIZE=8');
             DbInt.Params.Add('LANGDRIVER=');
             DbInt.Params.Add('SQLQRYMODE=SERVER');
             DbInt.Params.Add('SQLPASSTHRU MODE=SHARED AUTOCOMMIT');
             DbInt.Params.Add('SCHEMA CACHE TIME=-1');
             DbInt.Params.Add('MAX ROWS=-1');
             DbInt.Params.Add('BATCH COUNT=200');
             DbInt.Params.Add('ENABLE SCHEMA CACHE=FALSE');
             DbInt.Params.Add('SCHEMA CACHE DIR=');
             DbInt.Params.Add('ENABLE BCD=FALSE');
             DbInt.Params.Add('ENABLE INTEGERS=FALSE');
             DbInt.Params.Add('LIST SYNONYMS=NONE');
             DbInt.Params.Add('ROWSET SIZE=20');
             DbInt.Params.Add('BLOBS TO CACHE=1000');
             DbInt.Params.Add('BLOB SIZE=256');
             DbInt.Params.Add('OBJECT MODE=TRUE');
             DbInt.Params.Add('PASSWORD=sadanyou');

             Try
                DbInt.Open
             Except
                On E:Exception Do
                Begin
                   Application.MessageBox(Pchar(E.Message),'Erro',Mb_Ok + Mb_IconStop);
                   Raise;
                End;
             End;
