// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Jéssica Lana
// Data        :  05/03/2009
// Pendência   :  SOL 109421 KINTANA 496332
// Descrição   :  Alteração de gravação de arquivos de log na raiz do disco C:
// *****************************************************************************

unit FExecGeraXMLSPC;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, uCmSqlParams, Db, DBClient, uCMClientDataSet, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Grids, Wwdbigrd, Wwdbgrid, TREdit, wwdbdatetimepicker, CMDateTimePicker,
  uCtrlGeraXML, uSistema, uCtrlPadroes, BfDialogs, BrowseFolder,
  uProcuraDir, uVerificaPreenchimento, fProgresso;

type
  TfrmExecGeraXMLSPC = class(TfrmOkCancelar)
    cdsPatro: TCMClientDataSet;
    sqlPatro: TCMSqlParams;
    cdsPlano: TCMClientDataSet;
    sqlPlano: TCMSqlParams;
    cdsImovel: TCMClientDataSet;
    sqlImovel: TCMSqlParams;
    dsPlano: TDataSource;
    dbgPlano: TwwDBGrid;
    cdsPlanoNOME: TStringField;
    cdsPlanoCODIGOSPC: TStringField;
    cdsPlanoPERCPART: TFloatField;
    edtDataReferencia: TCMDateTimePicker;
    Label1: TLabel;
    edtCarteira: TEdit;
    Label2: TLabel;
    edtPatrimonio: TRealEdit;
    edtTributos: TRealEdit;
    edtValorReceber: TRealEdit;
    edtValorPagar: TRealEdit;
    edtAtivos: TRealEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dlgCaminho: TProcuraDirDlg;
    Label8: TLabel;
    pnlPasta: TPanel;
    lblDiretorio: TLabel;
    btnEscolheDir: TBitBtn;
    cdsPatroCNPJCPF: TStringField;
    cdsPatroNOME: TStringField;
    cdsPatroCODCNTCOR: TMemoField;
    cdsPatroNOMEGESTOR: TStringField;
    cdsPatroCNPJGESTOR: TStringField;
    cdsPatroNOMECUSTODIANTE: TStringField;
    cdsPatroCNPJCUSTODIANTE: TStringField;
    cdsPatroPATLIQ: TFloatField;
    cdsPatroTRIBUTOS: TFloatField;
    cdsPatroVALORATIVOS: TFloatField;
    cdsPatroVALORRECEBER: TFloatField;
    cdsPatroVALORPAGAR: TFloatField;
    cdsImovelIMOLOGRADOURO: TStringField;
    cdsImovelIMONUMERO: TStringField;
    cdsImovelIMONOME: TStringField;
    cdsImovelCIDADE: TStringField;
    cdsImovelCODESTADO: TStringField;
    cdsImovelIMOCEP: TStringField;
    cdsImovelIMONOME_1: TStringField;
    cdsImovelPERCPART: TFloatField;
    cdsImovelVALORCONTABIL: TFloatField;
    cdsImovelJUSTIFICATIVA: TFloatField;
    cdsImovelIMOVLRREAVAL: TFloatField;
    cdsImovelIMODATAREAVAL: TDateTimeField;
    cdsImovelTPAVALIADOR: TStringField;
    cdsImovelCNPJCPFAVALIADOR: TStringField;
    cdsImovelALUGUELCONTRATADO: TFloatField;
    cdsImovelALUGUELATRASADO: TFloatField;
    cdsImovelOPCAORECOMPRA: TStringField;
    cdsImovelDTRECOMPRA: TStringField;
    cdsImovelTIPOIMOVEL: TFloatField;
    cdsImovelQUESTJUR: TStringField;
    cdsImovelTIPOUSO: TFloatField;
    cdsImovelMATRICULA: TStringField;
    cdsImovelCNPJEMP: TStringField;
    cdsImovelIDIMOVEL: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure btnEscolheDirClick(Sender: TObject);

  private
    { Private declarations }

    procedure Progresso (vParams: array of variant);
    function VerificaPreenchimento : boolean;
  public
    { Public declarations }
    CtrlGeraXML : TCtrlGeraXML;

    sNomeBilhete : String;
  end;

var
  frmExecGeraXMLSPC: TfrmExecGeraXMLSPC;

implementation

{$R *.DFM}

uses uMensErro;

procedure TfrmExecGeraXMLSPC.FormCreate(Sender: TObject);
begin
   inherited;
   //Jéssica SOL 109421 KINTANA 496332
   lblDiretorio.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);
   pnlPasta.Caption:= Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa);

   CtrlGeraXML := TCtrlGeraXML.Create(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, Sistema.IdEspAcesso, Sistema.UsaPlanoPatro);
   CtrlGeraXML.InitializeAs( Padroes );

   CtrlGeraXML.cdsDadosPatro   := cdsPatro;
   CtrlGeraXML.cdsDadosImovel  := cdsImovel;
   CtrlGeraXML.cdsDadosPlano   := cdsPlano;

   edtDataReferencia.Date      := Date;
   cdsPlano.Data := CtrlGeraXML.LookupDadosPatro;
   CtrlGeraXML.Progresso := Progresso;
end;



procedure TfrmExecGeraXMLSPC.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   FreeAndNil ( CtrlGeraXML );
   inherited;
end;



procedure TfrmExecGeraXMLSPC.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;

   if not VerificaPreenchimento then Exit;

   if MsgDlg('Confirma gerar o arquivo?','InvestImob', mtConfirmation, [mbYes, mbNo],0) = mrYes then
   begin

      cdsPatro.Data := CtrlGeraXML.LookupDadosPatroXML(edtCarteira.Text,
                                                       edtDataReferencia.Date,
                                                       edtPatrimonio.Value,
                                                       edtTributos.Value,
                                                       edtAtivos.Value,
                                                       edtValorReceber.Value,
                                                       edtValorPagar.Value);

      cdsImovel.Data := CtrlGeraXML.LookupDadosImoveisXML(edtDataReferencia.Date);

      CtrlGeraXML.CreateThreadProgresso;
      frmProgresso.MostraFormProgresso('Gerando dados XML...');

      if not CtrlGeraXML.GeraArquivoXML(pnlPasta.Caption,edtCarteira.Text, edtDataReferencia.Date, Sistema.NomeFantasia, sNomeBilhete) then
         MsgDlg(CtrlGeraXML.MessageInfo, 'InvestImob', mtInformation, [mbOK],0)
      else
         MsgDlg('Arquivo gerado com sucesso.', 'InvestImob', mtInformation, [mbOK],0);

      frmProgresso.EscondeFormProgresso;
      CtrlGeraXML.FreeThreadProgresso;
   end;
end;

procedure TfrmExecGeraXMLSPC.btnEscolheDirClick(Sender: TObject);
begin
   inherited;
   dlgCaminho.Directory := pnlPasta.Caption;
   if dlgCaminho.Execute then pnlPasta.Caption := dlgCaminho.Directory + '\';
end;



function TfrmExecGeraXMLSPC.VerificaPreenchimento: boolean;
begin
   Result := True;

   try
      if edtDataReferencia.Text = '' then
         raise EValidacao.CreateVal('Informe a data de referencia', edtDataReferencia);

   except
      on ev : EValidacao do begin
         if ev.Show then MsgDlg(ev.message, 'Aviso', mtWarning, [mbOk], 0);
         if ev.Control.CanFocus then ev.Control.SetFocus;
         Result := False;
      end;
   end;

end;

procedure TfrmExecGeraXMLSPC.Progresso(vParams: array of variant);
begin
  if (vParams[1] = 1) and (High(vParams) = 5) then
       frmProgresso.MostraFormProgresso( vParams[5] )
  else frmProgresso.AndaFormProgresso(vParams[1], vParams[2]);
end;



end.
