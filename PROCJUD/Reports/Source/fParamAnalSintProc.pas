unit fParamAnalSintProc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSelProcessoMT, uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc,
  CmParamReport, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, wwdblook, Spin, wwdbdatetimepicker, CMDateTimePicker,
  TEdNum, ExtCtrls, ComCtrls;

type
  TfrmParamAnalSintProc = class(TfrmSelProcessoMT)
    gbxTituloRelat: TGroupBox;
    edTituloRelat: TEdit;
    grpMesRef: TGroupBox;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    procedure FormCreate(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamAnalSintProc: TfrmParamAnalSintProc;

implementation

{$R *.DFM}

uses uSistema, uMensErro, fAguarde, uCtrlFuncoesRH;

procedure TfrmParamAnalSintProc.FormCreate(Sender: TObject);
var
  Ano, Mes, Dia: word;
begin
  inherited;
  IrPaginaResult := false;

  DecodeDate(Date, Ano, Mes, Dia);
  cmbMes.ItemIndex := Mes - 1;
  spedAno.Value := Ano;
  cmbMesChange(Sender);

  edDataAju1.Date := (Date - Round(365.25*10));
  edDataNot1.Date := (Date - Round(365.25*10));
  edDataEnc1.Date := (Date - Round(365.25*10));
end;

procedure TfrmParamAnalSintProc.cmbMesChange(Sender: TObject);
begin
  inherited;
  edTituloRelat.Text := 'Análise Sintética de Processos - ' +
    Trim(cmbMes.Items[cmbMes.ItemIndex]) + '/' + IntToStr(spedAno.Value);
end;

procedure TfrmParamAnalSintProc.bbtnConfirmarClick(Sender: TObject);
var
  sListaNumProcesso: string;
begin
  frmAguarde.Pos := 0;
  frmAguarde.Mostra('Análise Sintética dos Processos');
  inherited;
  frmAguarde.Update;
  if (CdsProcesso.IsEmpty) then
  begin
    frmAguarde.Apaga;
    MsgDlg('Nenhum processo foi encontrado com as características selecionadas.', 'Aviso',
      mtInformation, [mbOk,mbHelp], 0);
  end
  else
  begin
    frmAguarde.Update;
    sListaNumProcesso := '';
    repeat
      if (sListaNumProcesso = '') then
        sListaNumProcesso := CdsProcesso.FieldByName('NUMPROCTRAB').asString
      else
        sListaNumProcesso := sListaNumProcesso +','+ CdsProcesso.FieldByName('NUMPROCTRAB').asString;

      CdsProcesso.Next;
    until (CdsProcesso.EOF);

    frmAguarde.Update;

    // Passagem de parâmetros para o relatório
    Cmp_Padrao.ParamByName('ListaNumProcesso').asString := sListaNumProcesso;
    Cmp_Padrao.ParamByName('MesRef').asInteger := cmbMes.ItemIndex + 1;
    Cmp_Padrao.ParamByName('AnoRef').asInteger := spedAno.Value;
    Cmp_Padrao.ParamByName('TituloRelatorio').asString := edTituloRelat.Text;
  end;
end;

end.
