unit FCadTabIRRF;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MontaSelect, DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd,
  Wwdbgrid, FCadastroCS, cmseldlg, wwidlg, DBCtrls, TREdit, FCadastroGridCS,
  IvDictio, IvMulti, IvEMulti, CmEventosCadastro, ImgList;

type
  TfrmCadTabIRRF = class(TfrmCadastroGridCS)
    lblAliq: TLabel;
    lblParcDeduz: TLabel;
    lblFaixaIni: TLabel;
    dbrAliqIRRF: TDBRealEdit;
    dbrFaixaIni: TDBRealEdit;
    dbrParcDeduz: TDBRealEdit;
    procedure FormActivate(Sender: TObject);
    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTabIRRF: TfrmCadTabIRRF;

implementation

{$R *.DFM}
Uses USistema, UMensErro, UDatabase, DBaseDados, uModulo;

procedure TfrmCadTabIRRF.FormActivate(Sender: TObject);
begin
  inherited;
  qry.Close;
  qry.SQL.Clear;
  qry.SQl.Text := 'SELECT * FROM '+ Sistema.PrefixoServidor+'IRRF';
  try
    qry.Open;
  Except
    MsgDlg('Problema na abertura da tabela IRRF','Erro',mtError,[mbOK],0);
    exit;
  end;
end;

procedure TfrmCadTabIRRF.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbrFaixaIni.SetFocus;
end;

procedure TfrmCadTabIRRF.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbrFaixaIni.SetFocus;
end;

procedure TfrmCadTabIRRF.bbtnConfirmarClick(Sender: TObject);
begin
  if dbrFaixaIni.Value = 0 then
  Begin
    MsgDlg('Obrigatório Preencher a Faixa Inicial','Erro',mtError,[mbOK],0);
    dbrFaixaIni.SetFocus;
    exit;
  end;
  inherited;

end;

end.
