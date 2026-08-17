unit fParamAnalSintProc;

interface
     
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelProcessoMT,
  DBTables, Db, Wwdatsrc, MAHlpBtn, StdCtrls, Spin, wwdblook, ExtCtrls, TEdNum, TB97, TREdit,
  TB97Tlbr, IvDictio, IvMulti, ComCtrls, checklst, Buttons, wwdbdatetimepicker, uCmSqlParams,
  CMDateTimePicker, IvEMulti, DBClient, uCMClientDataSet, CmParamReport, ColorCheckListBox;

type
  TfrmParamAnalSintProc = class(TfrmSelProcessoMT)
    grpMesRef: TGroupBox;
    gbxTituloRelat: TGroupBox;
    edTituloRelat: TEdit;
    cmbMes: TComboBox;
    spedAno: TSpinEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cmbMesChange(Sender: TObject);
  end;

var
  frmParamAnalSintProc: TfrmParamAnalSintProc;

implementation

uses uSistema, uMensErro, fAguarde, uCtrlFuncoesRH;

{$R *.DFM}

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
    ModalResult := mrNone;  
    exit;
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
