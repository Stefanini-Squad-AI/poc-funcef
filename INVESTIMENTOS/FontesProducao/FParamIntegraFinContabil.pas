unit FParamIntegraFinContabil;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, ExtCtrls, StdCtrls, wwdblook, Db, DBTables, Wwquery,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ppDB,
  ppDBBDE, Wwdatsrc, ppBands, ppClass, ppCtrls, ppPrnabl, ppCache, ppComm,
  ppProd, ppReport, Grids, DBGrids;

type
  TfrmParamIntegraFinContabil = class(TfrmOkCancelar)
    QryBuscaTipoInvestimento: TwwQuery;
    GroupBox1: TGroupBox;
    DbLkcTipoInvestimento: TwwDBLookupCombo;
    rdgTipo: TRadioGroup;
    procedure rdgTipoClick(Sender: TObject);
    procedure FazQry;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamIntegraFinContabil: TfrmParamIntegraFinContabil;

implementation

uses FDmRelatorio, USistema;

{$R *.DFM}

procedure TfrmParamIntegraFinContabil.rdgTipoClick(Sender: TObject);
begin
  inherited;
   If rdgTipo.ItemIndex = 1 Then
      DbLkcTipoInvestimento.Enabled := True
   Else
   Begin
      DbLkcTipoInvestimento.Text    := '';
      DbLkcTipoInvestimento.Enabled := False;
   End;   
end;

procedure TfrmParamIntegraFinContabil.FazQry;
Begin
   With DtmRelatorio.qryIntegraFinContabil Do
   Begin
      Close;
      SQL.Clear;
      SQL.Add('SELECT                                        ');
      SQL.Add('                                              ');
      SQL.Add('TIPOINVEST.DESCTIPOINVEST AS TIPOINVESTIMENTO,');
      SQL.Add('TIPOOPERACAO.DESCTIPOOPERACAO AS OPERACAO,');
      SQL.Add('TIPODESPINVEST.DESCTIPODESPINV AS RUBRICA ,');
      SQL.Add('TIPOACAO.DESCTIPOACAO||TIPOTITRENFIXA.DESCTIPRENFIXA AS TIPOTITULO,');
      SQL.Add('INVESTIMENTO.DESCINVESTIMENTO AS INVESTIMENTO,');
      SQL.Add('CARTEIRAINVEST.DESCCARTINVEST AS CARTEIRA,');
      SQL.Add('PADRLANCCONTINV.HISTLANCINVEST AS HISTORICO,');
      SQL.Add('PADRLANCCONTINV.FLGPAGRECNAO AS TIPOLANCTO,');
      SQL.Add('TIPOPER.TIPDESCRICAO AS TIPOOPERCONTABIL,');
      SQL.Add('PADRLANCCONTINV.CONTADOPERFIN  AS CONTADEBITO,');
      SQL.Add('PADRLANCCONTINV.CONTACOPERFIN  AS CONTACREDITO');
      SQL.Add('                                                           ');
      SQL.Add('FROM                                                       ');
      SQL.Add('                                                           ');
      SQL.Add('PADRLANCCONTINV,');
      SQL.Add('TIPOINVEST,');
      SQL.Add('TIPOOPERACAO,');
      SQL.Add('PESSOA,');
      SQL.Add('TIPOACAO,');
      SQL.Add('TIPOTITRENFIXA,');
      SQL.Add('CARTEIRAINVEST,');
      SQL.Add('TIPODESPINVEST,');
      SQL.Add('INVESTIMENTO,');
      SQL.Add('TIPOPER ');
      SQL.Add('                                                           ');
      SQL.Add('WHERE                                                      ');
      SQL.Add('                                                           ');
      If rdgTipo.ItemIndex = 1 Then
         SQL.Add('TIPOINVEST.IDTIPOINVEST = '''+
           QryBuscaTipoInvestimento.FieldByName('IDTIPOINVEST').AsString+''' AND');
      SQL.Add('PADRLANCCONTINV.IDTIPOINVEST=TIPOINVEST.IDTIPOINVEST(+) AND');
      SQL.Add('PADRLANCCONTINV.IDTIPOOPERACAO=TIPOOPERACAO.IDTIPOOPERACAO(+) AND');
      SQL.Add('PADRLANCCONTINV.IDPESSOA=PESSOA.IDPESSOA(+) AND');
      SQL.Add('PADRLANCCONTINV.CODTIPTITULO=TIPOACAO.CODTIPOACAO(+) AND');
      SQL.Add('PADRLANCCONTINV.CODTIPTITULO=TIPOTITRENFIXA.CODTIPRENFIXA(+) AND');
      SQL.Add('PADRLANCCONTINV.IDCARTEIRAINVEST=CARTEIRAINVEST.IDCARTEIRAINVEST(+) AND');
      SQL.Add('PADRLANCCONTINV.IDTIPODESPINVEST=TIPODESPINVEST.IDTIPODESPINVEST(+) AND');
      SQL.Add('PADRLANCCONTINV.IDINVESTIMENTO=INVESTIMENTO.IDINVESTIMENTO(+) AND');
      SQL.Add('PADRLANCCONTINV.TIPCODIGO = TIPOPER.TIPCODIGO(+)  ');
      SQL.Add('ORDER BY TIPOINVESTIMENTO, OPERACAO, RUBRICA , TIPOTITULO, INVESTIMENTO,HISTORICO ');
      Open;
      First;
   End;
End;

procedure TfrmParamIntegraFinContabil.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
   FazQry;
end;

procedure TfrmParamIntegraFinContabil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   DtmRelatorio.qryIntegraFinContabil.Close;
   QryBuscaTipoInvestimento.Close;
end;

procedure TfrmParamIntegraFinContabil.FormShow(Sender: TObject);
begin
  inherited;
   QryBuscaTipoInvestimento.Open;
end;

end.

