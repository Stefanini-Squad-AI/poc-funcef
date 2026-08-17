unit UFuncoesCCP;

interface

uses
  wwTable,
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, Mask, StdCtrls, wwdblook, MAHlpBtn,
  Buttons,  ComCtrls, FOkCancelar, Machklb,
  checklst, cmseldlg, Spin, TB97;


  procedure RestauraIcone(qry : TwwQuery);
  function TestaCtrlInterface(qry: TwwQuery;pTipo : char; pIdPessJur,pMesCob, pFlg : string) : boolean;

implementation

uses UFuncoesUteis;

procedure RestauraIcone(qry : TwwQuery);
begin
  with qry do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT 1 FROM DUAL');
    Open;
    Close;
  end;
end; // RestauraIcone;

function TestaCtrlInterface(qry: TwwQuery;pTipo : char; pIdPessJur,pMesCob, pFlg : string) : boolean;
var
  sSQL : string;
begin
  with qry do
  begin
    Close;
    SQL.Clear;
    sSQL := ' SELECT IDLOTE,FLGIDATMP,IDPESSOA,FLGVOLTATMP,FLGIDAINTERFACE,'+
            '        FLGVOLTAINTERFACE,FLGEMITIUCC,DATAIDATMP,DATAVOLTATMP,DATAIDAINTERFACE,'+
            '        DATAVOLTAINTERFA,DATAEMITIUCC,NUMREG,VLRTOTAL,MESREFERENCIA,TIPO,'+
            '        FLGPREPARADO,DATAPREPARO,DESCRICAO,FLGATRASODEVOL' +
            ' FROM   CTRLINTERFACE '+
            ' WHERE  (MESREFERENCIA = ''' + pMesCob + ''')' +
            ' AND    (TIPO = ''' + pTipo + ''')' +
            ' AND    (IDPESSOA = ' + pIdPessJur + ')';
    SQL.Add(sSQL);
    Open;
    if (RecordCount = 0)
    then Result := False
    else if (FieldByName(pFlg).AsInteger = 0)
         then Result := False
         else Result := True;
  end;
end; // TestaEnvio


end.
