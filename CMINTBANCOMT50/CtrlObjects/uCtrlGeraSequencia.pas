unit uCtrlGeraSequencia;

interface

Uses classes, SysUtils, wwQuery;

function GeraSequencia(const pNumEmpresaBanco : String; const pMessageInfo : String) : Integer;

implementation

function GeraSequencia(const pNumEmpresaBanco : String; const pMessageInfo : String) : Integer;
var qryNroSeq : twwQuery;
begin
  Result := -1;
  qryNroSeq := TwwQuery.Create(Nil);
  try
    qryNroSeq.DataBaseName := 'BaseDados';
    qryNroSeq.Sql.Text := 'SELECT SEQREMESSA'+pNumEmpresaBanco+'.NextVal as CONTROLEREMESSA from dual';
    try
      qryNroSeq.Open;
      Result := qryNroSeq.fieldByName('CONTROLEREMESSA').asInteger;
      QryNroSeq.Close;
    except
      raise Exception.Create(pMessageInfo);
    end;
  finally
    FreeAndNil(QryNroSeq);
  end;
end;

end.
