// Alterações
{*******************************************************************************
Analista.: Darivaldo Alencar
Pendencia: SOL 269619 ppm 1314059
Data.....: 04/03/2016
Descrição: Corrigido regra na IN1343
********************************************************************************
Analista.: Vinicius Eduardo Nascimento Maciel
Pendencia: SOL 170987 KTN 1528710
Data.....: 20/01/2012
Rotina...: GeraDirf e Tela
Descrição: Foi acrescentado a passagem do Plano Odontológico para a geração do
           arquivo.
Dfm......: Foram adicionados os componentes: pSubTipoPlanoOdonto
           Foram alteradas as propriedades: Height(tela) para 529,
           Caption(pSubTipoPlanoSaude) e foi mudada a propriedade top de
           diversos componentes.
********************************************************************************
Analista.: Flavio Dias
Pendencia:
Data.....: 14/02/2007
Rotina...:
Descrição: Acrescentar parâmetro EdPessoanotin nas Funções GeraDirf e ListaGeraDirf,
           para retirar da query da DIRF as pessoas do edit.
********************************************************************************}
unit FGeraDIRFMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, ComCtrls, StdCtrls, TREdit, ExtCtrls, CMProcuraSubTipo,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, uCtrlGeraDirf,
  uCtrlGeraDirf2011;

type
  TfrmGeraDIRFMT = class(TfrmSairAjuda)
    PSubTipoResponsavel: TCMProcuraSubTipo;
    rgSistema: TRadioGroup;
    gbNatureza: TGroupBox;
    edtData: TEdit;
    UpDown1: TUpDown;
    GroupBox1: TGroupBox;
    edtDataRef: TEdit;
    UpDown2: TUpDown;
    cbPesExi: TCheckBox;
    grpBoxImport: TGroupBox;
    Label1: TLabel;
    edtImport: TEdit;
    btbtnSeleciona: TBitBtn;
    gbValor: TGroupBox;
    rValorMinimo: TRealEdit;
    rdgrpTipoArquivo: TRadioGroup;
    rgNaturDeclar: TRadioGroup;
    prgBarAtuFluxo: TProgressBar;
    lblMensagem: TLabel;
    svDirf: TSaveDialog;
    opDirf: TOpenDialog;
    chckBoxRetencao: TCheckBox;
    bbtnGera: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    chckboxImporta: TCheckBox;
    chkParticipMantido: TCheckBox;
    edPessoanotin: TEdit;
    Label4: TLabel;
    gbNumRecibo: TGroupBox;
    edNumeroRecibo: TEdit;
    rValorIndenizacao: TRealEdit;
    lblAnual: TLabel;
    lblIndenizacao: TLabel;
    pSubTipoPlanoSaude: TCMProcuraSubTipo;
    Label5: TLabel;
    edFiltroCPF: TEdit;
    pSubTipoPlanoOdonto: TCMProcuraSubTipo;
    procedure cbPesExiClick(Sender: TObject);
    procedure chckboxImportaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnGeraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btbtnSelecionaClick(Sender: TObject);
    procedure rdgrpTipoArquivoClick(Sender: TObject);
    procedure rgSistemaClick(Sender: TObject);

  private
    CtrlGeraDirf : TCtrlGeraDirf;
    CtrlGeraDirfNova : TCtrlGeraDirfNova;
    Procedure MensProcessaDirf(msg : String);
    Procedure ExecutaDirf(const pAno,pAnoRef : String);
    Procedure ExecutaDirfAnosAnteriores(const pAno,pAnoRef : String);
    Procedure ExecutaDirfNova(const pAno,pAnoRef : String);
    procedure AcertaStatusNumeroRecibo(const bStatus: Boolean);
  public

  end;

var
  frmGeraDIRFMT: TfrmGeraDIRFMT;
  sCamImporta              : string;
  sNomeArquivo             : string;
  sAno                     : string;
  sAnoRef                  : String;

implementation

uses uSistema, uMensErro, uDataBase, DBaseDados;

{$R *.DFM}

procedure TfrmGeraDIRFMT.cbPesExiClick(Sender: TObject);
begin
  inherited;
  if chckboxImporta.Checked then
    grpBoxImport.Enabled := true
  else grpBoxImport.Enabled := false;
  if not(chckboxImporta.Checked) then
     Begin
       edtImport.text := '';
     end;
end;

procedure TfrmGeraDIRFMT.chckboxImportaClick(Sender: TObject);
begin
  inherited;
  if chckboxImporta.Checked then
    grpBoxImport.Enabled := true
  else grpBoxImport.Enabled := false;
  if not(chckboxImporta.Checked) then
    Begin
      edtImport.text := '';
    end;
end;

procedure TfrmGeraDIRFMT.FormActivate(Sender: TObject);
begin
  inherited;
  UpDown1.position := StrToInt(Copy(DateToStr(Date),7,4))-1;
  UpDown2.position := StrToInt(Copy(DateToStr(Date),7,4));
  lblMensagem.Caption := '';
end;

procedure TfrmGeraDIRFMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(CtrlGeraDirf);
  FreeAndNil(CtrlGeraDirfNova);
end;

procedure TfrmGeraDIRFMT.bbtnGeraClick(Sender: TObject);
begin
  inherited;
  sAno    := Trim(edtData.text);
  sAnoRef := Trim(edtDataRef.text);
  If (rgSistema.ItemIndex = -1) then
  begin
    MsgDlg('É necessário informar o Sistema!',
           'Informação',mtinformation,[mbOk],0);
    rgSistema.SetFocus;
    exit;
  end;
  If (rdgrpTipoArquivo.ItemIndex = 1) and (edNumeroRecibo.text = '') then
  begin
    MsgDlg('É necessário informar o Numero do Recibo no caso de Declaração Retificadora!',
           'Informação',mtinformation,[mbOk],0);
    edNumeroRecibo.SetFocus;
    exit;
  end;
  if svDirf.execute then
     begin
       CtrlGeraDirfNova.pAno:= edtData.Text; // darivaldo SOL 269619 ppm 1314059
       ExecutaDirf(sAno,sAnoRef)
     end;
end;

Procedure TFrmGeraDirfMT.ExecutaDirf(const pAno,pAnoRef : String);
begin
  If sAno <= '2009' then
    ExecutaDirfAnosAnteriores(pAno,pAnoRef)
  else
    ExecutaDirfNova(pAno,pAnoRef);
end;

procedure TFrmGeraDirfMT.ExecutaDirfNova(const pAno,pAnoRef : String);
var sDec : Char;
begin
  sDec := DecimalSeparator;
  DecimalSeparator := '.';
  Try
    sNomeArquivo := svDirf.filename;
    frmGeraDIRFMT.caption := 'Geração do Dirf - Aguarde o Processamento.';

    if not CtrlGeraDirfNova.GeraDirf(Sistema.IdEmpresa,
                                     PSubTipoResponsavel.SubTipoReg.Id,
                                     rdgrpTipoArquivo.ItemIndex,
                                     rgSistema.ItemIndex,
                                     rgNaturDeclar.ItemIndex,
                                     '01/01/'+pAno,
                                     '31/12/'+pAno,
                                     edtImport.text,
                                     sNomeArquivo,
                                     sCamImporta,
                                     pAno,
                                     pAnoRef,
                                     chckBoxRetencao.Checked,
                                     chckboxImporta.checked,
                                     cbPesExi.Checked,
                                     rValorMinimo.value,
                                     chkParticipMantido.Checked,
                                     edPessoanotin.Text,
                                     edNumeroRecibo.Text,
                                     rValorIndenizacao.value,
                                     pSubTipoPlanoSaude.SubTipoReg.Id,
                                     pSubTipoPlanoOdonto.SubTipoReg.Id,//Vinicius Maciel SOL 170987 KTN 1528710
                                     edFiltroCPF.Text) then
       MsgDlg(CtrlGeraDirfNova.MessageInfo,'Erro',mtError,[mbOk],0)
    else
       MsgDlg(CtrlGeraDirfNova.MessageInfo,'Informação',mtinformation,[mbOk],0);
    frmGeraDIRFMT.caption := 'Geração do Dirf';
  Finally
    DecimalSeparator := sDec;
  end;
end;


procedure TfrmGeraDIRFMT.MensProcessaDirf(msg: String);
begin
  if msg <> '*' then
    lblMensagem.Caption := msg;
end;

procedure TfrmGeraDIRFMT.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGeraDirf := TCtrlGeraDirf.Create;
  ctrlGeraDirf.Initialize(DtmBaseDados.dbBaseDados,
                          True,
                          Sistema.ConnectionType,
                          Sistema.ConnectionSide,
                          Sistema.AppRemoteServer,
                          False,
                          MensProcessaDirf);
  CtrlGeraDirfNova := TCtrlGeraDirfNova.Create;
  CtrlGeraDirfNova.Initialize(DtmBaseDados.dbBaseDados,
                              True,
                              Sistema.ConnectionType,
                              Sistema.ConnectionSide,
                              Sistema.AppRemoteServer,
                              False,
                              MensProcessaDirf);
  AcertaStatusNumeroRecibo(False);
end;


procedure TfrmGeraDIRFMT.btbtnSelecionaClick(Sender: TObject);
var
stemp : string;
i : integer;
bbarra : boolean;
begin
   edtImport.text:= '';
   bbarra:=false;
   stemp := '';
      if opDirf.Execute then
         stemp:= opDirf.FileName;
      if trim(stemp)<> '' then
         for i:= length(stemp)downto 1 do
           Begin
             if stemp[i]='\' then
               bbarra:=true;
             if not (bbarra) then
               edtImport.text := stemp[i]+edtImport.text;
           end;
   sCamImporta := stemp;
end;

procedure TfrmGeraDIRFMT.ExecutaDirfAnosAnteriores(const pAno,pAnoRef: String);
var sDec : Char;
begin
  sDec := DecimalSeparator;
  DecimalSeparator := '.';
  Try
    sNomeArquivo := svDirf.filename;
    frmGeraDIRFMT.caption := 'Geração do Dirf - Aguarde o Processamento.';

    if not CtrlGeraDirf.GeraDirf(Sistema.IdEmpresa,
                                 PSubTipoResponsavel.SubTipoReg.Id,
                                 rdgrpTipoArquivo.ItemIndex,
                                 rgSistema.ItemIndex,
                                 rgNaturDeclar.ItemIndex,
                                 '01/01/'+pAno,
                                 '31/12/'+pAno,
                                 edtImport.text,
                                 sNomeArquivo,
                                 sCamImporta,
                                 pAno,
                                 pAnoRef,
                                 chckBoxRetencao.Checked,
                                 chckboxImporta.checked,
                                 cbPesExi.Checked,
                                 rValorMinimo.value,
                                 chkParticipMantido.Checked,
                                 edPessoanotin.Text) then
       MsgDlg(CtrlGeraDirf.MessageInfo,'Erro',mtError,[mbOk],0)
    else
       MsgDlg(CtrlGeraDirf.MessageInfo,'Informação',mtinformation,[mbOk],0);
    frmGeraDIRFMT.caption := 'Geração do Dirf';
  Finally
    DecimalSeparator := sDec;
  end;
end;

procedure TfrmGeraDIRFMT.rdgrpTipoArquivoClick(Sender: TObject);
begin
  inherited;
  AcertaStatusNumeroRecibo(rdgrpTipoArquivo.ItemIndex = 1);
end;

procedure TFrmGeraDIRFMT.AcertaStatusNumeroRecibo(const bStatus : Boolean);
begin
  gbNumRecibo.enabled := bStatus;
  If Not gbNumRecibo.enabled then
  begin
    edNumeroRecibo.Text := '';
    edNumeroRecibo.Color := clInactiveCaption;
  end
  else
    edNumeroRecibo.Color := clWindow;
end;

procedure TfrmGeraDIRFMT.rgSistemaClick(Sender: TObject);
begin
  inherited;
  rValorIndenizacao.enabled := (rgSistema.ItemIndex = 0);
end;

end.
