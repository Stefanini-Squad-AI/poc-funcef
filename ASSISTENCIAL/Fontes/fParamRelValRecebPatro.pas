unit fParamRelValRecebPatro;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, Db, DBTables, Wwquery, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, dRelValsRecebPatro;

type
  TfrmParamRelValRecebPatro = class(TfrmOkCancelar)
    DblkPatro: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    Label1: TLabel;
    DblkMesCob: TwwDBLookupCombo;
    Label2: TLabel;
    qryMesCob: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelValRecebPatro: TfrmParamRelValRecebPatro;

implementation

{$R *.DFM}

procedure TfrmParamRelValRecebPatro.FormCreate(Sender: TObject);
begin
  inherited;
  qryPatro.Close;
  qryMesCob.Close;
  qryPatro.Open;
  qryMesCob.Open;
end;

procedure TfrmParamRelValRecebPatro.bbtnConfirmarClick(Sender: TObject);
var sMes : string;
begin
  inherited;
  sMes := '';
  if trim(DblkMesCob.LookupValue) = '' then
  begin
    showMessage('Selecione um Mês de Cobrança.');
    if DblkMesCob.CanFocus then DblkMesCob.SetFocus;
    exit;
  end
  else
    sMes := trim(DblkMesCob.LookupValue);

  with dtmRelValsRecebPatro do
  begin
    qryFundacao.Close;
    qryFundacao.Open;
    qryRelValRecebPatro.Close;
    qryRelValRecebPatro.Sql.Clear;
    qryRelValRecebPatro.Sql.Add('SELECT');
    qryRelValRecebPatro.Sql.Add('  PATRO.NOME,');
    qryRelValRecebPatro.Sql.Add('  H.MESCOBRANCA,');
    qryRelValRecebPatro.Sql.Add('  RECEBIDOS.MESCOBRANCA,');
    qryRelValRecebPatro.Sql.Add('  SUM(H.VALORRECEBIDO) AS TOTALRECEBIDO,');
    qryRelValRecebPatro.Sql.Add('  NVL(RECEBIDOS.QTDREC, 0) AS QTDREC,');
    qryRelValRecebPatro.Sql.Add('  SUM(H.VALORESPERADO) AS TOTALESPERADO,');
    qryRelValRecebPatro.Sql.Add('  COUNT(*) AS QTDTOTAL');
    qryRelValRecebPatro.Sql.Add('FROM HSTCONTRIBASS H, PESSOA PATRO , (SELECT COUNT(*) AS QTDREC, MESCOBRANCA, IDPESSJUR FROM HSTCONTRIBASS');
    qryRelValRecebPatro.Sql.Add('                   				           WHERE VALORRECEBIDO IS NOT NULL AND');
    qryRelValRecebPatro.Sql.Add('                                            VALORRECEBIDO > 0 AND');
    qryRelValRecebPatro.Sql.Add('                                            MESCOBRANCA = '+ quotedStr(sMes) +' AND');
    qryRelValRecebPatro.Sql.Add('                                            SITRECEBIMENTO >= 2');
    qryRelValRecebPatro.Sql.Add('                                            GROUP BY MESCOBRANCA, IDPESSJUR) RECEBIDOS');
    qryRelValRecebPatro.Sql.Add('WHERE H.MESCOBRANCA = '+ quotedStr(sMes) +' AND');
    qryRelValRecebPatro.Sql.Add('      H.MESCOBRANCA = RECEBIDOS.MESCOBRANCA(+) AND');
    qryRelValRecebPatro.Sql.Add('      H.IDPESSJUR   = RECEBIDOS.IDPESSJUR(+)   AND');
    qryRelValRecebPatro.Sql.Add('      H.IDPESSJUR   = PATRO.IDPESSOA');
    if (not qryPatro.IsEmpty) and (trim(dblkPatro.LookupValue) <> '') then
    begin
      qryRelValRecebPatro.Sql.Add('    AND H.IDPESSJUR   = ' + trim(dblkPatro.LookupValue));
    end;
    qryRelValRecebPatro.Sql.Add('GROUP BY PATRO.NOME, H.MESCOBRANCA, RECEBIDOS.QTDREC, RECEBIDOS.MESCOBRANCA');
    qryRelValRecebPatro.Sql.Add('ORDER BY H.MESCOBRANCA DESC, PATRO.NOME ASC');

    try
      qryRelValRecebPatro.Open;
    except
      showMessage('Ocorreu um erro ao processar o relatório!');
    end;

  end;


end;

end.
