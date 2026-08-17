unit fParamCadPessoal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Buttons, TEdNum, Spin, wwdblook, ExtCtrls,
  TB97, ComCtrls, FTelaAut, TB97Tlbr, IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker,
  CMDateTimePicker, uCmSqlParams, DBClient, uCMClientDataSet, CmParamReport;

type
  TfrmParamCadPessoal = class(TfrmSelPessoalMT)
    tbsConfiguracoes: TTabSheet;
    rgOpcaoColuna1: TRadioGroup;
    rgOpcaoColuna2: TRadioGroup;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  end;

var
  frmParamCadPessoal: TfrmParamCadPessoal;

implementation

uses uSistema, fAguarde;

{$R *.DFM}

procedure TfrmParamCadPessoal.FormCreate(Sender: TObject);
begin
  inherited;
  if (CdsParamRH.FieldByName('FLGDOISCARGOS').asInteger = 1) then
    rgOpcaoColuna1.Items.Add('Salário Cargo Altern.');
  IrPaginaResult := false;
end;

procedure TfrmParamCadPessoal.bbtnConfirmarClick(Sender: TObject);
var
  sListaIdFunc: string;
begin
  frmAguarde.Mostra('Cadastro de Pessoal');
  frmAguarde.Pos := 0;

  inherited;
  sListaIdFunc := '';
  while not(CdsPrincipal.EOF) do
  begin
    if (sListaIdFunc = '') then
      sListaIdFunc := CdsPrincipal.FieldByName('IDPESSOA').asString
    else
      sListaIdFunc := sListaIdFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  Cmp_Padrao.ParamByName('ListaIdFunc').asString := sListaIdFunc;
  Cmp_Padrao.ParamByName('NomeEmpresa').asString := Sistema.NomeEmpresa;
  Cmp_Padrao.ParamByName('PorFuncionario').asBoolean := not(cbxCandidatos.Checked);
  Cmp_Padrao.ParamByName('BuscarCargoAlternativo').asBoolean := cbxCargoAltern.Checked;
  Cmp_Padrao.ParamByName('OpcaoColuna1').asInteger := rgOpcaoColuna1.ItemIndex;
  Cmp_Padrao.ParamByName('OpcaoColuna2').asInteger := rgOpcaoColuna2.ItemIndex;
  Cmp_Padrao.ParamByName('SelDemitidos').asBoolean := cbxDemitidos.Checked;
  Cmp_Padrao.ParamByName('SelAfastados').asBoolean := cbxAfastados.Checked;
  Cmp_Padrao.ParamByName('Ordenacao').asInteger := cmbSequencia.ItemIndex;
end;

end.
