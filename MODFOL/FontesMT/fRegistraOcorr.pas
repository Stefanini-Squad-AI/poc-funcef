unit fRegistraOcorr;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, MAHlpBtn, StdCtrls,
  Buttons, TB97, ExtCtrls, Mask, wwdbedit, Db, DBTables, TREdit, wwdblook, Spin, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, wwdbdatetimepicker, CMDateTimePicker, MontaSelect, DBCtrls,
  DBClient, uCMClientDataSet, fSairAjuda, uCtrlTipOcMed, uCtrlRegOcorr;

type
  TfrmRegistraOcorr = class(TfrmSairAjuda)
    MontaSelectCID: TMontaSelect;
    CdsTipoOcorr: TCMClientDataSet;
    Label2: TLabel;
    gbxDatas: TGroupBox;
    Label3: TLabel;
    Label6: TLabel;
    dtedDataIni: TCMDateTimePicker;
    dtedDataFim: TCMDateTimePicker;
    Label5: TLabel;
    dblckTipoOcorr: TwwDBLookupCombo;
    Label1: TLabel;
    redLicenca: TRealEdit;
    Label4: TLabel;
    gbxExaminador: TGroupBox;
    Label7: TLabel;
    redAvaliacao: TRealEdit;
    GroupBox1: TGroupBox;
    edCODCID: TEdit;
    edCID: TEdit;
    bbtnBuscaCID: TBitBtn;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    edAvaliador: TEdit;
    bbtnProcMedico: TBitBtn;
    edNomePessoa: TEdit;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnProcMedicoClick(Sender: TObject);
    procedure bbtnBuscaCIDClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlTipOcMed: TCtrlTipOcMed;
    CtrlRegOcorr: TCtrlRegOcorr;

    IdExaminador: double;
  public
    IdPessoa: double;

    class procedure RegistrarOcorrenciaMedica(IdPessoa: double; Nome: string;
      DataAfast, DataRet: TDate);
  end;

var
  frmRegistraOcorr: TfrmRegistraOcorr;

implementation

uses uMensErro, uCtrlFuncoesRH, fProcuraPessoaDoc, uCtrlPadroes;

{$R *.DFM}

class procedure TfrmRegistraOcorr.RegistrarOcorrenciaMedica(IdPessoa: double; Nome: string;
  DataAfast, DataRet: TDate);
var
  frm: TfrmRegistraOcorr;
begin
  frm := TfrmRegistraOcorr.Create(Application);
  frm.edNomePessoa.Text := Nome;
  frm.IdPessoa := IdPessoa;
  frm.dtedDataIni.Date := DataAfast;
  frm.dtedDataFim.Date := DataRet;

  if (frm.dtedDataIni.Date > 0) and (frm.dtedDataFim.Date > 0) then
    frm.redLicenca.Value := frm.dtedDataFim.Date - frm.dtedDataIni.Date
  else
    frm.redLicenca.Value := 0;

  frm.ShowModal;
  frm.Free;
end;

procedure TfrmRegistraOcorr.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlRegOcorr := TCtrlRegOcorr.Create;
  CtrlRegOcorr.InitializeAs(Padroes);

  CtrlTipOcMed := TCtrlTipOcMed.Create;
  CtrlTipOcMed.InitializeAs(Padroes);

  frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);
  frmProcuraPessoaDoc.TabelaSubTipo := 'FORNSERV';
  frmProcuraPessoaDoc.FiltroSubTipo := 'FORNSERV.IDPESSOA = PESSOA.IDPESSOA';

  CdsTipoOcorr.Data := CtrlTipOcMed.ListTipoOcorrenciaMed;

  IdExaminador := 0;  
end;

procedure TfrmRegistraOcorr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlTipOcMed);
  FreeAndNil(CtrlRegOcorr);
  FreeAndNil(frmProcuraPessoaDoc);
  inherited;
end;

procedure TfrmRegistraOcorr.bbtnProcMedicoClick(Sender: TObject);
begin
  if (frmProcuraPessoaDoc.ShowModal = mrOk) then
  begin
    IdExaminador := StrToFloat(frmProcuraPessoaDoc.sIdPessoa);
    edAvaliador.Text := frmProcuraPessoaDoc.sNomePessoa;
  end;
end;

procedure TfrmRegistraOcorr.bbtnBuscaCIDClick(Sender: TObject);
begin
  MontaSelectCID.Executar;
  if (MontaSelectCID.RetornouValor) then
  begin
    edCODCID.Text := MontaSelectCID.ValoresChave[0];
    edCID.Text := MontaSelectCID.ValoresChave[1];
  end;
end;

procedure TfrmRegistraOcorr.bbtnConfirmarClick(Sender: TObject);
begin
  if (Trim(dblckTipoOcorr.Text) = '')  then
  begin
    MsgDlg('Informe o Tipo de Ocorrência.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dblckTipoOcorr.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (Trim(dtedDataIni.Text) = '')  then
  begin
    MsgDlg('Data de Afastamento não informada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dtedDataIni.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (Trim(dtedDataFim.Text) = '')  then
  begin
    MsgDlg('Data de Retorno não informada.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    dtedDataFim.SetFocus;
    ModalResult := mrNone;
    exit;
  end;

  if (CtrlRegOcorr.InserirOcorrencia(IdPessoa,
    CdsTipoOcorr.FieldByName('CODTIPOOCMED').asInteger, dtedDataIni.Date, dtedDataFim.Date,
    IdExaminador, edAvaliador.Text, edCODCID.Text, redLicenca.Value, redAvaliacao.Value)) then
    MsgDlg('Processo concluído com sucesso.', 'Informação', mtInformation, [mbOk,mbHelp], 0)
  else
    MsgDlg(CtrlRegOcorr.MessageInfo, 'Erro', mtError, [mbOk,mbHelp], 0);
end;

end.
