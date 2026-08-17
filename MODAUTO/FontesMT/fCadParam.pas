{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Analista Responsável: Andre Mesquita                  }
{                                                       }
{*******************************************************}
//******************************************************************************************
//N. Sol..........: 228736/17139
//N. Kintana......: 761996
//Data............: 27/04/2015
//Responsável.....: Felipe A. Santos
//Descrição.......: Inclusão do campo Dias Úteis para destacamento
//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 06/11/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Reposicionamento dos campos do formulário
//******************************************************************************************
Unit fCadParam;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
   wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
   DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ImgList,
   CmEventosCadastro, DBClient, uCMClientDataSet, uCtrlParamRH, wwdblook, uCtrlMsgContexto,
   uCtrlEmailConexao, uCmSqlParams, uCtrlListTerceirosRH, ComCtrls;

Type
   TfrmCadParam = Class(TFrmCadastroMT)
      CdsMsg: TCMClientDataSet;
      dsMsg: TDataSource;
      cdsEmailConexao: TCMClientDataSet;
      cdsTipoDesemb: TCMClientDataSet;
      cdsTipoDocCap: TCMClientDataSet;
      cdsTipoReceb: TCMClientDataSet;
      cdsTipoDocCar: TCMClientDataSet;
      qry: TCMSqlParams;
      cdsPatrocinadora: TCMClientDataSet;
      cdsPlanoPrevidenciario: TCMClientDataSet;
      cdsPortadorFormaCAR: TCMClientDataSet;
      cdsPortadorFormaCAP: TCMClientDataSet;
      qryPortadorCAP: TCMSqlParams;
      qryPlanoPrevCTB: TCMSqlParams;
      qryPatrocinadora: TCMSqlParams;
      dsPatrocinadora: TwwDataSource;
      CdsMATRDIS: TStringField;
      CdsMOEDAPROCTRAB: TFloatField;
      CdsIDMOTIVO: TFloatField;
      CdsIDRUBIRRF: TFloatField;
      CdsLIMADM: TFloatField;
    d: TFloatField;
      CdsLIMAFAST: TFloatField;
      CdsLIMRETOR: TFloatField;
      CdsNUMSTEPS: TFloatField;
      CdsTITSTEP1: TStringField;
      CdsTITSTEP2: TStringField;
      CdsTITSTEP3: TStringField;
      CdsTITSTEP4: TStringField;
      CdsTITSTEP5: TStringField;
      CdsTITSTEP6: TStringField;
      CdsTITSTEP7: TStringField;
      CdsTITSTEP8: TStringField;
      CdsTITSTEP9: TStringField;
      CdsIDRUBFGTS: TFloatField;
      CdsIDRUBINSS: TFloatField;
      CdsIDRUB13: TFloatField;
      CdsIDRUBANTEC13: TFloatField;
      CdsNORMALINI: TDateTimeField;
      CdsNORMALFIM: TDateTimeField;
      CdsFERIASINI: TDateTimeField;
      CdsFERIASFIM: TDateTimeField;
      CdsPGTO13INI: TDateTimeField;
      CdsPGTO13FIM: TDateTimeField;
      CdsFLGDOISCARGOS: TFloatField;
      CdsFLGNIVELINDIV: TFloatField;
      CdsIDRUBFALTA: TFloatField;
      CdsFLGINTEGRACONT: TFloatField;
      CdsFLGINTEGRACAP: TFloatField;
      CdsTRGDTINCLUSAO: TDateTimeField;
      CdsTRGUSERINCLUSAO: TStringField;
      CdsFLGCRIASUBCONTA: TFloatField;
      CdsFLGSENHAUSOPES: TFloatField;
      CdsFLGENDERINS: TFloatField;
      CdsFLGENDERALT: TFloatField;
      CdsFLGENDEREXC: TFloatField;
      CdsFLGTELEFINS: TFloatField;
      CdsFLGTELEFALT: TFloatField;
      CdsFLGTELEFEXC: TFloatField;
      CdsFLGCONTTINS: TFloatField;
      CdsFLGCONTTALT: TFloatField;
      CdsFLGCONTTEXC: TFloatField;
      CdsFLGCURSOINS: TFloatField;
      CdsFLGCURSOALT: TFloatField;
      CdsFLGCURSOEXC: TFloatField;
      CdsFLGFERIAINS: TFloatField;
      CdsFLGFERIAALT: TFloatField;
      CdsFLGFERIAEXC: TFloatField;
      CdsFLGEMPRGINS: TFloatField;
      CdsFLGEMPRGALT: TFloatField;
      CdsFLGEMPRGEXC: TFloatField;
      CdsFLGCTSALALT: TFloatField;
      CdsFLGLINHAINS: TFloatField;
      CdsFLGLINHAALT: TFloatField;
      CdsFLGLINHAEXC: TFloatField;
      CdsINDDURACAOCONTR: TFloatField;
      CdsFLGNUMERAMATRIC: TFloatField;
      CdsTAMANHOMATRIC: TFloatField;
      CdsIDMOTIVORESCISAO: TFloatField;
      CdsIDPARAMRH: TFloatField;
      CdsINDPOLITICA: TFloatField;
      CdsIDDOCUMENTO: TFloatField;
      CdsCOLDOCUMENTO: TFloatField;
      CdsTAMDOCUMENTO: TFloatField;
      CdsFLGFILTRAFATOR: TFloatField;
      CdsFLGAVALALUNO: TFloatField;
      CdsFLGCURSOXAVAL: TFloatField;
      CdsVALMAXAVALTRN: TFloatField;
      CdsFLGBANCOHORAS: TFloatField;
      CdsPERBANCOHORAS: TFloatField;
      CdsLIMBANCOHORAS: TFloatField;
      CdsDSRBANCOHORAS: TFloatField;
      CdsINDPERBCHORAS: TFloatField;
      CdsDATBANCOHORAS: TDateTimeField;
      CdsNORBANCOHORAS: TFloatField;
      CdsFLGPERCPROB: TFloatField;
      CdsINDCONTABJUR: TFloatField;
      CdsINDORCAMPES: TFloatField;
      CdsFLGBLOQCAND: TFloatField;
      CdsPONTOINI: TDateTimeField;
      CdsPONTOFIM: TDateTimeField;
      CdsDIRCONFIG: TStringField;
      CdsFLGUSAQUERY: TFloatField;
      CdsDIASACERTOCONTA: TFloatField;
      CdsFLGCALENDST: TFloatField;
      CdsRECPAGREC: TStringField;
      CdsCODTIPDES: TStringField;
      CdsRECPAGDES: TStringField;
      CdsCODTIPREC: TStringField;
      CdsIDPESSOA: TFloatField;
      CdsFLGMARCAAFAST: TFloatField;
      CdsFLGMARCAFERIAS: TFloatField;
      CdsFLGALTERAPONTO: TFloatField;
      CdsCODTIPDOCREC: TFloatField;
      CdsCODTIPDOCPAG: TFloatField;
      CdsCODPORTFORMAPAG: TFloatField;
      CdsCODPORTFORMAREC: TFloatField;
      CdsIDPLANOPREV: TFloatField;
      CdsIDPATRO: TFloatField;
      CdsDIASENVIODST: TFloatField;
      CdsPRAZOPONTO: TFloatField;
      CdsFLGMARCADIAFOLGA: TFloatField;
      CdsINDLIMITESAIDA: TFloatField;
      CdsFLGTIPOTRANSF: TFloatField;
      CdsFLGFATORBANCONEG: TFloatField;
      CdsFLGALTAUTOPONTO: TFloatField;
      CdsDATAVIGENCIAOBJ: TDateTimeField;
      CdsDATACORROBJ: TDateTimeField;
      CdsPLNCODIGOOBJ: TFloatField;
      CdsVLRPERCENTACRESCIMODIARIA: TFloatField;
      CdsVLRPERCENTREDUCAODIARIA: TFloatField;
      CdsVLRFIXOTAXITRECHO: TFloatField;
      qryTipoDesemb: TCMSqlParams;
      qryTipoReceb: TCMSqlParams;
      cdsTipoDesembCODTIPRECDES: TStringField;
      cdsTipoDesembDESCRICAO: TStringField;
      cdsTipoDesembPLACONTACREDITO: TStringField;
      cdsTipoDesembPLANO: TFloatField;
      cdsTipoDesembPLACONTA: TStringField;
      cdsTipoDesembRECPAG: TStringField;
      qryPortadorCAR: TCMSqlParams;
      PageControl1: TPageControl;
      TabSheet1: TTabSheet;
      GroupBox1: TGroupBox;
      Label47: TLabel;
      Label48: TLabel;
      Label6: TLabel;
      dblcTipoDoc: TwwDBLookupCombo;
      dblcTipoDesemb: TwwDBLookupCombo;
      dblkPortadorFormaCAP: TwwDBLookupCombo;
      GroupBox2: TGroupBox;
      Label1: TLabel;
      Label2: TLabel;
      Label7: TLabel;
      wwDBLookupCombo1: TwwDBLookupCombo;
      wwDBLookupCombo2: TwwDBLookupCombo;
      dblkPortadorFormaCAR: TwwDBLookupCombo;
      GroupBox3: TGroupBox;
      Label4: TLabel;
      Label5: TLabel;
      dblkPatrocinadora: TwwDBLookupCombo;
      dblkPlanoPrevidenciario: TwwDBLookupCombo;
      TabSheet2: TTabSheet;
      gbxDias: TGroupBox;
      dbspeAvalMax: TwwDBSpinEdit;
      Panel1: TPanel;
      lblAssuntoMsg: TLabel;
      lblEmailConexao: TLabel;
      dbedtAssuntoMsg: TDBEdit;
      dblkpConexaEmail: TwwDBLookupCombo;
      dbrdgrpFlgTipoEnvio: TDBRadioGroup;
      GroupBox4: TGroupBox;
      Label18: TLabel;
      dbe1: TDBEdit;
      Label10: TLabel;
      dbe2: TDBEdit;
      Label9: TLabel;
      dbe3: TDBEdit;
      Label3: TLabel;
      wwDBSpinEdit1: TwwDBSpinEdit;

      // Felipe A. Santos SOL 228736/17139 PPM 761996{CdsDIASBLOQDESTAC fim}
      dbspnedtDiasDestac: TwwDBSpinEdit;
      lblDiasUteisDestac: TLabel;
      CdsDIASBLOQDESTAC: TFloatField;
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure CmeCadastroAfterConfirma(Sender: TObject);
      Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
      Procedure FormShow(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
   Private
      CtrlParamRH: TCtrlParamRH;
      CtrlMsgContexto: TCtrlMsgContexto;
      CtrlEmailConexao: TCtrlEmailConexao;
      CtrlListTerceirosRH: TctrlListTerceirosRH;

      Procedure Sel;
      Function GravarRegistro: boolean;
      Procedure MsgErro(sMsg: String);
   End;

Var
   frmCadParam: TfrmCadParam;

Implementation

Uses uMensErro, uCtrlPadroes, uSistema, uCMTypes, dBaseDados, uCtrlUsoGeralRH;

{$R *.DFM}

Procedure TfrmCadParam.FormCreate(Sender: TObject);
Begin
   Inherited;

   PageControl1.ActivePageIndex := 0;

   CtrlParamRH := TCtrlParamRH.Create;
   CtrlParamRH.InitializeAs(Padroes);
   CtrlParamRH.CdsParamRH := Cds;

   Sel;
   If (Cds.IsEmpty) Then
      Begin
         CtrlParamRH.ExecInsert;
         CtrlParamRH.GravarParamRH;
         Sel;
      End;

   CtrlMsgContexto := TCtrlMsgContexto.Create;
   CtrlMsgContexto.Initialize(DtmBaseDados.dbBaseDados, True,
      Sistema.ConnectionType, Sistema.ConnectionSide, Sistema.AppRemoteServer, True, MsgErro);
   CtrlMsgContexto.CdsMsgContexto := CdsMsg;

   CtrlEmailConexao := TCtrlEmailConexao.Create;
   CtrlEmailConexao.InitializeAs(CtrlMsgContexto);
   cdsEmailConexao.Data := CtrlEmailConexao.ListaConexoes;

   CdsMsg.Data := CtrlMsgContexto.SelecionaMsgContexto(7);

   ctrlListTerceirosRH := TCtrlListTerceirosRH.Create(ctrlUsoGeralRH.UsuXFilial,
      ctrlUsoGeralRH.UsuXCCusto,
      ctrlUsoGeralRH.IdUsuarioGeral);

   ctrlListTerceirosRH.InitializeAs(ctrlParamRH);

   cdsTipoDocCap.Data := ctrlListTerceirosRH.ListTipoDocRecPag('P');
   cdsTipoDocCar.Data := ctrlListTerceirosRH.ListTipoDocRecPag('R');
   cdsTipoDesemb.Data := ctrlListTerceirosRH.ListTipoDocRecebDesemb(Sistema.IdEmpresa, 'P', true);
   cdsTipoReceb.Data := ctrlListTerceirosRH.ListTipoDocRecebDesemb(Sistema.IdEmpresa, 'R', true);

   cdsPatrocinadora.Data := ctrlListTerceirosRH.ListPatrocinadora;
   cdsPlanoPrevidenciario.Data := ctrlListTerceirosRH.ListPlanoPrevCTB;
   cdsPortadorFormaCAR.Data := ctrlListTerceirosRH.ListPortadorForma('R');
   cdsPortadorFormaCAP.Data := ctrlListTerceirosRH.ListPortadorForma('P');
End;

Procedure TfrmCadParam.FormShow(Sender: TObject);
Begin
   Inherited;
   sbtnAlterar.Enabled := Not (Cds.IsEmpty);
   height := 501;
End;

Procedure TfrmCadParam.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   FreeAndNil(CtrlParamRH);
   FreeAndNil(CtrlMsgContexto);
   FreeAndNil(CtrlEmailConexao);
   freeandnil(ctrlListTerceirosRH);
   Inherited;
End;

Procedure TfrmCadParam.CmeCadastroAfterConfirma(Sender: TObject);
Begin
   //inherited;
End;

Procedure TfrmCadParam.CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;
   cds.FieldByName('RECPAGREC').AsString := 'R';
   cds.FieldByName('RECPAGDES').AsString := 'P';
   cds.FieldByName('IDPESSOA').AsInteger := sistema.IdEmpresa;
   Accept := GravarRegistro;
   Sel;
End;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

Procedure TfrmCadParam.Sel;
Begin
   Cds.Data := CtrlParamRH.ListParamRH;
End;

Function TfrmCadParam.GravarRegistro: boolean;
Begin
   Result := CtrlParamRH.GravarParamRH;
   If Not (Result) Then
      Raise Exception.Create(CtrlParamRH.MessageInfo)
   Else
      Begin
         If CdsMsg.State = dsBrowse Then
            CdsMsg.Edit;
         CdsMsg.Post;
         Result := CtrlMsgContexto.GravaMsgContexto;
         If Not (Result) Then
            Raise Exception.Create(CtrlMsgContexto.MessageInfo)
      End;
End;

Procedure TfrmCadParam.MsgErro(sMsg: String);
Begin
   MsgDlg(sMsg, 'Erro', mtError, [mbOk], 0);
End;

Procedure TfrmCadParam.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   pnlFundo.enabled := True;
End;

End.

