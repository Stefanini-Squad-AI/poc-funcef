unit fParamBenefPorPessoa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  Db, DBTables, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, TB97, Buttons,
  TB97Tlbr, wwdbdatetimepicker, CMDateTimePicker, ExtCtrls, wwdblook, Spin, TEdNum, ComCtrls,
  Grids, Wwdbigrd, Wwdbgrid, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport;

type
  TfrmParamBenefPorPessoa = class(TfrmSelPessoalMT)
    tbshConfig: TTabSheet;
    GroupBox2: TGroupBox;
    cmbMes: TComboBox;
    speAno: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure speAnoChange(Sender: TObject);
  end;

var
  frmParamBenefPorPessoa: TfrmParamBenefPorPessoa;

implementation

uses uCtrlFuncoesRH, fAguarde;

{$R *.DFM}

procedure TfrmParamBenefPorPessoa.FormCreate(Sender: TObject);
begin
  inherited;
  cmbMes.ItemIndex := FU.ExtraiMes(Date) - 1;
  speAno.Value := FU.ExtraiAno(Date);
end;

procedure TfrmParamBenefPorPessoa.speAnoChange(Sender: TObject);
begin
  bbtnConfirmar.Enabled := (speAno.Value > 0);
end;

procedure TfrmParamBenefPorPessoa.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFuncSel: string;
begin
  frmAguarde.Mostra('Benefícios por Pessoa');
  frmAguarde.Pos := 0;

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
  Cmp_Padrao.ParamByName('MesRef').asString := IntToStr(speAno.Value) +'/'+
    FU.PoeZero(cmbMes.ItemIndex+1);
end;

end.
