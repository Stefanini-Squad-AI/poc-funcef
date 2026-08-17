unit uSad;

interface

uses dbTables, dSad, wwQuery, Sysutils, Forms, Windows;

procedure ConfirmaSAD( pDataSet : array of TDBDataSet) ;
function LeUltRegistroSAD(sTabela, sCampoID :String) :Cardinal;

implementation

procedure ConfirmaSAD( pDataSet : array of TDBDataSet) ;
begin
  dmSAD.dbSAD.ApplyUpdates(pDataSet);
end;

function LeUltRegistroSAD(sTabela, sCampoID :String) :Cardinal;
Var
  sSql :String;
Begin
  Result := 1;

  With TwwQuery.Create(Application) Do
     Try
        databasename := dmSAD.dbSAD.DatabaseName;

        Sql.Text := 'SELECT SEQ' + sTabela + '.NEXTVAL FROM DUAL';
        Try
           Open;
           Result := Fields[0].AsInteger;
        Except
           Close;
           Sql.Text := 'SELECT MAX(' + sCampoID + ') FROM ' + sTabela;

           Try
             Open;
             sSql := 'CREATE SEQUENCE SEQ' + sTabela + ' NOCACHE START WITH ' + IntToStr(Fields[0].AsInteger + 1);
             Close;
             Sql.Text := sSQl;
             Try
                ExecSql;
                Sql.Text := 'SELECT SEQ' + sTabela + '.NEXTVAL FROM DUAL';
                Open;
                Result := Fields[0].AsInteger;
             Except
                Application.MessageBox(Pchar('Erro Ao Criar o Sequence "SEQ' + sTabela + '". Não é possível Completar o Cadastro'),'SAD Exper', Mb_IconStop);
                Raise;
             End;
           Except
             Application.MessageBox('Erro Ao Buscar Sequence. Não é possível Completar o Cadastro','SAD Exper', Mb_IconStop);
             Raise;
           End;
        End;
     finally
        Free;
     End;
End;

end.
