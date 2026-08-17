unit UProduto;

interface

uses
 Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, wwdblook, ComCtrls, ExtCtrls, MAHlpBtn, Buttons,
  ToolWin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables, Wwquery,
  Wwdatsrc, DBCtrls;

type
  TProduto = class
     { Método para verificar se o código do produto possui digito verificador }
     function ExisteDV : boolean;
     { Método que calcula e retorna o digito verificador correspondente ao
       código passado como parametro }
     function DigitoVerif(sCod : string) : string;
     { Método que verifica se o código passado como parâmetro já existe na
      tabela de produto }
     function JaExisteProduto(sCodProd : string) : Boolean;

     { Método que verifica se a descricao passada como parâmetro já existe na
      tabela de produto }
     function ExisteDescProduto(sDesc : string) : Boolean;

     { Método que verifica se o código passado como parâmetro já existe na
      tabela ITEM como CodItemComanda }
     function ExisteItemComanda(iCodItemComanda : integer) : boolean;

     { Método que recebe uma SQL e executa retornando False se ocorrer um erro }
     function ExecutaQuery(sSQL : string) : boolean;

     function Insere(sNomeTabela,sSQLIncFields,sSQLIncValues : string) : boolean;
     function Altera(sNomeTabela,sSQLAlteracao,sSQLCondicao : string) : boolean;
     function ExisteArtigo(Artigo : String): Boolean;
     function Exclui(sNomeTabela,sSQLCondicao : string) : boolean;
     function TestaValidade(sCodProd : string) : boolean;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Produto : TProduto;

implementation

uses UString;

function TProduto.ExisteDV : Boolean;
var
  qryGeral:TwwQuery;
  sSql: String;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
  { Verificar na tabela de Parâmetros se o parametro ExisteDV é Verdadeiro
    ou Falso }
  Result := False;
  sSQL := 'SELECT EXISTEDV FROM PARALMOX WHERE EXISTEDV = ''T''';
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;
     if not isEmpty then Result := True; { ExisteDV }
     Close;
     Free;
  end;
end;

function TProduto.JaExisteProduto(sCodProd : string) : Boolean;
var
  qryGeral:TwwQuery;
  sSql: String;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
  Result := False;
  sSQL := 'SELECT CODPRODUTO FROM PRODUTO WHERE CODPRODUTO = '''+Trim(sCodProd)+'''';
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;
     if Not IsEmpty then Result := True;
     Close;
     Free;
  end;
end;

function TProduto.TestaValidade(sCodProd : string) : Boolean;
var
  qryGeral:TwwQuery;
  sSql: String;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
  Result := False;
  sSQL := 'SELECT LOTEVALIDADE FROM PRODUTO WHERE CODPRODUTO = '''+Trim(sCodProd)+'''';
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;
     if Not IsEmpty then
     Begin
        if FieldByName('LOTEVALIDADE').AsString = 'T' then
           Result := True;
     end;
     Close;
     Free;
  end;
end;

function TProduto.DigitoVerif(sCod : string) : string;
var
  iNum1,iNum2,iNum3,iNum4,iNum5  : Integer;
  iSoma  : Integer;
  rResto : Real;
  rDV    : Real;
  iCode  : Integer;
begin
  Val(Copy(sCod,1,1),iNum1,iCode);
  Val(Copy(sCod,2,1),iNum2,iCode);
  Val(Copy(sCod,3,1),iNum3,iCode);
  Val(Copy(sCod,4,1),iNum4,iCode);
  Val(Copy(sCod,5,1),iNum5,iCode);
  iSoma  := iNum1*3+iNum2*4+iNum3*5+iNum4*6+iNum5*7;
  rResto := iSoma mod 11;
  If (rResto = 0 )or ( rResto = 1 ) then rDV := 0 else rDV := 11 - rResto;
  if rDV = 0 then result := '';
  result := FloatToStr(rDV);
end;

function TProduto.ExisteDescProduto(sDesc : string) : Boolean;
var
  qryGeral:TwwQuery;
  sSql: String;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
   Result := False;
   sSQL := 'SELECT DESCPROD FROM PRODUTO WHERE DESCPROD = '''+Trim(sDesc)+'''';
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;
     if RecordCount > 0 then Result := True;
     Close;
     Free;
  end;
end;

function TProduto.ExisteItemComanda(iCodItemComanda : integer): boolean;
var
  qryGeral:TwwQuery;
  sSql: String;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
  Result := False;
  sSQL := 'SELECT CODITEMCOMANDA FROM ITEM WHERE CODITEMCOMANDA = '+IntToStr(iCodItemComanda);
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     Open;
     if not isEmpty then Result := True;
     Close;
     Free;
  end; { with }

end; {ExisteItemComanda}

function TProduto.ExecutaQuery(sSQL : string) : Boolean;
var
  qryGeral:TwwQuery;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
  Result := True;
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(sSQL);
     try
        ExecSQL;
        Free;
     except
        Free;
        Raise;
        Result := False;
     end;
  end; { with }

end;

function TProduto.Insere(sNomeTabela,sSQLIncFields,sSQLIncValues : string) : boolean;
var
  qryGeral:TwwQuery;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
  Result := True;
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(' INSERT INTO '+sNomeTabela+'('+sSQLIncFields+')');
     SQL.Add('VALUES ('+sSQLIncValues+')');
     try
        ExecSQL;
        Free;
     except
        Free;
        Raise;
        Result := False;
     end;
  end; { with }
end;

function TProduto.Altera(sNomeTabela,sSQLAlteracao,sSQLCondicao : string) : boolean;
var
  qryGeral:TwwQuery;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
  Result := True;
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(' UPDATE '+sNomeTabela+' '+sSQLAlteracao);
     SQL.Add(' WHERE '+sSQLCondicao);
     try
        ExecSQL;
        Free;
     except
        Free;
        Raise;
        Result := False;        
     end;
  end; { with }

end;

function TProduto.ExisteArtigo(Artigo : String): Boolean;
var
  qryGeral:TwwQuery;
  sSql: String;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
   with qryGeral do begin
      Close;
      sSql := 'Select CODARTIGO from Artigo where CodArtigo = '''+Artigo+'''';
      Sql.Clear;
      Sql.Add(sSql);
      Open;
      Result := not isEmpty;
      Close;
      Free;
   end;
end;

function TProduto.Exclui(sNomeTabela,sSQLCondicao : string) : boolean;
var
  qryGeral:TwwQuery;
Begin
  qryGeral :=TwwQuery.Create(Application);
  qryGeral.DatabaseName  := 'BASEDADOS';
  Result := True;
  with qryGeral do begin
     Close;
     SQL.Clear;
     SQL.Add(' DELETE '+sNomeTabela);
     SQL.Add(' WHERE '+sSQLCondicao);
     try
        ExecSQL;
        Free;
     except
        Free;
        Raise;
        Result := False;
     end;
  end; { with }
end;

end.
