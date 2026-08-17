unit FDCTFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Buttons, CMProcuraSubTipo, wwdblook, wwdbdatetimepicker,
  CMDateTimePicker, StdCtrls, ExtCtrls, Spin, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, TB97Tlbr, TB97, uCtrlDCTF, Db, DBClient, uCMClientDataSet, uCtrlGfip,
  uFuncoesUteisIR;

type
  TfrmDCTFMT = class(TfrmSairAjuda)
    gbxAnoMesRef: TLabel;
    spnAno: TSpinEdit;
    rgDeclaracao: TLabel;
    cbDeclaracao: TComboBox;
    cbSituacao: TComboBox;
    rgSituacao: TLabel;
    cbTrimestre: TComboBox;
    rgTrimestreComp: TLabel;
    rgCred: TRadioGroup;
    rgDeclaracaoComplementar: TRadioGroup;
    rgRetifica: TRadioGroup;
    edtNatJuridica: TEdit;
    Label2: TLabel;
    rgPeriodoBase: TGroupBox;
    Label4: TLabel;
    dtInicio: TCMDateTimePicker;
    dtFim: TCMDateTimePicker;
    rgProdTerceiro: TRadioGroup;
    rgTrimestre: TRadioGroup;
    rgQualJuridica: TLabel;
    cbQualificacao: TComboBox;
    cbLucro: TComboBox;
    rgFormaLucro: TLabel;
    cbApuracao: TComboBox;
    rgApuracaoCred: TLabel;
    dblcCPF: TwwDBLookupCombo;
    rgCPF: TLabel;
    Presponsavel: TCMProcuraSubTipo;
    Label3: TLabel;
    PRepresentante: TCMProcuraSubTipo;
    Label1: TLabel;
    edtCNAE: TEdit;
    cbReducao: TComboBox;
    rgBalanco: TLabel;
    Label5: TLabel;
    edCaminho: TEdit;
    edCRCContador: TEdit;
    SpbCaminho: TSpeedButton;
    sdArqTexto: TSaveDialog;
    cdsCPF: TCMClientDataSet;
    rbtnGerar: TBitBtn;
    procedure edtCNAEKeyPress(Sender: TObject; var Key: Char);
    procedure SpbCaminhoClick(Sender: TObject);
    procedure rbtnGerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    Dia,Mes,Ano : Word;
    Dia1,Mes1,Ano1 : Word;
    DataIni, DataFim, DataIniHeader, DataFimHeader, DataOcorrencia : string;
    DCTF : TCtrlDCTF;
    GFIP : TCtrlGfip;
  public
    { Public declarations }
  end;

var
  frmDCTFMT: TfrmDCTFMT;

implementation

uses uSistema, uMensErro, uDataBase, DBaseDados;

{$R *.DFM}

procedure TfrmDCTFMT.edtCNAEKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not ((key in ['0'..'9']) or (key in [#9, #16, #27, #8])) then
     Begin
       key := #0;
     end;
end;

procedure TfrmDCTFMT.SpbCaminhoClick(Sender: TObject);
begin
  inherited;
  sdArqTexto.Execute;
  if Trim(sdArqTexto.FileName) <> '' then
     edCaminho.Text := sdArqTexto.FileName
  else
     edCaminho.Text := '';
end;

procedure TfrmDCTFMT.rbtnGerarClick(Sender: TObject);
begin
  inherited;
  if Trim(cbDeclaracao.Text) = '' then
     Begin
       MsgDlg('Por favor preencher a declaração.','Aviso',mtWarning,[mbOK],0);
       cbDeclaracao.SetFocus;
       exit;
     end
  else if Trim(cbSituacao.Text) = '' then
     Begin
       MsgDlg('Por favor preencher a situação.','Aviso',mtWarning,[mbOK],0);
       cbSituacao.SetFocus;
       exit;
     end
  else if Trim(cbTrimestre.Text) = '' then
     Begin
       MsgDlg('Por favor preencher o trimestre.','Aviso',mtWarning,[mbOK],0);
       cbTrimestre.SetFocus;
       exit;
     end
  else if Trim(dtInicio.Text) = '' then
     Begin
       MsgDlg('Por favor preencher a data inicial.','Aviso',mtWarning,[mbOK],0);
       dtInicio.SetFocus;
       exit;
     end
  else if Trim(dtFim.Text) = '' then
     Begin
       MsgDlg('Por favor preencher a data final.','Aviso',mtWarning,[mbOK],0);
       dtFim.SetFocus;
       exit;
     end
  else if Trim(edtNatJuridica.Text) = '' then
     Begin
       MsgDlg('Por favor preencher a natureza jurídica.','Aviso',mtWarning,[mbOK],0);
       edtNatJuridica.SetFocus;
       exit;
     end
  else if Trim(cbQualificacao.Text) = '' then
     Begin
       MsgDlg('Por favor preencher a qualificação pessoa jurídica.','Aviso',mtWarning,[mbOK],0);
       cbQualificacao.SetFocus;
       exit;
     end
  else if Trim(cbLucro.Text) = '' then
     Begin
       MsgDlg('Por favor preencher a forma de tributo do lucro.','Aviso',mtWarning,[mbOK],0);
       cbLucro.SetFocus;
       exit;
     end
  else if Trim(cbApuracao.Text) = '' then
     Begin
       MsgDlg('Por favor preencher a apuração do crédito presumido.','Aviso',mtWarning,[mbOK],0);
       cbApuracao.SetFocus;
       exit;
     end
  else if Trim(dblcCPF.Text) = '' then
     Begin
       MsgDlg('Por favor preencher o CPF.','Aviso',mtWarning,[mbOK],0);
       dblcCPF.SetFocus;
       exit;
     end
  else if Trim(Presponsavel.Text) = '' then
     Begin
       MsgDlg('Por favor preencher o responsável.','Aviso',mtWarning,[mbOK],0);
       Presponsavel.SetFocus;
       exit;
     end
  else if Trim(PRepresentante.Text) = '' then
     Begin
       MsgDlg('Por favor preencher o representante.','Aviso',mtWarning,[mbOK],0);
       PRepresentante.SetFocus;
       exit;
     end
  else if Trim(edtCNAE.Text) = '' then
     Begin
       MsgDlg('Por favor preencher o CNAE.','Aviso',mtWarning,[mbOK],0);
       edtCNAE.SetFocus;
       exit;
     end
  else if Trim(cbReducao.Text) = '' then
     Begin
       MsgDlg('Por favor preencher o balanço de redução.','Aviso',mtWarning,[mbOK],0);
       cbReducao.SetFocus;
       exit;
     end
  else if Trim(edCaminho.Text) = '' then
     Begin
       MsgDlg('Por favor preencher o caminho do arquivo a ser gerado.','Aviso',mtWarning,[mbOK],0);
       edCaminho.SetFocus;
       exit;
     end;

  //Data Base inicial
  DecodeDate(dtInicio.DateTime,Ano,Mes,Dia);
  Dataini := strZero(2, intTostr(Dia)) + strZero(2, intTostr(Mes));
  DataIniHeader := strZero(2, intTostr(Dia)) + strZero(2, intTostr(Mes)) + intTostr(Ano);

  //Data Base final
  DecodeDate(dtfim.DateTime,Ano,Mes,Dia);
  DataFim := strZero(2, intTostr(Dia)) + strZero(2, intTostr(Mes)); //+ intTostr(Ano);
  DataFimHeader := strZero(2, intTostr(Dia)) + strZero(2, intTostr(Mes)) + intTostr(Ano);

  //Se a situação for igual a zero deve ser preenchido com zeros
  if cbSituacao.itemindex = 0 then
     DataOcorrencia := '00000000'
  else
    Begin
      DecodeDate(dtFim.DateTime,Ano,Mes,Dia);
      DataOcorrencia := strZero(2, intTostr(Dia)) + strZero(2, intTostr(Mes)) + intTostr(Ano);
    end;

  DecodeDate(dtInicio.DateTime, Ano, Mes, Dia);
  DecodeDate(dtFim.DateTime, Ano1, Mes1, Dia1);

  try
    if not DCTF.GeraTXT(edCaminho.Text, Sistema.IdEmpresa, strToint(dblcCPF.LookupValue), Presponsavel.SubTipoReg.Id,
                        PRepresentante.SubTipoReg.Id, DataIni, DataFim, edCRCContador.Text, spnAno.Text, cbDeclaracao.Text,
                        DataIniHeader, DataFimHeader, DataOcorrencia, edtNatJuridica.text, edtCNAE.text, cbSituacao.ItemIndex,
                        cbTrimestre.ItemIndex,  rgRetifica.ItemIndex, cbQualificacao.ItemIndex,
                        cbLucro.ItemIndex, rgProdTerceiro.ItemIndex, rgCred.ItemIndex, cbApuracao.ItemIndex, cbReducao.ItemIndex, strZero(2, intTostr(Dia)) + '/' + strZero(2, intTostr(Mes)) + '/' + intTostr(Ano),
                        strZero(2, intTostr(Dia1)) + '/' + strZero(2, intTostr(Mes1)) + '/' + intTostr(Ano1), rgTrimestre.ItemIndex) then
       Begin
         MsgDlg('Erros impediram a geração.','Aviso',mtWarning,[mbOK],0);
         exit;
       end
    else
       MsgDlg('Arquivo gerado com sucesso.','Aviso',mtWarning,[mbOK],0);
  except
    Raise;
  end;
end;

procedure TfrmDCTFMT.FormCreate(Sender: TObject);
begin
  inherited;
  DCTF := TCtrlDCTF.Create;
  DCTF.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);

  GFIP := TCtrlGfip.Create;
  GFIP.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
  Sistema.AppRemoteServer,True,nil,nil,False);
  //lista os documentos
  cdsCPF.data := GFIP.ListDoc;
end;

procedure TfrmDCTFMT.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DCTF.free;
  GFIP.free;
end;

end.
