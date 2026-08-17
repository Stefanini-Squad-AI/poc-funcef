//********************************************************************************************************
//N. Sol..........: 196976/13142
//N. Kintana......: 1886103
//Data............: 14/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertado problemas na exclusão de etapas normais
//********************************************************************************************************
//N. Sol..........: 174225
//N. Kintana......: 1572025
//Data............: 06/02/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Refazendo rotinas de integração contabil e financeira para considerar o valor das etapas
//                  rateado pelo programas e subprogramas dos objetos
//********************************************************************************************************
//N. Sol..........: 172550
//N. Kintana......: 1555163
//Data............: 27/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Incluir rotinas pegar dados de integração parametrizáveis
//********************************************************************************************************
//N. Sol..........: 172573 e 172553
//N. Kintana......: 1555789 e 1554889
//Data............: 24/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Incluir rotinas para a desintegração financeira
//                  Incluir campo DATAPREVPAGTO atualizada com o calculo de dias para frente a partir da data de lançamento
//                  - função CtrlEtapaProcesso.CalcularDataPagamento
//********************************************************************************************************
//N. Sol..........: 171564
//N. Kintana......: 1538999
//Data............: 09/01/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Passado o campo IDCBANCARIA na função GerarIntegracaoEtapa
//********************************************************************************************************
//N. Sol..........: 170769
//N. Kintana......: 1525972
//Data............: 22/12/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão do campo FLGEXIGELANCVALOR para permitir ou não a inclusão de etapas com valores zerados
//********************************************************************************************************
//Rotina..........: fCustomCadRegEtp
//N. Sol..........: 166469
//N. Kintana......: 1451795
//Data............: 13/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão da edição do campo NODOCUMENTO
//                  Inclusão de critica
//********************************************************************************************************
//Rotina..........: fCustomCadRegEtp
//N. Sol..........:
//N. Kintana......:
//Data............: 29/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Refeita toda a interface
//                  Implementando rotina para unificar os Depósitos judiciais controvero e incontroverso numa única AP
//********************************************************************************************************
//Rotina..........: fCustomCadRegEtp
//N. Sol..........: 161760
//N. Kintana......: 1379145
//Data............: 01/08/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Implementar novas rotinas de integração financeira. Retirar a forma atual (emulaçao da tela CAP/CAR)
//                  e substituir pelas funções de integração CAP/CAR e Contábil
//********************************************************************************************************
//Rotina..........: fCustomCadRegEtp
//N. Sol..........: 152860
//N. Kintana......: 1145902
//Data............: 27/07/2011
//Responsável.....: Otacilio Aquino
//Descrição.......: Desenvolvimento do Cadastro do Movimento das Arrematações
//********************************************************************************************************
//Rotina..........: fCustomCadRegEtp
//N. Sol..........: 156018
//N. Kintana......: 1228602
//Data............: 04/06/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de rotinas e funções para localizar o Desembolso por Etapa
//********************************************************************************************************
//Rotina..........: fCustomCadRegEtp
//N. Sol..........: 141647
//N. Kintana......: 905096
//Data............: 23/11/2010
//Responsável.....: Paulo Nobre e Renan Cristiano
//Descrição.......: Refeita toda a rotina que analisa a necessidade de pagamento ou recebimento
//                  Inclusão de chamada no formulario do Sistema Financeiro - TfrmLancDocCAPCAR,
//                  passando de forma automatica do Jurídico os dados de pagamento ou recebimento
//***********************************************************************************************************
//Rotina..........: CmeDetalheInsert(), BbtnCancelardetClick(), BbtnVoltarDetClick(), CmeDetalheDelete(), CmeCadastroInsert().
//N. Sol..........: 126248
//N. Kintana......: 658219
//Data............: 27/10/2009
//Responsável.....: William Santos
//Descrição.......: Implemetado ajuste para corrigir a numeração do cadastro das etapas dos Processos de forma crescente.
//*****************************************************************************************************************************
Unit fCustomCadRegEtp;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, IvDictio, IvMulti,
   MontaSelect, DBTables, Db, Wwdatsrc, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
   Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls, DBCtrls, Mask, TREdit,
   wwdbedit, wwdblook, CMProcuraSubTipo, wwdbdatetimepicker, CMDateTimePicker, uCMClientDataSet,
   CmEventosCadastro, ImgList, FCadastroMestreDetMT, DBClient, uCtrlGlobalRH, uCtrlProcessoTrab,
   uCtrlEtapaProcesso, uCtrlListTerceirosRH, uCtrlTipRec, uCtrlPeriodo, uCtrlHonorarioProcesso, uautorizacao,
   IvEMulti, FTelaAut, uCmSqlParams, Wwquery, uCtrlEtpDesdobramento, uCtrlHstEtapaProcTrab,
   Wwdbgrd2, TB97Tlwn, uCtrlIntegraRH, uCtrlCustomRH, uCmDbObject, uCmControlObject, uCtrlDocumento;

Type
   TfrmCustomCadRegEtp = Class(TFrmCadastroMestreDetMT)

      dsIMGAux: TwwDataSource;
      ToolbarSep972: TToolbarSep97;
      sbtnImagem: TToolbarButton97;
      Label1: TLabel;
      dbedNumero: TDBEdit;
      CdsDet: TCMClientDataSet;
      CdsTipoEtapa: TCMClientDataSet;
      CdsImagem: TCMClientDataSet;
      CdsIMGAux: TCMClientDataSet;
      CdsHonorarios: TCMClientDataSet;
      Label7: TLabel;
      dblckTipoEtp: TwwDBLookupCombo;
      Label4: TLabel;
      dtedDataReal: TCMDateTimePicker;
      Label3: TLabel;
      dbedAssunto: TDBEdit;
      Label6: TLabel;
      dbmObserv: TDBMemo;
      CdsEventoImovel: TCMClientDataSet;
      CdsImovel: TCMClientDataSet;
      sbtnProcurarLitis: TToolbarButton97;
      Label42: TLabel;
      dbedValRec: TDBRealEdit;
      lblCustas: TLabel;
      dbedCustas: TDBRealEdit;
      bbtnMulta: TBitBtn;
      lblNumSeqVinc: TLabel;
      dbedNumSeqVinc: TDBRealEdit;
      CdsCentroResponsabilidade: TCMClientDataSet;
      AuxiEtapa: TwwQuery;
      dbrgAbate: TDBRadioGroup;
      cdsHistoricoEtapas: TCMClientDataSet;
      dsHistoricoEtapas: TDataSource;
      Panel1: TPanel;
      Panel2: TPanel;
      btnFechaHistEtapas: TBitBtn;
      qryAux2: TwwQuery;
      dbgHisEtapas: TwwDBGrid;
      CdsPrograma: TCMClientDataSet;
      qryTipoDesembolso: TwwQuery;
      dsTipoDesembolso: TwwDataSource;
      CdsParamRH: TCMClientDataSet;
      lblTipoDesconstituicao: TLabel;
      SqlDet: TCMSqlParams;
      Label5: TLabel;
      dbeNumdocto: TDBEdit;
      qryAux1: TwwQuery;
      CMSqlParams1: TCMSqlParams;
      CdsTipoEtapaCODTIPORECURSO: TFloatField;
      CdsTipoEtapaDESCRICAO: TStringField;
      CdsTipoEtapaVALORHONOR: TFloatField;
      CdsTipoEtapaFLGPENHORA: TFloatField;
      CdsTipoEtapaFLGENCERRAMENTO: TFloatField;
      CdsTipoEtapaMOECODIGO: TFloatField;
      CdsTipoEtapaINDJUROS: TFloatField;
      CdsTipoEtapaTAXAJUROS: TFloatField;
      CdsTipoEtapaFLGEXECUCAO: TFloatField;
      CdsTipoEtapaFLGINTEGRACONTABIL: TStringField;
      CdsTipoEtapaFLGINTEGRAFINANCEIRO: TStringField;
      CdsTipoEtapaRECPAG: TStringField;
      SQLTipoEtapa: TCMSqlParams;
      CdsTipoEtapaFLGEXIGELANCVALOR: TStringField;
      CdsDetNUMPROCTRAB: TFloatField;
      CdsDetNUMSEQ: TFloatField;
      CdsDetCODTIPORECURSO: TFloatField;
      CdsDetIDIMAGEM: TFloatField;
      CdsDetVALORREC: TFloatField;
      CdsDetDATAPREVOCORR: TDateTimeField;
      CdsDetDATAREALOCOR: TDateTimeField;
      CdsDetOBSERVETAPA: TMemoField;
      CdsDetASSUNTO: TStringField;
      CdsDetTRGDTINCLUSAO: TDateTimeField;
      CdsDetTRGUSERINCLUSAO: TStringField;
      CdsDetFLGVALORABATE: TFloatField;
      CdsDetIDINVESTIMENTO: TFloatField;
      CdsDetIDCONJUNTO: TFloatField;
      CdsDetIDIMOVEL: TFloatField;
      CdsDetIDBEM: TFloatField;
      CdsDetIDPESSOA: TFloatField;
      CdsDetVALOR: TFloatField;
      CdsDetINDPENHORA: TFloatField;
      CdsDetINDVALOR: TFloatField;
      CdsDetFLGIMPORTACAO: TFloatField;
      CdsDetCODDOCUMENTO: TFloatField;
      CdsDetIDPLANPREVCTBPATR: TFloatField;
      CdsDetIDFUNDOINVEST: TFloatField;
      CdsDetIDCBANCARIA: TFloatField;
      CdsDetNUMSEQVINC: TFloatField;
      CdsDetVALORMULTA: TFloatField;
      CdsDetINDMULTA: TFloatField;
      CdsDetFLGINVESTLIDO: TFloatField;
      CdsDetVALORCUSTAS: TFloatField;
      CdsDetVALORJUIZ: TFloatField;
      CdsDetCODPORTADOR: TFloatField;
      CdsDetVALORMULTAPAGA: TFloatField;
      CdsDetDATAINIMULTA: TDateTimeField;
      CdsDetDATAPAGMULTA: TDateTimeField;
      CdsDetIDTIPOCOTA: TFloatField;
      CdsDetIDTIPOINVEST: TFloatField;
      CdsDetIDCUSTODIANTE: TFloatField;
      CdsDetIDOPERRENFIXAPLIC: TFloatField;
      CdsDetIDFIELDEPOS: TFloatField;
      CdsDetIDSITPENHORA: TFloatField;
      CdsDetPLANO: TFloatField;
      CdsDetPLNCODIGO: TFloatField;
      CdsDetNODOCUMENTO: TFloatField;
      ToolbarButton971: TToolbarButton97;
      spbDesfazerIntrega: TSpeedButton;
      CdsDetDATAPREVPAGTO: TDateTimeField;
      Label9: TLabel;
      dbDtPrevPagto: TCMDateTimePicker;
      CMProcuraReq: TCMProcuraSubTipo;
      rgSituacao: TDBRadioGroup;
      LabelNumProc: TLabel;
      dbedNumJCJ: TDBEdit;
      Panel3: TPanel;
      Label2: TLabel;
      Label31: TLabel;
      Label8: TLabel;
      dbTipoDesembolso: TDBEdit;
      qryTipoDesembolsoCODTIPRECDES: TStringField;
      qryTipoDesembolsoRECPAG: TStringField;
      qryTipoDesembolsoPLANO: TFloatField;
      qryTipoDesembolsoPLACONTA: TStringField;
      qryTipoDesembolsoPLACONTACREDITO: TStringField;
      qryTipoDesembolsoDESCRICAO: TStringField;
      CdsTipoDoc: TCMClientDataSet;
      CdsPortadorFormaCAP: TCMClientDataSet;
      Label47: TLabel;
      lblPortadorForma: TLabel;
      CMSqlParams2: TCMSqlParams;
      DBEdit2: TDBEdit;
      DBEdit3: TDBEdit;
      DBEdit4: TDBEdit;
      DBEdit5: TDBEdit;
      dsCentroResponsabilidade: TwwDataSource;
      dsPortadorFormaCAP: TwwDataSource;
      dsPrograma: TwwDataSource;
      dsTipoDoc: TwwDataSource;
      CdsProgramaIDTIPOPROC: TFloatField;
      CdsProgramaNOMETIPOPROC: TStringField;
      lblCentroCusto: TLabel;
      qryLkpCentroCusto: TwwQuery;
      qryLkpCentroCustoNOME: TStringField;
      qryLkpCentroCustoCODCENTROCUSTO: TStringField;
      dblkCentroCusto: TwwDBLookupCombo;
      CMSqlParams3: TCMSqlParams;
      qryAux: TwwQuery;
      spbVerObjetosAssociados: TSpeedButton;
      btnVerHistoricoEtapas: TSpeedButton;
      cdsHistoricoEtapasNUMPROCTRAB: TFloatField;
      cdsHistoricoEtapasNUMSEQ: TFloatField;
      cdsHistoricoEtapasCODTIPORECURSO: TFloatField;
      cdsHistoricoEtapasMOECODIGO: TFloatField;
      cdsHistoricoEtapasDATAATU: TDateTimeField;
      cdsHistoricoEtapasDATA_ULTIMA_ATUALIZACAO: TStringField;
      cdsHistoricoEtapasULTIMO_VALOR_ATUALIZADO: TFloatField;
      cdsHistoricoEtapasULTIMA_CUSTAS_ATUALIZADA: TFloatField;
      cdsHistoricoEtapasTIPO_AJUSTE: TStringField;
      cdsHistoricoEtapasTRGDTINCLUSAO: TDateTimeField;
      cdsHistoricoEtapasTRGUSERINCLUSAO: TStringField;
      CdsDetPLNPLANIL: TFloatField;
      CdsDetETAPA: TStringField;
      CdsDetVALORHONOR: TFloatField;
      CdsDetFLGPENHORA: TFloatField;
      CdsDetFLGENCERRAMENTO: TFloatField;
      CdsDetTIPOPENH: TStringField;
      CdsDetBEMPENHORADO: TStringField;
      CdsDetDESCPENHORA: TStringField;
      qryTipoDesembolsoIDPROGRAMA: TFloatField;
      spbInformacoesAdicionais: TSpeedButton;
      spbCadObjetosAssociados: TSpeedButton;
      btnContaBanc: TSpeedButton;
      cdsEtapaxObjetos: TCMClientDataSet;
      cdsEtapaxObjetosNUMPROCTRAB: TFloatField;
      cdsEtapaxObjetosCODTIPORECURSO: TFloatField;
      cdsEtapaxObjetosIDPLANOPREV: TFloatField;
      cdsEtapaxObjetosIDPATRO: TFloatField;
      cdsEtapaxObjetosDATAREALOCOR: TDateTimeField;
      cdsEtapaxObjetosDATAPREVPAGTO: TDateTimeField;
      cdsEtapaxObjetosCODTIPOOBJETO: TFloatField;
      cdsEtapaxObjetosIDTIPOPROC: TFloatField;
      cdsEtapaxObjetosTIPCODIGO: TStringField;
      cdsEtapaxObjetosNOMETIPOPROC: TStringField;
      cdsEtapaxObjetosTIPDESCRICAO: TStringField;
      cdsEtapaxObjetosDESCRICAO: TStringField;
      Procedure CmeCadastroFind(Sender: TObject);
      Procedure sbtnImagemClick(Sender: TObject);
      Procedure bbtnOkDetClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormCreate(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
      Procedure dsDetStateChange(Sender: TObject);
      Procedure CdsDetBeforeEdit(DataSet: TDataSet);
      Procedure CdsDetAfterScroll(DataSet: TDataSet);
      Procedure CmeDetalheDelete(Sender: TObject);
      Procedure CdsDetAfterInsert(DataSet: TDataSet);
      Procedure CdsDetBeforePost(DataSet: TDataSet);
      Procedure CdsDetBeforeDelete(DataSet: TDataSet);
      Procedure sbtnProcurarClick(Sender: TObject);
      Procedure sbtnProcurarLitisClick(Sender: TObject);
      Procedure bbtnMultaClick(Sender: TObject);
      Procedure CdsAfterScroll(DataSet: TDataSet);
      Procedure CmeDetalheInsert(Sender: TObject);
      Procedure bbtnCancelarDetClick(Sender: TObject);
      Procedure CmeCadastroInsert(Sender: TObject);
      Procedure sbtnExcluiDetClick(Sender: TObject);
      Procedure sbtnInsDetClick(Sender: TObject);
      Procedure sbtnAltDetClick(Sender: TObject);
      Procedure dbedNumSeqVincExit(Sender: TObject);
      Procedure btnFechaHistEtapasClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure dblckTipoEtpCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure dbgrdDetDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure sbtnAlterarClick(Sender: TObject);
      Procedure spbDesfazerIntregaClick(Sender: TObject);
      Procedure spbVerObjetosAssociadosClick(Sender: TObject);
      Procedure btnVerHistoricoEtapasClick(Sender: TObject);
      Procedure dbgrdDetCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure spbCadObjetosAssociadosClick(Sender: TObject);
      Procedure btnContaBancClick(Sender: TObject);
      Procedure spbInformacoesAdicionaisClick(Sender: TObject);
   Private
      CtrlGlobalRH: TCtrlGlobalRH;
      CtrlProcessoTrab: TCtrlProcessoTrab;
      CtrlHonorarioProcesso: TCtrlHonorarioProcesso;
      CtrlEtapaProcesso: TCtrlEtapaProcesso;
      CtrlPeriodo: TCtrlPeriodo;
      CtrlListTerceirosRH: TCtrlListTerceirosRH;
      CtrlTipRec: TCtrlTipRec;
      CtrlHstEtapaProcTrab: TCtrlHstEtapaProcTrab;
      CtrlEtpDesdobramento: TCtrlEtpDesdobramento;

      FctrlDocumento: TCtrlDocumento;

      dValDespesaTot, dValHonorAntes, dValCustasAntes, IdImovelAntes,
         dValorDepAntes, dValorPenAntes, dValorConAntes, dValorLevAntes,
         dValorDep, dValorPen, dValorCon, dValorLev, dValorAlt,
         dValorInv, dValorInvAntes, dValorCustasAntes: double;
      bAlterouValores, bFazCAP, bFazDiferenca, bFazCAR,
         bFazAlterador: boolean;
      iNumSeqAtual, IdPatro, IdPlanoPrev, IdPatroInvest, IdPlanoInvest: integer;
      IdBemAntes, IdConjuntoAntes: double;
      dValorObj, dValCausa, dValOrig, dValAtual, dValReal: double;

      FMensagemCtrlDocumento: String;

      Procedure Sel(NumProcTrab: double);
      Procedure GravarHonorarioEtapa;
      Function GravarRegistro: boolean;

      Procedure AtualizaBEM(iSit: Integer; NumProc, NumSeq: double);
      Procedure AtualizaIMOVEL(sSit: String; NumProc, NumSeq: double);
      Procedure TestaSeDesconstituicao(NumProc2, NumSeq2: double);
      Procedure LocalizaEtapaDesembolso(pIdPrograma, pCodTipoRecurso: Integer; pRecPag: String);
      Function LocalizaEtapaVincular(sCodTipoRecurso: String; Var iNumSeqEtapaVinc: Integer): Boolean;

      // SOL 174225 KTN 1572025 - Paulo Nobre
      Function ExcluirDadosDaIntegracaoFinanceira(iNumProctrab, iNumSeq, iDocumento: Integer): Boolean;

   Protected
      Procedure OnClick_ProcurarProcesso; Virtual; Abstract;
      Procedure OnClick_ProcurarProcessoComLitisconsortes; Virtual; Abstract;
   End;

Var
   frmCustomCadRegEtp: TfrmCustomCadRegEtp;
   ValorDesconstituicao: Double;
   sDesconstituicaoOK, sTrgUserInclusao: String;
   bExcluiu, bTemDepInconVinculado, bTemDepConVinculado, bIntegraFinanceiro, bAtualizaEtapa: Boolean;
   iNumSeqEtapaVinc, iIdPrograma: Integer;
   MessageInfo: String;

Implementation

Uses uSistema, uMensErro, fAguarde, uCtrlPadroes, uCtrlParamIntegra,
   uCtrlFuncoesRH, uCtrlUsoGeralRH, dCds, fCadRegPenhora, fCadRegContaBanc,
   fCadRegMulta, fCadRegEtp, fProcuraPessoaDoc, dBaseDados,
   fCadHonorarioSucumbenciais, fCadCondenacoes, fLancDocCAPCARMT, fCadDepositoJudicial,
   uCtrlPlacontasCapCar, uIntegraBack, fCadMovArrematacao, fCadEtapasXObjetos;

{$R *.DFM}

Procedure TfrmCustomCadRegEtp.FormCreate(Sender: TObject);
Var sSQL: String;
Begin
   Inherited;

   Screen.Cursor := crAppStart;
   CtrlEtapaProcesso := TCtrlEtapaProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlEtapaProcesso.InitializeAs(Padroes);
   CtrlEtapaProcesso.CdsProcesso := Cds;
   CtrlEtapaProcesso.CdsEtapas := CdsDet;
   CtrlEtapaProcesso.CdsImagens := CdsImagem;
   CtrlEtapaProcesso.CdsHonorarios := CdsHonorarios;
   CtrlEtapaProcesso.CdsImovel := CdsImovel;
   CtrlEtapaProcesso.CdsEventoImovel := CdsEventoImovel;

   CtrlHstEtapaProcTrab := TCtrlHstEtapaProcTrab.Create;
   CtrlHstEtapaProcTrab.InitializeAs(Padroes);
   CtrlHstEtapaProcTrab.CdsHstetapaproctrab := cdsHistoricoEtapas;
   cdsHistoricoEtapas.Data := CtrlHstEtapaProcTrab.SelecionaHstetapaproctrab(-1, -1, -1);

   CtrlProcessoTrab := TCtrlProcessoTrab.Create(Sistema.IdModulo, Sistema.IdUsuario,
      Sistema.IdEmpresa, Sistema.UsaPlanoPatro, CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlProcessoTrab.InitializeAs(Padroes);

   CtrlGlobalRH := TCtrlGlobalRH.Create;
   CtrlGlobalRH.InitializeAs(Padroes);

   CtrlListTerceirosRH := TCtrlListTerceirosRH.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlListTerceirosRH.InitializeAs(Padroes);

   CtrlPeriodo := TCtrlPeriodo.Create;
   CtrlPeriodo.InitializeAs(Padroes);

   CtrlTipRec := TCtrlTipRec.Create;
   CtrlTipRec.InitializeAs(Padroes);

   CtrlHonorarioProcesso := TCtrlHonorarioProcesso.Create(CtrlUsoGeralRH.UsuXFilial,
      CtrlUsoGeralRH.UsuXCCusto, CtrlUsoGeralRH.IdUsuarioGeral);
   CtrlHonorarioProcesso.InitializeAs(Padroes);

   // SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
   FctrlDocumento := TctrlDocumento.Create;
   FctrlDocumento.InitializeAs(padroes);
   //
   frmProcuraPessoaDoc := TfrmProcuraPessoaDoc.Create(Application);
   CdsHonorarios.Data := CtrlHonorarioProcesso.ListTabHonorarioEmBranco;
   CdsIMGAux.Data := CtrlEtapaProcesso.ListImagens(-1);
   CdsImovel.Data := CtrlListTerceirosRH.ListImovel;
   CdsEventoImovel.Data := CtrlListTerceirosRH.ListEventoImovelVazio;

   // SOL 155481  KTN 1233809 - Paulo Nobre
   // Acesso etapas por grupo
   sTrgUserInclusao := '';
   qryAux1.SQL.clear;
   qryAux1.SQL.add('select g.idusuario, g.idgrupo, ga.nomegrupo  ');
   qryAux1.SQL.add('from grupousu g, grupoacesso ga               ');
   qryAux1.SQL.add('WHERE g.idgrupo = ga.idgrupo and TRIM(ga.nomegrupo) = ''GEJUR - DIBEN'' and '); // Grupo GEJUR - DIBEN (idgrupo = 539 - Producao)
   qryAux1.SQL.add('      g.idusuario = ' + floattostr(Sistema.IdUsuario));
   qryAux1.Open;
   If Not qryAux1.EOF Then
      Begin
         // Filtra etapas específicas do Depósito Judicial - Controverso e Incontroverso
         CdsTipoEtapa.Data := CtrlTipRec.ListTipRecGrupo('(1035, 1110)'); // Somente para Usuários da DIBEN
         sTrgUserInclusao := 'CM' + qryAux1.fieldbyname('idusuario').asString;
      End
   Else
      CdsTipoEtapa.Data := CtrlTipRec.ListTipRec; // Usuários normais da GEJUR

   // fim - SOL 155481  KTN 1233809 - Paulo Nobre

   // SOL 172550 KTN 1555163 - Paulo Nobre
   CdsParamRH.Data := CtrlGlobalRH.GetParamRH('FLGINTEGRACAP, FLGINTEGRACONT, DIASPAGTOJURETAPA, CODTIPDOCEJURETAPA,  ' +
      ' CODPORTFORMAPAGETAPAJUR, CODCENTCUSTOJUR, RECPAGCUSTASJUDPAG, CODDESEMBCUSTASJUDPAG');

   Screen.Cursor := crDefault;

   sbtnProcurarClick(Self);
   If Not (MontaSelect.RetornouValor) Then
      Sel(-1);

   tbcDetalhe.detdbGrids.Clear;
   tbcDetalhe.detdbGrids.Add('dbgrdDet');
   tbcDetalhe.Tabs.Clear;
   tbcDetalhe.Tabs.Add('Detalhamento');

   // SOL 161760 KTN 1379145 - Paulo Nobre
   // Se Integra com o Financeiro e Contábil
   bIntegraFinanceiro := (CdsParamRH.FieldByName('FLGINTEGRACAP').asInteger = 1) And
      (CtrlPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, DateToStr(Date)));

   // SOL 174225 KTN 1572025 - Paulo Nobre
   // Por ser uma outra tabela usada pelo Financeiro - Tabela PROGRAMA,
   // tivemos que fazer um de/para com a tabela TIPOPROCESSO do Jurídico
   If Cds.FieldByName('IDTIPOPROC').AsInteger = 2 Then // INV
      iIdPrograma := 3
   Else If Cds.FieldByName('IDTIPOPROC').AsInteger = 3 Then // ADM
      iIdPrograma := 4
   Else If Cds.FieldByName('IDTIPOPROC').AsInteger = 4 Then // PREV
      iIdPrograma := 1;

   ValorDesconstituicao := 0;
   bExcluiu := False;
   bolSucumbencia := false;
   bAtualizaEtapa := False;

   panel1.Visible := False;
   pnlControlesDet.Enabled := False;
   dbgrdDet.Enabled := True;
   bTemDepInconVinculado := False;
   bTemDepConVinculado := False;

   spbDesfazerIntrega.Enabled := False;
End;

Procedure TfrmCustomCadRegEtp.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin

   qryLkpCentroCusto.Close;

   FreeAndNil(CtrlEtapaProcesso);
   FreeAndNil(CtrlHonorarioProcesso);
   FreeAndNil(CtrlProcessoTrab);
   FreeAndNil(CtrlGlobalRH);
   FreeAndNil(CtrlPeriodo);
   FreeAndNil(CtrlListTerceirosRH);
   FreeAndNil(CtrlTipRec);
   FreeAndNil(frmProcuraPessoaDoc);

   If Assigned(frmCadRegPenhora) Then
      FreeAndNil(frmCadRegPenhora);

   //Renan Cristiano SOL Nº 126385 KINTANA 6585269 - INI
   If Assigned(frmCadDepositoJudicial) Then
      FreeAndNil(frmCadDepositoJudicial);
   //Renan Cristiano SOL Nº 126385 KINTANA 6585269 - FIM

   If Assigned(frmCadHonorarioSucumbenciais) Then
      FreeAndNil(frmCadHonorarioSucumbenciais);

   If Assigned(FctrlDocumento) Then
      FreeAndNil(FctrlDocumento);

   If Assigned(frmCadEtapasXObjetos) Then
      FreeAndNil(frmCadEtapasXObjetos);

   Inherited;
End;

Procedure TfrmCustomCadRegEtp.CmeCadastroFind(Sender: TObject);
Begin
   If (MontaSelect.RetornouValor) Then
      Sel(StrToFloat(MontaSelect.ValoresChave[0]));
End;

Procedure TfrmCustomCadRegEtp.CmeDetalheDelete(Sender: TObject);
Var
   iNumSeq: Integer;
Begin
   IdBemAntes := CdsDet.FieldByName('IDBEM').asFloat;
   IdConjuntoAntes := CdsDet.FieldByName('IDCONJUNTO').asFloat;

   If (CdsHonorarios.Locate('NUMSEQ', CdsDet.FieldByName('NUMSEQ').asFloat, [])) Then
      CdsHonorarios.Delete;
   If (CdsImagem.Locate('IDIMAGEM', CdsDet.FieldByName('IDIMAGEM').asFloat, [])) Then
      CdsImagem.Delete;

   //William M. Santos - SOL nº 126248  KINTANA nº 658219 - INI
   If (pgctrlDetalhe.ActivePage = tbsDet) Then
      Begin
         iNumSeq := CdsDet.FieldByName('NUMSEQ').asInteger;
         If iNumSeq >= iNumSeqAtual Then
            Dec(iNumSeqAtual);
      End;
   //William M. Santos - SOL nº 126248  KINTANA nº 658219 - FIM
   Inherited;
End;

Procedure TfrmCustomCadRegEtp.CmeCadastroApplyEdit(sender: TObject; Var Accept: Boolean);
Begin
   Inherited;

   Accept := GravarRegistro;

   If (Cds.FieldByName('IDPATRO').asInteger > 0) And (IdPatroInvest = 0) Then
      IdPatro := Cds.FieldByName('IDPATRO').asInteger;
   If (Cds.FieldByName('IDPLANOPREV').asInteger > 0) And (IdPlanoInvest = 0) Then
      IdPlanoPrev := Cds.FieldByName('IDPLANOPREV').asInteger;
End;

Procedure TfrmCustomCadRegEtp.dsDetStateChange(Sender: TObject);
Begin
   Inherited;
   If (CdsDet.State In [dsInsert, dsEdit]) Then
      dblckTipoEtp.SetFocus;
End;

Procedure TfrmCustomCadRegEtp.CdsDetAfterScroll(DataSet: TDataSet);
Begin
   spbInformacoesAdicionais.Enabled := False;
   spbCadObjetosAssociados.Enabled := False;
   spbVerObjetosAssociados.Enabled := False;

   spbDesfazerIntrega.Enabled := Not CdsDet.FieldByName('CODDOCUMENTO').isnull;

   If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1030) Or // Penhora
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or // Depósito Judicial - Controverso
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110) Or // Depósito Judicial - Incontroverso
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1086) Or // Honorarios Sucumbenciais
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1053) Or // Condenção Solidária
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1111) Then // Arrematação
      spbInformacoesAdicionais.Enabled := True;

   If CdsTipoEtapa.FieldByName('FLGINTEGRAFINANCEIRO').asString = 'S' Then // Sim
      Begin
         spbCadObjetosAssociados.Enabled := True;
         spbVerObjetosAssociados.Enabled := True;
         LocalizaEtapaDesembolso(iIdPrograma, CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger, CdsTipoEtapa.FieldByName('RECPAG').asString);
      End;
End;

Procedure TfrmCustomCadRegEtp.CdsDetBeforeEdit(DataSet: TDataSet);
Begin
   dValCustasAntes := CdsDet.FieldByName('VALORCUSTAS').asFloat;
   dValHonorAntes := 0;
   IdImovelAntes := CdsDet.FieldByName('IDIMOVEL').asFloat;
   Inherited;
End;

Procedure TfrmCustomCadRegEtp.sbtnImagemClick(Sender: TObject);
Var
   bInserir: boolean;
Begin
   CdsIMGAux.EmptyDataSet;
   bInserir := Not (CdsImagem.Locate('NUMSEQ', CdsDet.FieldByName('NUMSEQ').asInteger, []));
   If Not (bInserir) Then
      Begin
         CdsIMGAux.Insert;
         CdsIMGAux.FieldByName('IDIMAGEM').asFloat := CdsImagem.FieldByName('IDIMAGEM').asFloat;
         TBlobField(CdsIMGAux.FieldByName('IMAGEM')).Value :=
            TBlobField(CdsImagem.FieldByName('IMAGEM')).Value;
         CdsIMGAux.FieldByName('DESCRIMAGEM').asString := CdsImagem.FieldByName('DESCRIMAGEM').asString;
         CdsIMGAux.Post;
      End;

   FU.AssociarImagem(dsIMGAux, TBlobField(CdsIMGAux.FieldByName('IMAGEM')),
      TFloatField(CdsDet.FieldByName('IDIMAGEM')), 'Documento',
      (CdsDet.State In [dsInsert, dsEdit]), (CdsDet.State In [dsInsert, dsEdit]));

   If (CdsDet.FieldByName('IDIMAGEM').asFloat <= 0) Then
      Begin
         If Not (bInserir) Then
            CdsImagem.Delete;
      End
   Else
      Begin
         If (bInserir) Then
            Begin
               CdsImagem.Insert;
               CdsImagem.FieldByName('NUMSEQ').asInteger := CdsDet.FieldByName('NUMSEQ').asInteger;
               CdsImagem.FieldByName('IDIMAGEM').asFloat := CdsIMGAux.FieldByName('IDIMAGEM').asFloat;
            End
         Else
            CdsImagem.Edit;

         TBlobField(CdsImagem.FieldByName('IMAGEM')).Value :=
            TBlobField(CdsIMGAux.FieldByName('IMAGEM')).Value;
         CdsImagem.FieldByName('DESCRIMAGEM').asString := CdsIMGAux.FieldByName('DESCRIMAGEM').asString;
         CdsImagem.Post;
      End;
End;

Procedure TfrmCustomCadRegEtp.bbtnOkDetClick(Sender: TObject);
Begin
   If cdsdet.State In [dsinsert, dsedit] Then
      Begin
         Try
            iNumSeqEtapaVinc := 0;

            // SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre
            If CdsTipoEtapa.FieldByName('FLGINTEGRAFINANCEIRO').asString = 'S' Then // Sim
               Begin
                  CdsDet.FieldByName('DATAPREVPAGTO').asDateTime := CtrlEtapaProcesso.CalcularDataPagamento(Strtodate(dtedDataReal.Text), CdsParamRH.FieldByName('DIASPAGTOJURETAPA').asInteger); // EX: 3 dias pra frente
               End;

            //-- Renan Cristiano SOL 131509 Kintana 750181 Início.
            If pgctrlDetalhe.ActivePageIndex = 0 Then //Etapas
               Begin
                  If (Trim(dblckTipoEtp.Text) = '') Then
                     Begin
                        MsgDlg('Preencha o Tipo de Etapa.', 'Aviso', mtWarning, [mbOk], 0);
                        dblckTipoEtp.SetFocus;
                        exit;
                     End;

                  If (Trim(dtedDataReal.Text) = '') Then
                     Begin
                        MsgDlg('Preencha a Data.', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
                        dtedDataReal.SetFocus;
                        exit;
                     End;

                  If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1051) Then // Desconstituição de Penhora
                     Begin
                        If (dbedNumSeqVinc.Value = 0) Then
                           Begin
                              MsgDlg('É necessário vincular o Nº da Sequência da Penhora que se deseja Desconstituir.', 'Aviso', mtInformation, [mbOk], 0);
                              dbedNumSeqVinc.setfocus;
                              exit;
                           End;

                        If sDesconstituicaoOK = 'B' Then // Bem
                           AtualizaBEM(0, Cds.FieldByName('NUMPROCTRAB').asinteger, dbedNumSeqVinc.value);
                        If sDesconstituicaoOK = 'I' Then // Imovel
                           AtualizaIMOVEL('N', Cds.FieldByName('NUMPROCTRAB').asinteger, dbedNumSeqVinc.value);
                     End;

                  If (dbrgAbate.ItemIndex = -1) Then
                     Begin
                        MsgDlg('É necessário ser informado ao que se refere a Etapa (Depósito, Penhora, etc).', 'Aviso', mtInformation, [mbOk], 0);
                        dbrgAbate.setfocus;
                        exit;
                     End;

                  // SOL 170769 KTN 1525972  Paulo Nobre
                  If (CdsTipoEtapa.fieldByname('FLGEXIGELANCVALOR').asString = 'S') Then
                     Begin
                        If (dbedValRec.Value = 0) Then //-- Renan Cristiano SOL 133219 | Kintana 774633
                           Begin
                              MsgDlg('É necessário informar o Valor.', 'Aviso', mtInformation, [mbOk], 0);
                              dbedValRec.setfocus;
                              exit;
                           End;
                     End;

                  // SOL 174225 KTN 1572025 - Paulo Nobre
                  If (CdsTipoEtapa.FieldByName('FLGINTEGRAFINANCEIRO').asString = 'S') Then
                     Begin
                        If (Trim(dblkCentroCusto.Text) = '') Then
                           Begin
                              MsgDlg('Preencha o Centro de Custo.', 'Aviso', mtWarning, [mbOk], 0);
                              dblckTipoEtp.SetFocus;
                              exit;
                           End;

                        If strtodate(trim(dbDtPrevPagto.Text)) <= strtodate(Trim(dtedDataReal.Text)) Then
                           Begin
                              MsgDlg('Data Prevista de Pagto. deve ser MAIOR que a Data de Laçamento.', 'Aviso', mtWarning, [mbOk], 0);
                              dbDtPrevPagto.SetFocus;
                              exit;
                           End;

                        If (CdsParamRH.FieldByName('CODDESEMBCUSTASJUDPAG').asString = '') Then
                           Begin
                              MsgDlg('Desembolso das Custas não foi Parametrizado. Verifique !', 'Aviso', mtWarning, [mbOk, mbHelp], 0);
                              Exit;
                           End;

                        // SOL 172550 KTN 1555163 - Paulo Nobre
         //               If CdsCentroResponsabilidade.FieldByName('CODCENTRORESPON').AsString = '' Then
         //                  Begin
         //                     MsgDlg('Centro de Responsabilidade não encontrado para este Usuário.', 'Aviso', mtWarning, [mbOk], 0);
         //                     exit;
         //                  End;

                        If (Trim(dbTipoDesembolso.Text) = '') Then
                           Begin
                              MsgDlg('Etapa exige o pré-cadastramento do Desembolso. Verifique !', 'Aviso', mtWarning, [mbOk], 0);
                              dblckTipoEtp.SetFocus;
                              exit;
                           End;

                        If CdsDet.FieldByName('IDCBANCARIA').AsInteger = 0 Then
                           Begin
                              MsgDlg('Conta Bancária não definida. Verifique !', 'Aviso', mtWarning, [mbOk], 0);
                              btnContaBancClick(self);
                              exit;
                           End;

                     End;
               End;

            //-- Renan Cristiano SOL 131509 Kintana 750181 Fim.

            If (Trim(dbedAssunto.Text) = '') Then
               dbedAssunto.Text := dblckTipoEtp.Text;

            If (Trim(dbmObserv.Text) = '') Then
               dbmObserv.Text := dblckTipoEtp.text + ' - Proc.Interno Nº: ' + Cds.FieldByName('NUMPROCTRAB').asString;

            CdsDet.FieldByName('ETAPA').asString := CdsTipoEtapa.FieldByName('DESCRICAO').asString;
            CdsDet.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date;

            // SOL 156018
            // SOL 161760 KTN 1379145 - Paulo Nobre
            If CdsTipoEtapa.FieldByName('FLGINTEGRAFINANCEIRO').asString = 'S' Then // Sim
               LocalizaEtapaDesembolso(iIdPrograma, CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger, CdsTipoEtapa.FieldByName('RECPAG').asString);
            // Fim - SOL 156018

            If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or // Depósito Judicial - Controverso
            (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110) Then // Depósito Judicial - Incontroverso
               Begin
                  If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Then // Depósito Judicial - Controverso
                     Begin
                        If Not LocalizaEtapaVincular('1110', iNumSeqEtapaVinc) Then
                           Begin
                              If MsgDlg('Existirá um Depósito Judicial INCONTROVERSO Vinculado ?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
                                 CdsDet.FieldByName('NUMSEQVINC').asInteger := -1; // -1 usado como um flag lógico temporário para indicar que há Etapa a Vincular
                           End
                        Else
                           Begin
                              CdsDet.FieldByName('NUMSEQVINC').asInteger := iNumSeqEtapaVinc;
                              dbedNumSeqVinc.Enabled := False;
                           End;
                     End
                  Else // Depósito Judicial - Incontroverso
                     Begin
                        If Not LocalizaEtapaVincular('1035', iNumSeqEtapaVinc) Then
                           Begin
                              If MsgDlg('Existirá um Depósito Judicial CONTROVERSO Vinculado ?', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
                                 CdsDet.FieldByName('NUMSEQVINC').asInteger := -1; // -1 usado como um flag lógico temporário para indicar que há Etapa a Vincular
                           End
                        Else
                           Begin
                              CdsDet.FieldByName('NUMSEQVINC').asInteger := iNumSeqEtapaVinc;
                              dbedNumSeqVinc.Enabled := False;
                           End;
                     End;
               End;

            CmeDetalhe.RepetirInsert := False;

            Inherited;

            bAtualizaEtapa := True;

            sbtnAlterar.Enabled := True;
            bbtnConfirmar.enabled := True;
            bbtnCancelar.enabled := True;
            pnlControlesDet.Enabled := False;
            dbgrdDet.enabled := True;

            sbtnInsDet.Enabled := True;
            sbtnAltDet.Enabled := True;
            sbtnExcluiDet.Enabled := True;

            spbDesfazerIntrega.Enabled := Not CdsDet.FieldByName('CODDOCUMENTO').isnull;

            application.ProcessMessages;

            CdsDetAfterScroll(CdsDet);
         Except
            On E: Exception Do
               Begin

                  frmAguarde.pbAguarde.Visible := True;
                  frmAguarde.Apaga;

                  bbtnCancelarClick(self);
               End;
         End;
      End;
End;

Procedure TfrmCustomCadRegEtp.bbtnConfirmarClick(Sender: TObject);
Var
   EtapaAtual: TBookmark;
   CdsAux: TClientDataSet;
   dValorEtapa, dValorCustas, dValorEtapaVinc: Double;
   sSql, sEtapaObservacao, sEtapaCustasObservacao, sIdDesembolsoCustas, sCodTipoRecursoVinculado: String;
Begin
   CdsAux := TClientDataSet.Create(Nil);
   dValorEtapa := 0;
   dValorCustas := 0;
   dValorEtapaVinc := 0;
   sEtapaCustasObservacao := '';

   EtapaAtual := CdsDet.GetBookmark; // Salvando o ponteiro da Etapa Atual

   If bAtualizaEtapa Then
      Begin
         frmAguarde.pbAguarde.Visible := false;
         frmAguarde.Mostra('Atualizando a(s) Etapa(s)...');
         bAtualizaEtapa := False;

         Screen.Cursor := crSQLWait;
         // Comita as etapas
         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;
         Screen.Cursor := crDefault;

         Inherited;

         // SOL 174225 KTN 1572025 - Paulo Nobre
         CdsDet.GotoBookmark(EtapaAtual); // Voltando a Etapa atual
      End;

   If (bExcluiu = False) And // somente se tiver incluindo e alterando
   (bIntegraFinanceiro) And // Integrar Geral vindo do parâmetro
   (CdsTipoEtapa.FieldByName('FLGINTEGRAFINANCEIRO').asString = 'S') And // Se a Etapa está marcada para integrar
   (CdsDet.FieldByName('CODDOCUMENTO').isnull) And // Não tiver sido integrado
   (CdsDet.FieldByName('NUMSEQVINC').asInteger <> -1) Then // se não for uma etapa vinculada
      Begin
         If MsgDlg('Gerar Integração Contábil && Financeira dessa Etapa ? ', 'Atenção', mtConfirmation, [mbYes, mbNo], 0) = mrYes Then
            Begin
               // Carregando os Objetos associados
               cdsEtapaxObjetos.Data := CtrlEtapaProcesso.LocalizaObjAssociados(cds.FieldByName('NUMPROCTRAB').asFloat, CdsDet.FieldByName('NUMSEQ').AsFloat, CdsDet.FieldByName('CODTIPORECURSO').asFloat);
               If Not cdsEtapaxObjetos.IsEmpty Then
                  Begin
                     sEtapaObservacao := Trim(CdsDet.FieldByName('OBSERVETAPA').asString);

                     ////////////////////  Rotina para Depósitos Judiciais ////////////////////////
                     If ((CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or // Depósito Judicial - Controverso
                        (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110)) And // Depósito Judicial - Incontroverso
                     (CdsDet.FieldByName('NUMSEQVINC').asInteger > 0) Then
                        Begin
                           If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Then
                              Begin
                                 sCodTipoRecursoVinculado := '1110';
                                 sEtapaObservacao := 'Dep.Judicial Incontroverso e Controverso - Proc.Interno nº: ' + Cds.FieldByName('NUMPROCTRAB').asString;
                              End
                           Else
                              Begin
                                 sCodTipoRecursoVinculado := '1035';
                                 sEtapaObservacao := 'Dep.Judicial Controverso e Incontroverso - Proc.Interno nº: ' + Cds.FieldByName('NUMPROCTRAB').asString;
                              End;

                           Screen.Cursor := crSQLWait;
                           sSql := 'SELECT NUMSEQ, VALORREC                                   ' + #13#10 +
                              ' FROM ETAPAPROCTRAB                                            ' + #13#10 +
                              ' WHERE NUMPROCTRAB = ' + Cds.FieldByName('NUMPROCTRAB').AsString + #13#10 +
                              ' AND CODTIPORECURSO = ' + quotedStr(sCodTipoRecursoVinculado) + #13#10 +
                              ' AND NUMSEQ = ' + CdsDet.FieldByName('NUMSEQVINC').asString;
                           CdsAux.Data := Padroes.GetDataPacket(sSql);
                           Screen.Cursor := crDefault;
                           If Not CdsAux.IsEmpty Then
                              dValorEtapaVinc := CdsAux.FieldByName('VALORREC').asFloat;
                        End;
                     ////////////////////////////////////////////////////////////////////////////////////

                     dValorEtapa := CdsDet.FieldByName('VALORREC').asFloat;
                     dValorCustas := CdsDet.FieldByName('VALORCUSTAS').asFloat;

                     If dValorCustas > 0 Then
                        sEtapaObservacao := sEtapaObservacao + ' - ( incluso Custas Judiciais ) ';

                     frmAguarde.pbAguarde.Visible := false;
                     frmAguarde.Mostra('Realizando as Integrações...');

                     Try
                        // Abrindo nova transação para as Integrações
                        If Not dtmBaseDados.dbBaseDados.InTransaction Then
                           dtmBaseDados.dbBaseDados.StartTransaction;

                        // SOL 174225 KTN 1572025 - Paulo Nobre
                        // Contabilizando a Etapa Atual
                        If CtrlEtapaProcesso.IntegrandoEtapaContabilFinanceiro(
                           CdsDet.FieldByName('DATAREALOCOR').AsDateTime, // Data de Emissão/Lançamento
                           CdsDet.FieldByName('DATAPREVPAGTO').AsDateTime, // Data Prevista de Pagamento
                           Cds.FieldByName('IDADVOGRECDA').AsInteger, // Id do Escritorio de Advocacia (Favorecido)
                           CdsDet.FieldByName('IDCBANCARIA').AsInteger, // Id da Conta Bancaria
                           qryTipoDesembolso.FieldByName('PLANO').asInteger, // Plano Contábil
                           CdsParamRH.FieldByName('CODTIPDOCEJURETAPA').asInteger, // Tipo de Documento
                           CdsPortadorFormaCAP.FieldByName('CODFORMA').asInteger,
                           qryTipoDesembolso.fieldbyname('IDPROGRAMA').asInteger, // Programa do Desembolso
                           qryLkpCentroCusto.FieldByName('CODCENTROCUSTO').AsString, // Centro de Custo
                           CdsCentroResponsabilidade.FieldByName('CODCENTRORESPON').AsString, // Centro de Responsabilidade
                           sEtapaObservacao, // Histórico
                           qryTipoDesembolso.fieldbyname('RECPAG').AsString, // RecPag da Etapa
                           qryTipoDesembolso.fieldbyname('CODTIPRECDES').AsString, // Desembolso da Etapa
                           CdsParamRH.fieldbyname('RECPAGCUSTASJUDPAG').asString, // RecPag das Custas
                           CdsParamRH.fieldbyname('CODDESEMBCUSTASJUDPAG').asString, // Desembolso da Custas
                           CdsTipoEtapa.FieldByName('FLGINTEGRACONTABIL').asString,
                           dValorEtapa,
                           dValorEtapaVinc,
                           dValorCustas,
                           cdsEtapaxObjetos) Then
                           Begin
                              Screen.Cursor := crSQLWait;
                              // Atualiza a Etapa Corrente
                              AuxiEtapa.SQL.Clear;
                              AuxiEtapa.SQL.add('UPDATE ETAPAPROCTRAB SET  ');
                              AuxiEtapa.SQL.add('CODDOCUMENTO = ' + CtrlEtapaProcesso.CodDocumento);
                              AuxiEtapa.SQL.add(',NODOCUMENTO = ' + CtrlEtapaProcesso.NumDocumentoGerado);
                              AuxiEtapa.SQL.add(',PLANO = ' + qryTipoDesembolso.FieldByName('PLANO').asString);
                              AuxiEtapa.SQL.add(',PLNCODIGO = ' + inttostr(CtrlEtapaProcesso.plncodigogerado));
                              AuxiEtapa.SQL.add(',PLNPLANIL = ' + quotedstr(CtrlEtapaProcesso.NumPlanilhaGerada));
                              AuxiEtapa.SQL.add('WHERE NUMPROCTRAB = ' + Cds.FieldByName('NUMPROCTRAB').AsString);
                              AuxiEtapa.SQL.add('      AND NUMSEQ = ' + CdsDet.FieldByName('NUMSEQ').AsString);
                              AuxiEtapa.SQL.add('      AND CODTIPORECURSO = ' + CdsDet.FieldByName('CODTIPORECURSO').AsString);
                              AuxiEtapa.ExecSql;

                              // Atualiza a Etapa Vinculada
                              If ((CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or // Depósito Judicial - Controverso
                                 (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110)) Then // Depósito Judicial - Incontroverso
                                 Begin
                                    qryAux1.SQL.Clear;
                                    qryAux1.SQL.add('UPDATE ETAPAPROCTRAB SET NUMSEQVINC = 0 ');
                                    qryAux1.SQL.add(',CODDOCUMENTO = ' + CtrlEtapaProcesso.CodDocumento);
                                    qryAux1.SQL.add(',NODOCUMENTO = ' + CtrlEtapaProcesso.NumDocumentoGerado);
                                    qryAux1.SQL.add(',PLANO = ' + qryTipoDesembolso.FieldByName('PLANO').asString);
                                    qryAux1.SQL.add(',PLNCODIGO = ' + inttostr(CtrlEtapaProcesso.plncodigogerado));
                                    qryAux1.SQL.add(',PLNPLANIL = ' + quotedstr(CtrlEtapaProcesso.NumPlanilhaGerada));
                                    qryAux1.SQL.add('WHERE NUMPROCTRAB = ' + Cds.FieldByName('NUMPROCTRAB').AsString);
                                    qryAux1.SQL.add('      AND NUMSEQVINC = -1');
                                    If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Then // Depósito Judicial - Controverso
                                       qryAux1.SQL.add('      AND CODTIPORECURSO = 1110 ') // Incontroverso
                                    Else
                                       qryAux1.SQL.add('      AND CODTIPORECURSO = 1035 '); // Controverso
                                    qryAux1.ExecSql;
                                 End;

                              // Comita a etapa
                              If dtmBaseDados.dbBaseDados.InTransaction Then
                                 dtmBaseDados.dbBaseDados.Commit;
                              Screen.Cursor := crDefault;

                              frmAguarde.pbAguarde.Visible := True;
                              frmAguarde.Apaga
                           End
                        Else
                           Raise Exception.Create(FCtrlDocumento.MessageInfo);
                     Except
                        On E: Exception Do
                           Begin
                              If dtmBaseDados.dbBaseDados.InTransaction Then
                                 dtmBaseDados.dbBaseDados.RollBack;

                              frmAguarde.pbAguarde.Visible := True;
                              frmAguarde.Apaga;

                              MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Informação', mtInformation, [mbOk, mbHelp], 0);
                              Exit;
                           End;
                     End;
                  End
               Else
                  Begin
                     MsgDlg('Para a Integração desta Etapa, primeiro, é necessário Associar Objetos. Verifique !', 'Aviso', mtWarning, [mbOk], 0);
                     frmAguarde.pbAguarde.Visible := True;
                     frmAguarde.Apaga;
                     bbtnCancelarClick(self);

                     CdsDet.GotoBookmark(EtapaAtual); // Voltando a Etapa atual

                     sbtnAlterarClick(self);
                     Exit;
                  End;

            End;
      End;

   frmAguarde.pbAguarde.Visible := True;
   frmAguarde.Apaga;

   qryTipoDesembolso.Close;
   bExcluiu := False;
   lblTipoDesconstituicao.caption := '';

   bbtnCancelarClick(self);
   FreeAndNil(CdsAux);
   CdsDet.FreeBookmark(EtapaAtual);

End;

Procedure TfrmCustomCadRegEtp.bbtnCancelarClick(Sender: TObject);
Begin
   If dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.Rollback;

   Inherited;

   iNumSeqAtual := CtrlEtapaProcesso.GetUltimoNumSeq;

   CmeCadastroFind(Sender);

   pnlControlesDet.Enabled := False;
   dbgrdDet.enabled := True;
   sbtnAlterar.enabled := True;
End;

Procedure TfrmCustomCadRegEtp.CdsDetAfterInsert(DataSet: TDataSet);
Begin
   Inherited;
   spbInformacoesAdicionais.Enabled := False;
   IdImovelAntes := 0;
End;

Procedure TfrmCustomCadRegEtp.CdsDetBeforePost(DataSet: TDataSet);
Begin
   Inherited;
   If (IdImovelAntes <> CdsDet.FieldByName('IDIMOVEL').asFloat) Or
      ((CdsDet.FieldByName('IDIMOVEL').asFloat > 0) And
      (CdsDet.FieldByName('VALORREC').asFloat < 0)) Then
      Begin
         If (CdsDet.FieldByName('IDIMOVEL').asFloat > 0) And
            (CdsDet.FieldByName('VALORREC').asFloat > 0) Then // Início de Penhora
            Begin
               CtrlProcessoTrab.AtualizarImovel(CdsDet.FieldByName('IDIMOVEL').asFloat, true);
               CtrlProcessoTrab.InserirEventoImovel(
                  CdsDet.FieldByName('IDIMOVEL').asFloat,
                  CdsDet.FieldByName('DATAREALOCOR').asDateTime, //EviData
                  True,
                  copy(CdsDet.FieldByName('OBSERVETAPA').asString, 1, 2000),
                  FU.IFF(CdsDet.FieldByName('INDVALOR').asInteger = 3, CdsDet.FieldByName('VALOR').asFloat, 100), //EviPercent
                  CdsDet.FieldByName('VALORREC').asFloat) // EviVlrAjustado
            End;

         // Término de Penhora
         If ((IdImovelAntes > 0) And // Por Exclusão da Etapa
            (CdsDet.FieldByName('IDIMOVEL').asFloat = 0)) Or
            ((IdImovelAntes = 0) And // Por Desconstituição em Nova Etapa
            (CdsDet.FieldByName('IDIMOVEL').asFloat > 0) And
            (CdsDet.FieldByName('VALORREC').asFloat < 0)) Then
            Begin
               CtrlProcessoTrab.AtualizarImovel(FU.IFF(IdImovelAntes > 0, IdImovelAntes,
                  CdsDet.FieldByName('IDIMOVEL').asFloat), False);
               CtrlProcessoTrab.InserirEventoImovel(
                  FU.IFF(IdImovelAntes > 0, IdImovelAntes, CdsDet.FieldByName('IDIMOVEL').asFloat),
                  CdsDet.FieldByName('DATAREALOCOR').asDateTime, //EviData
                  False,
                  copy(CdsDet.FieldByName('OBSERVETAPA').asString, 1, 2000),
                  0, //EviPercent
                  0) //EviVlrAjustado
            End;
      End;
End;

Procedure TfrmCustomCadRegEtp.CdsDetBeforeDelete(DataSet: TDataSet);
Begin
   Inherited;
   If (CdsDet.FieldByName('IDIMOVEL').asFloat > 0) Then // Término de Penhora
      Begin
         CtrlEtapaProcesso.AtualizarImovel(CdsDet.FieldByName('IDIMOVEL').asFloat, False);
         CtrlEtapaProcesso.InserirEventoImovel(
            CdsDet.FieldByName('IDIMOVEL').asFloat,
            CdsDet.FieldByName('DATAREALOCOR').asDateTime, //EviData
            False,
            'Penhora Excluída',
            0, //EviPercent
            0) //EviVlrAjustado
      End;
End;

Procedure TfrmCustomCadRegEtp.Sel(NumProcTrab: double);
Begin
   Cds.Data := CtrlProcessoTrab.ListProcesso(NumProcTrab);
   CdsDet.Data := CtrlEtapaProcesso.ListEtapas(NumProcTrab);
   CdsDetAfterScroll(CdsDet);

   CdsImagem.Data := CtrlEtapaProcesso.ListImagens(NumProcTrab);

   If NumProcTrab > 0 Then
      Begin
         CdsPrograma.Data := CtrlListTerceirosRH.ListTipProcJUR(Cds.FieldByName('IDTIPOPROC').asInteger);
         // SOL 174225 KTN 1572025 - Paulo Nobre
         CdsCentroResponsabilidade.Data := CtrlListTerceirosRH.ListaCentroResponsabilidadeJUR(Sistema.IdUsuario);
         CdsTipoDoc.Data := CtrlListTerceirosRH.ListTipoDocRecPagEtapa(CdsParamRH.FieldByName('CODTIPDOCEJURETAPA').asInteger, 'P');
         CdsPortadorFormaCAP.Data := CtrlListTerceirosRH.ListPortadorFormaEtapa(CdsParamRH.FieldByName('CODPORTFORMAPAGETAPAJUR').asInteger, 'P');

         qryLkpCentroCusto.Close;
         qryLkpCentroCusto.Open;
         dblkCentroCusto.LookupValue := CdsParamRH.FieldByName('CODCENTCUSTOJUR').asString; // '71136' - Default GEJUR
      End;

   dValHonorAntes := 0;
   dValDespesaTot := Cds.FieldByName('DESPESAPROC').asFloat;
End;

Procedure TfrmCustomCadRegEtp.GravarHonorarioEtapa;
Begin
   If (Cds.FieldByName('IDADVOGRECDA').IsNull) Then
      Begin
         If Not (CtrlEtapaProcesso.GerarHonorario(Date)) Then
            MsgDlg(CtrlEtapaProcesso.MessageInfo, 'Erro', mtError, [mbOk, mbHelp], 0);
      End;
End;

Function TfrmCustomCadRegEtp.GravarRegistro: boolean;
Begin
   CdsDet.BeforeEdit := Nil;
   Result := CtrlEtapaProcesso.GravarEtapaProcesso(true, true, IdBemAntes, IdConjuntoAntes);
   CdsDet.BeforeEdit := CdsDetBeforeEdit;
   If Not (Result) Then
      Raise Exception.Create(CtrlEtapaProcesso.MessageInfo);
End;

Procedure TfrmCustomCadRegEtp.sbtnProcurarClick(Sender: TObject);
Begin
   MontaSelect.UsaDistinct := false;
   MontaSelect.Caption := 'Seleciona Processo';

   MontaSelect.Filtro.Clear;

   MontaSelect.Tabelas.Clear;
   MontaSelect.Tabelas.Add('PESSOA');
   MontaSelect.Tabelas.Add('PROCESSOTRAB');
   MontaSelect.Tabelas.Add('VARAJUSTICA');

   OnClick_ProcurarProcesso;

   MontaSelect.Filtro.Add('PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA');
   MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
   Inherited;
   sbtnAlterar.Enabled := True;
End;

Procedure TfrmCustomCadRegEtp.sbtnProcurarLitisClick(Sender: TObject);
Begin
   Inherited;
   MontaSelect.UsaDistinct := true;
   MontaSelect.Caption := 'Seleciona Processo Incluindo Litisconsortes';

   MontaSelect.Filtro.Clear;

   MontaSelect.CamposChave.Clear;
   MontaSelect.CamposChave.Add('PROCESSOTRAB.NUMPROCTRAB');

   MontaSelect.Tabelas.Clear;
   MontaSelect.Tabelas.Add('PESSOA');
   MontaSelect.Tabelas.Add('PROCESSOTRAB');
   MontaSelect.Tabelas.Add('COPARTPROCTRAB');
   MontaSelect.Tabelas.Add('VARAJUSTICA');

   OnClick_ProcurarProcessoComLitisconsortes;

   MontaSelect.Filtro.Add('(PROCESSOTRAB.IDRECLAMANTE = PESSOA.IDPESSOA) OR (COPARTPROCTRAB.IDPESSOA = PESSOA.IDPESSOA)');
   MontaSelect.Filtro.Add('PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)');
   MontaSelect.Filtro.Add('PROCESSOTRAB.NUMPROCTRAB   = COPARTPROCTRAB.NUMPROCTRAB(+)');

   sbtnProcurarClick(Sender);
   sbtnProcurarLitis.Down := false;
End;

Procedure TfrmCustomCadRegEtp.bbtnMultaClick(Sender: TObject);
Begin
   Inherited;
   If Assigned(frmCadRegMulta) Then
      frmCadRegMulta := frmCadRegMulta;
   frmCadRegMulta := TfrmCadRegMulta.Create(Application);
   frmCadRegMulta.ExibirTelaMulta(Cds, CdsDet, Nil);

End;

Procedure TfrmCustomCadRegEtp.CdsAfterScroll(DataSet: TDataSet);
Begin
   Inherited;
   // Rotina para trazer os valores do Banco de Dados
   CtrlEtapaProcesso.GetValores(Cds.FieldByName('NumProcTrab').AsFloat,
      dValCausa, dValOrig, dValAtual, dValReal);
End;

Procedure TfrmCustomCadRegEtp.CmeDetalheInsert(Sender: TObject);
Begin
   Inherited;
   //William M. Santos - SOL nº 126248  KINTANA nº 658219 - INI
   If (pgctrlDetalhe.ActivePage = tbsDet) Then
      Begin
         If CdsDet.RecordCount = 0 Then
            iNumSeqAtual := 1
         Else
            Inc(iNumSeqAtual);
         CdsDet.FieldByName('NUMSEQ').asInteger := iNumSeqAtual;
         //William M. Santos - SOL nº 658219 .  KINTANA nº 658219 - FIM
      End;
End;

Procedure TfrmCustomCadRegEtp.bbtnCancelarDetClick(Sender: TObject);
Begin
   //William M. Santos - SOL nº 126248  KINTANA nº 658219 - INI
   If (pgctrlDetalhe.ActivePage = tbsDet) And (CdsDet.State = dsInsert) Then
      Dec(iNumSeqAtual);
   //William M. Santos - SOL nº 126248  KINTANA nº 658219 - FIM
   Inherited;

   sbtnAlterar.Enabled := True;
   bbtnConfirmar.enabled := True;
   bbtnCancelar.enabled := True;
   pnlControlesDet.Enabled := False;
   dbgrdDet.enabled := True;

   sbtnInsDet.Enabled := True;
   sbtnAltDet.Enabled := True;
   sbtnExcluiDet.Enabled := True;

   CdsDetAfterScroll(CdsDet);
End;

Procedure TfrmCustomCadRegEtp.CmeCadastroInsert(Sender: TObject);
Begin
   Inherited;
   //William M. Santos - SOL nº 126248  KINTANA nº 658219 - INI
   iNumSeqAtual := 0;
   //William M. Santos - SOL nº 126248  KINTANA nº 658219 - INI
End;

Procedure TfrmCustomCadRegEtp.sbtnExcluiDetClick(Sender: TObject);
Begin
   If cdsDet.FieldByName('CODDOCUMENTO').isnull Then
      Begin
         If MsgDlg('Confirma Exclusão dessa Etapa ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
            
               // Sol 196976/13142 Kintana 1886103 - Paulo Nobre
               If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               bExcluiu := True;

               // SOL 155481  KTN 1233809 - Paulo Nobre
               If sTrgUserInclusao = '' Then
                  Begin
                     If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1030) Then // Penhora
                        AtualizaIMOVEL('N', cdsDet.FieldByName('NUMPROCTRAB').asinteger, cdsDet.FieldByName('NUMSEQVINC').asinteger);

                     If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1051) Then // Desconstituição de Penhora
                        Begin
                           TestaSeDesconstituicao(cdsDet.FieldByName('NUMPROCTRAB').asinteger, cdsDet.FieldByName('NUMSEQVINC').asinteger);
                           If sDesconstituicaoOK = 'B' Then
                              AtualizaBEM(1, cdsDet.FieldByName('NUMPROCTRAB').asinteger, cdsDet.FieldByName('NUMSEQVINC').asinteger);
                           If sDesconstituicaoOK = 'I' Then
                              AtualizaIMOVEL('P', cdsDet.FieldByName('NUMPROCTRAB').asinteger, cdsDet.FieldByName('NUMSEQVINC').asinteger);
                           If sDesconstituicaoOK = 'V' Then
                              //                  AtualizaINVESTIMENTO('P', cdsDet.FieldByName('NUMPROCTRAB').asinteger, cdsDet.FieldByName('NUMSEQVINC').asinteger);
                              If sDesconstituicaoOK = 'F' Then
                                 //                  AtualizaFUNDOS('P', cdsDet.FieldByName('NUMPROCTRAB').asinteger, cdsDet.FieldByName('NUMSEQVINC').asinteger);
                        End;

                     //Brunno Mattos - SOL 149850 - KTN 1086522 - Inclui o 1110
                     If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or //Depósito Judicial - COntroverso
                     (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110) Or // Depósito Judicial - Incontroverso
                     (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1053) Then // Condenacao Solidária / Subsidiária
                        CtrlEtpDesdobramento.ExcluiDesdobramento(cdsDet.FieldByName('NUMPROCTRAB').asFloat, CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger, CdsDet.FieldByName('NUMSEQ').AsFloat);

                     If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1111) Then // Arrematação
                        CtrlEtapaProcesso.ExcluiArrematacao(cdsDet.FieldByName('NUMPROCTRAB').asFloat, CdsDet.FieldByName('NUMSEQ').AsFloat, CdsDet.FieldByName('CODTIPORECURSO').asFloat);

                     If (CdsTipoEtapa.FieldByName('FLGINTEGRAFINANCEIRO').asString = 'S') Then
                        CtrlEtapaProcesso.ExcluiObjAssociados(cdsDet.FieldByName('NUMPROCTRAB').asFloat, CdsDet.FieldByName('NUMSEQ').AsFloat, CdsDet.FieldByName('CODTIPORECURSO').asFloat);
                  End
               Else
                  Begin
                     // SOL 155481  KTN 1233809 - Paulo Nobre
                     If sTrgUserInclusao = CdsDet.FieldByName('TRGUSERINCLUSAO').AsString Then
                        Begin
                           //Brunno Mattos - SOL 149850 - KTN 1086522 - Inclui o 1110
                           If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or //Depósito Judicial - Controverso
                           (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110) Then // Depósito Judicial - Incontroverso
                              CtrlEtpDesdobramento.ExcluiDesdobramento(cdsDet.FieldByName('NUMPROCTRAB').asFloat, CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger, CdsDet.FieldByName('NUMSEQ').AsFloat);
                        End
                     Else
                        Begin
                           MsgDlg('Você não tem permissão para Excluir esta Etapa. Verifique !', 'Aviso', mtInformation, [mbOk], 0);
                           sbtnExcluiDet.Down := False;
                           Exit;
                        End;
                  End;

               Inherited;

               bAtualizaEtapa := True;

            End;
      End
   Else
      Begin
         Application.MessageBox('Etapa não pode ser Excluída, por conter Integração.' + #13 + #13 +
            'Portanto, primeiramente, será necessário Desfazer a Integração.', 'Atenção !', mb_ICONWARNING + mb_OK);
         sbtnExcluiDet.Down := False;
      End;
End;

//************* novas rotinas ****************************************************

Procedure TfrmCustomCadRegEtp.AtualizaBEM(iSit: Integer; NumProc, NumSeq: double);
Begin
   Screen.Cursor := crSQLWait;
   qryAux1.SQL.clear;
   qryAux1.SQL.add('SELECT IDBEM, INDPENHORA FROM ETAPAPROCTRAB ');
   qryAux1.SQL.add('WHERE NUMPROCTRAB = ' + FloatToStr(NumProc));
   qryAux1.SQL.add('      AND CODTIPORECURSO = ' + FloatToStr(1030)); // Penhora
   qryAux1.SQL.add('      AND NUMSEQ = ' + FloatToStr(NumSeq));
   qryAux1.Open;
   If Not qryAux1.isEmpty Then
      Begin
         If iSit = 0 Then
            Begin
               cdsDet.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
               cdsDet.FieldByName('INDVALOR').asInteger := 1;
               cdsDet.FieldByName('INDPENHORA').asInteger := qryAux1.FieldByName('INDPENHORA').asinteger;
               cdsDet.FieldByName('VALOR').asFloat := dbedValRec.value;
               cdsDet.FieldByName('IDBEM').asInteger := qryAux1.FieldByName('IDBEM').asinteger;
            End;
      End;

   qryAux.SQL.clear;
   qryAux.SQL.add('UPDATE BEM SET FLGPENHORA = ' + quotedstr(inttostr(iSit))); // Libera o bem da Penhora
   qryAux.SQL.add('WHERE IDBEM = ' + FloatToStr(qryAux1.FieldByName('IDBEM').asinteger));
   qryAux.ExecSql;

   If iSit = 0 Then
      Begin
         MsgDlg('BEM Desconstituído com sucesso !', 'Aviso', mtInformation, [mbOk], 0);
         lblTipoDesconstituicao.caption := '';
         sDesconstituicaoOK := '';
         dbedValRec.setfocus;
      End;

   Screen.Cursor := crDefault;
End;

Procedure TfrmCustomCadRegEtp.AtualizaIMOVEL(sSit: String; NumProc, NumSeq: double);
Begin
   Screen.Cursor := crSQLWait;
   qryAux1.SQL.clear;
   qryAux1.SQL.add('SELECT IDIMOVEL, INDPENHORA FROM ETAPAPROCTRAB ');
   qryAux1.SQL.add('WHERE NUMPROCTRAB = ' + FloatToStr(NumProc));
   qryAux1.SQL.add('      AND CODTIPORECURSO = ' + FloatToStr(1030)); // Penhora
   qryAux1.SQL.add('      AND NUMSEQ = ' + FloatToStr(NumSeq));
   qryAux1.Open;
   If Not qryAux1.isEmpty Then
      Begin
         If sSit = 'N' Then
            Begin
               cdsDet.FieldByName('IDPESSOA').asInteger := Sistema.IdEmpresa;
               cdsDet.FieldByName('INDVALOR').asInteger := 1;
               cdsDet.FieldByName('INDPENHORA').asInteger := qryAux1.FieldByName('INDPENHORA').asinteger;
               cdsDet.FieldByName('VALOR').asFloat := dbedValRec.value;
               cdsDet.FieldByName('IDIMOVEL').asInteger := qryAux1.FieldByName('IDIMOVEL').asinteger;
            End;
      End;

   qryAux.SQL.clear;
   qryAux.SQL.add('UPDATE IMOVEL SET FLGSTATUS = ' + quotedstr(sSit)); // Libera o bem da Penhora
   qryAux.SQL.add('WHERE IDIMOVEL = ' + FloatToStr(qryAux1.FieldByName('IDIMOVEL').asinteger));
   qryAux.ExecSql;

   If sSit = 'N' Then
      Begin
         MsgDlg('IMOVEL Desconstituído com sucesso !', 'Aviso', mtInformation, [mbOk], 0);
         lblTipoDesconstituicao.caption := '';
         sDesconstituicaoOK := '';
         //         dbedValRec.setfocus;
      End;

   Screen.Cursor := crDefault;
End;

Procedure TfrmCustomCadRegEtp.TestaSeDesconstituicao(NumProc2, NumSeq2: double);
Begin
   Screen.Cursor := crSQLWait;
   qryAux1.SQL.clear;
   qryAux1.SQL.add('SELECT IDBEM, IDIMOVEL, IDINVESTIMENTO, IDFUNDOINVEST, VALORREC, INDPENHORA FROM ETAPAPROCTRAB ');
   qryAux1.SQL.add('WHERE NUMPROCTRAB = ' + FloatToStr(NumProc2));
   qryAux1.SQL.add('      AND CODTIPORECURSO = ' + FloatToStr(1030)); // Penhora   FLGVALORABATE = 2
   qryAux1.SQL.add('      AND NUMSEQ = ' + FloatToStr(NumSeq2));
   qryAux1.Open;
   Screen.Cursor := crDefault;
   If qryAux1.FieldByName('INDPENHORA').asInteger <> 4 Then // Não for Numerário
      Begin
         If (qryAux1.FieldByName('IDBEM').isnull) And
            (qryAux1.FieldByName('IDIMOVEL').isnull) And
            (qryAux1.FieldByName('IDINVESTIMENTO').isnull) And
            (qryAux1.FieldByName('IDFUNDOINVEST').isnull) Then
            sDesconstituicaoOK := '' // Vinculação informada não remete a uma penhora válida
         Else
            Begin
               If Not (qryAux1.FieldByName('IDBEM').isnull) Then
                  sDesconstituicaoOK := 'B'; // Tem penhora - Bem
               If Not (qryAux1.FieldByName('IDIMOVEL').isnull) Then
                  sDesconstituicaoOK := 'I'; // Tem penhora - Imovel
               If Not (qryAux1.FieldByName('IDINVESTIMENTO').isnull) Then
                  sDesconstituicaoOK := 'V'; // Tem penhora - Investimento
               If Not (qryAux1.FieldByName('IDFUNDOINVEST').isnull) Then
                  sDesconstituicaoOK := 'F'; // Tem penhora - Fundos

               ValorDesconstituicao := qryAux1.FieldByName('VALORREC').asFloat * -1;
            End;
      End
   Else
      Begin
         sDesconstituicaoOK := 'N'; // Tem penhora- Numerário
         ValorDesconstituicao := qryAux1.FieldByName('VALORREC').asFloat * -1;
      End;
End;

Procedure TfrmCustomCadRegEtp.sbtnInsDetClick(Sender: TObject);
Begin
   If Not dtmBaseDados.dbBaseDados.InTransaction Then
      dtmBaseDados.dbBaseDados.StartTransaction;

   iNumSeqAtual := CtrlEtapaProcesso.GetUltimoNumSeq;

   bbtnConfirmar.enabled := False;
   bbtnCancelar.enabled := False;
   pnlControlesDet.Enabled := True;
   dbgrdDet.enabled := False;

   Inherited;

   sbtnInsDet.Enabled := False;
   sbtnAltDet.Enabled := False;
   sbtnExcluiDet.Enabled := False;
   spbDesfazerIntrega.Enabled := False;

   dblckTipoEtp.Setfocus;
End;

Procedure TfrmCustomCadRegEtp.sbtnAltDetClick(Sender: TObject);
Begin
   If cdsDet.FieldByName('CODDOCUMENTO').isnull Then
      Begin
         // SOL 166469 Kintana 1451795 - Paulo Nobre
         dbeNumdocto.Enabled := True;
         dbeNumdocto.Color := clWhite;
         If (dbeNumdocto.text <> '') And (CdsDet.FieldByName('PLNCODIGO').AsString <> '') Then
            Begin
               dbeNumdocto.Enabled := False;
               dbeNumdocto.Color := clBtnFace;
            End;

         // SOL 155481  KTN 1233809 - Paulo Nobre
         If (sTrgUserInclusao <> '') And (sTrgUserInclusao <> CdsDet.FieldByName('TRGUSERINCLUSAO').AsString) Then
            Begin
               MsgDlg('Você não tem permissão para Alterar esta Etapa. Verifique !', 'Aviso', mtInformation, [mbOk], 0);
               sbtnAltDet.Down := False;
               Exit;
            End;
         //

         If Not dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         bbtnConfirmar.enabled := False;
         bbtnCancelar.enabled := False;
         pnlControlesDet.Enabled := True;
         dbgrdDet.enabled := False;

         // SOL 161760 KTN 1379145 - Paulo Nobre
         If CdsTipoEtapa.FieldByName('FLGINTEGRAFINANCEIRO').asString = 'S' Then // Sim
            LocalizaEtapaDesembolso(iIdPrograma, CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger, CdsTipoEtapa.FieldByName('RECPAG').asString);

         Inherited;

         sbtnInsDet.Enabled := False;
         sbtnAltDet.Enabled := False;
         sbtnExcluiDet.Enabled := False;
         spbDesfazerIntrega.Enabled := False;

         dblckTipoEtp.Setfocus;
      End
   Else
      Begin
         Application.MessageBox('Etapa não pode ser Alterada, por conter Integração.' + #13 + #13 +
            'Portanto, primeiramente, será necessário Desfazer a Integração.', 'Atenção !', mb_ICONWARNING + mb_OK);
         sbtnAltDet.Down := False;
      End;
End;

Procedure TfrmCustomCadRegEtp.dbedNumSeqVincExit(Sender: TObject);
Begin
   Inherited;
   If CdsDet.FieldByName('NUMSEQVINC').asinteger > 0 Then
      Begin
         If pgctrlDetalhe.ActivePageIndex = 0 Then // Etapas
            Begin
               If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1051) Then // Desconstituição de Penhora
                  Begin
                     TestaSeDesconstituicao(Cds.FieldByName('NUMPROCTRAB').asinteger, CdsDet.FieldByName('NUMSEQVINC').asinteger);
                     If sDesconstituicaoOK <> '' Then
                        Begin
                           If sDesconstituicaoOK = 'B' Then
                              lblTipoDesconstituicao.caption := 'Desconstituição de BEM';
                           If sDesconstituicaoOK = 'I' Then
                              lblTipoDesconstituicao.caption := 'Desconstituição de IMÓVEL';
                           //                           If sDesconstituicaoOK = 'V' Then
                           //                              lblTipoDesconstituicao.caption := 'Desconstituição de INVESTIMENTO';
                           If sDesconstituicaoOK = 'N' Then
                              lblTipoDesconstituicao.caption := 'Desconstituição de NUMERÁRIO';

                           dbedValRec.value := ValorDesconstituicao;
                        End
                     Else
                        Begin
                           MsgDlg('É necessário vincular o Nº da Sequência de uma Penhora de Bem ou Imóvel ou Investimento.', 'Aviso', mtInformation, [mbOk], 0);
                           dbedNumSeqVinc.setfocus;
                        End;
                     spbInformacoesAdicionais.Enabled := False;
                  End
               Else
                  Begin
                     spbInformacoesAdicionais.Enabled := True;
                     lblTipoDesconstituicao.caption := '';
                  End;
            End;
      End;
End;

Procedure TfrmCustomCadRegEtp.btnFechaHistEtapasClick(Sender: TObject);
Begin
   Inherited;
   panel1.Visible := false;
   Self.Enabled := true;
End;

Procedure TfrmCustomCadRegEtp.FormShow(Sender: TObject);
Begin
   spbInformacoesAdicionais.Enabled := False;
   bolSucumbencia := false;
   Inherited;
End;

Procedure TfrmCustomCadRegEtp.LocalizaEtapaDesembolso(pIdPrograma, pCodTipoRecurso: Integer; pRecPag: String);
Begin
   Screen.Cursor := crSQLWait;
   qryTipoDesembolso.Close;
   qryTipoDesembolso.SQL.Clear;
   qryTipoDesembolso.SQL.add('SELECT T.CODTIPRECDES, T.RECPAG, T.PLANO, T.PLACONTA, T.PLACONTACREDITO, T.DESCRICAO, J.IDPROGRAMA ');
   qryTipoDesembolso.SQL.add('FROM JUR_ETAPA_DESEMBOLSO J, TIPORECEBDESEMB T');
   qryTipoDesembolso.SQL.add('WHERE J.CODTIPRECDES = T.CODTIPRECDES');
   qryTipoDesembolso.SQL.add('      AND J.RECPAG = T.RECPAG');
   qryTipoDesembolso.SQL.add('      AND J.CODTIPORECURSO = ' + quotedstr(inttostr(pCodTipoRecurso)));
   qryTipoDesembolso.SQL.add('      AND J.IDPROGRAMA = ' + quotedstr(inttostr(pIdPrograma)));
   qryTipoDesembolso.SQL.add('      AND J.RECPAG = ' + quotedstr(pRecPag));
   qryTipoDesembolso.Open;
   Screen.Cursor := crDefault;
   If qryTipoDesembolso.EOF Then
      Begin
         qryTipoDesembolso.Close;
         // SOL 165674 KTN 1437472 - Paulo Nobre
         qryTipoDesembolso.SQL.Clear;
         qryTipoDesembolso.SQL.add('SELECT T.CODTIPRECDES, T.RECPAG, T.PLANO, T.PLACONTA, T.PLACONTACREDITO, T.DESCRICAO, J.IDPROGRAMA ');
         qryTipoDesembolso.SQL.add('FROM JUR_ETAPA_DESEMBOLSO J, TIPORECEBDESEMB T');
         qryTipoDesembolso.SQL.add('WHERE J.CODTIPRECDES = T.CODTIPRECDES');
         qryTipoDesembolso.SQL.add('      AND J.RECPAG = T.RECPAG');
         qryTipoDesembolso.SQL.add('      AND J.CODTIPORECURSO = ' + quotedstr(inttostr(pCodTipoRecurso)));
         qryTipoDesembolso.SQL.add('      AND J.RECPAG = ' + quotedstr(pRecPag));
         qryTipoDesembolso.Open;
         Screen.Cursor := crDefault;
      End;
End;

Procedure TfrmCustomCadRegEtp.dblckTipoEtpCloseUp(Sender: TObject; LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   spbInformacoesAdicionais.Enabled := False;
   //Renan Cristiano SOL Nº 126385 KINTANA 6585269 - INI

   If (CdsTipoEtapa.FieldByName('FLGPENHORA').asInteger = 1) Then // Sim
      dbrgAbate.ItemIndex := 2; // Penhora

   //Brunno Mattos - SOL 149850 - KTN 1086522 - Inclui o 1110
   If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1030) Or // Penhora
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or // Depósito Judicial - Controverso
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110) Or // Depósito Judicial - Incontroverso
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1086) Or // Honorarios Sucumbenciais
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1053) Or // Condenção Solidária
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1111) Then // Arrematação
      spbInformacoesAdicionais.Enabled := True;
   //Renan Cristiano SOL Nº 126385 KINTANA 6585269 - FIM

   If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 550) Or
      (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 670) Or
      (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or
      (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110) Then
      dbrgAbate.ItemIndex := 0;

   If CdsTipoEtapa.FieldByName('FLGINTEGRAFINANCEIRO').asString = 'S' Then // Sim
      LocalizaEtapaDesembolso(iIdPrograma, CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger, CdsTipoEtapa.FieldByName('RECPAG').asString);

   dtedDataReal.Setfocus;
End;

Function TfrmCustomCadRegEtp.LocalizaEtapaVincular(sCodTipoRecurso: String; Var iNumSeqEtapaVinc: Integer): Boolean;
Var CdsAux: TClientDataSet;
   sSql: String;
Begin
   result := False;
   Screen.Cursor := crSQLWait;
   CdsAux := TClientDataSet.Create(Nil);
   sSql := 'SELECT NUMSEQ                                             ' + #13#10 +
      ' FROM ETAPAPROCTRAB                                            ' + #13#10 +
      ' WHERE NUMPROCTRAB = ' + Cds.FieldByName('NUMPROCTRAB').AsString + #13#10 +
      ' AND CODTIPORECURSO = ' + quotedstr(sCodTipoRecurso) + #13#10 +
      ' AND NUMSEQVINC = -1';
   CdsAux.Data := Padroes.GetDataPacket(sSql);
   Screen.Cursor := crDefault;
   If Not CdsAux.IsEmpty Then
      Begin
         iNumSeqEtapaVinc := CdsAux.fieldbyname('NUMSEQ').asInteger;
         result := True;
      End;
   Freeandnil(CdsAux);
End;

Procedure TfrmCustomCadRegEtp.dbgrdDetDrawDataCell(Sender: TObject;
   Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   Inherited;
   If Not CdsDet.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               dbgrdDet.Canvas.Font.Color := clBlack;
               dbgrdDet.Canvas.Font.Style := [];

               If ((CdsDet.FieldByName('CODTIPORECURSO').asInteger = 1035) Or // Depósito Judicial - Controverso
                  (CdsDet.FieldByName('CODTIPORECURSO').asInteger = 1110)) And // Depósito Judicial - Incontroverso
               (CdsDet.FieldByName('NUMSEQVINC').asInteger = -1) Then
                  Begin
                     dbgrdDet.Canvas.Font.Color := clRed;
                     dbgrdDet.Canvas.Font.Style := [fsbold];
                  End;

               // Somente se não tiver sido Integrado
               If Not CdsDet.FieldByName('CODDOCUMENTO').isNull Then
                  If (Field.Name = 'CdsDetPLNPLANIL') Or (Field.Name = 'CdsDetNODOCUMENTO') Then
                     Begin
                        // Trocar a cor de fundo de uma determinada coluna
                        dbgrdDet.Canvas.Font.Style := [fsbold];
                     End;

               dbgrdDet.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmCustomCadRegEtp.sbtnAlterarClick(Sender: TObject);
Begin
   Inherited;
   sbtnInsDet.Enabled := True;
   sbtnAltDet.Enabled := True;
   sbtnExcluiDet.Enabled := True;
End;

// SOL 174225 KTN 1572025 - Paulo Nobre

Function TfrmCustomCadRegEtp.ExcluirDadosDaIntegracaoFinanceira(iNumProctrab, iNumSeq, iDocumento: Integer): Boolean;
Var Qry: TwwQuery;
   CtrlDocumento: TCtrlDocumento;
Begin
   Result := False;
   FMensagemCtrlDocumento := '';
   Try
      Try
         Screen.Cursor := crSQLWait;
         // Limpa os Dados da Etapa, antes de excluir nas tabelas do Financeiro e Contábil
         Qry := TwwQuery.Create(Nil);
         Qry.DatabaseName := 'BaseDados';
         Qry.Close;
         Qry.SQL.Clear;
         Qry.SQL.Add('UPDATE ETAPAPROCTRAB');
         Qry.SQL.Add('SET CODDOCUMENTO = NULL, PLNCODIGO = NULL, NODOCUMENTO = NULL, PLNPLANIL = NULL ');
         Qry.SQL.Add('WHERE NUMPROCTRAB = ' + floattostr(iNumProcTrab));
         Qry.SQL.Add('      AND CODDOCUMENTO  = ' + floattostr(iDocumento));
         Qry.execsql;
         If qry.RowsAffected > 0 Then
            Begin
               // Exclui o Documento da Etapa no Financeiro
               // Caso o mesmo já não tenha sido liquidado.
               // A Control do Documento trata as situações
               // de impossibilidade
               CtrlDocumento := TCtrlDocumento.Create;
               CtrlDocumento.InitializeAs(Padroes);
               CtrlDocumento.OpenTransaction := False;
               CtrlDocumento.Prepare(OpDocumento, odlEfetivo);

               CtrlDocumento.CodDocumento := iDocumento;
               CtrlDocumento.IdUsuario := Sistema.idUsuario;
               CtrlDocumento.IdEspAcesso := Sistema.idEspAcesso;
               CtrlDocumento.UsaPlanoPatro := Sistema.UsaPlanoPatro;
               CtrlDocumento.IdModulo := Sistema.idModulo; // Sistjurcons

               If Not CtrlDocumento.Delete Then
                  Raise Exception.Create('CapCar - ' + FMensagemCtrlDocumento);

               Result := True;
            End;
         Screen.Cursor := crDefault;
      Except
         On E: Exception Do
            Begin
               Result := False;
               FMensagemCtrlDocumento := E.Message;
            End;
      End
   Finally
      FMensagemCtrlDocumento := CtrlDocumento.MessageInfo;
      FreeAndNil(CtrlDocumento);
      freeandnil(Qry);
   End;
End;

// SOL 172573-172553  KTN 1555789-1554889 - Paulo Nobre

Procedure TfrmCustomCadRegEtp.spbDesfazerIntregaClick(Sender: TObject);
Begin
   If Not cdsDet.FieldByName('CODDOCUMENTO').isnull Then
      Begin
         If MsgDlg('Confirma Desfazer a Integração Financeira dessa Etapa ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               frmAguarde.pbAguarde.Visible := false;
               frmAguarde.Mostra('Desfazendo as Integrações...');

               Screen.Cursor := crSQLWait;
               If Not dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.StartTransaction;

               If ExcluirDadosDaIntegracaoFinanceira(
                  cdsDet.FieldByName('NUMPROCTRAB').asinteger,
                  cdsDet.FieldByName('NUMSEQ').asinteger,
                  cdsDet.FieldByName('CODDOCUMENTO').asinteger) Then
                  Begin
                     //                     bExcluiu := True;
                     If dtmBaseDados.dbBaseDados.InTransaction Then
                        dtmBaseDados.dbBaseDados.Commit;
                     CmeCadastroFind(Sender);
                  End
               Else
                  Application.MessageBox(pchar(FMensagemCtrlDocumento), 'Atenção !', Mb_IconExclamation);

               frmAguarde.pbAguarde.Visible := True;
               frmAguarde.Apaga;

               bAtualizaEtapa := True;
            End;
      End
   Else
      Application.MessageBox('Etapa não possui Integração Financeira !', 'Atenção !', mb_ICONWARNING + mb_OK);
End;

Procedure TfrmCustomCadRegEtp.spbVerObjetosAssociadosClick(Sender: TObject);
Begin
   If Not Assigned(frmCadEtapasXObjetos) Then
      frmCadEtapasXObjetos := TfrmCadEtapasXObjetos.Create(Application);

   frmCadEtapasXObjetos.ExibirTela(Cds.FieldByName('NUMPROCTRAB').asInteger,
      CdsDet.FieldByName('NUMSEQ').AsInteger, CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger, 1);

   frmCadEtapasXObjetos.ShowModal;
End;

Procedure TfrmCustomCadRegEtp.btnVerHistoricoEtapasClick(Sender: TObject);
Begin
   Inherited;
   cdsHistoricoEtapas.data := CtrlHstEtapaProcTrab.SelecionaHstetapaproctrab(Cds.FieldByName('NUMPROCTRAB').AsFloat,
      CdsDet.FieldByName('NUMSEQ').asFloat, CdsDet.FieldByName('CODTIPORECURSO').asFloat);
   If Not cdsHistoricoEtapas.IsEmpty Then
      Begin
         panel1.Visible := True;
         panel1.BringToFront;
         panel1.Top := 62;
         panel1.left := 150;
         panel2.caption := 'Histórico de: ' + CdsDet.FieldByName('ETAPA').AsString;
      End
   Else
      Application.MessageBox('Sem Histórico para esta Etapa. Verifique !', 'Atenção !', mb_ICONEXCLAMATION + mb_OK);
End;

Procedure TfrmCustomCadRegEtp.dbgrdDetCalcCellColors(Sender: TObject;
   Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
   ABrush: TBrush);
Begin
   Inherited;
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00C0FFFF // amarelo bebê
               Else
                  ABrush.Color := clWhite;
            End;
      End
   Else
      Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TfrmCustomCadRegEtp.spbCadObjetosAssociadosClick(Sender: TObject);
Begin
   Inherited;
   If Not Assigned(frmCadEtapasXObjetos) Then
      frmCadEtapasXObjetos := TfrmCadEtapasXObjetos.Create(Application);

   frmCadEtapasXObjetos.ExibirTela(Cds.FieldByName('NUMPROCTRAB').asInteger,
      CdsDet.FieldByName('NUMSEQ').AsInteger, CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger, 0);

   frmCadEtapasXObjetos.ShowModal;
End;

Procedure TfrmCustomCadRegEtp.btnContaBancClick(Sender: TObject);
Begin
   Inherited;
   If Not (Assigned(frmCadRegContaBanc)) Then
      frmCadRegContaBanc := TfrmCadRegContaBanc.Create(Application);

   frmCadRegContaBanc.ExibirTelaContaBanc(Cds.FieldByName('IDADVOGRECDA').asInteger, CdsDet);
End;

Procedure TfrmCustomCadRegEtp.spbInformacoesAdicionaisClick(Sender: TObject);
Begin
   Inherited;
   If dtedDataReal.Text <> '' Then
      CdsDet.FieldByName('DATAREALOCOR').asDateTime := dtedDataReal.Date;

   If CdsDet.FieldByName('DATAREALOCOR').IsNull Then
      Begin
         MsgDlg('Informe a Data, antes de abrir esta tela', 'Aviso', mtInformation, [mbOk], 0);
         dtedDataReal.SetFocus;
         exit;
      End;

   //Renan Cristiano Sol Nº 126385 Kintana 6585269 Inicio

   If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1030) Or // Penhora
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1051) Then // Desconstituição de Penhora
      Begin
         If Not (Assigned(frmCadRegPenhora)) Then
            frmCadRegPenhora := TfrmCadRegPenhora.Create(Application);

         frmCadRegPenhora.ExibirTelaPenhora(CdsDet);
      End;

   //Brunno Mattos - SOL 149850 - KTN 1086522 - Inclui o 1110
   If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1035) Or // Depósito Judicial - Controverso
   (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1110) Then // Depósito Judicial - Incontroverso
      Begin
         If Not Assigned(frmCadDepositoJudicial) Then
            frmCadDepositoJudicial := TfrmCadDepositoJudicial.Create(Application);

         frmCadDepositoJudicial.ExibirTelaDepositoJudicial(Cds.FieldByName('NUMPROCTRAB').asInteger,
            CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger,
            CdsDet.FieldByName('NUMSEQ').AsInteger);

         frmCadDepositoJudicial.ShowModal;
         dbedValRec.value := frmCadDepositoJudicial.dValor;
      End;

   If CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1086 Then // Honorarios Sucumbenciais
      Begin
         If Not (Assigned(frmCadHonorarioSucumbenciais)) Then
            frmCadHonorarioSucumbenciais := TfrmCadHonorarioSucumbenciais.Create(Application);

         FrmCadHonorarioSucumbenciais.ExibirTelaSucumbencia(Cds.FieldByName('NUMPROCTRAB').asinteger,
            cdsDet.FieldByName('NUMSEQ').AsInteger,
            CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger,
            CdsDet.FieldByName('VALORREC').AsFloat);
      End;

   If CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1053 Then // Condenações
      Begin
         If Not (Assigned(frmCadCondenacoes)) Then
            frmCadCondenacoes := TfrmCadCondenacoes.Create(Application);

         frmCadCondenacoes.ExibirTelaCondenacao(Cds.FieldByName('NUMPROCTRAB').asinteger,
            CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger,
            CdsDet.FieldByName('NUMSEQ').AsInteger,
            CdsDet.FieldByName('VALORREC').AsFloat);
      End;

   // Otacilio Aquino Sol Nº 152860 Kintana 1145902 Inicio
   If (CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger = 1111) Then // Arrematação
      Begin
         If Not Assigned(frmCadMovArrematacao) Then
            frmCadMovArrematacao := TfrmCadMovArrematacao.Create(Application);

         frmCadMovArrematacao.ExibirTela(Cds.FieldByName('NUMPROCTRAB').asInteger,
            CdsTipoEtapa.FieldByName('CODTIPORECURSO').asInteger,
            CdsDet.FieldByName('NUMSEQ').AsInteger);

         frmCadMovArrematacao.ShowModal;
      End;
   // Otacilio Aquino Sol Nº 152860 Kintana 1145902 Fim

   //Renan Cristiano Sol Nº 126385 Kintana 6585269 Fim
End;

End.

