unit fParamInconsistSal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TB97, wwdblook, ExtCtrls, Spin,
  TEdNum, ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, TREdit,
  CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport, uCtrlGlobalRH;

type
  TfrmParamInconsistSal = class(TfrmSelPessoalMT)
    gbxFatoresHay: TGroupBox;
    redHayMin: TRealEdit;
    redHayMax: TRealEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnOutraVezClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlGlobalRH: TCtrlGlobalRH;

    IndPolitica: integer;
  end;

var
  frmParamInconsistSal: TfrmParamInconsistSal;

implementation

uses uMensErro, dCds, uCtrlPadroes, uCtrlFuncoesRH;

{$R *.DFM}

procedure TfrmParamInconsistSal.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('INDPOLITICA');
  IndPolitica := dmCds.Cds.FieldByName('INDPOLITICA').asInteger;

  gbxFatoresHay.Visible := (IndPolitica = 1);
  if (IndPolitica = 1) then
  begin
    redHayMin.Value := 0.7;
    redHayMax.Value := 1.5;
  end;
end;

procedure TfrmParamInconsistSal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlGlobalRH);
  inherited;
end;

procedure TfrmParamInconsistSal.bbtnOutraVezClick(Sender: TObject);
begin
  inherited;
  bbtnOutraVez.Enabled := false;
end;

procedure TfrmParamInconsistSal.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel: string;
begin
  if (redHayMin.Value > redHayMax.Value) then
  begin
    MsgDlg('O Fator Mínimo não deve ser maior do que o Fator Máximo.' +CR_LF+ 'Verifique.',
           'Aviso', mtInformation, [mbOk,mbHelp], 0);
    exit;
  end;

  inherited;

  sListaIdFuncSel := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFuncSel = '') then
      sListaIdFuncSel := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFuncSel := sListaIdFuncSel +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFuncSel;
  Cmp_Padrao.ParamByName('IndPolitica').asInteger := IndPolitica;
  Cmp_Padrao.ParamByName('HayMin').asFloat := redHayMin.Value;
  Cmp_Padrao.ParamByName('HayMax').asFloat := redHayMax.Value;
end;

end.
