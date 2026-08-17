unit FPrincipal;

{--------------------------------------------------------------------------------------------------
Rotina..........:
N. SIG..........: WO10578
Data............: 09/05/2024
Responsável.....: Helen V Bianchi
Descrição.......: Adicionado o Status do contrato
--------------------------------------------------------------------------------------------------
N.  WO..........: WO10499
Data............: 10/05/2024
Responsável.....: Helen V Bianchi
Descrição.......: Retirar a tela de alerta de medição de contrato da abertura automática.
                  Excluir o menu Alerta de Medição.
----------------------------------------------------------------------------------------------------
N. WO...........: WO7622
Data............: 02/02/2024
Responsável.....: Helen V Bianchi
Descrição.......: Criação da funcionalidade Cadastro -> Contrato x Usuários.
----------------------------------------------------------------------------------------------------
N. SIG..........: 88476
Data............: 11/11/2020
Responsável.....: Ewerton Beltramini
Descrição.......: Alteração da descrição no menu e criação de novo Form (frmCadAditamentoMTDel ).
--------------------------------------------------------------------------------
Rotina..........: mnu
Nº SOL..........: 218909.16724
N. PPM..........: 588170
Data............: 20/02/2015
Responsável.....: Felipe A. Santos
Descrição.......: Criação da funcionalidade Consultas -> Alerta de Medição de Contratos.
-------------------------------------------------------------------------------
Rotina......: AppPadraoShowParamReportPadrao
N. Sol......: 222290-16959
N. PPM .....: 670297
Data........: 15/02/2012
Responsável.: Edilaine Ferraresi
Melhoria....: contador para total de registros por tipo de aditamento
--------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: mnu
Nº SOL......: 142171
Nº KINTANA..: 913629
Data........: 12/08/2011
Responsável.: Vinicius Eduardo Nascimento Maciel
Descrição...: Adicionado item de menu para cadastro de alçadas.
-------------------------------------------------------------------------------------------------- }
{-------------------------------------------------------------------------------
Rotina......: Item no Menu Alteração de Data Venc. AP
Nº SOL......: 65757
Nº KINTANA..: 523339
Data........: 06/04/2011
Responsável.: Helen V. Bianchi
Descrição...: Rotina para Alteração da Dt Vencimento de uma Ap Já Bloqueada.
--------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 99155
Nº KINTANA..: 495508
Data........: 02/09/2010
Responsável.: Thaise Amaral Martins
Descrição...: Create no form dmtRelatContatoAnalitico (relatório de Contratos
              Analitico) no AppPadrao.
--------------------------------------------------------------------------------
Rotina:            mnuAlteracaoEncerramentoClick
Nº SOL:            120379
Nº KINTANA         575054
Data da Alteração: 01/02/2010
Responsável:       Ricardo A.
Descrição:         Adicionado item de menu para Alteração de Encerramento
--------------------------------------------------------------------------------
Rotina..........: mnuQualificacaoClick
N. Sol..........: 120378
N. Kintana......: 575744
Data............: 08/12/2009
Responsável.....: Marilza Colpani
Descrição.......: Criação de um item de menu
-------------------------------------------------------------------------------}


interface

Uses  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMPrincipal, Menus, Wwintl, ExtCtrls, Buttons, ComCtrls, TB97,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Mask, wwdbedit,
  DBCtrls, TB97Tlwn, TB97Tlbr, TB97Ctls, IvDictio, IvAMulti, IvBinDic,
  IvMulti, IvEMulti, CorreioCM, fcLabel, AppEvnts, StdActns, ActnList,
  ImgList, fcStatusBar, CMApplicationEvents, SConnect, MConnect, DBClient,
  uCmSqlParams, uCMClientDataSet, uCtrlParamIntegra, uCMTypes, uResource,
  CMNetUsers, uCtrlCtrlParcelaMedicao, wwstorep;

type

  TfrmPrincipal = class(TfrmCMPrincipal)
    mnuCadastrodeContratos1: TMenuItem;
    mnuObjetoContratual1: TMenuItem;
    mnuItemContratual1: TMenuItem;
    mnuObjetoxItemContratual1: TMenuItem;
    mnuObjetoxItem1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    qryIntegraContab: TwwQuery;
    qryIntegraContabMASCARA: TStringField;
    qryIntegraContabPLANO: TFloatField;
    qryIntegraContabPACESTORNA: TStringField;
    Operao1: TMenuItem;
    mnuMedicao1: TMenuItem;
    mnuGeracaoContrato1: TMenuItem;
    mnuResponsvel1: TMenuItem;
    mnuProjetos1: TMenuItem;
    mnuConsultaContratos: TMenuItem;
    mnuImagensdoContrato1: TMenuItem;
    mnuCliente1: TMenuItem;
    mnuFornecedor1: TMenuItem;
    mnuUsurioxContratos1: TMenuItem;
    mnuVencimentosContratos: TMenuItem;
    mnuContratoOriginal1: TMenuItem;
    NotaFiscal1: TMenuItem;
    mnuModeloNF: TMenuItem;
    mnuImpressaoNF: TMenuItem;
    N1: TMenuItem;
    mnuCorrecoes: TMenuItem;
    mnuReferencias: TMenuItem;
    mnuValores: TMenuItem;
    mnuQualificacao: TMenuItem;
    spAux: TCMSqlParams;
    N2: TMenuItem;
    CancelamentodeEmisso1: TMenuItem;
    N5: TMenuItem;
    mnuParamAditamento: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    mnuExcluiParcela: TMenuItem;
    N8: TMenuItem;
    miReajustes: TMenuItem;
    LancamentoOramento: TMenuItem;
    mnuOperacaoOrcamentaria: TMenuItem;
    mnuAltAditamento: TMenuItem;
    mnuAlteracaoEncerramento: TMenuItem;
    mnuAltDtVencAP1: TMenuItem;
    mnuCadastrodeAlcadas: TMenuItem;
    mnuContratoXUsurios1: TMenuItem;
    procedure mnuCadastrodeContratos1Click(Sender: TObject);
    procedure mnuObjetoContratual1Click(Sender: TObject);
    procedure mnuItemContratual1Click(Sender: TObject);
    procedure mnuObjetoxItemContratual1Click(Sender: TObject);
    procedure mnuObjetoxItem1Click(Sender: TObject);
    procedure mnuMedicao1Click(Sender: TObject);
    procedure mnuGeracaoContrato1Click(Sender: TObject);
    procedure mnuResponsvel1Click(Sender: TObject);
    procedure nmuConfigParametrosClick(Sender: TObject);
    procedure mnuConsultaContratosClick(Sender: TObject);
    procedure mnuImagensdoContrato1Click(Sender: TObject);
    procedure mnuCliente1Click(Sender: TObject);
    procedure mnuFornecedor1Click(Sender: TObject);
    procedure mnuUsurioxContratos1Click(Sender: TObject);
    procedure mnuVencimentosContratosClick(Sender: TObject);
    procedure mnuContratoOriginal1Click(Sender: TObject);
    procedure AppPadraoAfterLogin(Sender: TObject);
    procedure AppPadraoCreateFormReports(Sender: TObject);
    procedure mnuImpressaoNFClick(Sender: TObject);
    procedure mnuCorrecoesClick(Sender: TObject);
    procedure mnuQualificacaoClick(Sender: TObject);
    procedure mnuValoresClick(Sender: TObject);
    procedure mnuModeloNFClick(Sender: TObject);
    procedure CancelamentodeEmisso1Click(Sender: TObject);
    procedure AppPadraoPrintReportPadrao(sender: TObject;
      IdReports: Integer; sFileName: String; var Printed: Boolean);
    procedure AppPadraoConfigReportPadrao(liIdReports, liOrigemCm: Integer;
      DesReport: TObject; var Config: Boolean);
    procedure mnuParamAditamentoClick(Sender: TObject);
    procedure mnuExcluiParcelaClick(Sender: TObject);
    procedure miReajustesClick(Sender: TObject);
    procedure LancamentoOramentoClick(Sender: TObject);
    procedure mnuOperacaoOrcamentariaClick(Sender: TObject);
    procedure mnuAltAditamentoClick(Sender: TObject);
    procedure mnuAlteracaoEncerramentoClick(Sender: TObject);
    procedure mnuAltDtVencAP1Click(Sender: TObject);
    procedure mnuCadastrodeAlcadasClick(Sender: TObject);
    procedure AppPadraoShowParamReportPadrao(sender: TObject;
      IdReports: Integer; var sParams: String; var PrintReport: Boolean);
	procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure mnuAlertaMedicaoClick(Sender: TObject);
    procedure mnuContratoXUsurios1Click(Sender: TObject);
  private
    { Private declarations }
    FCtrlCtrlParcelaMedicao : TCtrlCtrlParcelaMedicao; // Felipe A. Santos SOL 218909/16724 PPM 588170

    function  ExibeReajuste: Boolean;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
    dMS, uMensErro, uDataBase, DBaseDados, uSistema, fTelaAut,
    FCadForne,FCadCliente, FCadContratoOrig, FImpressaoNotas,
    FCadCorrecoesContratuaisMT, uCtrlReferenciaContr,
    uCtrlVlrRefContr, uCtrlCorrecoesContratuais,
    FAvisoContratosCorrecaoMT, FConsultaAltTabMT, FCadServProdMT,
    FCadItemContratualMT, FCadServProdXItemMT, FCadReferenciaContrMT,
    FCadVlrReferenciaMT, FCadUsuXContrMT, FCadServProdXItemContrMT, FCadResponsavelMT, FCancelaNFMT,
    FCadContratoMT, FMedicaoContratosMT, FGeracaoContratoMT,
    FCadParamContratoMT, FAvisoVencContrMT, uCtrlRptContrato,
    FConsultaContrOrigMT, FConsultaContratosMT, FCadModeloNFMT, FImpNFMT,
    fCadParamAditamentoMT, DRelatoriosContrato,
    DRelatContatoAnalitico,
    fExcluiParcelaMT,
    fCadImgagensXcontrato, FExecLancaOrcamento, FExecApuracaoOrc,
    FAltAditamentoMT, FCadEncerramento, FRelatContratosAnalitico, FOkCancelar,
    FAlteraVencAP, FCadAlcadasMT, FAlertaMedicaoMT,
    FParamRelAditamentos, FCadContrXUsuMT;          // edilaine - SOL 222290-16959 / PPM 670297

{$R *.DFM}

procedure TfrmPrincipal.mnuCadastrodeContratos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadContratoMT, TfrmCadContratoMT, False);
end;

procedure TfrmPrincipal.mnuObjetoContratual1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadServProdMT,TfrmCadServProdMT,False);
end;

procedure TfrmPrincipal.mnuItemContratual1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadItemContratualMT,TfrmCadItemContratualMT,False);
end;

procedure TfrmPrincipal.mnuObjetoxItemContratual1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadServProdXItemContrMT, TfrmCadServProdXItemContrMT, False);
end;

procedure TfrmPrincipal.mnuObjetoxItem1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadServProdXItemMT, TfrmCadServProdXItemMT, False);
end;

procedure TfrmPrincipal.mnuMedicao1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmMedicaoContratosMT, TfrmMedicaoContratosMT, False);
end;

procedure TfrmPrincipal.mnuGeracaoContrato1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmGeracaoContratoMT, TfrmGeracaoContratoMT, False);
end;

procedure TfrmPrincipal.mnuResponsvel1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadResponsavelMT, TfrmCadResponsavelMT, False);
end;

procedure TfrmPrincipal.nmuConfigParametrosClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadParamContratoMT, TfrmCadParamContratoMT, False);
end;

procedure TfrmPrincipal.mnuConsultaContratosClick(Sender: TObject);
begin
   inherited;

   AbrirForm(frmConsultaContratosMT, TfrmConsultaContratosMT, False);
end;

procedure TfrmPrincipal.mnuImagensdoContrato1Click(Sender: TObject);
begin
   inherited;
   //início - andre tavares - pendência 17275 - 25/08/2004
   AbrirForm(FrmCadImgagensXcontrato, TFrmCadImgagensXcontrato, False);
   //fim - andre tavares - pendência 17275 - 25/08/2004
end;

procedure TfrmPrincipal.mnuCliente1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadCliente, TfrmCadCliente, False);
end;

procedure TfrmPrincipal.mnuFornecedor1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadForne, TfrmCadForne, False);
end;

procedure TfrmPrincipal.mnuUsurioxContratos1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadUsuXContrMT, TfrmCadUsuXContrMT, False);
end;

procedure TfrmPrincipal.mnuVencimentosContratosClick(Sender: TObject);
begin
   inherited;    
   AbrirForm(frmAvisoVencMT, TfrmAvisoVencMT, False);
end;

procedure TfrmPrincipal.mnuContratoOriginal1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCadContratoOrig, TfrmCadContratoOrig, False);
end;

procedure TfrmPrincipal.AppPadraoAfterLogin(Sender: TObject);
var cdsAux,
    cdsAux2 // Felipe A. Santos SOL 218909/16724 PPM 588170 
    : TCMClientDataSet;
begin
  inherited;
  if Sistema.FezLogin then begin
     if Sistema.MudouEmpresa then begin
        ParamIntegra.GetParams(Sistema.IdEmpresa, 0, 'INTEGRACONTAB', 'PARAMCAP', tiCAP);

        dtmMS.MS_Objeto.Filtro.Add('O.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
        dtmMS.MS_Item.Filtro.Add('I.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));
     end;

     //---------------------------------------------------------------------
     //Exibe Tela de Aviso de Vencimento de Contratos
     //---------------------------------------------------------------------
     try
        //WO10499 - Helen V Bianchi - Inicio
        {
        // Felipe A. Santos SOL 218909/16724 PPM 588170 - início
        cdsAux2 := TCMClientDataSet.Create(nil);
        cdsAux2.Data := FCtrlCtrlParcelaMedicao.ListContratosParaMedicao;

        cdsAux2.First;
        while not(cdsAux2.Eof) do
        begin
          if FCtrlCtrlParcelaMedicao.ExibeAlerta(cdsAux2.FieldByName('AVISOMEDICAO').AsFloat,
                                                 cdsAux2.FieldByName('VENCIMENTO').AsDateTime) then
          begin
             AbrirForm(frmAlertaMedicaoMT, TfrmAlertaMedicaoMT, False);
             Break;
          end;

          CdsAux2.Next;
        end;
        // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim  }
        //WO10499 - Helen V Bianchi - Fim
        cdsAux := TCMClientDataSet.Create(nil);
        spAux.ClientDataSet := cdsAux;
        
        spAux.SQL.Text:='SELECT '+
                        //WO10578 - Helen V Bianchi - Inicio
                        ' decode(flgfimcontrato, ''E'', ''Encerrado'',  '+
                        '     decode(nvl(flgfase_encerramento, ''N''), ''S'', ''Em Encerramento'','+
                        '     decode(nvl(flgrenovacao, ''N''), ''S'', ''Em Renovação'','+
                        '     decode(flgfimcontrato, ''N'', ''Em Aberto'', ''S'', ''Vigente'', ''A'', '+
                        '     ''Aprovado'', ''R'', ''Recusado'',  ''X'', ''Excluído'')))) as STATUS, '+
                        //WO10578 - Helen V Bianchi - Fim
                        '   IDCONTRATO, '+
                        '   NOMECONTRATO, '+
                        '   DATAPREVENCERRA, '+
                        '   AVISO, '+
                        '  (TO_DATE(DATAPREVENCERRA,''DD/MM/YY'')-AVISO) DATAAVISO, '+
                        '  (ROUND(TO_DATE(DATAPREVENCERRA,''DD/MM/YY'')- '+
                        '         TO_DATE(SYSDATE,''DD/MM/YY''))) DIASFALTAM, '+
                        '   FLGFIMCONTRATO '+
                        'FROM '+
                        '   CONTRATOCONTR '+
                        'WHERE '+
                        '   ((DATAPREVENCERRA-AVISO)<=SYSDATE) AND '+
                        '   (FLGFIMCONTRATO = ''S'') AND '+
                        '   (IDPESSOA = '+FloatToStr(Sistema.IdEmpresa)+') AND '+
                        '   (IDCONTRATO IN (SELECT IDCONTRATO '+
                        '                   FROM CONTRATOUSUARIO '+
                        '                   WHERE (IDUSUARIO = '+FloatToStr(Sistema.IdUsuario)+'))) '+
                        'ORDER BY DATAPREVENCERRA ';
        spAux.Open;

        if not(cdsAux.EOF) then AbrirForm(frmAvisoVencMT, TfrmAvisoVencMT, False);
     finally
        cdsAux.Free;
        cdsAux2.Free; // Felipe A. Santos SOL 218909/16724 PPM 588170
     end;

     ExibeReajuste;
   end;
end;

procedure TfrmPrincipal.AppPadraoCreateFormReports(Sender: TObject);
begin
   inherited;
   Application.CreateForm(TdtmRelatoriosContrato, dtmRelatoriosContrato);
   Application.CreateForm(TdmtRelatContatoAnalitico, dmtRelatContatoAnalitico);
end;



procedure TfrmPrincipal.mnuModeloNFClick(Sender: TObject);
begin
   AbrirForm(frmCadModeloNF, TfrmCadModeloNF, False);
end;

procedure TfrmPrincipal.mnuImpressaoNFClick(Sender: TObject);
begin
   AbrirForm(frmImpressaoNotas, TfrmImpressaoNotas, False);
end;

procedure TfrmPrincipal.mnuCorrecoesClick(Sender: TObject);
begin
   AbrirForm(frmCadCorrecoesContratuaisMT,TfrmCadCorrecoesContratuaisMT, False);
end;

procedure TfrmPrincipal.mnuQualificacaoClick(Sender: TObject);
begin
   // Marilza Colpani SOL 120378/Kintana 575744
   AbrirForm(frmCadReferenciaContrMT, TfrmCadReferenciaContrMT, False);
end;

procedure TfrmPrincipal.mnuValoresClick(Sender: TObject);
begin
   AbrirForm(frmCadVlrReferenciaMT, TfrmCadVlrReferenciaMT, False);
end;

{procedure TfrmPrincipal.mnuLogTabelasClick(Sender: TObject);
begin
   AbrirForm(frmConsultaAltTabMT, TfrmConsultaAltTabMT, False);
end;}

procedure TfrmPrincipal.CancelamentodeEmisso1Click(Sender: TObject);
begin
   inherited;
   AbrirForm(frmCancelaNFMT, TfrmCancelaNFMT, False);
end;

procedure TfrmPrincipal.AppPadraoConfigReportPadrao(liIdReports,
  liOrigemCm: Integer; DesReport: TObject; var Config: Boolean);
var
  CtrlRptContrato : TCtrlRptContrato;
begin
   inherited;
   CtrlRptContrato:=TCtrlRptContrato.Create;
   try
      Config:=ConfigReport(liIdReports,liOrigemCm,CtrlRptContrato,DesReport);
      CtrlRptContrato.Free;
   except
      CtrlRptContrato.Free;
      raise;
   end;
end;

procedure TfrmPrincipal.AppPadraoPrintReportPadrao(sender: TObject;
  IdReports: Integer; sFileName: String; var Printed: Boolean);
var
  CtrlRptContrato : TCtrlRptContrato;
begin
   inherited;
   CtrlRptContrato:=TCtrlRptContrato.Create;
   try
      Printed:=Self.ShowReport(IDReports,CtrlRptContrato);
      CtrlRptContrato.Free;
   except
      CtrlRptContrato.Free;
      raise;
   end;
end;

procedure TfrmPrincipal.mnuParamAditamentoClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadParamAditamentoMT, TfrmCadParamAditamentoMT, False);
end;

procedure TfrmPrincipal.mnuExcluiParcelaClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmExcluiParcelaMT, TfrmExcluiParcelaMT, False);
end;

procedure TfrmPrincipal.miReajustesClick(Sender: TObject);
begin
  inherited;
  if not ExibeReajuste then begin
     MsgDlg('Não existem contratos para reajustar', 'Aviso', mtWarning, [mbOk], 0);
  end;
end;

function TfrmPrincipal.ExibeReajuste: Boolean;
var cdsAux: TCMClientDataSet;
    rNumDiasAviso: Double;
    bCorrigirAux : Boolean;
    vContratos   : OLEVariant;
begin
  Result := False;
  try
    //Exibe Tela de Aviso de Reajuste
    cdsAux := TCMClientDataSet.Create(nil);
    spAux.ClientDataSet := cdsAux;
    spAux.SQL.Clear;
    spAux.SQL.Add('SELECT NUMDIASAVISOCORR FROM PARAMCONTRATO');
    spAux.Open;
    rNumDiasAviso := cdsAux.FieldByName('NUMDIASAVISOCORR').AsFloat;
  finally
    cdsAux.Free;
  end;

  if rNumDiasAviso <> 0 then begin
     // Exibe a tela com os contratos
     with TfrmAvisoContratosCorrecaoMT.Create(Self) do begin
       try
         CarregaDados(rNumDiasAviso);
         if (cdsContratosCorr.IsEmpty) then Exit;
         Result := True;
         ShowModal;
         bCorrigirAux := bCorrigir;
         vContratos   := cdsContratosCorr.Data;
       finally
         Free;
       end;
     end;

     if bCorrigirAux then begin
        with TCtrlCorrecoesContratuais.Create do begin
          try
            Initialize(dtmBaseDados.dbBaseDados,True);
            if not(CorrigeContratos(Sistema.IdEmpresa, vContratos)) then
               MsgDlg(MessageInfo,'Erro',mtError,[mbOK],0);
          finally
            Free;
          end;
        end;
     end;
  end;
end;


procedure TfrmPrincipal.LancamentoOramentoClick(Sender: TObject);
begin
   inherited;
   AbrirForm(frmExecLancaOrcamento, TfrmExecLancaOrcamento, False);
end;


procedure TfrmPrincipal.mnuOperacaoOrcamentariaClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmExecApuracaoOrc, TfrmExecApuracaoOrc, False);
end;

procedure TfrmPrincipal.mnuAltAditamentoClick(Sender: TObject);
begin
  inherited;
  AbrirForm(frmAltAditamentoMT, TfrmAltAditamentoMT, False);
end;

procedure TfrmPrincipal.mnuAlteracaoEncerramentoClick(Sender: TObject);
begin
  inherited;
  // Ricardo A. SOL 120379 KTN 575054
  AbrirForm(frmCadEncerramento, TfrmCadEncerramento, False);
  // FIM Ricardo A. SOL 120379 KTN 575054
end;

procedure TfrmPrincipal.mnuAltDtVencAP1Click(Sender: TObject);
begin
  inherited;
  //Helen - SOL :65757 Kintana : 523339
  AbrirForm(FrmAlteraVencAP,TFrmAlteraVencAP, false);
end;

//Vinicius Maciel - SOL 142171 KTN 913629
procedure TfrmPrincipal.mnuCadastrodeAlcadasClick(Sender: TObject);
begin
  inherited;
   AbrirForm(frmCadAlcadasMT,TfrmCadAlcadasMT,False);
end;
//Vinicius Maciel - SOL 142171 KTN 913629 - FIM

procedure TfrmPrincipal.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(FCtrlCtrlParcelaMedicao); // Felipe A. Santos SOL 218909/16724 PPM 588170
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  inherited;
  // Felipe A. Santos SOL 218909/16724 PPM 588170 -  início
  FCtrlCtrlParcelaMedicao := TCtrlCtrlParcelaMedicao.Create;
  FCtrlCtrlParcelaMedicao.Initialize(dtmBaseDados.dbBaseDados,True);
  // Felipe A. Santos SOL 218909/16724 PPM 588170 - fim
end;

procedure TfrmPrincipal.mnuAlertaMedicaoClick(Sender: TObject);
begin
  inherited;
  //WO10499 - Helen V Bianchi - Excluir este menu
  //AbrirForm(frmAlertaMedicaoMT, TfrmAlertaMedicaoMT, False);  // Felipe A. Santos SOL 218909/16724 PPM 588170
end;


procedure TfrmPrincipal.AppPadraoShowParamReportPadrao(sender: TObject;
  IdReports: Integer; var sParams: String; var PrintReport: Boolean);
begin
  case (IdReports) of
    2451 : frmPreviewReports := TfrmParamRelAditamentos.Create(Self);       // edilaine - SOL 222290-16959 / PPM 670297
    else   frmPreviewReports := nil;
  end;
  inherited;
end;

procedure TfrmPrincipal.mnuContratoXUsurios1Click(Sender: TObject);
begin
  inherited;
  //Helen V Bianchi - WO7622 - Criação da Funcionalidade
   AbrirForm(frmCadContrXUsuMT, TfrmCadContrXUsuMT, False);
end;

initialization
   Sistema.NomeModulo     := 'Contratos e Projetos';  // Nome do Módulo
   Sistema.IdModulo       := 12;     		     // IdModulo cadastrado no SAD
   Sistema.Versao := '3.04.18b';
   Sistema.NomeAplicativo :='Contratos e Projetos';
end.
