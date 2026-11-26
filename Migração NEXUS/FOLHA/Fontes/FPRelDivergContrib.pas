unit FPRelDivergContrib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Spin, wwdblook, fcCombo, fcColorCombo, Db,
  DBTables, Wwquery, Wwdatsrc;

type
  TFrmPRelDivergContrib = class(TfrmOkCancelar)
    pnlOrdenacaoeCor: TPanel;
    rdoTipoOrdem: TRadioGroup;
    grbCor: TGroupBox;
    lblCor: TLabel;
    ccbEscolheCor: TfcColorCombo;
    pnlLoteMes: TPanel;
    lblLote: TLabel;
    dblkLote: TwwDBLookupCombo;
    grbMesAnoComparacao: TGroupBox;
    cmbMes: TComboBox;
    lblMes: TLabel;
    lblAno: TLabel;
    speAno: TSpinEdit;
    dlgColor: TColorDialog;
    dsLote: TwwDataSource;
    qryLote: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPRelDivergContrib: TFrmPRelDivergContrib;

implementation

uses dBaseDados, uSistema, dRelDivergContrib, uMensErro;

{$R *.DFM}

procedure TFrmPRelDivergContrib.bbtnConfirmarClick(Sender: TObject);
Var
  sMesEscolhido : String;

begin
  inherited;
  If Trim(cmbMes.Text) <> '' Then
  Begin
    If cmbMes.ItemIndex <= 8 Then
      sMesEscolhido := speAno.Text+'/0'+IntToStr(cmbMes.ItemIndex + 1)
    Else
      sMesEscolhido := speAno.Text+'/'+IntToStr(cmbMes.ItemIndex + 1);
  End
  Else
  Begin
    MsgDlg('Por Favor, escolha mês de referência para comparação.', 'Informação', mtInformation, [mbOK], 0);
    cmbMes.SetFocus;
    ModalResult := mrNone;
    Exit;
  End;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  Case rdoTipoOrdem.ItemIndex Of
    0: dtmRelDivergContrib.qryRelDivergContrib.Sql.Strings[35] := ' ORDER BY C.NOME, E.MATRICULA ';
    1: dtmRelDivergContrib.qryRelDivergContrib.Sql.Strings[35] := ' ORDER BY C.NOME, PP.INSCRICAONUMERO ';
    2: dtmRelDivergContrib.qryRelDivergContrib.Sql.Strings[35] := ' ORDER BY C.NOME, P.NOME ';
  End;

  dtmRelDivergContrib.qryRelDivergContrib.Close;
  dtmRelDivergContrib.qryRelDivergContrib.ParamByName('PMESREF').AsString    := qryLote.FieldByName('MESREFERENCIA').AsString;
  dtmRelDivergContrib.qryRelDivergContrib.ParamByName('PMESCOB').AsString    := sMesEscolhido;
  dtmRelDivergContrib.qryRelDivergContrib.ParamByName('PMESREFANT').AsString := sMesEscolhido;
  dtmRelDivergContrib.qryRelDivergContrib.Open;
  dtmRelDivergContrib.CorZebra                 := ccbEscolheCor.SelectedColor;
  dtmRelDivergContrib.lblMostraLoteRef.Caption := qryLote.FieldByName('LOTE').AsString;
end;

procedure TFrmPRelDivergContrib.FormShow(Sender: TObject);
Var
  wDia, wMes, wAno : Word;

begin
  inherited;
  DecodeDate(Date, wAno, wMes, wDia);
  speAno.Value     := wAno;
  cmbMes.ItemIndex := wMes - 1;
  qryLote.Open;
end;

end.
