//*********************************************************************************************
// N. Chamado....: WO17661 (WO13458)
// Dt Alterações.: 16/09/2024
// Responsável...: Paulo Nobre
// Descrição.....: .Atribuido o diretorio default "c:\" como inicial na abertura do dialog
//                  abrir arquivos.
//                 .Independentemente se está selecionando um arquivo retorno de um path local
//                  ou de rede, sempre será gerada uma copia deste no diretorio local padrão do
//                  Planus e num sub-dir específico - "c:\planus\temp\LogBaixaIntegraBancaria".
//----------------------------------------------------------------------------------------------
//N. SIG........:  112126
//Dt Alteração..:  02/08/2021
//Responsável...:  Ewerton Beltramini
//Descrição.....:  Implementar ordenação no Grid principal.
//******************************************************************************
//N. SIG........: 103323
//Dt Alteração..: 01/12/2020
//Responsável...: Everson Cunha
//Descrição.....: Melhorias na baixa automática do modelo
//                BANCO CEF - SIACC - DEBITO AUTOMATICO
//******************************************************************************
//Rotina.............: CmbModeloCnabChange, SbtnAbrirArquivoRetClick 
//N. SIG.............: 63651  
//Data da Alteração..: 30/09/2020
//Alteração Form.....: FBaixaIntBancoMT
//Responsável .......: Cássio Florencio Rovaroto
//Descrição..........: Atualizações no  tratamento de baixa de documento no convênio SIACC 150.
//***************************************************************************************
//Rotina.............: bbtnCancelarClick, FormShow, CmbModeloCnabChange, btnDadosRetornoClick
//N. SIG.............: 63651
//Data da Alteração..: 12/11/2019
//Alteração Form.....: FBaixaIntBancoMT
//Responsável .......: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de tratamento de baixa de documento no convênio SIACC 150.
//***************************************************************************************
//Rotina.............: FormCreate, SbtnAbrirArquivoRetClick, bbtnCancelarClick, 
//                     bbtnConfirmarClick
//N. SIG.............: 82888
//Data da Alteração..: 14/03/2019
//Alteração Form.....: FBaixaIntBancoMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Alterações para leitura do arquivo de retorno via ETL.
//***************************************************************************************
//Rotina                : Geral
//N. Sol..........      : 214738_15892
//N. Kintana......      : 2057238
//Data da Alteração:    : 13/03/2014
//Alteração Form:       : FBaixaIntBancoMT
//Responsável:          : Paulo Nobre
//Descrição.......      : Inclusão na GRID do campo virtual FLGMARCADO e outras regras
//                        descrita na EF desta demanda.
//******************************************************************************************
//Rotina..........: bbtnConfirmarClick
//N. Sol..........: 187427
//N. Kintana......: 1793755
//Data............: 07/01/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Inclusão de Rotina para atualizar os lançamentos com as ocorrências
{--------------------------------------------------------------------------------------------------
Rotina......: SbtnAbrirArquivoRetClick, bbtnConfirmarClick, GrdCdsDocumentosUpdateFooter
Nº SOL......: 183486
Nº KINTANA..: 1718525
Data........: 05/07/2012
Responsável.: Edilaine Ferraresi
Descrição...: filtro do grid para visualizar apenas recebimentos efetivados
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 174820.8461
Nº KINTANA..: 1603235
Data........: 20/04/2012
Responsável.: JRM6 - José Roberto Marque
Descrição...: comentado código 60 para contabilização Sintética
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 151965
Nº KINTANA..: 1124894
Data........: 07/12/2011
Responsável.: Arnaldo Vicente Scarin
Descrição...: Inclusão de um flag para indicar a baixa do arquivo de retorno SIGCB
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: -
Nº SOL......: 155238
Nº KINTANA..: 1200572
Data........: 24/03/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Alteração da opção "Usar ETL na baixa" como default desmarcado.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina......: bbtnConfirmarClick
Nº SOL......: 124570/3781 e 124570/3782
Nº KINTANA..: 1136318 e 1136319
Data........: 17/02/2011
Responsável.: Fábio Henrique Beccaria Sampaio
Descrição...: Implementação para fazer a validação o período bloqueado.
---------------------------------------------------------------------------------------------------}
{
Rotina.............: FormCreate
N. Sol.............: 151593
N. Kintana.........: 1115220
Data...............: 16/02/2011
Responsável........: Ricardo de Freitas Araújo
Descrição..........: Alterado caminho defult do log de lançamentos financeiros.
}

{
Rotina............: bbtnConfirmarClick
N. Sol.............: 124570
N. Kintana......: 103005
Data...............: 20/12/2010
Responsável...: Gustavo Oliveira
Descrição........: Inclusão do campo "Usar ETL na baixa";
                   Alteração do método Mostrar Processamento;

Rotina............: SbtnAbrirArquivoRetClick
N. Sol.............: 133216
N. Kintana......: 775057
Data...............: 18/04/2010
Responsável...: Cássio Camargo
Descrição........: Correção do processo de Baixa Automática, que trata possível
                   erro em arquivo de retorno.

Rotina............: bbtnConfirmarClick
N. Sol.............: 112617
N. Kintana......: 521708
Data...............: 03/04/2009
Responsável...: Ricardo Alves
Descrição........: Limitada entrada de valor do campo NUMCHQBORDERO para 15 caracteres.
}

{
Rotina............: FormCreate, SbtnAbrirArquivoRetClick, bbtnConfirmarClick
N. Sol.............: 110651
N. Kintana......: 505820
Data...............: 05/03/2009
Responsável...: Ricardo Alves
Descrição........: Corrigido bug no fechamento da janela de baixa automática após
  execução do processamento da baixa.
}
{
Rotina............: bbtnConfirmarClick
N. Sol.............: 103843
N. Kintana......: 464129
Data...............: 02/02/2009
Responsável...: Ricardo Alves
Descrição........: Modificada criação do objeto para que seja corretamente liberado
     da memória após sua utilização.
}
{
--------------------------------------------------------------------------------
Data      : 27/11/2006
Pendência : 23824
Autor     : Rodolpho da Silva
Descrição : Criticar a data da disponibilidade. A crítica está sendo feita aqui na
            tela, devido a data do float mudar conforme parametrização do portadorforma
--------------------------------------------------------------------------------
Rotina    : TCtrlDocumento.LancaRateioContab
Data      : 21/08/2006
Pendência : 22528
Autor     : Andre Tavares
Descrição : Deve constar no histórico contábil o Nº do lote do documento se o mesmo se encontar em um lote
(isso só ocorre se o documento for CAP).
--------------------------------------------------------------------------------
}
{-------------------------------------------------------------------------------
Pendência: 23081
Data     : 17/08/2006
Autor    : Andre Tavares
Descrição: Fazer a baixa dos documentos com o portadorforma original dos documentos.
-------------------------------------------------------------------------------}

// Andre Tavares - 10/01/2006 - pendencia 19282 - indicar um número de lote para
// baixa automaticamente como é feito na tela de baixa manual.

// André Tavares - pendência 17412 - 24/08/2004 - criação do campo e parâmetro
//                 de data de disponibilidade para baixa dos documentos.
(*******************************************************************************
 19/01/1999
  Alteração na rotina de baixa -> os documentos passam a ser exibidos num grid e
  a baixa é feita como no pagamento manual - Conclusão do CNAB;
 21/01/1999
  Inclusão de Alteradores na baixa, inclusive com o cálculo da tarifa cobrada pelo
  banco;
 25/01/1999
  Implementação do parâmetro de lançamento no financeiro ( Módulo )
  Alteração na rotina de baixa -> os documentos passam a ser exibidos num grid e
  a baixa é feita como no pagamento manual - Conclusão do SISPAG;
 17/03/1999 - 02.06.00
  Alteração no campo FLGINDICARECEBIMENTO para FLGINDICARECEB
 24/03/1999 - 02.06.02
  Alteração na baixa manual para pagamento dos lotes
 07/04/1999 - 02.07.02
  Correção na no lançamento do Financeiro na Baixa dos Título para lançar sempre
  como entrada no contas a receber e saída no contas a pagar;
 11/05/1999 - 2.08.03
  Alteração na visualização do arquivo gerado.
 19/05/1999 - 2.08.04
  Correção da mensagem comando sql não finalizado corretamente ao selecionar
  o arquivo
 22/09/1999 - 2.13.10
  Alateração no valor da baixa para doc's com saldo negativo: o valor gravado
  passou a ser sempre o absoluto;
 30/09/1999 - 2.13.14
  Inclusão da opção de considerar o float para a data do lançamento contábil de
  acordo com o parâmetro do sistema para a contabilização da baixa
 01/11/1999 - 2.14.10
  Implementação da baixa eletrônica dos lotes no contas a pagar
 05/11/1999 - 2.14.11
  Implementação da busca do número do lote de origem do envio e do portador
  forma origem do envio para a baixa;
 30/10/2001 - 3.01.17
   Implementação da rotina de baixa de documentos que forão pagos em uma só
   boleta - Fábio Barros
 *******************************************************************************)
Unit
   FBaixaIntBancoMT;

Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, MAHlpBtn, StdCtrls, Buttons, TB97, ExtCtrls, Db, DBTables,
   wwdblook, Usistema, uAutorizacao,
   uMensErro, TB97Tlbr, Grids, Wwdbigrd, Wwdbgrid, Wwdatsrc, IvDictio,
   IvMulti, IvEMulti, CMDBLookupCombo, JclStrings, JclShell, uCMSqlParams,
   DBClient, uCMClientDataSet, uCtrlParamIntegra, uCtrlBaixaIntBanco,
   CmParamReport, uCmFileUtils, wwdbdatetimepicker, CMDateTimePicker, Mask,
   wwdbedit, Wwdbspin, uctrlDocumento { andre tavares - 10/01/2006 - pendencia 19282},
   fProgressoDuplo, fProgresso, //*** andre tavares 07/12/2006
   // Rodolpho da Silva - P: 23824 - 27/11/2006
   uCtrlFinanc, uCtrlPadroes,
   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   uCtrlPeriodo, uCtrlContab, ComCtrls, ImgList,
   FileCtrl;  // Paulo Nobre - WO13458 / 17661

Type
   TFrmBaixaIntBancoMT = Class(TfrmOkCancelar)
      DlgAbrir: TOpenDialog;
      GrdCdsDocumentos: TwwDBGrid;
      Panel1: TPanel;
      LblPgto: TLabel;
      EdtArquivoRetorno: TEdit;
      LblPath: TLabel;
      SbtnAbrirArquivoRet: TSpeedButton;
      Panel2: TPanel;
      SpeedButton1: TSpeedButton;
      DsCdsDocumentos: TwwDataSource;
      CmbModeloCnab: TCMDBLookupCombo;
      CdsDocumentos: TCMClientDataSet;
      CdsPortaDorForma: TCMClientDataSet;
      CdsParamCAP: TCMClientDataSet;
      CdsOcorrencia: TCMClientDataSet;
      CdsAux: TCMClientDataSet;
      CdsUnid: TCMClientDataSet;
      CdsModelosCnab: TCMClientDataSet;
      CdsAlt: TCMClientDataSet;
      CdsAuxCodDoc: TCMClientDataSet;
      dtpDataDisp: TCMDateTimePicker;
      lblDataDisp: TLabel;
      sqlParamFinanc: TCMSqlParams;
      cdsParamFinanc: TCMClientDataSet;
      valCommit: TwwDBSpinEdit;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      edtTotDocs: TEdit;
      CMSqlParams1: TCMSqlParams;
      grpbLogFinanc: TGroupBox;
      edtArquivoLog: TEdit;
      spbtnArqLog: TSpeedButton;
      bitbtnVisualiza: TBitBtn;
      dlgArqLog: TOpenDialog;
      ChkUsarETL: TCheckBox;
      CdsETL: TCMClientDataSet;
      Label4: TLabel;
      dtLancamento: TCMDateTimePicker;
      CdsDocumentosCODDOCUMENTO: TFloatField;
      CdsDocumentosIDPESSOA: TFloatField;
      CdsDocumentosPLACONTA: TStringField;
      CdsDocumentosCODCENTROCUSTO: TStringField;
      CdsDocumentosIDFORCLI: TFloatField;
      CdsDocumentosIDUSUARIOINCLUSAO: TFloatField;
      CdsDocumentosNODOCUMENTO: TFloatField;
      CdsDocumentosCOMPLDOCUMENTO: TStringField;
      CdsDocumentosDATAEMISSAO: TDateTimeField;
      CdsDocumentosCODSUBCONTA: TFloatField;
      CdsDocumentosCODTIPDOC: TFloatField;
      CdsDocumentosDEBCRE: TStringField;
      CdsDocumentosDATAVENCTO: TDateTimeField;
      CdsDocumentosDATAPROGRAMADA: TDateTimeField;
      CdsDocumentosOPERACAO: TStringField;
      CdsDocumentosVALOR: TFloatField;
      CdsDocumentosVALOROUTRAMOEDA: TFloatField;
      CdsDocumentosNUMLOTE: TFloatField;
      CdsDocumentosCODLANCFINANC: TFloatField;
      CdsDocumentosNOSSONUMERO: TStringField;
      CdsDocumentosIDMODULO: TFloatField;
      CdsDocumentosRAZAOSOCIAL: TStringField;
      CdsDocumentosJUROS: TFloatField;
      CdsDocumentosDESCONTOS: TFloatField;
      CdsDocumentosABATIMENTO: TFloatField;
      CdsDocumentosDATABAIXA: TDateTimeField;
      CdsDocumentosCODPORTFORMA: TFloatField;
      CdsDocumentosNOME: TStringField;
      CdsDocumentosTARIFABANCARIA: TFloatField;
      CdsDocumentosVALORNOMINAL: TFloatField;
      CdsDocumentosCODALTERADORBAIXA: TFloatField;
      CdsDocumentosFLGCONTABALTERADOR: TStringField;
      CdsDocumentosRECPAG: TStringField;
      CdsDocumentosSTATUS: TStringField;
      CdsDocumentosPLANO: TFloatField;
      CdsDocumentosCODGRUPOCNAB: TFloatField;
      CdsDocumentosNUMLANCTO: TFloatField;
      CdsDocumentosVLRLIQUIDO: TFloatField;
      CdsDocumentosCODLIQBAIXA: TStringField;
      CdsDocumentosCODFORMAPAG: TStringField;
      CdsDocumentosFLOATFORMAPAG: TStringField;
      CdsDocumentosCODOCORRENCIA: TStringField;
      CdsDocumentosFLGBAIXATOTAL: TStringField;
      CdsDocumentosFLGMARCADO: TStringField;
      Toolbar971: TToolbar97;
      ToolbarSep972: TToolbarSep97;
      ToolbarSep973: TToolbarSep97;
      SbAdTodos: TBitBtn;
      SbInverte: TBitBtn;
      pnlGrdDadosRetorno: TPanel;
      grdDadosRetorno: TwwDBGrid;
      cdsDadosRetorno: TCMClientDataSet;
      dsDadosRetorno: TDataSource;
      pnlConvenioBancario: TPanel;
      lblConvenioBancario: TLabel;
      cmbConvBancario: TCMDBLookupCombo;
      cdsConvBancario: TCMClientDataSet;
      lblDtRetorno: TLabel;
      dtpDtVencimento: TCMDateTimePicker;
      btnDadosRetorno: TSpeedButton;
    ListaDeImagens: TImageList;
      Procedure SbtnAbrirArquivoRetClick(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure FormActivate(Sender: TObject);
      Procedure CdsDocumentosAfterOpen(DataSet: TDataSet);
      Procedure GrdCdsDocumentosCalcCellColors(Sender: TObject;
         Field: TField; State: TGridDrawState; Highlight: Boolean;
         AFont: TFont; ABrush: TBrush);
      Procedure GrdCdsDocumentosTopRowChanged(Sender: TObject);
      Procedure GrdCdsDocumentosUpdateFooter(Sender: TObject);
      Procedure spbtnArqLogClick(Sender: TObject);
      Procedure bitbtnVisualizaClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure SbInverteClick(Sender: TObject);
      Procedure SbAdTodosClick(Sender: TObject);
      Procedure ChkUsarETLExit(Sender: TObject);
      procedure cdsDadosRetornoAfterOpen(DataSet: TDataSet);
      procedure CmbModeloCnabChange(Sender: TObject);
      procedure btnDadosRetornoClick(Sender: TObject);
    procedure GrdCdsDocumentosCalcTitleImage(Sender: TObject;
      Field: TField; var TitleImageAttributes: TwwTitleImageAttributes);
    procedure GrdCdsDocumentosTitleButtonClick(Sender: TObject;
      AFieldName: String);
      
   Private
      { Private declarations }
      CtrlBaixaIntBanco: TCtrlBaixaIntBanco;

      sNumChequeBordero: String;
      sListaRetorno: TStrings;
      SequenceBaixa: Integer;

      //Cássio Rovaroto - 82888 - Início
      bLeRetornoETL: boolean;
      sCaptionLabelDoc: string;
      sCaptionGroupLog: string;
      iDMAIS: integer;
      //Cássio Rovaroto - 82888 - Fim

      //    HabilitaTimer     : Boolean;
      Procedure mostraProcessamento(vParam: Array Of Variant); //*** andre tavares 07/12/2006
      Procedure GravaLogFinanceiro(Const sLog: String);
      // Sol  214738_15892  KTN 2057238  Paulo Nobre   13/03/2014
      Function ContaMarcados: Integer;

   Public
      { Public declarations }
   End;

Var
   FrmBaixaIntBancoMT: TFrmBaixaIntBancoMT;
   dValorTotalBaixado: Double; // Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014

Implementation

Uses
   DBaseDados, uModulo, uFuncaoGeral, fAguarde, uDataBase;

{$R *.DFM}
//************************************************

Procedure TFrmBaixaIntBancoMT.FormCreate(Sender: TObject);
Begin
   Inherited;

   //Ricardo SOL 151593 KINTANA 1115220 - Alterado caminho defult do log
   //de lançamentos financeiros
   edtArquivoLog.Clear;
   edtArquivoLog.text := 'C:\Planus\Temp\LogLancFinanceiro.txt';

   self.DoubleBuffered := true;
   CtrlBaixaIntBanco := Nil; //andre tavares - 07/12/2006

   If ParamIntegra.Recpag = 'P' Then
      Begin
         // Daniel Simões - 25/01/2006 - Início------------------------------------------
         HelpContext := 30033; //30046;
         bbtnAjuda.HelpContext := 30033; //30046;
         Caption := 'Pagamento Eletrônico (MT)';
         LblPgto.Caption := 'Tipo de Arquivo IntBanco';
      End
   Else
      Begin
         HelpContext := 40052;
         bbtnAjuda.HelpContext := 40052;
      End;

   sqlParamFinanc.Open;
   dtpDataDisp.Text := '';
   dtpDataDisp.Visible := (cdsParamFinanc.FieldByName('FLGINTDISPFIN').asString = 'Y');
   lblDataDisp.Visible := dtpDataDisp.Visible;

   CtrlBaixaIntBanco := TCtrlBaixaIntBanco.Create;

   CtrlBaixaIntBanco.IdEmpresa := Sistema.IdEmpresa;
   CtrlBaixaIntBanco.IdModulo := Sistema.IdModulo;
   CtrlBaixaIntBanco.IdUsuario := Sistema.IdUsuario;
   CtrlBaixaIntBanco.IdEspAcesso := Sistema.IdEspAcesso;
   CtrlBaixaIntBanco.UsaPlanoPatro := Sistema.UsaPlanoPatro;
   CtrlBaixaIntBanco.PlanoConta := ParamIntegra.Plano;
   CtrlBaixaIntBanco.RecPag := ParamIntegra.RecPag;
   CtrlBaixaIntBanco.PrefixoServidor := Sistema.PrefixoServidor;
   CtrlBaixaIntBanco.LancaBaixaFloat := Modulo.LancaBaixaFloat;
   CtrlBaixaIntBanco.IntegraContab := ParamIntegra.IntegraContabPag;
   CtrlBaixaIntBanco.PartidaDobrada := ParamIntegra.PartidaDobrada;

   CtrlBaixaIntBanco.CdsDocumentos := CdsDocumentos;
   CtrlBaixaIntBanco.CdsPortaDorForma := CdsPortaDorForma;
   CtrlBaixaIntBanco.CdsParamCAP := CdsParamCAP;
   CtrlBaixaIntBanco.CdsOcorrencia := CdsOcorrencia;
   CtrlBaixaIntBanco.CdsAux := CdsAux;
   CtrlBaixaIntBanco.CdsUnid := CdsUnid;
   CtrlBaixaIntBanco.CdsModelosCnab := CdsModelosCnab;
   CtrlBaixaIntBanco.CdsAlt := CdsAlt;
   CtrlBaixaIntBanco.CdsAuxCodDoc := CdsAuxCodDoc;
   CtrlBaixaIntBanco.CdsETL := CdsETL;
   CtrlBaixaIntBanco.cdsConvBancario := cdsConvBancario;
   

   CtrlBaixaIntBanco.SequenceBaixa := SequenceBaixa;
   //  CtrlBaixaIntBanco.HabilitaTimer    := HabilitaTimer;

   CtrlBaixaIntBanco.InitializeAs(ParamIntegra);
   CtrlBaixaIntBanco.AbreQueries;

   //pendência 27101 - 14/01/2008
   grpbLogFinanc.Enabled := (trim(CdsParamCAP.fieldByName('FLGGERALOGFINAN').asString) = 'S');
   edtArquivoLog.Enabled := (trim(CdsParamCAP.fieldByName('FLGGERALOGFINAN').asString) = 'S');
   spbtnArqLog.Enabled := (trim(CdsParamCAP.fieldByName('FLGGERALOGFINAN').asString) = 'S');
   bitbtnVisualiza.Enabled := (trim(CdsParamCAP.fieldByName('FLGGERALOGFINAN').asString) = 'S');

   CtrlBaixaIntBanco.OnBaixa := self.mostraProcessamento;
   CtrlBaixaIntBanco.OnGravaLogFinan := GravaLogFinanceiro;

   // Ricardo A. SOL 110651 KTN: 505820
   sListaRetorno := TStringList.Create;

   //Cássio Rovaroto - SIG nº 82888 - Início
   bLeRetornoETL := False;
   pnlGrdDadosRetorno.SendToBack;
   sCaptionLabelDoc := Panel2.Caption;
   sCaptionGroupLog := grpbLogFinanc.Caption;
   //Cássio Rovaroto - SIG nº 82888 - Fim

End;
//************************************************

Procedure TFrmBaixaIntBancoMT.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin
   If (CdsDocumentos.ChangeCount > 0) Then
      CdsDocumentos.CancelUpdates;

   CtrlBaixaIntBanco.FechaQueries;

   FreeAndNil(CtrlBaixaIntBanco); //*** andré tavares - 07/12/2006

   // Ricardo A. SOL 103842
   If Assigned(sListaRetorno) And (sListaRetorno.Count > 0) Then
      sListaRetorno.Clear();

   FreeAndNil(sListaRetorno);

   Inherited;
End;
//************************************************

Procedure TFrmBaixaIntBancoMT.SbtnAbrirArquivoRetClick(Sender: TObject);
Var
   filtro: String; // Edilaine - SOL 183486 / KTN 1718525
   sArqRetornoTEMP, sArqRetorno, sPathETL, sArqParamRetorno, sLinhaParamBaixa: string;
   tArqParamRetorno: TextFile;
   iIdUtlProcETL: Integer;

   sPathArquivoTempRet, sPathFinalArqRet, sPathFinalArqLog : string;  // Paulo Nobre - WO13458 / 17661 
Begin
   Inherited;
   Application.ProcessMessages;
   iIdUtlProcETL:= -1;

   If CmbModeloCnab.Text = '' Then Begin
         MsgDlg('Favor Indicar o ' + LblPgto.Caption, 'Aviso', mtError, [mbOk], 0);
         CmbModeloCnab.SetFocus;
         Exit;               
      End;

   If Not CtrlBaixaIntBanco.AbreOcorrencia(CmbModeloCnab.LookupValue) Then Begin
         MsgDlg(CtrlBaixaIntBanco.MessageInfo, 'Aviso', mtError, [mbOk], 0);
         Exit;
      End;

   Try
      If DlgAbrir.Execute Then
      Begin
        EdtArquivoRetorno.Text := DlgAbrir.FileName;
        //Cássio Rovaroto - SIG nº82888 - Início
        if (bLeRetornoETL) and
           (MsgDlg('Deseja fazer a leitura do arquivo retorno via ETL?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        begin
          iIdUtlProcETL := CtrlBaixaIntBanco.RetornaUltbaixaProc;
          sPathETL := CtrlBaixaIntBanco.PegaCaminhoETL(ParamIntegra.Recpag);
          sArqRetornoTEMP := StringReplace(sPathETL, 'ARQUIVO_FAZ_BAIXA.TXT', 'Arquivo_Retorno.tmp', [rfReplaceAll, rfIgnoreCase]);
          sArqRetorno := StringReplace(sPathETL, 'ARQUIVO_FAZ_BAIXA.TXT', 'Arquivo_Retorno.txt', [rfReplaceAll, rfIgnoreCase]);
          sArqParamRetorno := StringReplace(sPathETL, 'ARQUIVO_FAZ_BAIXA.TXT', 'ArquivoTipoBaixa.txt', [rfReplaceAll, rfIgnoreCase]);

          CopyFile(pChar(DlgAbrir.FileName), pChar(sArqRetornoTEMP), True);
          AssignFile(tArqParamRetorno, sArqParamRetorno);
          Rewrite(tArqParamRetorno);

          sLinhaParamBaixa :=  '1;' + IntToStr(Sistema.IdUsuario) + ';' + IntToStr(Sistema.IdModulo) + ';Baixa Automática';

          Append(tArqParamRetorno);
          Write(tArqParamRetorno, sLinhaParamBaixa);
          CloseFile(tArqParamRetorno);
          mostraProcessamento([6, 0, 0, 0, 0, 'Leitura de arquivo retorno executada via ETL. ' + #13 + 'Processo iniciado em ' + FormatDateTime('dd/mm/yy hh:nn:ss', Now)]);
          RenameFile(sArqRetornoTEMP, sArqRetorno);

          while  iIdUtlProcETL = CtrlBaixaIntBanco.RetornaUltbaixaProc do
          begin
            if iIdUtlProcETL <> CtrlBaixaIntBanco.RetornaUltbaixaProc then
              Sleep(1000)
            else
              Sleep(30000);
          end;

          MostraProcessamento([5]);
          MsgDlg('Leitura do arquivo de retorno realizada com sucesso.', 'Aviso', mtInformation, [mbOk], 0);
          SequenceBaixa := CtrlBaixaIntBanco.RetornaUltbaixaProc;
          Toolbar971.Visible := False;
          cdsDadosRetorno.Data := CtrlBaixaIntBanco.RetornaDadosRetorno(CtrlBaixaIntBanco.RetornaUltbaixaProc);
          edtTotDocs.Text := cdsDadosRetorno.FieldByName('QTD_A_BAIXAR').AsString;
          iDMAIS := CtrlBaixaIntBanco.buscaFloat(cdsDadosRetorno.FieldByName('CODPORTFORMA').AsInteger);
          Panel2.Caption := 'Resumo da leitura do Arquivo Retorno';
          grpbLogFinanc.Caption := EmptyStr;
          edtArquivoLog.Visible := False;
          spbtnArqLog.Visible := False;
          bitbtnVisualiza.Visible := False;
          ChkUsarETL.Checked := True;
          ChkUsarETL.Enabled := False;
          pnlGrdDadosRetorno.BringToFront;
          Exit;
        end
        else
        begin
        //Cássio Rovaroto - SIG nº82888 - Fim

          // Paulo Nobre - WO13458 / 17661 - Inicio
          // Se não existir, cria um diretorio especifico para guardar uma cópia do arquivo de retorno.
          //
          sPathArquivoTempRet := Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa) + '\LogBaixaIntegraBancaria';
          If Not DirectoryExists(sPathArquivoTempRet) Then
             ForceDirectories(sPathArquivoTempRet);

          sPathFinalArqRet := sPathArquivoTempRet + '\' + ExtractFileName(DlgAbrir.FileName);

          sPathFinalArqLog := ChangeFileExt(DlgAbrir.FileName, 'log');

          // Gerando uma cópia do arquivo de retorno no novo path temporário
          sListaRetorno.LoadFromFile(DlgAbrir.FileName);
          sListaRetorno.SaveToFile(sPathFinalArqRet);
          //

          // Ricardo A. SOL 110651 KTN: 505820
          sListaRetorno.Clear();
          sListaRetorno := CtrlBaixaIntBanco.BuscaBaixa(StrToIntDef(CmbModeloCnab.LookupValue, 0),
          sPathFinalArqRet,          //DlgAbrir.FileName,
          UpperCase(Sistema.NomeEmpresa), 'S'); // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
          // Paulo Nobre - WO13458 / 17661 - Fim

          If sListaRetorno <> Nil Then
            If sListaRetorno.Count = 0 Then Begin
              MsgDlg('Não foram encontrados registros para baixa no arquivo', 'Aviso', mtError, [mbOk], 0);
              Exit;
            End;

          //Leandro Pocebon- WO13458 / 17661 - Inicio
          if sListaRetorno <> Nil then
          begin
            if FileExists(sPathFinalArqLog) then
               DeleteFiles(sPathFinalArqLog);

            CopyFile(PChar(sPathFinalArqRet), PChar(sPathFinalArqLog), True);
          end;
          //Leandro Pocebon- WO13458 / 17661 - fim


          If sListaRetorno <> Nil Then
            If Copy(sListaRetorno[0], 1, 4) = 'Erro' Then Exit;

            //*** andre tavares 07/12/2006 CtrlBaixaIntBanco.pbAguarde := FrmAguarde.pbAguarde;
            //*** andre tavares 07/12/2006 FrmAguarde.Min := 0;
            //*** andre tavares 07/12/2006 FrmAguarde.Max := sListaRetorno.Count + 1;
            //*** andre tavares 07/12/2006 FrmAguarde.Pos := FrmAguarde.Min;
            //*** andre tavares 07/12/2006 FrmAguarde.Mostra('Selecionando Documentos');

            // Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014
            //CdsDocumentos.EmptyDataSet;
            CtrlBaixaIntBanco.LimpaDocumentos;
            CdsDocumentos.DisableControls;
            CdsDocumentos.LogChanges := false;

            CtrlBaixaIntBanco.MontaGrid(sListaRetorno, CmbModeloCnab.LookupValue, 'S');

            // Edilaine - SOL 183486 / KTN 1718525
            If (ParamIntegra.Recpag = 'R') And (StrToInt(CmbModeloCnab.LookupValue) In [8, 14, 50, 60, 61, 62]) Then //Cássio Rovaroto - SIG nº 102320 - Inclusão de tratamento para o SIACC 150
               Begin
                  filtro := 'CODOCORRENCIA = ''00'' ';

                  CdsDocumentos.Filtered := false;
                  CdsDocumentos.Filter := filtro;
                  CdsDocumentos.Filtered := true;
               End
            //Everson Cunha - SIG103323 - Ini
            else
            begin
              filtro := '';

              CdsDocumentos.Filtered := false;
              CdsDocumentos.Filter := filtro;
            end;
            //Everson Cunha - SIG103323 - Fim
            // Edilaine - SOL 183486 / KTN 1718525 - fim

            edtTotDocs.Text := intToStr(CdsDocumentos.RecordCount);

            CdsDocumentos.EnableControls;
            CdsDocumentos.LogChanges := true;

            //*** andre tavares 07/12/2006 FrmAguarde.Pos := FrmAguarde.Pos + 1;
        end; //Cássio Rovaroto - SIG nº82888
      End;


      mostraProcessamento([2, 0, sListaRetorno.count, cdsDocumentos.RecordCount, 'Selecionando Documentos para Baixa']);

      If (CdsDocumentos.IsEmpty) And (trim(CtrlBaixaIntBanco.sNomeArqLog) <> '') Then
         VisualizaArquivo(CtrlBaixaIntBanco.sNomeArqLog, '');

      // Rodolpho da Silva - P: 25538 - 12/06/2007
      // Apenas para executar um "Refresh" no método
      //GrdCdsDocumentosUpdateFooter que resulta o total dos documentos
      CdsDocumentos.Edit;
      CdsDocumentos.Post;
      // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
      GrdCdsDocumentos.RedrawGrid;
   Except
      //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Início
      MostraProcessamento([2]);
      //Cássio - SOL Nº 133216 KINTANA Nº 775057 - Fim
      MsgDlg('Não foi possível ler o arquivo', 'Aviso', mtError, [mbOk], 0);
      Raise;
   End;

End;
//************************************************

Procedure TFrmBaixaIntBancoMT.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   EdtArquivoRetorno.Text := '';
   CmbModeloCnab.Text := '';
   DlgAbrir.FileName := '';
   //Cássio Rovaroto - SIG nº 63651 - Início
   cmbConvBancario.Text := '';
   pnlConvenioBancario.Visible := False;
   //Cássio Rovaroto - SIG nº 63651 - Fim
   
   //Cássio Rovaroto - SIG nº 82888 - Início
   if bLeRetornoETL then
   begin
    if not CtrlBaixaIntBanco.ExcluiDadosProcerssoBaixa(SequenceBaixa) then
    begin
      MsgDlg('Ocorreu um erro ao cancelar a operação.', 'Aviso', mtError, [mbOk], 0);
      Exit;
    end;
    ChkUsarETL.Checked := False;
    ChkUsarETL.Enabled := True;
    Toolbar971.Visible := True;
    Panel2.Caption := sCaptionLabelDoc;
    grpbLogFinanc.Caption := sCaptionGroupLog;
    edtArquivoLog.Visible := True;
    spbtnArqLog.Visible := True;
    bitbtnVisualiza.Visible := True;
    pnlGrdDadosRetorno.SendToBack;
   end;
   //Cássio Rovaroto - SIG nº 82888
End;

//************************************************

Procedure TFrmBaixaIntBancoMT.bbtnConfirmarClick(Sender: TObject);
Var
   sAux: String;
   iCodPortForma: Integer;
   objDocumento: TCtrlDocumento;
   objFinanc: TCtrlFinanc;
   objPeriodo: TCtrlPeriodo; // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   objContab: TCtrlContab; // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   bSintetizaContabilizacao: Boolean;
   bArquivoSigCb: Boolean;
   iSel: Word; // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
   filtro: String; // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
   tArquivoParamBaixa: TextFile; // Cássio Rovaroto - SIG nº 82888
   sPathETLBaixa, sPathETLBaixaTEMP, sPathArqParamBaixa, sLinha: string; // Cássio Rovaroto - SIG nº 82888
   //SequenceBaixa: Integer; // Cássio Rovaroto - SIG nº 82888
   BaixaETL: Boolean; // Cássio Rovaroto - SIG nº 82888
   IdCidade, IdPais : Integer; // Cássio Rovaroto - SIG nº 82888
   UF, sDataLancto, sDataDisponib: String; // Cássio Rovaroto - SIG nº 82888
Begin
   Inherited;

   edtArquivoLog.Enabled := false;
   spbtnArqLog.Enabled := false;
   sDataLancto := EmptyStr; // Cássio Rovaroto - SIG nº 82888
   sDataDisponib := EmptyStr; // Cássio Rovaroto - SIG nº 82888


   // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
   //Cássio Rovaroto - SIG nº 82888 - Início
   //If ContaMarcados = 0 Then
   if (ContaMarcados = 0) and not (bLeRetornoETL) then
      Begin
         iSel := Application.MessageBox('Nenhum documento selecionado.' + #13 + 'Deseja baixar assim mesmo ?', 'Confirmar', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2);
         If iSel = IDYES Then
            Begin
               DtLancamento.Clear;
               SbAdTodosClick(self);
               ContaMarcados;
            End
         Else
            exit;
      End;
  //Cássio Rovaroto - SIG nº 82888 - Fim

   If (dtLancamento.date > dtpDataDisp.Date) Then
      Begin
         MsgDlg('A Data de Lançamento deverá ser menor ' + #13 +
            '    ou igual a Data de Disponibilidade !', 'Aviso', mtWarning, [mbOk], 0);
         dtLancamento.SetFocus;
         Exit;
      End;
   //

   If (trim(dtpDataDisp.Text) = '') And (dtpDataDisp.Visible) Then
      Begin
         MsgDlg('Preencha a Data de Disponibilidade ', 'Aviso', mtError, [mbOk], 0);
         dtpDataDisp.SetFocus;
         Exit;
      End;

   If CmbModeloCnab.Text = '' Then
      Begin
         MsgDlg('Favor Indicar o ' + LblPgto.Caption, 'Aviso', mtError, [mbOk], 0);
         CmbModeloCnab.SetFocus;
         Exit;
      End;

   //Cássio Rovaroto - SIG nº 82888 - Início
   //If CdsDocumentos.IsEmpty Then
   if (CdsDocumentos.IsEmpty) and not (bLeRetornoETL) then
   //Cássio Rovaroto - SIG nº 82888 - Fim
      Begin
         MsgDlg('Não Existem Documentos para este ' + LblPgto.Caption, 'Aviso', mtError, [mbOk], 0);
         Exit;
      End;

  //Everson Cunha - SIG103323 - Ini
  if (Not CdsDocumentos.isEmpty) and (StrToInt(CmbModeloCnab.LookupValue) = 63) and (dValorTotalBaixado <> 0) then
  begin
    MsgDlg('Tipo de Cobrança Eletrônica não permite a baixa COM financeiro ', 'Aviso', mtError, [mbOk], 0);
    Exit;
  end;   
  //Everson Cunha - SIG103323 - Fim

   If ParamIntegra.RecPag = 'R' Then
      Begin
         If (CdsParamcap.FieldByName('CODALTERADORABAT').AsInteger = 0) Then
            Begin
               MsgDlg('Falta Indicar Alterador para Abatimento no Cadastro de Parâmetro do Sistema', 'Aviso', mtError, [mbOk], 0);
               Exit;
            End;

         If (CdsParamcap.FieldByName('CODALTERADORDESC').AsInteger = 0) Then
            Begin
               MsgDlg('Falta Indicar Alterador para Desconto no Cadastro de Parâmetro do Sistema', 'Aviso', mtError, [mbOk], 0);
               Exit;
            End;

         If (CdsParamcap.FieldByName('CODALTERADORTARIF').AsInteger = 0) Then
            Begin
               MsgDlg('Falta Indicar Alterador para Outros Valores no Cadastro de Parâmetro do Sistema', 'Aviso', mtError, [mbOk], 0);
               Exit;
            End;

         If (CdsParamcap.FieldByName('CODALTERADORJUROS').AsInteger = 0) Then
            Begin
               MsgDlg('Falta Indicar Alterador para Juros no Cadastro de Parâmetro do Sistema', 'Aviso', mtError, [mbOk], 0);
               Exit;
            End;

         sAux := 'Lote de Recebimento'
      End
   Else
      sAux := 'Cheque / Borderô';

   //Obs: Não utilizar o Exit dentro do Try/Finally, pois gera um
   //erro e mantém o objeto em memória, não destruindo-o
   sAux := '';
   objFinanc := TCtrlFinanc.Create(Sistema.IdEmpresa, Sistema.IdModulo,
      Sistema.IdUsuario, Sistema.UsaPlanoPatro);
   Try
      objFinanc.InitializeAs(Padroes);
      If Not objFinanc.TestaDispFinanc(Sistema.IdEmpresa, Sistema.IdUsuario,
         dtpDataDisp.Date) Then
         sAux := objFinanc.MessageInfo;
   Finally
      FreeAndNil(objFinanc);
   End;

   If Trim(sAux) <> '' Then
      Begin
         MsgDlg(sAux, 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   // Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319
   sAux := '';
   objPeriodo := TCtrlPeriodo.Create;
   Try
      objPeriodo.InitializeAs(Padroes);

      If objPeriodo.RetornaPeriodoExercicioData(Sistema.IdEmpresa, dtpDataDisp.Text) Then
         Begin
            If objPeriodo.TestaPeriodoBloqueado(Sistema.IdEmpresa, tbBloqOuInt, objPeriodo.Periodo, objPeriodo.Exercicio, False) Then
               sAux := objPeriodo.MessageInfo;
         End
      Else
         sAux := objPeriodo.MessageInfo;

   Finally
      FreeAndNil(objPeriodo);
   End;

   If Trim(sAux) <> '' Then
      Begin
         MsgDlg(sAux, 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   sAux := '';
   objContab := TCtrlContab.Create;
   Try
      objContab.InitializeAs(Padroes);
      If Not objContab.TestaDataBloqueadaProc(Sistema.IdEmpresa, Sistema.IdModulo, dtpDataDisp.Text) Then
         sAux := objContab.MessageInfo;
   Finally
      FreeAndNil(objContab);
   End;

   If Trim(sAux) <> '' Then
      Begin
         MsgDlg(sAux, 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;
   // Fim - Alterado por FHBS - SOL: 124570/3781 e 124570/3782 KTN: 1136318 e 1136319

   If (Not CdsDocumentos.IsEmpty) Then
      Begin
         // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
         If Application.MessageBox(PChar('Confirma a baixa no valor total de R$ ' + floattostrf(dValorTotalBaixado, ffnumber, 12, 2) + ' ?'), 'Confirmar', MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = Mryes Then
            Begin
               Try
                  // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                  // *****************************************************************************************************
                  //
                  // Ricardo A. SOL 103843
                  objDocumento := TCtrlDocumento.Create();
                  Try
                     objDocumento.InitializeAs(ParamIntegra);
                     sNumChequeBordero := IntToStr(objDocumento.GetNumChqBordero());
                  Finally
                     FreeAndNil(objDocumento);
                  End;

                  If Not InputQuery('Baixa Automática', 'Favor Indicar o Nº do ' + sAux, sNumChequeBordero) Then
                     Begin
                        MsgDlg('Falta indicação do Nº do ' + sAux, 'Aviso', mtError, [mbOk], 0);
                        Exit;
                     End;

                  If (sNumChequeBordero = '') Then
                     Begin
                        MsgDlg('Falta indicação do Nº do ' + sAux, 'Aviso', mtError, [mbOk], 0);
                        Exit;
                     End;

                  // Ricardo A. SOL: 112617 KTN: 521708
                  // máximo de 15 caracteres por causa do campo NUMCHQBORDERO na tabela RECBTOPAGTO
                  If (Length(sNumChequeBordero) > 15) Then
                     Begin
                        MsgDlg('Tamanho do Nº do ' + sAux + ' não pode exceder a 15 digítos', 'Aviso', mtError, [mbOK], 0);
                        Exit;
                     End;

                  // *****************************************************************************************************

                  // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
                  If Not ChkUsarETL.Checked Then
                     mostraProcessamento([3, cdsDocumentos.Recno, 0, 1, cdsDocumentos.RecordCount, 'Documentos '])
                  Else
                     mostraProcessamento([6, 0, 0, 0, 0, 'Baixa sendo executada via ETL. ' + #13 + 'Processo iniciado em ' + FormatDateTime('dd/mm/yy hh:nn:ss', Now)]);
                  // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim

                  iCodPortForma := CdsDocumentos.FieldByName('CODPORTFORMA').AsInteger;

                  CdsDocumentos.DisableControls;
                  CdsDocumentos.LogChanges := false;

                  // Edilaine - SOL 183486 / KTN 1718525
                  CdsDocumentos.Filter := '';
                  CdsDocumentos.Filtered := false;
                  // Edilaine - SOL 183486 / KTN 1718525 - fim

                  // SOL 174820.8461 KTN : 1603235 JRM6
                  bSintetizaContabilizacao := ((CmbModeloCnab.LookupValue = '50')); //or
                  //                                 (CmbModeloCnab.LookupValue = '60'));
                        // SOL 174820.8461 KTN : 1603235 JRM6  - fim
                  bArquivoSigCb := (CmbModeloCnab.LookupValue = '60');

                  CtrlBaixaIntBanco.bUsaPortFormaRetorno := true;

                  If (CtrlBaixaIntBanco.bbtnConfirmarClick(
                     CmbModeloCnab.LookupValue,
                     sListaRetorno, // Paulo Nobre - Sol 187427 Kintana 1793755
                     iCodPortForma,
                     StrToFloat(sNumChequeBordero),
                     CdsDocumentos.FieldByName('DataBaixa').AsDateTime,
                     dtLancamento.date, // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                     dtpDataDisp.date,
                     Trunc(valCommit.value),
                     bSintetizaContabilizacao,
                     ChkUsarETL.Checked,
                     bArquivoSigCb)) Then
                     Begin
                        // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
                        If Application.MessageBox(PChar(CtrlBaixaIntBanco.MessageInfo + ' Deseja gerar arquivo de Log?'), 'Aviso', MB_YESNO) = Mryes Then
                           Begin
                              If CtrlBaixaIntBanco.GerarArquivoLOG(CtrlBaixaIntBanco.SequenceBaixa) Then
                                 MsgDlg('Arquivo de LOG gerado com sucesso!', 'Aviso', mtWarning, [mbOk], 0);
                           End;
                        CtrlBaixaIntBanco.SequenceBaixa := 0;
                        Exit;

                        // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim
                     End
                  Else
                     Begin

                        //*** andre tavares 07/12/2006 FrmAguarde.Pos := FrmAguarde.Max;
                     End;
               Finally
                  MostraProcessamento([5]);
                  edtArquivoLog.Enabled := true;
                  spbtnArqLog.Enabled := true;

                  // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                  // Ricardo A. SOL 110651 KTN: 505820
   //             sListaRetorno.Clear();
   //             If trim(CtrlBaixaIntBanco.sNomeArqLog) <> '' Then
   //             VisualizaArquivo(CtrlBaixaIntBanco.sNomeArqLog, '');

                  // Paulo Nobre - Sol 214738_15892  KTN 2057238 - 13/03/2014
                  dtLancamento.Clear;
                  dtpDataDisp.Clear;

                  Cursor := crSQLWait;
                  CdsDocumentos.EnableControls;
                  CdsDocumentos.LogChanges := true;
                  CtrlBaixaIntBanco.LimpaDocumentos;
                  sListaRetorno.Clear();
                  sListaRetorno := CtrlBaixaIntBanco.BuscaBaixa(StrToIntDef(CmbModeloCnab.LookupValue, 0),
                     DlgAbrir.FileName, UpperCase(Sistema.NomeEmpresa), 'N');
                  If (sListaRetorno <> Nil) And (Copy(sListaRetorno[0], 1, 4) <> 'Erro') Then
                     If sListaRetorno.Count <> 0 Then
                        Begin
                           CtrlBaixaIntBanco.MontaGrid(sListaRetorno, CmbModeloCnab.LookupValue, 'N');

                           edtTotDocs.Text := intToStr(CdsDocumentos.RecordCount);

                           Cursor := crDefault;

                           GrdCdsDocumentos.RedrawGrid;
                        End
                     Else
                        MsgDlg('Não foram encontrados registros para baixa no arquivo', 'Aviso', mtError, [mbOk], 0);
               End;
            End;
   //Cássio Rovaroto - SIG nº 82888 - Início
   //   End;
      end
      //Procedimento via ETL
      else
      if bLeRetornoETL then
      begin
        DiasUteis.SetLogradouro(Sistema.IdEmpresa, IdCidade, IdPais, UF);
        sPathETLBaixa := CtrlBaixaIntBanco.PegaCaminhoETL(ParamIntegra.Recpag);
        sPathETLBaixaTEMP := StringReplace(sPathETLBaixa, 'ARQUIVO_FAZ_BAIXA.TXT', 'ARQUIVO_FAZ_BAIXA.TMP', [rfReplaceAll, rfIgnoreCase]);
        sPathArqParamBaixa := StringReplace(sPathETLBaixa, 'ARQUIVO_FAZ_BAIXA.TXT', 'ArqParamBaixa.txt', [rfReplaceAll, rfIgnoreCase]);
        SequenceBaixa := CtrlBaixaIntBanco.RetornaUltbaixaProc;

        AssignFile(tArquivoParamBaixa, sPathArqParamBaixa);
        Rewrite(tArquivoParamBaixa);
        Append(tArquivoParamBaixa);
        if dtLancamento.Text <> EmptyStr then
          sDataLancto := DateToStr(DiasUteis.PrimeiroDiaUtilPosterior((dtLancamento.Date + (iDMAIS - 1)), IdCidade, IdPais, UF, True, False, False));

        sDataDisponib :=  DateToStr(DiasUteis.PrimeiroDiaUtilPosterior((dtpDataDisp.Date - 1), IdCidade, IdPais, UF, True, False, False));

        sLinha := '1;' + sDataLancto + ';' + sDataDisponib;
        Write(tArquivoParamBaixa, sLinha);
        CloseFile(tArquivoParamBaixa);

        RenameFile(sPathETLBaixaTEMP, sPathETLBaixa);
        mostraProcessamento([6, 0, 0, 0, 0, 'Baixa sendo executada via ETL. ' + #13 + 'Processo iniciado em ' + FormatDateTime('dd/mm/yy hh:nn:ss', Now)]);

        BaixaETL := True;
        while BaixaETL do
        begin
          BaixaETL := CtrlBaixaIntBanco.VerificarBaixaETL(SequenceBaixa);
          if not BaixaETL then
            Sleep(1000)
          else
            Sleep(30000);
        end;

        MostraProcessamento([5]);
        Application.MessageBox(PChar('Processo de Baixa finalizado com sucesso!'
                        + #13 + #10 + 'Total de documentos baixados: ' + IntToStr(CtrlBaixaIntBanco.QtdeBaixaETL)), 'Aviso', MB_OK);

        ChkUsarETL.Checked := False;
        ChkUsarETL.Enabled := True;
        Toolbar971.Visible := True;
        Panel2.Caption := sCaptionLabelDoc;
        grpbLogFinanc.Caption := sCaptionGroupLog;
        edtArquivoLog.Visible := True;
        spbtnArqLog.Visible := True;
        bitbtnVisualiza.Visible := True;
        pnlGrdDadosRetorno.SendToBack;    
      end;
   //Cássio Rovaroto - SIG nº 82888 - Fim
End;
//************************************************

Procedure TFrmBaixaIntBancoMT.mostraProcessamento(vParam: Array Of Variant);
//  Legenda do FormProgresso
//   vParam[0] :  Tipo da operação (0 = MostraProgDuplo,   1 = AndaProgDuplo,   2 = EscondeProgDuplo)
//                                 (3 = MostraRpogSimples, 4 = AndaProgSimples, 5 = EscondeProgSimples)
//-------------------------------------
//   vParam[1]  :  Registro Atual - Acima
//   vParam[2]  :  Registro Atual - Abaixo

//  Acima
//   vParam[3]  :  Mínimo de Registros
//   vParam[4]  :  Total de Registros
//   vParam[5]  :  Legenda

// Abaixo
//   vParam[6]  :  Mínimo de Registros
//   vParam[7]  :  Total de Registros
//   vParam[8]  :  Legenda

Begin
   Case vParam[0] Of
      // Progresso duplo
      0: Begin
            frmProgressoDuplo.DoubleBuffered := true;
            frmProgressoDuplo.Caption := 'Processamento de Baixa dos Documentos';

            frmProgressoDuplo.Min := 0;
            frmProgressoDuplo.Max := vParam[4];
            frmProgressoDuplo.Min2 := 0;
            frmProgressoDuplo.Max2 := vParam[7];
            frmProgressoDuplo.Legenda := vParam[5];
            frmProgressoDuplo.Legenda2 := vParam[8];

            frmProgressoDuplo.btnCancelar.Visible := false;
            frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5], vParam[8], vParam[3], vParam[6], vParam[4], vParam[7], false, false);
         End;

      1: Begin
            If Not frmProgressoDuplo.Visible Then
               frmProgressoDuplo.MostraFormProgressoDuplo(vParam[5], vParam[8], vParam[3], vParam[6], vParam[4], vParam[7], false, false);

            frmProgressoDuplo.Legenda := vParam[5];
            frmProgressoDuplo.Legenda2 := vParam[8];
            frmProgressoDuplo.Min := vParam[3];
            frmProgressoDuplo.Min2 := vParam[6];
            frmProgressoDuplo.Max := vParam[4];
            frmProgressoDuplo.Max2 := vParam[7];
            frmProgressoDuplo.AndaFormProgressoDuplo(vParam[1], vParam[2]);
         End;

      2: frmProgressoDuplo.EscondeFormProgressoDuplo;

      // Progresso simples
      3: Begin
            frmProgresso.DoubleBuffered := true;
            frmProgresso.Caption := 'Processamento de Baixa dos Documentos';
            frmProgresso.MostraFormProgresso(vParam[5], false, false, true, vParam[3], vParam[4]);
         End;

      4: Begin
            frmProgresso.Min := vParam[3];
            frmProgresso.Max := vParam[4];
            frmProgresso.Legenda := vParam[5];
            frmProgresso.AndaFormProgresso(vParam[1], vParam[4]);
         End;

      5: frmProgresso.EscondeFormProgresso;
      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Início
      6: Begin
            frmProgresso.DoubleBuffered := true;
            frmProgresso.Caption := 'Processamento de Baixa dos Documentos. Aguarde...';

            frmProgresso.lblContador.Visible := False;
            frmProgresso.Panel1.Visible := False;
            frmProgresso.MostraFormProgresso(vParam[5], false, false, True, vParam[3], vParam[4]);

         End;
      // Número do SOL: 124570 2981 Kintana 103005 - Baixa ETL Fim
   End;
   Application.ProcessMessages;
   Repaint;
End;

Procedure TFrmBaixaIntBancoMT.FormActivate(Sender: TObject);
Begin
   If frmProgressoDuplo.Visible Then
      Begin //Durante a transação do sql não deixar o form de progresso perder o foco
         SetWindowPos(frmProgressoDuplo.handle, HWND_TOPMOST, frmProgressoDuplo.Left, frmProgressoDuplo.Top, frmProgressoDuplo.Width, frmProgressoDuplo.Height, 0); // HWND_NOTOPMOST normal
         Repaint;
         Application.ProcessMessages;
      End
   Else
      Inherited;
End;

Procedure TFrmBaixaIntBancoMT.CdsDocumentosAfterOpen(DataSet: TDataSet);
Begin
   Inherited;
   TFloatField(DataSet.FieldByName('VALOR')).DisplayFormat := '#,##0.00;-#,##0.00';
End;

Procedure TFrmBaixaIntBancoMT.GrdCdsDocumentosCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   Inherited;
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then Begin
         If Not Highlight Then Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then Begin
                     ABrush.Color := $00C0FFFF; // amarelo bebê
                  End Else Begin
                     ABrush.Color := clWhite;
                  End;
            End;
      End Else Begin
         ABrush.Color := clHighLight;
         AFont.Color := clHighLightText;
      End;
End;

Procedure TFrmBaixaIntBancoMT.GrdCdsDocumentosTopRowChanged(
   Sender: TObject);
Begin
   Inherited;
   (sender As TwwDBGrid).Invalidate;
End;

Procedure TFrmBaixaIntBancoMT.GrdCdsDocumentosUpdateFooter(Sender: TObject);
Var
   rTotal: Double;
Begin
   Inherited;
   rTotal := 0;
   With TClientDataSet.Create(Nil) Do
      Try
         Data := CdsDocumentos.Data;

         // Edilaine - SOL 183486 / KTN 1718525
         If (Not CdsDocumentos.isEmpty) And (CdsDocumentos.Filter <> '') Then
            Begin
               Filter := CdsDocumentos.Filter;
               Filtered := CdsDocumentos.Filtered;
            End;
         // Edilaine - SOL 183486 / KTN 1718525 - fim

        //Everson Cunha - SIG103323 - Ini
        //Não filtra o GRID (Mostra documentos efetivados e não efetivados)
        //Mas filtra o totalizador no footer (Somar apenas os efetivados)
        If (Not CdsDocumentos.isEmpty) and (StrToInt(CmbModeloCnab.LookupValue) = 63) Then
        Begin
          Filter := 'CODOCORRENCIA = ''00'' ';
          Filtered := true;
        End;
        //Everson Cunha - SIG103323 - Fim

         While Not Eof Do
            Begin
               rTotal := rTotal + FieldByName('VALOR').AsFloat;

               Next;
            End;

        //Everson Cunha - SIG103323 - Ini
        //Não filtra o GRID (Mostra documentos efetivados e não efetivados)
        //Mas filtra o totalizador no footer (Somar apenas os efetivados)
        If (Not CdsDocumentos.isEmpty) and (StrToInt(CmbModeloCnab.LookupValue) = 63) Then
        Begin
          Filtered := False;
          Filter := '';
        End;
        //Everson Cunha - SIG103323 - Fim

         (sender As TwwDBGrid).ColumnByName('VALOR').FooterValue := FormatFloat('#,##0.00;-#,##0.00', rTotal);
      Finally
         Free;
      End;
End;

Procedure TFrmBaixaIntBancoMT.spbtnArqLogClick(Sender: TObject);
Begin
   Inherited;
   
   dlgArqLog.Execute;

   If (trim(dlgArqLog.FileName) <> '') Then
      edtArquivoLog.text := dlgArqLog.FileName;
End;

Procedure TFrmBaixaIntBancoMT.bitbtnVisualizaClick(Sender: TObject);
Begin
   Inherited;
   If (trim(edtArquivoLog.text) <> '') Then
      VisualizaArquivo(edtArquivoLog.text, '');
End;

//para associar ao evento de gravação do financeiro

Procedure TFrmBaixaIntBancoMT.GravaLogFinanceiro(Const sLog: String);
Var F: TextFile;
Begin

   Try
      If trim(edtArquivoLog.text) <> '' Then
         Begin
            AssignFile(F, edtArquivoLog.text);
            If Not FileExists(edtArquivoLog.text) Then
               Rewrite(F)
            Else
               Append(F);

            Writeln(F, sLog);
            Flush(f);
         End; //if
   Finally
      CloseFile(F);
   End;
End;

Procedure TFrmBaixaIntBancoMT.FormShow(Sender: TObject);
Begin
   Inherited;
   If (Sistema.IdModulo <> 4) Then
      Begin
         ChkUsarETL.Checked := false;
         ChkUsarETL.Visible := false;
         pnlConvenioBancario.Visible := False; //Cássio Rovaroto - SIG nº 63651
      End;
End;

// Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014

Function TFrmBaixaIntBancoMT.ContaMarcados: Integer;
Var iQtd: Integer;
Begin
   Inherited;
   iQtd := 0;
   dValorTotalBaixado := 0;
   If (Not CdsDocumentos.isEmpty) Then
      Begin
         Cursor := crSQLWait;
         CdsDocumentos.DisableControls;
         CdsDocumentos.First;

         if (StrToInt(CmbModeloCnab.LookupValue) <> 63) then //Everson Cunha - SIG103323
         begin
            While Not CdsDocumentos.Eof Do
            Begin
               If CdsDocumentos.FieldByName('FLGMARCADO').AsString = 'S' Then
                  Begin
                     dValorTotalBaixado := dValorTotalBaixado + CdsDocumentos.fieldbyname('VALOR').asFloat;
                     inc(iQtd);
                  End;
               CdsDocumentos.Next;
            End;
         end
         else
         begin
            //Everson Cunha - SIG103323 - Ini
            While Not CdsDocumentos.Eof Do
            Begin
              If CdsDocumentos.FieldByName('FLGMARCADO').AsString = 'S' Then
              Begin
                inc(iQtd);
              End;
              CdsDocumentos.Next;
            End;

            //Não filtra o GRID (Mostra documentos efetivados e não efetivados)
            //Mas filtra o totalizador (Somar apenas os efetivados)

            CdsDocumentos.Filter := 'CODOCORRENCIA = ''00'' ';
            CdsDocumentos.Filtered := true;

            CdsDocumentos.First;

            While Not CdsDocumentos.Eof Do
            Begin
              If CdsDocumentos.FieldByName('FLGMARCADO').AsString = 'S' Then
              Begin
                dValorTotalBaixado := dValorTotalBaixado + CdsDocumentos.fieldbyname('VALOR').asFloat;
              End;
              CdsDocumentos.Next;
            End;

            CdsDocumentos.Filtered := False;
            CdsDocumentos.Filter := '';
            //Everson Cunha - SIG103323 - Fim
         end;

         Cursor := crDefault;
         CdsDocumentos.EnableControls;
         Result := iQtd;
      End;
End;

Procedure TFrmBaixaIntBancoMT.SbInverteClick(Sender: TObject);
Begin
   Inherited;
   // Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014
   If (Not CdsDocumentos.isEmpty) Then
      Begin
         Cursor := crSQLWait;
         CdsDocumentos.DisableControls;
         CdsDocumentos.First;
         While Not CdsDocumentos.Eof Do
            Begin
               CdsDocumentos.edit;
               If CdsDocumentos.FieldByName('FLGMARCADO').AsString = 'S' Then
                  CdsDocumentos.FieldByName('FLGMARCADO').AsString := 'N'
               Else
                  CdsDocumentos.FieldByName('FLGMARCADO').AsString := 'S';

               CdsDocumentos.Next;
            End;

         CdsDocumentos.First;
         Cursor := crDefault;
         CdsDocumentos.EnableControls;
      End;
End;

Procedure TFrmBaixaIntBancoMT.SbAdTodosClick(Sender: TObject);
Begin
   Inherited;
   // Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014
   If (Not CdsDocumentos.isEmpty) Then
      Begin
         Cursor := crSQLWait;
         CdsDocumentos.DisableControls;
         CdsDocumentos.First;
         While Not CdsDocumentos.Eof Do
            Begin
               CdsDocumentos.edit;
               CdsDocumentos.FieldByName('FLGMARCADO').AsString := 'S';

               CdsDocumentos.Next;
            End;

         CdsDocumentos.First;
         Cursor := crDefault;
         CdsDocumentos.EnableControls;
      End;
End;

Procedure TFrmBaixaIntBancoMT.ChkUsarETLExit(Sender: TObject);
Begin
   Inherited;
   // Sol 214738_15892  KTN 2057238  Paulo Nobre   13/03/2014
   GrdCdsDocumentos.setfocus;
End;

procedure TFrmBaixaIntBancoMT.cdsDadosRetornoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  TFloatField(DataSet.FieldByName('VALORTOT')).DisplayFormat := '#,##0.00;-#,##0.00';
end;

procedure TFrmBaixaIntBancoMT.CmbModeloCnabChange(Sender: TObject);
begin
  inherited;
  bLeRetornoETL := CtrlBaixaIntBanco.RetornoViaETL(CdsModelosCnab.FieldByName('IDMODELOSCNAB').asInteger, paramIntegra.RecPag);

  //Cássio Rovaroto - SIG nº 102320 - Início
  //Cássio Rovaroto - SIG nº 63651 - Início
  //if CdsModelosCnab.FieldByName('IDMODELOSCNAB').AsInteger = 62 then // 62 - BANCO CEF - SIACC - DEBITO AUTOMATICO
  //  pnlConvenioBancario.Visible := True
  //else
  //  pnlConvenioBancario.Visible := False;
  //Cássio Rovaroto - SIG nº 63651 - Fim
  //Cássio Rovaroto - SIG nº 102320 - Fim
  
end;

procedure TFrmBaixaIntBancoMT.btnDadosRetornoClick(Sender: TObject);
var
    filtro: string;
    i: integer;
    sArqRetornoTEMP, sArqRetorno, sPathETL, sArqParamRetorno, sLinhaParamBaixa, sLinha: string;
    tArqParamRetorno, tDocsArqRetorno: TextFile;
    iIdUtlProcETL: Integer;
begin
  inherited;
  i:= 0;
  if dtpDtVencimento.Text   = '' then
  begin
    MsgDlg('Por favor, defina a data do crédito efetivado.', 'Aviso', mtError, [mbOk], 0);
    dtpDtVencimento.SetFocus;
    Exit;
  end;

  if CmbModeloCnab.Text = '' then
  begin
    MsgDlg('Favor Indicar o ' + LblPgto.Caption, 'Aviso', mtError, [mbOk], 0);
    CmbModeloCnab.SetFocus;
    Exit;
  end;

  if not CtrlBaixaIntBanco.AbreOcorrencia(CmbModeloCnab.LookupValue) then
  begin
    MsgDlg(CtrlBaixaIntBanco.MessageInfo, 'Aviso', mtError, [mbOk], 0);
    Exit;
  end;

  try
    if (bLeRetornoETL) and
       (MsgDlg('Deseja fazer a leitura do arquivo retorno via ETL?', 'Confirmação', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      EdtArquivoRetorno.Text := EmptyStr;
      //sListaRetorno.Clear();
      sListaRetorno := CtrlBaixaIntBanco.BuscaBaixa(StrToIntDef(CmbModeloCnab.LookupValue, 0),
                                                    EmptyStr,
                                                    UpperCase(Sistema.NomeEmpresa),
                                                    'S',
                                                    dtpDtVencimento.Text,
                                                    StrToInt(cmbConvBancario.LookupValue));

      if (sListaRetorno = nil) or (sListaRetorno.Count = 0) then
      begin
        MsgDlg('Não foram encontrados registros para baixa no arquivo', 'Aviso', mtError, [mbOk], 0);
        Exit;
      end;

      iIdUtlProcETL := CtrlBaixaIntBanco.RetornaUltbaixaProc;
      sPathETL := CtrlBaixaIntBanco.PegaCaminhoETL(ParamIntegra.Recpag);
      sArqRetornoTEMP := StringReplace(sPathETL, 'ARQUIVO_FAZ_BAIXA.TXT', 'Arquivo_Retorno.tmp', [rfReplaceAll, rfIgnoreCase]);
      sArqRetorno := StringReplace(sPathETL, 'ARQUIVO_FAZ_BAIXA.TXT', 'Arquivo_Retorno.txt', [rfReplaceAll, rfIgnoreCase]);
      sArqParamRetorno := StringReplace(sPathETL, 'ARQUIVO_FAZ_BAIXA.TXT', 'ArquivoTipoBaixa.txt', [rfReplaceAll, rfIgnoreCase]);

      AssignFile(tDocsArqRetorno, sArqRetornoTEMP);
      Rewrite(tDocsArqRetorno);

      while i <= sListaRetorno.Count -1 do
      begin
        sLinha := sListaRetorno[i];
        Writeln(tDocsArqRetorno, sLinha);
        Inc(i);
      end;
      CloseFile(tDocsArqRetorno);

      AssignFile(tArqParamRetorno, sArqParamRetorno);
      Rewrite(tArqParamRetorno);

      sLinhaParamBaixa :=  '1;' + IntToStr(Sistema.IdUsuario) + ';' + IntToStr(Sistema.IdModulo) + ';Baixa Automática';

      Append(tArqParamRetorno);
      Write(tArqParamRetorno, sLinhaParamBaixa);
      CloseFile(tArqParamRetorno);

      RenameFile(sArqRetornoTEMP, sArqRetorno);
      mostraProcessamento([6, 0, 0, 0, 0, 'Leitura de arquivo retorno executada via ETL. ' + #13 + 'Processo iniciado em ' + FormatDateTime('dd/mm/yy hh:nn:ss', Now)]);

      while  iIdUtlProcETL = CtrlBaixaIntBanco.RetornaUltbaixaProc do
      begin
        if iIdUtlProcETL <> CtrlBaixaIntBanco.RetornaUltbaixaProc then
          Sleep(1000)
        else
          Sleep(30000);
      end;

      MostraProcessamento([5]);
      MsgDlg('Leitura do arquivo de retorno realizada com sucesso.', 'Aviso', mtInformation, [mbOk], 0);
      SequenceBaixa := CtrlBaixaIntBanco.RetornaUltbaixaProc;
      Toolbar971.Visible := False;
      cdsDadosRetorno.Data := CtrlBaixaIntBanco.RetornaDadosRetorno(CtrlBaixaIntBanco.RetornaUltbaixaProc);
      edtTotDocs.Text := cdsDadosRetorno.FieldByName('QTD_A_BAIXAR').AsString;
      iDMAIS := CtrlBaixaIntBanco.buscaFloat(cdsDadosRetorno.FieldByName('CODPORTFORMA').AsInteger);
      Panel2.Caption := 'Resumo da leitura do Arquivo Retorno';
      grpbLogFinanc.Caption := EmptyStr;
      edtArquivoLog.Visible := False;
      spbtnArqLog.Visible := False;
      bitbtnVisualiza.Visible := False;
      ChkUsarETL.Checked := True;
      ChkUsarETL.Enabled := False;
      pnlGrdDadosRetorno.BringToFront;
      Exit;
    end
    else
    begin
      EdtArquivoRetorno.Text := EmptyStr;
      //sListaRetorno.Clear();
      sListaRetorno := CtrlBaixaIntBanco.BuscaBaixa(StrToIntDef(CmbModeloCnab.LookupValue, 0),
                                                    EmptyStr,
                                                    UpperCase(Sistema.NomeEmpresa),
                                                    'S',
                                                    dtpDtVencimento.Text,
                                                    StrToInt(cmbConvBancario.LookupValue));

      if (sListaRetorno = nil) or (sListaRetorno.Count = 0) then
      begin
        MsgDlg('Não foram encontrados registros para baixa no arquivo', 'Aviso', mtError, [mbOk], 0);
        Exit;
      end;

      CtrlBaixaIntBanco.LimpaDocumentos;
      CdsDocumentos.DisableControls;
      CdsDocumentos.LogChanges := false;

      CtrlBaixaIntBanco.MontaGrid(sListaRetorno, CmbModeloCnab.LookupValue, 'S');

      if (ParamIntegra.Recpag = 'R') And (StrToInt(CmbModeloCnab.LookupValue) In [62]) then
      begin
        filtro := 'CODOCORRENCIA = ''00'' ';

        CdsDocumentos.Filtered := false;
        CdsDocumentos.Filter := filtro;
        CdsDocumentos.Filtered := true;
      end;
      edtTotDocs.Text := intToStr(CdsDocumentos.RecordCount);

      CdsDocumentos.EnableControls;
      CdsDocumentos.LogChanges := true;
      mostraProcessamento([2, 0, sListaRetorno.count, cdsDocumentos.RecordCount, 'Selecionando Documentos para Baixa']);

      if (CdsDocumentos.IsEmpty) And (trim(CtrlBaixaIntBanco.sNomeArqLog) <> '') then
        VisualizaArquivo(CtrlBaixaIntBanco.sNomeArqLog, '');

      CdsDocumentos.Edit;
      CdsDocumentos.Post;
      GrdCdsDocumentos.RedrawGrid;
    end;
  except
    MostraProcessamento([2]);
    MsgDlg('Não foi possível ler o arquivo', 'Aviso', mtError, [mbOk], 0);
    Raise;
  end;

end;

//Ewerton Beltramini - 02/08/2021 - SIG 112126 - Inicio...
procedure TFrmBaixaIntBancoMT.GrdCdsDocumentosCalcTitleImage(
  Sender: TObject; Field: TField;
  var TitleImageAttributes: TwwTitleImageAttributes);
begin
  inherited;
    If (Field.FieldName = 'NODOCUMENTO') Or
       (Field.FieldName = 'RAZAOSOCIAL') Or
       (Field.FieldName = 'DATAPROGRAMADA') Or
       (Field.FieldName = 'DATAVENCTO') Or
       (Field.FieldName = 'VALOR') Or
       (Field.FieldName = 'CODPORTFORMA') Then
    Begin
         TitleImageAttributes.ImageIndex := 0;
         If Trim(CdsDocumentos.IndexName) = Trim('desc' + Field.FieldName) Then
            TitleImageAttributes.ImageIndex := 1;
    End;
end;
//Ewerton Beltramini - 02/08/2021 - SIG 112126 - Fim.

//Ewerton Beltramini - 02/08/2021 - SIG 112126 - Inicio...
procedure TFrmBaixaIntBancoMT.GrdCdsDocumentosTitleButtonClick(
  Sender: TObject; AFieldName: String);
begin
  inherited;
      Try
        If (Not CdsDocumentos.Active) Or
          (CdsDocumentos.IsEmpty) Or
          ( (AFieldName <> 'NODOCUMENTO') And
            (AFieldName <> 'RAZAOSOCIAL') And
            (AFieldName <> 'DATAPROGRAMADA') And
            (AFieldName <> 'DATAVENCTO') And
            (AFieldName <> 'VALOR') And
            (AFieldName <> 'CODPORTFORMA') ) Then
             Exit;

        If (Trim(CdsDocumentos.IndexName) = Trim('asc' + AFieldName)) Then
          CdsDocumentos.IndexName := 'desc' + AFieldName
        Else
          CdsDocumentos.IndexName := 'asc' + AFieldName;

      Finally
        CdsDocumentos.First;
      End;
end;
//Ewerton Beltramini - 02/08/2021 - SIG 112126 - Fim.

End.

