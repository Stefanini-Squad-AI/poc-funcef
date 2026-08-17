//********************************************************************************************
// N. Solicitação: WO28016
// Dt Alteração..: 27/11/2025
// Responsável...: Paulo Nobre
// Descrição.....: Na função: ExecutaConciliacaoAutomatica, estava tendo uma fuga de memória
//                 por conta do filter e bookmark (só aconteceu depois da migração pro banco
//                 Oracle), então, foi refeito o processo de localização dos lançamentos
//                 iguais entre os movimentos do Extrato Bancário e o CFINAN. 
//********************************************************************************************
//N. WO...........: 7698
//Data............: 08/02/2024
//Responsável.....: Lendro Pocebon
//Descrição.......: Tratamento do arquivo no formato .CSV
//********************************************************************************************
//N. SIG..........: 132872
//Data............: 26/04/2023
//Responsável.....: Cássio Florencio Rovaroto
//Descrição.......: Inclusão de definição de registros financeiros a conciliar.
//******************************************************************************
//N. SIG..........: 125198
//Data............: 12/07/2022
//Responsável.....: Everson Cunha
//Descrição.......: Desconsiderar o valor Bloqueado no somatório do "Disponível
//                  Total"
//******************************************************************************
//N. SIG..........: 40974
//Data............: 10/01/2018
//Responsável.....: Everson Cunha
//Descrição.......: Melhoria na concilição automática, para que leve em conside-
//                  ração apenas data e valor. Só conciliar se houver apenas um
//                  registro de cada lado com a mesma Data, Tipo e Valor.
//******************************************************************************
//N. Sol..........: 255703
//N. Kintana......: 826929
//Data............: 09/06/2015
//Responsável.....: William Moreira
//Descrição.......: Mensagem para quando o arquivo não tiver um modelo valido
//******************************************************************************
//N. Sol..........: 201700
//N. Kintana......: 1955228
//Data............: 07/03/2013
//Responsável.....: Paulo Nobre
//Descrição.......: Controle de Bloqueio para lançamentos de SICOB D + 1 e SIVAT
//******************************************************************************
//N. Sol..........: 198796/13843
//N. Kintana......: 1914601
//Data............: 17/01/2013
//Responsável.....: Edilaine Ferraresi / Paulo Nobre
//Descrição.......: Carregando os dados de bloqueio para processar antes de
//                  verificar se há cheques para desbloquear
//******************************************************************************
//N. Sol..........: 198796.13877
//N. Kintana......: 1918841
//Data............: 23/01/2013
//Responsável.....: Otacilio Aquino
//Descrição.......: Alterado o tipo de variavel (dValoMovExtrato,
//                  dValoMovFinanc: Currency)
//******************************************************************************
//N. Sol..........: 31714/13162
//N. Kintana......: 1887925
//Data............: 17/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando a conciliação manual para faze-la 'n' para 'n'
//******************************************************************************
//N. Sol..........: 31714/13082
//N. Kintana......: 1883867
//Data............: 12/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando as condições do SQL da função SaldoMovimFinanc
//******************************************************************************
//N. Sol..........: 31714/12902
//N. Kintana......:
//Data............: 04/12/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando o resultado da função -> ConciliacaoAberta
//******************************************************************************
//N. Sol..........: 31714/12862
//N. Kintana......: 1875635
//Data............: 29/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Acertando o saldo bloqueado do extrato bancário
//******************************************************************************
//N. Sol..........: 31714/12802
//N. Kintana......:
//Data............: 28/11/2012
//Responsável.....: Paulo Nobre
//Descrição.......: Retirada a condição: 'AND SITCONCILIACAO = ''A'' de várias
//                  querys
//******************************************************************************
//N. Sol..........: 31714_38358
//N. Kintana......: 523349_523362
//Data............: 06/06/2012
//Responsável.....: Paulo Nobre
//Descrição.......: NOVA Conciliação Bancária
//******************************************************************************
//
//  Conteúdo do campo: MOVIMFINANC.CONCILIADO:

//  N  - Não conciliado
//  S  - Conciliado normal
//  Z  - Não conciliado no dia e vai ser conciliado no outro dia (mesma coisa que o "N"), só para facilitar a identificação
//  D  - Conciliado com lançamento lançado em Definitivo depois de análise

//  Conteúdo do campo: MOVEXTRATOBANCARIO.CONCILIADO

//  N  - Não conciliado
//  S  - Conciliado

//  Conteúdo do campo: MOVEXTRATOBANCARIO.SITCONCILIACAO

//  A  - Aberto
//  F  - Fechado

//  Conteúdo do campo: MOVEXTRATOBANCARIO.TIPOLINHA

//  N  - Normal

//
Unit FConciliacaoBancariaAtual;
                                       
Interface

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   ComCtrls, StdCtrls, wwdblook, wwdbdatetimepicker, CMDateTimePicker, DB, uDataBase, DbClient,
   Buttons, ExtCtrls, MAHlpBtn, TB97Tlbr, TB97, Grids, Wwdbigrd, Wwdbgrid,
   Mask, TREdit, Wwdatsrc, DBTables, Wwquery, uCmSqlParams, uCmControlObject, uCmDbObject,
   uCMClientDataSet, uCtrlMovimFinanc, uCtrlListTercFinanc, math,
   uCtrlCarregaDadosArquivoExtratoBancario, ImgList, wwdbedit, jpeg, FPreview,
   DBCtrls, ppBands, ppCache, ppClass, ppComm, ppRelatv, ppProd, ppReport,
   ppDB, ppDBPipe, ppDBBDE, TXComp, TXRB,
   uCmMath;  // Paulo Nobre - WO28016

Type
   TfrmConciliacaoBancariaAtual = Class(TForm)
      plnMovBanc: TPanel;
      plnMovFinanc: TPanel;
      pnlPassos: TPanel;
      pnlDadosFiltro: TPanel;
      Panel1: TPanel;
      Panel5: TPanel;
      pcExtratoAConciliar: TPageControl;
      tbsExtAConc: TTabSheet;
      tbsExtConc: TTabSheet;
      pcMoviFinancAConciliar: TPageControl;
      tbsMovAConc: TTabSheet;
      tbsMovConc: TTabSheet;
      grdExtratoAconciliar: TwwDBGrid;
      grdMovFinAConciliar: TwwDBGrid;
      grdMovFinConciliado: TwwDBGrid;
      Dock971: TDock97;
      tb97Fundo: TToolbar97;
      Label4: TLabel;
      tbsMovB: TTabSheet;
      grdBloqueios: TwwDBGrid;
      pnlDesfazerConc: TPanel;
      dlgAbreArquivo: TOpenDialog;
      dsExtratoAConciliar: TwwDataSource;
      dsMovFinAConciliar: TwwDataSource;
      spbConciliarAuto: TSpeedButton;
      CdsMovFinAConciliar: TCMClientDataSet;
      SQLMovFinAConciliar: TCMSqlParams;
      CdsMovFinAConciliarDATALANCFINAN: TDateTimeField;
      CdsMovFinAConciliarNUMCHQBORDERO: TStringField;
      CdsMovFinAConciliarVALORLANCFINAN: TFloatField;
      CdsMovFinAConciliarHISTORICO: TStringField;
      CdsMovFinAConciliarENTRADASAIDA: TStringField;
      spbConciliarMan: TSpeedButton;
      spbFecharDia: TSpeedButton;
      Label9: TLabel;
      CdsMovFinConciliado: TCMClientDataSet;
      DateTimeField1: TDateTimeField;
      StringField2: TStringField;
      FloatField1: TFloatField;
      StringField3: TStringField;
      StringField4: TStringField;
      dsMovFinConciliado: TwwDataSource;
      SQLMovFinConciliado: TCMSqlParams;
      CdsMovFinAConciliarCODLANCFINANC: TFloatField;
      CdsMovFinConciliadoCODLANCFINANC: TFloatField;
      qryAux1: TwwQuery;
      qryAux: TwwQuery;
      Image3: TImage;
      Image4: TImage;
      CdsExtratoConciliado: TCMClientDataSet;
      FloatField2: TFloatField;
      DateTimeField2: TDateTimeField;
      StringField7: TStringField;
      FloatField3: TFloatField;
      StringField8: TStringField;
      StringField9: TStringField;
      StringField10: TStringField;
      dsExtratoConciliado: TwwDataSource;
      SQLExtratoConciliado: TCMSqlParams;
      grdExtratoConciliado: TwwDBGrid;
      ImageList1: TImageList;
      SQLExtratoAConciliar: TCMSqlParams;
      CdsExtratoAConciliar: TCMClientDataSet;
      CdsExtratoAConciliarIDMOVEXTRATOBANCARIO: TFloatField;
      CdsExtratoAConciliarDATAEXTRATO: TDateTimeField;
      CdsExtratoAConciliarTIPOLANCTO: TStringField;
      CdsExtratoAConciliarVALORLANCTO: TFloatField;
      CdsExtratoAConciliarNUMDOCUMENTO: TStringField;
      CdsExtratoAConciliarHISTORICO: TStringField;
      CdsExtratoAConciliarCONCILIADO: TStringField;
      CdsExtratoAConciliarSITCONCILIACAO: TStringField;
      spbDesfazerConc: TSpeedButton;
      edSaldoExtratoConciliado: TRealEdit;
      Label8: TLabel;
      qryLkpBanco: TwwQuery;
      dsLkpBanco: TwwDataSource;
      qryLkpBancoNUMBANCO: TStringField;
      Label1: TLabel;
      dsBloqueios: TwwDataSource;
      SQLBloqueios: TCMSqlParams;
      CdsBloqueios: TCMClientDataSet;
      spbLancaMovFinanc: TSpeedButton;
      CdsMovFinAConciliarCONCILIADO: TStringField;
      CdsMovFinConciliadoCONCILIADO: TStringField;
      CdsExtratoAConciliarTIPOINCLUSAOLANCTO: TStringField;
      qryLkpBancoDESCRICAO: TStringField;
      qryLkpBancoCODPORTADOR: TFloatField;
      dblkpBanco: TwwDBLookupCombo;
      CdsExtratoAConciliarCODPORTADOR: TFloatField;
      qryLkpBancoNOCONTACORR: TStringField;
      CdsExtratoConciliadoCODPORTADOR: TFloatField;
      Panel7: TPanel;
      Label13: TLabel;
      edSaldoAntMovFinanc: TRealEdit;
      Label12: TLabel;
      edSaldoDiaMovFinanc: TRealEdit;
      edSaldoDispMovFinanc: TRealEdit;
      Label11: TLabel;
      Panel6: TPanel;
      edSaldoAntExtrato: TRealEdit;
      edSaldoDiaExtrato: TRealEdit;
      Label5: TLabel;
      Label6: TLabel;
      CdsExtratoAConciliarTIPOLINHA: TStringField;
      spbCarregaMov: TSpeedButton;
      Image2: TImage;
      spbLocalizarMov: TSpeedButton;
      cdsLocalizaMov: TCMClientDataSet;
      FloatField5: TFloatField;
      DateTimeField4: TDateTimeField;
      StringField1: TStringField;
      FloatField6: TFloatField;
      StringField5: TStringField;
      StringField6: TStringField;
      StringField11: TStringField;
      FloatField7: TFloatField;
      SQLLocalizaMov: TCMSqlParams;
      cdsLocalizaMovSITCONCILIACAO: TStringField;
      cdsLocalizaMovTIPOINCLUSAOLANCTO: TStringField;
      cdsLocalizaMovTIPOLINHA: TStringField;
      spbExcluirMovimento: TSpeedButton;
      imgM: TImage;
      imgI: TImage;
      spbAbreArquivo: TSpeedButton;
      spbCadExtrato: TSpeedButton;
      imgSet1: TImage;
      edtArquivo: TEdit;
      Label2: TLabel;
      edSaldoBloqMovFinanc: TRealEdit;
      CdsMovFinAConciliarSITBLOQUEIOLANC: TFloatField;
      CdsMovFinAConciliarDATADISPFINANC: TDateTimeField;
      CdsMovFinAConciliarHISTPADFINAN: TFloatField;
      CdsMovFinConciliadoDATADISPFINANC: TDateTimeField;
      CdsMovFinAConciliarDATADESBLOQUEIO: TDateTimeField;
      Panel8: TPanel;
      StaticText3: TStaticText;
      edTotalCheques: TRealEdit;
      edTotalBloqJud: TRealEdit;
      StaticText4: TStaticText;
      grdBloqueiosIButton: TwwIButton;
      Image1: TImage;
      StaticText1: TStaticText;
      edSaldoExtratoConciliado2: TRealEdit;
      Panel9: TPanel;
      StaticText2: TStaticText;
      edSaldoMovFinancConciliado: TRealEdit;
      stMsg: TStaticText;
      spbAbrirDia: TSpeedButton;
      CdsMovFinConciliadoHISTPADFINAN: TFloatField;
      CdsMovFinConciliadoSITBLOQUEIOLANC: TFloatField;
      CdsBloqueiosTIPOBLOQ: TStringField;
      CdsBloqueiosDATALANC: TDateTimeField;
      CdsBloqueiosCODPORTADOR: TFloatField;
      CdsBloqueiosNUMDOCUMENTO: TStringField;
      CdsBloqueiosENTRADASAIDA: TStringField;
      CdsBloqueiosVALORLANCFINAN: TFloatField;
      CdsBloqueiosHISTORICO: TStringField;
      CdsBloqueiosDATADISPONIB: TDateTimeField;
      CdsBloqueiosHISTPADFINAN: TFloatField;
      CdsBloqueiosIDPLANPREVCTBPATR: TFloatField;
      CdsBloqueiosCODCENTRORESPON: TStringField;
      CdsBloqueiosSITBLOQDESBLOQ: TFloatField;
      CdsExtratoAConciliarSITBLOQUEIOLANC: TFloatField;
      CdsExtratoConciliadoSITBLOQUEIOLANC: TFloatField;
      CdsBloqueiosDATADESBLOQUEIO: TDateTimeField;
      CdsBloqueiosCODLANCFINANC: TFloatField;
      dtDiaExtrato: TCMDateTimePicker;
      Label3: TLabel;
      edSaldoTotalExtrato: TRealEdit;
      Label10: TLabel;
      edSaldoBloqExtrato: TRealEdit;
      Label7: TLabel;
      edSaldoDispExtrato: TRealEdit;
      spbImprimir: TSpeedButton;
      Label14: TLabel;
      edSaldoTotalMovim: TRealEdit;
      Panel2: TPanel;
      StaticText5: TStaticText;
      edSaldoMovFinancNaoConciliado: TRealEdit;
      Panel3: TPanel;
      StaticText6: TStaticText;
      edSaldoExtratoNaoConciliado: TRealEdit;
      bbtnSair: TBitBtn;
      CdsExtratoAConciliarDTABERTURACONC: TDateTimeField;
      strngfldCdsExtratoAConciliarUSERABERTURACONC: TStringField;
      chkDesfazerTudo: TCheckBox;
      CdsExtratoAConciliarIDLANCCONCILIADO: TFloatField;
      CdsExtratoConciliadoIDLANCCONCILIADO: TFloatField;
      CdsMovFinAConciliarIDLANCCONCILIADO: TFloatField;
      CdsMovFinConciliadoIDLANCCONCILIADO: TFloatField;
      CdsBloqueiosIDLANCCONCILIADO: TFloatField;
      edTotalOutros: TRealEdit;
      StaticText7: TStaticText;
    SpeedButton1: TSpeedButton;
    Image5: TImage;
    btn1: TSpeedButton;
    img1: TImage;
    spbMovBancario: TSpeedButton;
    Image6: TImage;
      Procedure grdExtratoAconciliarCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure bbtnSairClick(Sender: TObject);
      Procedure grdExtratoAconciliarDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure FormCreate(Sender: TObject);
      Procedure grdExtratoAconciliarTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure grdMovFinAConciliarTitleButtonClick(Sender: TObject;
         AFieldName: String);
      Procedure spbConciliarAutoClick(Sender: TObject);
      Procedure spbConciliarManClick(Sender: TObject);
      Procedure spbCarregaMovClick(Sender: TObject);
      Procedure grdMovFinAConciliarDrawDataCell(Sender: TObject;
         Const Rect: TRect; Field: TField; State: TGridDrawState);
      Procedure grdExtratoConciliadoDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure grdMovFinConciliadoDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure grdMovFinAConciliarCalcCellColors(Sender: TObject;
         Field: TField; State: TGridDrawState; Highlight: Boolean;
         AFont: TFont; ABrush: TBrush);
      Procedure spbFecharDiaClick(Sender: TObject);
      Procedure grdExtratoAconciliarMouseMove(Sender: TObject;
         Shift: TShiftState; X, Y: Integer);
      Procedure grdExtratoAconciliarCalcTitleImage(Sender: TObject;
         Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
      Procedure grdMovFinAConciliarCalcTitleImage(Sender: TObject;
         Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
      Procedure spbDesfazerConcClick(Sender: TObject);
      Procedure grdBloqueiosDrawDataCell(Sender: TObject; Const Rect: TRect;
         Field: TField; State: TGridDrawState);
      Procedure grdMovFinAConciliarMouseMove(Sender: TObject;
         Shift: TShiftState; X, Y: Integer);
      Procedure spbLancaMovFinancClick(Sender: TObject);
      Procedure spbCadExtratoClick(Sender: TObject);
      Procedure spbAbreArquivoClick(Sender: TObject);
      Procedure spbLocalizarMovClick(Sender: TObject);
      Procedure dtDiaExtratoChange(Sender: TObject);
      Procedure dblkpBancoChange(Sender: TObject);
      Procedure spbExcluirMovimentoClick(Sender: TObject);
      Procedure FormShow(Sender: TObject);
      Procedure spbAbrirDiaClick(Sender: TObject);
      Procedure grdBloqueiosIButtonClick(Sender: TObject);
      Procedure grdExtratoConciliadoCalcCellColors(Sender: TObject;
         Field: TField; State: TGridDrawState; Highlight: Boolean;
         AFont: TFont; ABrush: TBrush);
      Procedure grdMovFinConciliadoCalcCellColors(Sender: TObject;
         Field: TField; State: TGridDrawState; Highlight: Boolean;
         AFont: TFont; ABrush: TBrush);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure spbImprimirClick(Sender: TObject);
      Procedure dblkpBancoEnter(Sender: TObject);
    procedure spbMovBancarioClick(Sender: TObject);
   Private
      { Private declarations }
      CtrlMovimFinanc: TCtrlMovimFinanc;
      CtrlCarregaDadosArquivoExtratoBancario: TCtrlCarregaDadosArquivoExtratoBancario;

      Procedure PreencheExtrato;
      Procedure ExecutaConciliacaoAutomatica;
      Procedure ExecutaConciliacaoManual_n_n; // 'n' para 'n'
      Procedure CarregarGrids;
      Procedure InicializarPosicoes;
      Procedure VerificarSeTemChequeParaDesbloquear;

      Function TotalChequeBloqueados(pSit: Integer): Double;
      Function TotalOutrosBloqueados(pSit: Integer): Double;
      Function TotalBloqueiosJudiciais: Double;
      Function SaldoAnteriorMovimFinanc: Double;
      Function SaldoMovimFinanc(pSituacao, pSitBloq: String): Double;
      Function SaldoAtualizadoExtrato(pSituacao: String): Double;
      Function SaldoAnteriorExtratoBancario: Double;
      Function SaldoExtratoBancarioBloqueado: Double;
      Function DataProximoDiaUtil(DataBase: TDateTime): TDateTime;
      Function ConciliacaoAberta: Boolean;
   Public
      { Public declarations }
   End;

Var
   frmConciliacaoBancariaAtual: TfrmConciliacaoBancariaAtual;
   sUltimoIndiceExtrato, sUltimoIndiceMovFinanc, sTextoMsg1, sTextoMsg2: String;
   txtArqExtrato: TextFile;

Implementation
{$R *.DFM}

Uses dBaseDados, uSistema, uMensErro, fAguarde, fTelaAut, FMovimFinancMT,
   fCadExtratoBancario, fCadBloqueiosJudiciaisFinanc, FEspelhoDaConciliacaoBancariaAtual,
   fConcMovimentoBancario,
   uFuncaoGeral;  // Paulo Nobre - WO28016

Procedure TfrmConciliacaoBancariaAtual.FormCreate(Sender: TObject);
Begin
   //Inicializa CtrlCarregaDadosArquivoExtratoBancario
   CtrlCarregaDadosArquivoExtratoBancario := TCtrlCarregaDadosArquivoExtratoBancario.Create(self);

   //Inicializa CtrlMovimFinanc
   CtrlMovimFinanc := TCtrlMovimFinanc.Create(Sistema.IdEmpresa,
      Sistema.IdModulo,
      Sistema.IdUsuario,
      Sistema.UsaPlanoPatro);

   CtrlMovimFinanc.Initialize(dtmBaseDados.dbBaseDados, True);

   pcExtratoAConciliar.ActivePageIndex := 0;
   pcMoviFinancAConciliar.ActivePageIndex := 0;
   pnlDesfazerConc.Enabled := False;

   InicializarPosicoes;

   // Inicia as grids pela ordem abaixo
   sUltimoIndiceExtrato := 'AscTIPOLANCTO';
   sUltimoIndiceMovFinanc := 'AscENTRADASAIDA';
   dtDiaExtrato.DateTime := date;
   qryLkpBanco.Close;
   qryLkpBanco.Open;
End;

Procedure TfrmConciliacaoBancariaAtual.spbLocalizarMovClick(Sender: TObject);
Begin
   If dblkpBanco.Text = '' Then
      Begin
         MsgDlg('Selecione o Banco/Conta a ser Conciliada !', 'Aviso', mtWarning, [mbOk], 0);
         dblkpBanco.Setfocus;
         Exit;
      End;

   cdsLocalizaMov.Data := CtrlMovimFinanc.ListaMovimExtratoDiaConciliacao(Datetostr(dtDiaExtrato.Date), qryLkpBanco.Fieldbyname('CODPORTADOR').asString, '', '');
   If cdsLocalizaMov.isEmpty Then // Não tem Movimento para o Dia e Banco/Conta selecionado
      Begin
         //MsgDlg('Importe um arquivo Bancário (.OFX) ou Inclua Manualmente o Extrato Bancário !', 'Aviso', mtWarning, [mbOk], 0); // Leandro wo7698
         MsgDlg('Importe um arquivo Bancário ou Inclua Manualmente o Extrato Bancário !', 'Aviso', mtWarning, [mbOk], 0);   // Leandro wo7698
         InicializarPosicoes;
         spbAbreArquivo.Enabled := True;
         spbCadExtrato.Enabled := True;
         spbCarregaMov.Enabled := True;
      End
   Else
      Begin
         spbAbreArquivo.Enabled := False;
         spbCadExtrato.Enabled := True;
         If cdsLocalizaMov.Fieldbyname('TIPOINCLUSAOLANCTO').asString = 'M' Then // Se Movimento Lançado manualmente
            Begin
               spbCadExtrato.Enabled := True;
               imgI.Visible := False;
               imgM.Visible := True;
            End
         Else
            Begin
               imgI.Visible := True;
               imgM.Visible := False;
            End;

         spbCarregaMov.Enabled := True;
         spbAbrirDia.Enabled := (cdsLocalizaMov.Fieldbyname('SITCONCILIACAO').asString = 'F');
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.spbAbreArquivoClick(Sender: TObject);
Begin
   If dblkpBanco.Text = '' Then
      Begin
         MsgDlg('Selecione o Banco/Conta a ser Conciliada !', 'Aviso', mtWarning, [mbOk], 0);
         dblkpBanco.Setfocus;
         Exit;
      End;

   try  //William Moreira da Silva - SOL 255703 PPM 826929
    dlgAbreArquivo.Execute;
    If dlgAbreArquivo.FileName <> '' Then
      Begin
         edtArquivo.Text := dlgAbreArquivo.FileName;
         // Executa rotinas que carregam os dados do arquivo para dentro de uma Classe
         CtrlCarregaDadosArquivoExtratoBancario.ArquivoOFX := edtArquivo.Text;
         If Not CtrlCarregaDadosArquivoExtratoBancario.Processar Then
            //MsgDlg('Arquivo não apresenta conteúdo válido para um padrão de Arquivo Bancário (.OFX). Verifique !', 'Aviso', mtWarning, [mbOk], 0) // Leandro WO7698
            MsgDlg('Arquivo não apresenta conteúdo válido para um padrão de Arquivo Bancário. Verifique !', 'Aviso', mtWarning, [mbOk], 0)   // Leandro WO7698
         Else
            Begin
               // Pegando a data de primeiro lançamento contido no movimento do extrato para usar como base de comparação
               If CtrlCarregaDadosArquivoExtratoBancario.ObtemItem(0).DataLancamento = dtDiaExtrato.Date Then
                  Begin
                     PreencheExtrato;
                     spbLocalizarMovClick(self);
                  End
               Else
                  Begin
                     MsgDlg('Data Contida no Arquivo Bancário : ' + datetostr(CtrlCarregaDadosArquivoExtratoBancario.ObtemItem(0).DataLancamento) + ', não confere ' + #13 +
                        'com a Data da Conciliação informada : ' + datetostr(dtDiaExtrato.date) + '. Verifique !', 'Aviso', mtWarning, [mbOk], 0);
                     dtDiaExtrato.Setfocus;
                  End;
            End;
      End;
   //William Moreira da Silva - SOL 255703 PPM 826929
   Except
         //MsgDlg('Arquivo não apresenta conteúdo válido para um padrão de Arquivo Bancário (.OFX). Verifique !', 'Aviso', mtWarning, [mbOk], 0);    // Leandro WO7698
         MsgDlg('Arquivo não apresenta conteúdo válido para um padrão de Arquivo Bancário. Verifique !', 'Aviso', mtWarning, [mbOk], 0);
         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Rollback;
   END;
   //William Moreira da Silva - SOL 255703 PPM 826929
End;

Procedure TfrmConciliacaoBancariaAtual.PreencheExtrato;
Var i: Integer;
Begin
   If (length(trim(edtArquivo.Text)) = 0) Then
      Exit;
   Try
      Try
         CdsExtratoAConciliar.DisableControls;
         If Not dtmBaseDados.dbBaseDados.Intransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         frmAguarde.pbAguarde.Visible := false;
         frmAguarde.Mostra('Importando o Arquivo Bancário...');

         // Inserindo os Lançamentos
         For i := 0 To CtrlCarregaDadosArquivoExtratoBancario.QtdItems - 1 Do
            Begin
               // Só grava se o lançamento bancário for o do dia escolhido
               If CtrlCarregaDadosArquivoExtratoBancario.ObtemItem(i).DataLancamento = dtDiaExtrato.Date Then
                  Begin
                     qryAux1.Close;
                     qryAux1.SQL.Clear;
                     qryAux1.SQL.add('INSERT INTO MOVEXTRATOBANCARIO                               ');
                     qryAux1.SQL.add('(IDMOVEXTRATOBANCARIO, CODPORTADOR, DATAEXTRATO, TIPOLANCTO, VALORLANCTO, NUMDOCUMENTO, ');
                     qryAux1.SQL.add(' HISTORICO, CONCILIADO, SITCONCILIACAO, TIPOINCLUSAOLANCTO, TIPOLINHA, SITBLOQUEIOLANC ) ');
                     qryAux1.SQL.add(' VALUES (SEQMOVEXTRATOBANCARIO.NEXTVAL, :p2, :p3, :p4, :p5, :p6, :p7, :p8, :p9, :p10, :p11, :p12)  ');
                     qryAux1.ParamByName('p2').AsInteger := qryLkpBanco.Fieldbyname('CODPORTADOR').asInteger;
                     qryAux1.ParamByName('p3').AsDateTime := CtrlCarregaDadosArquivoExtratoBancario.ObtemItem(i).DataLancamento;
                     qryAux1.ParamByName('p4').AsString := CtrlCarregaDadosArquivoExtratoBancario.ObtemItem(i).TipoLanc;
                     qryAux1.ParamByName('p5').AsFloat := CtrlCarregaDadosArquivoExtratoBancario.ObtemItem(i).Valor;
                     qryAux1.ParamByName('p6').AsString := CtrlCarregaDadosArquivoExtratoBancario.ObtemItem(i).NumDocto;
                     qryAux1.ParamByName('p7').AsString := CtrlCarregaDadosArquivoExtratoBancario.ObtemItem(i).Historico;
                     qryAux1.ParamByName('p8').AsString := 'N'; // Não Conciliado
                     qryAux1.ParamByName('p9').AsString := 'A'; // Aberto
                     qryAux1.ParamByName('p10').AsString := 'I'; // Importado
                     qryAux1.ParamByName('p11').AsString := 'N'; // Lançamento Normal
                     // SOL 201700 Kintana 1955228 - Paulo Nobre
                     qryAux1.ParamByName('p12').AsInteger := 0; // Desbloqueado
                     If Not qryAux1.Prepared Then
                        qryAux1.Prepare;
                     qryAux1.ExecSQL;
                  End;
            End;

         If dtmBaseDados.dbBaseDados.Intransaction Then
            dtmBaseDados.dbBaseDados.Commit;

         frmAguarde.pbAguarde.Visible := True;
         frmAguarde.Apaga;
      Except
         Raise;
         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Rollback;
      End;
   Finally
      CdsExtratoAConciliar.EnableControls;
      qryAux.Close;
   End;
End;

Procedure TfrmConciliacaoBancariaAtual.spbCadExtratoClick(Sender: TObject);
Begin
   If dblkpBanco.Text = '' Then
      Begin
         MsgDlg('Selecione o Banco/Conta a ser Conciliada !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   edtArquivo.Clear;
   frmCadExtratoBancario := TfrmCadExtratoBancario.Create(self);
   frmCadExtratoBancario.sDataExtrato := datetostr(dtDiaExtrato.Date);
   frmCadExtratoBancario.sBancoConta := qryLkpBanco.Fieldbyname('DESCRICAO').asString;
   frmCadExtratoBancario.iCodPortador := qryLkpBanco.Fieldbyname('CODPORTADOR').asInteger;
   If cdsLocalizaMov.Fieldbyname('TIPOINCLUSAOLANCTO').asString = '' Then // Não há movimento lançado
      frmCadExtratoBancario.sTipoInclusaoLancto := 'M' // então força sempre Manual
   Else
      frmCadExtratoBancario.sTipoInclusaoLancto := cdsLocalizaMov.Fieldbyname('TIPOINCLUSAOLANCTO').asString;
   frmCadExtratoBancario.Showmodal;
   frmCadExtratoBancario.Free;
   spbLocalizarMovClick(self);
End;

Procedure TfrmConciliacaoBancariaAtual.ExecutaConciliacaoAutomatica;
Var sTipoLancMovFinanc, sIdLancConciliado: String;
   Marca : TBookmark; //Everson Cunha - SIG40974
   eValorFinanc : Extended;
   dDataFinanc : TDateTime;
Begin
   If Not (CdsExtratoAConciliar.Active) Or (CdsExtratoAConciliar.IsEmpty) Or
      Not (CdsMovFinAConciliar.Active) Or (CdsMovFinAConciliar.IsEmpty) Then
      Exit;

   sTextoMsg2 := '';
   stMsg.Caption := '';
   Cursor := crSQLWait;
   CdsMovFinAConciliar.DisableControls;
   CdsExtratoAConciliar.DisableControls;
   Try
      Try
         If Not dtmBaseDados.dbBaseDados.Intransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         // Varre o Extrato do banco
         CdsExtratoAConciliar.First;
         While Not (CdsExtratoAConciliar.EOF) Do
            Begin
              //Everson Cunha - SIG40974 - Início

               // Varre o MovimFinanc
               //CdsMovFinAConciliar.First;
               //While Not (CdsMovFinAConciliar.EOF) Do
               //   Begin
                     // Compara o Documento do Extrato com o Documento do MovimFinanc
                     //If (StrToFloat(trim(CdsExtratoAConciliar.FieldByName('NUMDOCUMENTO').AsString)) =
                     //   StrToFloat(trim(CdsMovFinAConciliar.FieldByName('NUMCHQBORDERO').AsString))) Then
                     //   Begin
                     //      If CdsMovFinAConciliar.FieldByName('ENTRADASAIDA').AsString = 'E' Then
                     //         sTipoLancMovFinanc := 'C' // Crédito
                     //      Else
                     //         sTipoLancMovFinanc := 'D'; // Débito

                           // Compara os Tipos (levando em conta 'E/S') e o Valores do Extrato com o do Movimento Financeiro
                    //       If (CdsExtratoAConciliar.FieldByName('TIPOLANCTO').AsString = sTipoLancMovFinanc) And
                   //           (CdsExtratoAConciliar.FieldByName('VALORLANCTO').AsFloat = CdsMovFinAConciliar.F                                                               ieldByName('VALORLANCFINAN').AsFloat) Then

              //Extrato Banco
              //Verifica se existe apenas um registro do mesmo Tipo e Valor
              //Só concilia automático este registro se ele for único (Tipo e Valor)

               // Paulo Nobre - WO28016 - Inicio

//              Marca := CdsExtratoAConciliar.GetBookmark;
//              CdsExtratoAConciliar.Filter := ' VALORLANCTO = ' + CdsExtratoAConciliarVALORLANCTO.AsString +
//                                             ' AND TIPOLANCTO = ' + QuotedStr(CdsExtratoAConciliarTIPOLANCTO.AsString);
//              CdsExtratoAConciliar.Filtered := True;

     //         CdsMovFinAConciliar.Filter := ' VALORLANCFINAN = ' + CdsExtratoAConciliarVALORLANCTO.AsString +
     //                                       ' AND ENTRADASAIDA = ' + QuotedStr(sTipoLancMovFinanc) +
     //                                       ' AND DATALANCFINAN = ' + QuotedStr(CdsExtratoAConciliarDATAEXTRATO.AsString);
     //         CdsMovFinAConciliar.Filtered := True;

//              if (CdsExtratoAConciliar.RecordCount = 1) and (CdsMovFinAConciliar.RecordCount = 1) then
              //Everson Cunha - SIG40974 - Fim

              // Localizando no CFINAN
              //

              If CdsExtratoAConciliar.FieldByName('TIPOLANCTO').AsString = 'C' Then
                sTipoLancMovFinanc := 'E' // Crédito
              Else
                sTipoLancMovFinanc := 'S'; // Débito

              // Verifica se existe apenas um lançamento no CFINAN com com estas chaves do Extrato Bancário
              qryAux.Close;
              qryAux.SQL.Clear;
              qryAux.SQL.ADD('SELECT CODLANCFINANC ');
              qryAux.SQL.ADD('FROM CM.MOVIMFINANC   ');
              qryAux.SQL.ADD('WHERE DATALANCFINAN = ' + quotedstr(CdsExtratoAConciliarDATAEXTRATO.AsString) );
              qryAux.SQL.ADD('      AND ENTRADASAIDA = ' + quotedstr(sTipoLancMovFinanc)   );
              qryAux.SQL.ADD('      AND VALORLANCFINAN = ' + FloatToStrCM(Abs(CdsExtratoAConciliarVALORLANCTO.AsFloat)) );
              qryAux.SQL.ADD('      AND CODPORTADOR    = ' + CdsExtratoAConciliarCODPORTADOR.AsString );
              qryAux.SQL.ADD('      AND CONCILIADO IN (''N'', ''Z'') ');
              qryAux.Open;
              If (not qryAux.isEmpty) Then
              Begin

                 // Localizando o lançamento específico, no CFINAN, para conciliar
                 CdsMovFinAConciliar.Locate('CODLANCFINANC',qryAux.FieldByName('CODLANCFINANC').AsInteger, []);

              // Paulo Nobre - WO28016 - Fim

                 qryAux.SQL.Clear;
                 qryAux.SQL.add('SELECT SEQLANCCONCILIADO.NEXTVAL SEQ FROM DUAL');
                 qryAux.Open;
                 sIdLancConciliado := qryAux.FieldByName('SEQ').AsString;

                 qryAux.Close;
                 qryAux.SQL.Clear;
                 qryAux.SQL.ADD('UPDATE MOVIMFINANC SET CONCILIADO = ''S'' '); // Conciliado
                 qryAux.SQL.ADD(', IDLANCCONCILIADO = ' + QuotedStr(sIdLancConciliado));
                 qryAux.SQL.ADD(', DATACONCILIACAOBANCARIA = ' + quotedstr(datetostr(date)));

                 // Se for Depósito em cheque ou Outros, então Bloqueia se a data de Disponibilidade dele é > que a data do lançamento
                 // SOL 201700 Kintana 1955228 - Paulo Nobre
                 If (CdsMovFinAConciliar.FieldByName('HISTPADFINAN').AsInteger In [14, 19, 20]) And // Deposito em Cheque e SICOB d+1 e SIVAT
                 (CdsMovFinAConciliar.FieldByName('DATADISPFINANC').AsDateTime > CdsMovFinAConciliar.FieldByName('DATALANCFINAN').AsDateTime) Then
                    Begin
                       qryAux.SQL.ADD(', SITBLOQUEIOLANC = 1 '); // Bloqueado
                       qryAux.SQL.ADD(', DATADESBLOQUEIO = NULL ');
                       sTextoMsg1 := 'Cheque(s) e/ou Outro(s) bloqueado(s) nesta data: ';
                       sTextoMsg2 := sTextoMsg2 + CdsExtratoAConciliar.FieldByName('NUMDOCUMENTO').AsString + ' - ' + floattostrf(CdsExtratoAConciliar.FieldByName('VALORLANCTO').AsFloat, ffcurrency, 12, 2) + '  |  ';
                    End;

                 qryAux.SQL.ADD('WHERE CODLANCFINANC = ' + CdsMovFinAConciliar.FieldByName('CODLANCFINANC').AsString);
                 If Not qryAux.Prepared Then
                    qryAux.Prepare;
                 qryAux.ExecSQL;

                 qryAux1.Close;
                 qryAux1.SQL.clear;
                 qryAux1.SQL.ADD('UPDATE MOVEXTRATOBANCARIO SET CONCILIADO = ''S'' '); // Conciliado
                 qryAux1.SQL.ADD(', IDLANCCONCILIADO = ' + QuotedStr(sIdLancConciliado));

                 // Se for Depósito em cheque ou Outros, Bloqueia também no Extrato
                 // SOL 201700 Kintana 1955228 - Paulo Nobre
                 If (CdsMovFinAConciliar.FieldByName('HISTPADFINAN').AsInteger In [14, 19, 20]) And // Deposito em Cheque e SICOB D+1 e SIVAT
                 (CdsMovFinAConciliar.FieldByName('DATADISPFINANC').AsDateTime > CdsMovFinAConciliar.FieldByName('DATALANCFINAN').AsDateTime) Then
                    qryAux1.SQL.ADD(', SITBLOQUEIOLANC = 1 '); // Bloqueado

                 qryAux1.SQL.ADD('WHERE IDMOVEXTRATOBANCARIO = ' + CdsExtratoAConciliar.FieldByName('IDMOVEXTRATOBANCARIO').AsString);
                 If Not qryAux1.Prepared Then
                    qryAux1.Prepare;
                 qryAux1.ExecSQL;
              End;
                        //End;                      //Everson Cunha - SIG40974

                  //   CdsMovFinAConciliar.Next;    //Everson Cunha - SIG40974
                  //End;                            //Everson Cunha - SIG40974

              // Paulo Nobre - WO28016 - Inicio

              //Everson Cunha - SIG40974 - Início
        //      CdsExtratoAConciliar.Filtered := False;
        //      CdsMovFinAConciliar.Filtered := False;

      //        CdsExtratoAConciliar.GotoBookmark(Marca);
              //Everson Cunha - SIG40974 - Fim

              // Paulo Nobre - WO28016 - Fim

               CdsExtratoAConciliar.Next;
            End;

      //      CdsExtratoAConciliar.FreeBookmark(Marca); //Everson Cunha - SIG40974

//         CdsExtratoAConciliar.Filtered := False;                    // Paulo Nobre - WO28016
//         CdsMovFinAConciliar.Filtered := False;                     // Paulo Nobre - WO28016 

         If dtmBaseDados.dbBaseDados.Intransaction Then
            dtmBaseDados.dbBaseDados.Commit;
      Except
         On E: Exception Do
            Begin
               If dtmBaseDados.dbBaseDados.InTransaction Then
               begin
                 dtmBaseDados.dbBaseDados.Rollback;
                 CdsExtratoAConciliar.Filtered := False;
                 CdsMovFinAConciliar.Filtered := False;
              end;
            End;
      End;
   Finally
      CdsMovFinAConciliar.EnableControls;
      CdsExtratoAConciliar.EnableControls;
      CdsExtratoAConciliar.First;
      CdsMovFinAConciliar.First;
      Cursor := crDefault;
      stMsg.caption := sTextoMsg1 + sTextoMsg2;
   End;
End;

Procedure TfrmConciliacaoBancariaAtual.CarregarGrids;
Begin
   Cursor := crSQLWait;
   CdsExtratoAConciliar.Data := CtrlMovimFinanc.ListaMovimExtratoDiaConciliacao(Datetostr(dtDiaExtrato.Date), qryLkpBanco.Fieldbyname('CODPORTADOR').asString, 'N', 'A'); // A Conciliar / Aberto
   CdsExtratoConciliado.Data := CtrlMovimFinanc.ListaMovimExtratoDiaConciliacao(Datetostr(dtDiaExtrato.Date), qryLkpBanco.Fieldbyname('CODPORTADOR').asString, 'S', ''); // Conciliado

   CdsMovFinAConciliar.Data := CtrlMovimFinanc.ListaMovimFinanceiroConciliacao(Datetostr(dtDiaExtrato.Date), qryLkpBanco.Fieldbyname('CODPORTADOR').asString, 'N'); // A Conciliar
   CdsMovFinConciliado.Data := CtrlMovimFinanc.ListaMovimFinanceiroConciliacao(Datetostr(dtDiaExtrato.Date), qryLkpBanco.Fieldbyname('CODPORTADOR').asString, 'S'); // Conciliado

   CdsBloqueios.Data := CtrlMovimFinanc.ListaMovimBloqueios(Datetostr(dtDiaExtrato.Date), qryLkpBanco.Fieldbyname('CODPORTADOR').asString);

   // SOL 31714/12862   KTN 1875635 - Paulo Nobre
   // Sol..........: 31714/12942 - Paulo Nobre
   edTotalCheques.Value := abs(TotalChequeBloqueados(0)); // Todos os cheques anteriores e do dia bloqueados
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   edTotalOutros.Value := abs(TotalOutrosBloqueados(0)); // Todos os OUTROS anteriores e do dia bloqueados
   edTotalBloqJud.Value := abs(TotalBloqueiosJudiciais); // Bloqueios Judiciais

   // Saldos do Extrato Bancário
   edSaldoAntExtrato.Value := SaldoAnteriorExtratoBancario;
   edSaldoDiaExtrato.Value := SaldoAtualizadoExtrato('');
   edSaldoTotalExtrato.Value := edSaldoAntExtrato.Value + edSaldoDiaExtrato.Value;
   // SOL 31714/12862   KTN 1875635 - Paulo Nobre
   // Sol..........: 31714/12942 - Paulo Nobre
   edSaldoBloqExtrato.Value := abs(SaldoExtratoBancarioBloqueado) + edTotalBloqJud.Value; // Saldo Bloqueado (Importado) + Total dos Bloq. Judiciais
   //
   edSaldoExtratoNaoConciliado.Value := SaldoAtualizadoExtrato('N');
   edSaldoExtratoConciliado.Value := SaldoAtualizadoExtrato('S');
   edSaldoExtratoConciliado2.Value := edSaldoExtratoConciliado.Value;

   //SIG125198 - Everson Cunha - Ini
   //edSaldoDispExtrato.Value := (edSaldoAntExtrato.Value + edSaldoDiaExtrato.Value) - abs(edSaldoBloqExtrato.Value);

   if dtDiaExtrato.Date < 44743 then // 01/07/2022
     edSaldoDispExtrato.Value := (edSaldoAntExtrato.Value + edSaldoDiaExtrato.Value) - abs(edSaldoBloqExtrato.Value)
   else
    edSaldoDispExtrato.Value := (edSaldoAntExtrato.Value + edSaldoDiaExtrato.Value);
   //SIG125198 - Everson Cunha - Fim

   //
   // Saldos do Movimento Financeiro
   edSaldoAntMovFinanc.Value := SaldoAnteriorMovimFinanc; // A Conciliar
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   edSaldoDiaMovFinanc.Value := SaldoMovimFinanc('', '0') + abs(TotalChequeBloqueados(1)) + abs(TotalOutrosBloqueados(1)); // Todos os cheques do dia e Outros Bloqueados
   edSaldoTotalMovim.Value := edSaldoAntMovFinanc.Value + edSaldoDiaMovFinanc.Value;
   edSaldoBloqMovFinanc.Value := edTotalCheques.Value + edTotalBloqJud.Value;

   //SIG125198 - Everson Cunha - Ini
   //edSaldoDispMovFinanc.Value := (edSaldoAntMovFinanc.Value + edSaldoDiaMovFinanc.Value) - abs(edSaldoBloqMovFinanc.Value);

   if dtDiaExtrato.Date < 44743 then // 01/07/2022
     edSaldoDispMovFinanc.Value := (edSaldoAntMovFinanc.Value + edSaldoDiaMovFinanc.Value) - abs(edSaldoBloqMovFinanc.Value)
   else
     edSaldoDispMovFinanc.Value := (edSaldoAntMovFinanc.Value + edSaldoDiaMovFinanc.Value);
   //SIG125198 - Everson Cunha - Fim

   edSaldoMovFinancNaoConciliado.Value := SaldoMovimFinanc('N', ''); // Não Conciliado
   edSaldoMovFinancConciliado.Value := SaldoMovimFinanc('S', ''); // Conciliado

   spbFecharDia.enabled := (ConciliacaoAberta);

   Cursor := crDefault;

   pnlDesfazerConc.Enabled := (Not CdsExtratoConciliado.isEmpty);

      Application.ProcessMessages;

      grdExtratoAconciliar.RefreshDisplay;

End;

Function TfrmConciliacaoBancariaAtual.SaldoAnteriorExtratoBancario: Double;
Begin
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT SUM(VALORLANCTO) AS VALORLANCTO');
   qryAux.SQL.add('FROM MOVEXTRATOBANCARIO                ');
   qryAux.SQL.add('WHERE DATAEXTRATO < ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryAux.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryAux.Open;
   Result := qryAux.fieldbyname('VALORLANCTO').asFloat;
   qryAux.Close;
   Cursor := crDefault;
End;

Function TfrmConciliacaoBancariaAtual.SaldoAtualizadoExtrato(pSituacao: String): Double;
Begin
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT NVL(SUM(VALORLANCTO),0) AS SALDOEXTRATO ');
   qryAux.SQL.add('FROM MOVEXTRATOBANCARIO                ');
   qryAux.SQL.add('WHERE DATAEXTRATO = ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryAux.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   If pSituacao <> '' Then
      qryAux.SQL.add('   AND CONCILIADO = ' + quotedstr(pSituacao)); // Conciliado ou Não
   qryAux.Open;
   Result := qryAux.fieldbyname('SALDOEXTRATO').asFloat;
   qryAux.Close;
   Cursor := crDefault;
End;

Function TfrmConciliacaoBancariaAtual.SaldoExtratoBancarioBloqueado: Double;
Begin
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT NVL(SUM(VALORLANCTO),0) AS TOTALBLOQ ');
   qryAux.SQL.add('FROM MOVEXTRATOBANCARIO                     ');
   qryAux.SQL.add('WHERE DATAEXTRATO <= ' + quotedstr(Datetostr(dtDiaExtrato.Date))); //Edilaine - SOL 198796/13843 - KTN 1914601 - condição <= em vez de =
   qryAux.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   //qryAux.SQL.add('      AND SITCONCILIACAO = ''A'' '); // Aberto                   //Edilaine - SOL 198796/13843 - KTN 1914601 - comentado
   qryAux.SQL.add('      AND SITBLOQUEIOLANC = 1    '); // Bloqueado
   qryAux.Open;
   Result := qryAux.fieldbyname('TOTALBLOQ').asFloat;
   qryAux.Close;
   Cursor := crDefault;
End;

Function TfrmConciliacaoBancariaAtual.SaldoAnteriorMovimFinanc: Double;
Begin
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)) AS SALDOANTERIOR '); // E/S
   qryAux.SQL.add('FROM MOVIMFINANC  ');
   qryAux.SQL.add('WHERE DATALANCFINAN < ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryAux.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryAux.Open;
   Result := qryAux.fieldbyname('SALDOANTERIOR').asFloat;
   qryAux.Close;
   Cursor := crDefault;
End;

Function TfrmConciliacaoBancariaAtual.SaldoMovimFinanc(pSituacao, pSitBloq: String): Double;
Begin
   // SOL 31714/13082  KTN 1883867 - Paulo Nobre
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)) AS SALDO '); // E/S
   qryAux.SQL.add('FROM MOVIMFINANC                                      ');
   qryAux.SQL.add('WHERE CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   If pSituacao = 'N' Then
      Begin
         qryAux.SQL.add('   AND DATALANCFINAN <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
         qryAux.SQL.add('   AND CONCILIADO IN (''N'', ''Z'') '); // Não Conciliado e Não Compensado
      End;
   If pSituacao = 'S' Then
      Begin
         qryAux.SQL.add('   AND DATALANCFINAN = ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
         qryAux.SQL.add('   AND CONCILIADO IN (''S'', ''D'') '); // Conciliado e Conciliado Definitivo
      End;
   If pSitBloq <> '' Then
      Begin
         qryAux.SQL.add('   AND DATALANCFINAN = ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
         qryAux.SQL.add('   AND SITBLOQUEIOLANC = 0  '); // Não bloqueado
      End;
   qryAux.Open;
   Result := qryAux.fieldbyname('SALDO').asFloat;
   qryAux.Close;
   Cursor := crDefault;
End;

Procedure TfrmConciliacaoBancariaAtual.grdExtratoAconciliarCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
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

Procedure TfrmConciliacaoBancariaAtual.bbtnSairClick(Sender: TObject);
Begin
   qryLkpBanco.Close;
   qryAux.Close;
   qryAux1.Close;
   Close;
End;

Procedure TfrmConciliacaoBancariaAtual.grdExtratoAconciliarDrawDataCell(
   Sender: TObject; Const Rect: TRect; Field: TField;
   State: TGridDrawState);
Begin
   If Not CdsExtratoAConciliar.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               If CdsExtratoAConciliar.FieldByName('TIPOLANCTO').asString = 'D' Then // Débito
                  grdExtratoAconciliar.Canvas.Font.Color := clRed;

               grdExtratoAconciliar.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.grdExtratoAconciliarTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
   Try
      If Not (CdsExtratoAConciliar.Active) Or (CdsExtratoAConciliar.IsEmpty) Or (AFieldName = 'IDMOVEXTRATOBANCARIO') Then
         Exit;

      If (AFieldName = sUltimoIndiceExtrato) And (Trim(CdsExtratoAConciliar.IndexName) = Trim('Asc' + AFieldName)) Then
         CdsExtratoAConciliar.IndexName := 'Desc' + AFieldName
      Else
         CdsExtratoAConciliar.IndexName := 'Asc' + AFieldName;

      sUltimoIndiceExtrato := AFieldName;
   Finally
      CdsExtratoAConciliar.First;
   End;
End;

Procedure TfrmConciliacaoBancariaAtual.grdMovFinAConciliarTitleButtonClick(Sender: TObject; AFieldName: String);
Begin
   Try
      If Not (CdsMovFinAConciliar.Active) Or (CdsMovFinAConciliar.IsEmpty) Or (AFieldName = 'CONCILIADO') Then
         Exit;

      If (AFieldName = sUltimoIndiceMovFinanc) And (Trim(CdsMovFinAConciliar.IndexName) = Trim('Asc' + AFieldName)) Then
         CdsMovFinAConciliar.IndexName := 'Desc' + AFieldName
      Else
         CdsMovFinAConciliar.IndexName := 'Asc' + AFieldName;

      sUltimoIndiceMovFinanc := AFieldName;
   Finally
      CdsMovFinAConciliar.First;
   End;
End;

Procedure TfrmConciliacaoBancariaAtual.spbConciliarAutoClick(Sender: TObject);
Begin
   // Paulo Nobre - WO28016 - Inicio
   frmAguarde.pbAguarde.Visible := false;
   frmAguarde.Mostra('Analizando os lançamentos semelhantes...');

   ExecutaConciliacaoAutomatica;
   CarregarGrids;

   frmAguarde.pbAguarde.Visible := True;
   frmAguarde.Apaga;
   // Paulo Nobre - WO28016 - Inicio

   spbConciliarAuto.Enabled := False;
   spbConciliarMan.enabled := True;
   spbMovBancario.Enabled := True;
   If CdsExtratoAConciliar.isEmpty Then
   begin
      spbConciliarMan.enabled := False;
      spbMovBancario.Enabled := False;
   end;
End;

Procedure TfrmConciliacaoBancariaAtual.spbConciliarManClick(Sender: TObject);
Begin
  sTextoMsg2 := '';
   stMsg.Caption := '';
   pcExtratoAConciliar.ActivePageIndex := 0;
   pcMoviFinancAConciliar.ActivePageIndex := 0;

   If (CdsExtratoAConciliar.FieldByName('CONCILIADO').AsString = 'S') And (CdsMovFinAConciliar.FieldByName('CONCILIADO').AsString = 'S') Then
      Begin
         ExecutaConciliacaoManual_n_n;

         CarregarGrids;
      End
   Else
      MsgDlg('Lançamentos (Extrato e Financeiro) devem ser Marcados. Verifique ! ', 'Atenção', mtWarning, [mbOk], 0);
End;

Procedure TfrmConciliacaoBancariaAtual.spbCarregaMovClick(Sender: TObject);
Begin
   spbCarregaMov.Enabled := False;

   // Paulo Nobre - WO28016 - Inicio
   frmAguarde.pbAguarde.Visible := false;
   frmAguarde.Mostra('Carregando os movimentos do dia...');

   // Desbloqueando os cheques , que porventura estejam no dia do desbloqueio bancário
   VerificarSeTemChequeParaDesbloquear;
   //
   CarregarGrids;
   //
   frmAguarde.pbAguarde.Visible := True;
   frmAguarde.Apaga;
   // Paulo Nobre - WO28016 - Inicio

   spbConciliarAuto.enabled := True;
   If ((CdsExtratoAConciliar.isEmpty) Or (CdsMovFinAConciliar.isEmpty) Or (Not CdsExtratoConciliado.IsEmpty)) Then
      spbConciliarAuto.enabled := False;
   spbConciliarMan.enabled := ((spbConciliarAuto.enabled = False) And (Not CdsExtratoAConciliar.isEmpty));
   spbMovBancario.Enabled := ((spbConciliarAuto.enabled = False) And (Not CdsExtratoAConciliar.isEmpty)); //True;

   spbExcluirMovimento.Enabled := True;
   spbLancaMovFinanc.Enabled := (Not CdsMovFinAConciliar.IsEmpty);
End;

Procedure TfrmConciliacaoBancariaAtual.grdMovFinAConciliarDrawDataCell(
   Sender: TObject; Const Rect: TRect; Field: TField;
   State: TGridDrawState);
Begin
   If Not CdsMovFinAConciliar.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin

               If Field.Name = 'CdsMovFinAConciliarVALORLANCFINAN' Then
                  Begin
                     If CdsMovFinAConciliar.FieldByName('ENTRADASAIDA').asString = 'S' Then // Saída
                        grdMovFinAConciliar.Canvas.Font.Color := clRed;
                  End;

               If CdsMovFinAConciliar.FieldByName('CONCILIADO').asString = 'Z' Then // Não Conciliado no dia e transferido para outro
                  Begin
                     grdMovFinAConciliar.Canvas.Font.Color := clBlue;
                     grdMovFinAConciliar.Canvas.Font.Style := [fsbold];
                  End;

               // SOL 201700 Kintana 1955228 - Paulo Nobre
               If (CdsMovFinAConciliar.FieldByName('HISTPADFINAN').AsInteger In [14, 19, 20]) Then // Deposito em Cheque e SICOB D+1 e SIVAT
                  Begin
                     grdMovFinAConciliar.Canvas.Font.Color := clMaroon;
                     grdMovFinAConciliar.Canvas.Font.Style := [fsbold];
                  End;

               grdMovFinAConciliar.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.grdExtratoConciliadoDrawDataCell(
   Sender: TObject; Const Rect: TRect; Field: TField;
   State: TGridDrawState);
Begin
   If Not CdsExtratoConciliado.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               If CdsExtratoConciliado.FieldByName('TIPOLANCTO').asString = 'D' Then // Db
                  grdExtratoConciliado.Canvas.Font.Color := clRed;

               If (CdsExtratoConciliado.FieldByName('SITBLOQUEIOLANC').AsInteger = 1) Then // Deposito em Cheque Bloqueado
                  Begin
                     grdExtratoConciliado.Canvas.Font.Color := clMaroon;
                     grdExtratoConciliado.Canvas.Font.Style := [fsbold];
                  End;

               grdExtratoConciliado.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.grdMovFinConciliadoDrawDataCell(
   Sender: TObject; Const Rect: TRect; Field: TField;
   State: TGridDrawState);
Begin
   If Not CdsMovFinConciliado.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               If CdsMovFinConciliado.FieldByName('ENTRADASAIDA').asString = 'S' Then // Saída
                  grdMovFinConciliado.Canvas.Font.Color := clRed;

               If CdsMovFinConciliado.FieldByName('CONCILIADO').asString = 'D' Then // Lançado em substituição a um original e de forma Definitiva
                  Begin
                     grdMovFinConciliado.Canvas.Font.Color := clBlue;
                     grdMovFinConciliado.Canvas.Font.Style := [fsbold];
                  End;

               // SOL 201700 Kintana 1955228 - Paulo Nobre
               If (CdsMovFinConciliado.FieldByName('HISTPADFINAN').AsInteger In [14, 19, 20]) Then // Deposito em Cheque e SICOB D+1 e SIVAT
                  Begin
                     grdMovFinConciliado.Canvas.Font.Color := clMaroon;
                     grdMovFinConciliado.Canvas.Font.Style := [fsbold];
                  End;

               grdMovFinConciliado.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.grdMovFinAConciliarCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
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

Procedure TfrmConciliacaoBancariaAtual.spbFecharDiaClick(Sender: TObject);
Begin
   If edSaldoDiaExtrato.value = edSaldoExtratoConciliado.value Then
      Begin
         MsgDlg('Lançamentos não Conciliados, serão transportados para o próximo dia útil ', 'Atenção', mtWarning, [mbOk], 0);

         If MsgDlg('Confirma o Fechamento da Conciliação do dia: ' + Datetostr(dtDiaExtrato.Date) + ' ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
            Begin
               Try
                  Screen.Cursor := crSQLWait;

                  // Sobrou lançamentos no movimento financeiro que não foram conciliados
                  If Not CdsMovFinAConciliar.isEmpty Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.clear;
                        qryAux.SQL.ADD('UPDATE MOVIMFINANC SET CONCILIADO = ''Z'' '); // Não Conciliado no dia e transferido para outro
                        qryAux.SQL.ADD('WHERE DATALANCFINAN = ' + QuotedStr(Datetostr(dtDiaExtrato.Date)));
                        qryAux.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
                        qryAux.SQL.ADD('      AND CONCILIADO = ''N''  '); // Não Conciliado
                        If Not qryAux.Prepared Then
                           qryAux.Prepare;
                        qryAux.ExecSQL;
                     End;

                  // Fechando o dia através do Extrato
                  qryAux1.Close;
                  qryAux1.SQL.clear;
                  qryAux1.SQL.ADD('UPDATE MOVEXTRATOBANCARIO SET SITCONCILIACAO = ''F''      '); // Fechado
                  qryAux1.SQL.ADD('WHERE DATAEXTRATO = ' + QuotedStr(Datetostr(dtDiaExtrato.Date)));
                  qryAux1.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
                  qryAux1.SQL.ADD('      AND CONCILIADO = ''S''  '); // Sim
                  qryAux1.SQL.ADD('      AND SITCONCILIACAO = ''A'' '); // Aberto
                  If Not qryAux1.Prepared Then
                     qryAux1.Prepare;
                  qryAux1.ExecSQL;

                  If dtmBaseDados.dbBaseDados.Intransaction Then
                     dtmBaseDados.dbBaseDados.Commit;
                  Screen.Cursor := crDefault;

                  MsgDlg('Conciliação/Fechamento do dia: ' + Datetostr(dtDiaExtrato.Date) + ', efetuada com Sucesso !', 'Aviso', mtWarning, [mbOk], 0);
                  CarregarGrids;
                  InicializarPosicoes;
                  spbFecharDia.Enabled := False;
                  dblkpBanco.setfocus;
               Except
                  Raise;
                  If dtmBaseDados.dbBaseDados.InTransaction Then
                     dtmBaseDados.dbBaseDados.Rollback;
               End;
            End;
      End
   Else
      MsgDlg('Fechamento da Conciliação não pode ser realizado, pois o Saldo Conciliado difere do Saldo do Dia. Verifique !', 'Aviso', mtWarning, [mbOk], 0);
End;

Procedure TfrmConciliacaoBancariaAtual.grdExtratoAconciliarMouseMove(
   Sender: TObject; Shift: TShiftState; X, Y: Integer);
Var
   pt: TGridcoord;
Begin
   pt := grdExtratoAconciliar.MouseCoord(x, y);

   If pt.y = 0 Then
      grdExtratoAconciliar.Cursor := crHandPoint
   Else
      grdExtratoAconciliar.Cursor := crDefault;
End;

Procedure TfrmConciliacaoBancariaAtual.grdExtratoAconciliarCalcTitleImage(
   Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
Begin
   If Field.FieldName <> 'CONCILIADO' Then
      Begin
         If CdsExtratoAConciliar.IndexName = Trim('Asc' + Field.FieldName) Then
            TitleImageAttributes.ImageIndex := 0
         Else
            TitleImageAttributes.ImageIndex := 1;
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.grdMovFinAConciliarCalcTitleImage(
   Sender: TObject; Field: TField; Var TitleImageAttributes: TwwTitleImageAttributes);
Begin
   If Field.FieldName <> 'CONCILIADO' Then
      Begin
         If CdsMovFinAConciliar.IndexName = Trim('Asc' + Field.FieldName) Then
            TitleImageAttributes.ImageIndex := 0
         Else
            TitleImageAttributes.ImageIndex := 1;
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.spbDesfazerConcClick(Sender: TObject);
   Procedure AtualizaDesfazConciliacao(iIDLANCCONCILIADO: Integer);
   Begin
      qryAux.Close;
      qryAux.SQL.Clear;
      qryAux.SQL.ADD('UPDATE MOVIMFINANC SET CONCILIADO = ''N''   '); // Não Conciliado
      qryAux.SQL.ADD(', IDLANCCONCILIADO = NULL     ');
      qryAux.SQL.ADD(', DATACONCILIACAOBANCARIA = NULL  ');
      qryAux.SQL.ADD('WHERE IDLANCCONCILIADO = ' + inttostr(iIDLANCCONCILIADO));
      If Not qryAux.Prepared Then
         qryAux.Prepare;
      qryAux.ExecSQL;

      qryAux1.Close;
      qryAux1.SQL.Clear;
      qryAux1.SQL.ADD('UPDATE MOVEXTRATOBANCARIO SET CONCILIADO = ''N''   '); // Não Conciliado
      qryAux1.SQL.ADD(', IDLANCCONCILIADO = NULL     ');
      qryAux1.SQL.ADD('WHERE IDLANCCONCILIADO = ' + inttostr(iIDLANCCONCILIADO));
      If Not qryAux1.Prepared Then
         qryAux1.Prepare;
      qryAux1.ExecSQL;
   End;
Begin
   Try
      Try
         sTextoMsg1 := '';
         stMsg.Caption := '';
         Cursor := crSQLWait;

         // Paulo Nobre - WO28016 - Inicio
         frmAguarde.pbAguarde.Visible := false;
         frmAguarde.Mostra('Desfazendo a conciliação...');

         If Not dtmBaseDados.dbBaseDados.Intransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         If chkDesfazerTudo.checked Then
            Begin
               CdsExtratoConciliado.DisableControls;
               CdsExtratoConciliado.First;
               While Not CdsExtratoConciliado.EOF Do
                  Begin
                     AtualizaDesfazConciliacao(CdsExtratoConciliado.FieldByName('IDLANCCONCILIADO').AsInteger);

                     CdsExtratoConciliado.Next;
                  End;
               CdsExtratoConciliado.EnableControls;
            End
         Else
            AtualizaDesfazConciliacao(CdsExtratoConciliado.FieldByName('IDLANCCONCILIADO').AsInteger);

         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Commit;

         CarregarGrids;

         frmAguarde.pbAguarde.Visible := True;
         frmAguarde.Apaga;

         // Paulo Nobre - WO28016 - Fim

         spbConciliarAuto.enabled := False;
         If chkDesfazerTudo.checked Then
            Begin
               pcExtratoAConciliar.ActivePageIndex := 0;
               pcMoviFinancAConciliar.ActivePageIndex := 0;
               spbConciliarAuto.enabled := True;
               spbConciliarMan.enabled := False;
               spbMovBancario.Enabled := False;
            End;

         spbConciliarMan.enabled := (spbConciliarAuto.enabled = False);
         spbMovBancario.Enabled := (spbConciliarAuto.enabled = False);;

      Except
         Raise;
         If dtmBaseDados.dbBaseDados.InTransaction Then
            dtmBaseDados.dbBaseDados.Rollback;
      End;
   Finally
      Cursor := crDefault;
      chkDesfazerTudo.Checked := False;
   End;
End;

Procedure TfrmConciliacaoBancariaAtual.grdBloqueiosDrawDataCell(Sender: TObject; Const Rect: TRect; Field: TField; State: TGridDrawState);
Begin
   If Not CdsBloqueios.isEmpty Then
      Begin
         If Not ((gdSelected In State) Or (gdFixed In State) Or (gdFocused In State)) Then
            Begin
               If (CdsBloqueios.FieldByName('TIPOBLOQ').asString = 'C') Or (CdsBloqueios.FieldByName('TIPOBLOQ').asString = 'O') Then // Cheque e outros
                  grdBloqueios.Canvas.Font.Color := clMaroon;

               If CdsBloqueios.FieldByName('TIPOBLOQ').asString = 'J' Then // Bloq. Jud.
                  grdBloqueios.Canvas.Font.Color := clBlue;

               grdBloqueios.DefaultDrawDataCell(Rect, Field, State);
            End;
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.grdMovFinAConciliarMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
Var pt: TGridcoord;
Begin
   pt := grdMovFinAConciliar.MouseCoord(x, y);

   If pt.y = 0 Then
      grdMovFinAConciliar.Cursor := crHandPoint
   Else
      grdMovFinAConciliar.Cursor := crDefault;
End;

Procedure TfrmConciliacaoBancariaAtual.spbLancaMovFinancClick(Sender: TObject);
Begin
   AbrirFormModal(frmMovimFinancMT, TfrmMovimFinancMT);
   CarregarGrids;
End;

Procedure TfrmConciliacaoBancariaAtual.InicializarPosicoes;
Begin
   sTextoMsg2 := '';
   stMsg.Caption := '';
   imgI.Visible := False;
   imgM.Visible := False;
   spbExcluirMovimento.Enabled := False;
   spbAbreArquivo.enabled := False;
   spbCadExtrato.Enabled := False;
   edtArquivo.Text := '';
   spbCarregaMov.enabled := False;
   spbConciliarMan.enabled := False;
   spbConciliarAuto.enabled := False;
   spbMovBancario.Enabled := False;
   spbFecharDia.enabled := False;
   spbAbrirDia.Enabled := False;
   spbLancaMovFinanc.Enabled := False;
   edSaldoAntMovFinanc.Value := 0.00;
   edSaldoDiaMovFinanc.Value := 0.00;
   edSaldoBloqMovFinanc.Value := 0.00;
   edSaldoDispMovFinanc.Value := 0.00;
   edSaldoTotalMovim.Value := 0.00;
   edSaldoAntExtrato.Value := 0.00;
   edSaldoDiaExtrato.Value := 0.00;
   edSaldoTotalExtrato.Value := 0.00;
   edSaldoBloqExtrato.Value := 0.00;
   edSaldoDispExtrato.Value := 0.00;
   edSaldoExtratoConciliado.value := 0.00;
   edSaldoExtratoConciliado2.value := 0.00;
   edSaldoMovFinancConciliado.Value := 0.00;
   CdsExtratoAConciliar.Close;
   CdsExtratoConciliado.Close;
   CdsMovFinAConciliar.Close;
   CdsMovFinConciliado.Close;
End;

Procedure TfrmConciliacaoBancariaAtual.dtDiaExtratoChange(Sender: TObject);
Begin
   InicializarPosicoes;
End;

Procedure TfrmConciliacaoBancariaAtual.dblkpBancoChange(Sender: TObject);
Begin
   InicializarPosicoes;
End;

Procedure TfrmConciliacaoBancariaAtual.spbExcluirMovimentoClick(Sender: TObject);
Begin
   If dblkpBanco.Text = '' Then
      Begin
         MsgDlg('Selecione o Banco/Conta a ser Conciliada !', 'Aviso', mtWarning, [mbOk], 0);
         Exit;
      End;

   spbAbreArquivo.enabled := False;
   spbCadExtrato.Enabled := False;
   edtArquivo.Text := '';
   pcExtratoAConciliar.ActivePageIndex := 0;

   // Somente se há movimento a conciliar no dia, para o banco
   If Not CdsExtratoAConciliar.isEmpty Then
      Begin
         // Somente se há movimento conciliado no dia, para o banco
         If CdsExtratoConciliado.isEmpty Then
            Begin
               If MsgDlg('Confirma Exclusão do Movimento Bancário do: ' + #13 + #13 +
                  'Dia                  : ' + Datetostr(dtDiaExtrato.Date) + #13 +
                  'Banco/Conta : ' + qryLkpBanco.Fieldbyname('DESCRICAO').asString + ' ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
                  Begin
                     Try
                        Try
                           Cursor := crSQLWait;
                           CdsExtratoAConciliar.DisableControls;
                           If Not dtmBaseDados.dbBaseDados.Intransaction Then
                              dtmBaseDados.dbBaseDados.StartTransaction;

                           qryAux.Close;
                           qryAux.SQL.Clear;
                           qryAux.SQL.ADD('DELETE FROM MOVEXTRATOBANCARIO ');
                           qryAux.SQL.ADD('WHERE DATAEXTRATO  = ' + quotedstr(datetostr(dtDiaExtrato.Date)));
                           qryAux.SQL.ADD('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
                           If Not qryAux.Prepared Then
                              qryAux.Prepare;
                           qryAux.ExecSQL;

                           If dtmBaseDados.dbBaseDados.Intransaction Then
                              dtmBaseDados.dbBaseDados.Commit;
                           Cursor := crDefault;

                           InicializarPosicoes;
                           spbExcluirMovimento.Enabled := False;
                        Except
                           Raise;
                           If dtmBaseDados.dbBaseDados.InTransaction Then
                              dtmBaseDados.dbBaseDados.Rollback;
                        End;
                     Finally
                        CdsExtratoAConciliar.EnableControls;
                        qryAux.Close;
                        Cursor := crDefault;
                     End;
                  End;
            End
         Else
            MsgDlg('Existem Lançamentos Conciliados, favor desfazer a Conciliação antes da Exclusão !. Verifique !', 'Aviso', mtWarning, [mbOk], 0);
      End
   Else
      MsgDlg('Não há Movimento de Extrato para a Exclusão. Verifique !', 'Aviso', mtWarning, [mbOk], 0);
End;

Function TfrmConciliacaoBancariaAtual.DataProximoDiaUtil(DataBase: TDateTime): TDateTime;
Var dDtaPz: TDateTime;
Begin
   dDtaPz := DataBase + 1;
   While Not diasUteis.diaUtil(dDtaPz, 5300108, 1, 'DF', True, True, False) Do
      dDtaPz := dDtaPz + 1; // Achar o dia útil Posterior

   Result := dDtaPz;
End;

Procedure TfrmConciliacaoBancariaAtual.FormShow(Sender: TObject);
Begin
   dtDiaExtrato.Setfocus;
End;

Procedure TfrmConciliacaoBancariaAtual.spbAbrirDiaClick(Sender: TObject);
Begin
   If dblkpBanco.Text = '' Then
      Begin
         MsgDlg('Selecione o Banco/Conta a ser Conciliada !', 'Aviso', mtWarning, [mbOk], 0);
         dblkpBanco.Setfocus;
         Exit;
      End;

   If MsgDlg('Confirma a Abertura da Conciliação do dia: ' + Datetostr(dtDiaExtrato.Date) + ' ?', 'Atenção !', MtConfirmation, [MbYes, MbNo], 0) = MrYes Then
      Begin
         Try

            If Not dtmBaseDados.dbBaseDados.Intransaction Then
               dtmBaseDados.dbBaseDados.StartTransaction;

            Screen.Cursor := crSQLWait;

            // Abrindo os Movimentos do Dia
            qryAux1.Close;
            qryAux1.SQL.clear;
            qryAux1.SQL.ADD('UPDATE MOVEXTRATOBANCARIO SET SITCONCILIACAO = ''A''   '); // Aberto
            qryAux1.SQL.ADD(',DTABERTURACONC = ' + QuotedStr(Datetostr(date)));
            qryAux1.SQL.ADD(',USERABERTURACONC = ' + floattostr(sistema.IdUsuario));
            qryAux1.SQL.ADD('WHERE DATAEXTRATO = ' + QuotedStr(Datetostr(dtDiaExtrato.Date)));
            qryAux1.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
            qryAux1.SQL.ADD('      AND SITCONCILIACAO = ''F'' '); // Sim e Fechado
            If Not qryAux1.Prepared Then
               qryAux1.Prepare;
            qryAux1.ExecSQL;

            If dtmBaseDados.dbBaseDados.Intransaction Then
               dtmBaseDados.dbBaseDados.Commit;
            Screen.Cursor := crDefault;

            MsgDlg('Abertura da Conciliação do dia: ' + Datetostr(dtDiaExtrato.Date) + ', efetuada com Sucesso !', 'Aviso', mtWarning, [mbOk], 0);
            spbAbrirDia.Enabled := False;
            CarregarGrids;
            dblkpBanco.setfocus;
         Except
            Raise;
            If dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.Rollback;
         End;
      End;
End;

Procedure TfrmConciliacaoBancariaAtual.VerificarSeTemChequeParaDesbloquear;
Begin
   Try
      If Not dtmBaseDados.dbBaseDados.Intransaction Then
         dtmBaseDados.dbBaseDados.StartTransaction;

      sTextoMsg2 := '';
      stMsg.Caption := '';

      Cursor := crSQLWait;

      //Edilaine - SOL 198796/13843 - KTN 1914601
      CdsBloqueios.Data := CtrlMovimFinanc.ListaMovimBloqueios(Datetostr(dtDiaExtrato.Date), qryLkpBanco.Fieldbyname('CODPORTADOR').asString);

      CdsBloqueios.First;
      While Not CdsBloqueios.EOF Do
         Begin
            If (CdsBloqueios.FieldByName('TIPOBLOQ').asString = 'C') Or (CdsBloqueios.FieldByName('TIPOBLOQ').asString = 'O') Then // Cheque e outros
               Begin
                  If CdsBloqueios.Fieldbyname('DATADISPONIB').asDateTime = DataProximoDiaUtil(dtDiaExtrato.Date) Then
                     Begin
                        qryAux.Close;
                        qryAux.SQL.clear;
                        qryAux.SQL.ADD('UPDATE MOVIMFINANC SET ');
                        qryAux.SQL.ADD('SITBLOQUEIOLANC = 0    '); // Desbloqueado
                        qryAux.SQL.ADD(', DATADESBLOQUEIO = ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
                        qryAux.SQL.add('WHERE CODLANCFINANC = ' + CdsBloqueiosCodLancFinanc.asString);
                        If Not qryAux.Prepared Then
                           qryAux.Prepare;
                        qryAux.ExecSQL;

                        qryAux1.Close;
                        qryAux1.SQL.clear;
                        qryAux1.SQL.ADD('UPDATE MOVEXTRATOBANCARIO SET ');
                        qryAux1.SQL.ADD('SITBLOQUEIOLANC = 0           '); // Desbloqueado
                        qryAux1.SQL.ADD('WHERE IDLANCCONCILIADO = ' + CdsBloqueiosIdLancConciliado.asString);
                        If Not qryAux1.Prepared Then
                           qryAux1.Prepare;
                        qryAux1.ExecSQL;

                        stMsg.caption := 'Cheque(s) e/ou Outro(s) foi(ram) desbloqueado(s) nesta data';
                     End;
               End;

            CdsBloqueios.Next;
         End;

      If dtmBaseDados.dbBaseDados.Intransaction Then
         dtmBaseDados.dbBaseDados.Commit;

      Cursor := crDefault;
   Except
      On E: Exception Do
         Begin
            If dtmBaseDados.dbBaseDados.InTransaction Then
               dtmBaseDados.dbBaseDados.Rollback;
         End;
   End;
End;

Function TfrmConciliacaoBancariaAtual.TotalChequeBloqueados(pSit: Integer): Double;
Begin
   // Selecionando os Cheques Bloqueados
   // Sol..........: 31714/12942 - Paulo Nobre
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT NVL(SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)),0) AS TOTALBLOQ');
   qryAux.SQL.add('FROM MOVIMFINANC ');
   If pSit = 0 Then // Anteriores + os do Dia
      qryAux.SQL.add('WHERE DATALANCFINAN <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)))
   Else // só os do Dia
      qryAux.SQL.add('WHERE DATALANCFINAN = ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryAux.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryAux.SQL.add('      AND SITBLOQUEIOLANC = 1 '); // Bloqueado
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   qryAux.SQL.add('      AND HISTPADFINAN = 14 '); // Cheques
   qryAux.Open;
   Result := qryAux.fieldbyname('TOTALBLOQ').asFloat;
   qryAux.Close;
   Cursor := crDefault;
End;

Function TfrmConciliacaoBancariaAtual.TotalOutrosBloqueados(pSit: Integer): Double;
Begin
   // Selecionando os Outros Bloqueados
   // SOL 201700 Kintana 1955228 - Paulo Nobre
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT NVL(SUM(DECODE(ENTRADASAIDA, ''S'', -VALORLANCFINAN, VALORLANCFINAN)),0) AS TOTALBLOQ');
   qryAux.SQL.add('FROM MOVIMFINANC ');
   If pSit = 0 Then // Anteriores + os do Dia
      qryAux.SQL.add('WHERE DATALANCFINAN <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)))
   Else // só os do Dia
      qryAux.SQL.add('WHERE DATALANCFINAN = ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryAux.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryAux.SQL.add('      AND SITBLOQUEIOLANC = 1 '); // Bloqueado
   qryAux.SQL.add('      AND HISTPADFINAN IN (19, 20) '); // SICOB D+1 e SIVAT
   qryAux.Open;
   Result := qryAux.fieldbyname('TOTALBLOQ').asFloat;
   qryAux.Close;
   Cursor := crDefault;
End;

Function TfrmConciliacaoBancariaAtual.TotalBloqueiosJudiciais: Double;
Begin
   Cursor := crSQLWait;
   qryAux.Close;
   qryAux.SQL.Clear;
   qryAux.SQL.add('SELECT NVL(SUM(DECODE(TIPOLANCTO, ''S'', -VALORLANCTO, VALORLANCTO)),0) AS TOTALBLOQ');
   qryAux.SQL.add('FROM MOVFINBLOQJUDICIAIS                                      ');
   qryAux.SQL.add('WHERE DATALANCTO <= ' + quotedstr(Datetostr(dtDiaExtrato.Date)));
   qryAux.SQL.add('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryAux.Open;
   Result := qryAux.fieldbyname('TOTALBLOQ').asFloat;
   qryAux.Close;
   Cursor := crDefault;
End;

Procedure TfrmConciliacaoBancariaAtual.grdBloqueiosIButtonClick(Sender: TObject);
Begin
   // Cadastro de Bloqueios Judiciais
   frmCadBloqueiosJudiciaisFinanc := TfrmCadBloqueiosJudiciaisFinanc.create(self);
   frmCadBloqueiosJudiciaisFinanc.iCodPortador := qryLkpBanco.Fieldbyname('CODPORTADOR').asInteger;
   frmCadBloqueiosJudiciaisFinanc.ShowModal;
   frmCadBloqueiosJudiciaisFinanc.Free;
End;

Procedure TfrmConciliacaoBancariaAtual.grdExtratoConciliadoCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00F0F0F0 // Cinza claro
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

Procedure TfrmConciliacaoBancariaAtual.grdMovFinConciliadoCalcCellColors(
   Sender: TObject; Field: TField; State: TGridDrawState;
   Highlight: Boolean; AFont: TFont; ABrush: TBrush);
Begin
   // faz com que as linhas do grid tenham cores alternadas
   If State <> [gdSelected] Then
      Begin
         If Not Highlight Then
            Begin
               // linhas ímpares = amarelo, linhas pares = branco
               If ((Sender As TwwDBGrid).CalcCellRow Mod 2) = 0 Then
                  ABrush.Color := $00F0F0F0 // Cinza claro
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

Procedure TfrmConciliacaoBancariaAtual.FormClose(Sender: TObject; Var Action: TCloseAction);
Begin
   action := cafree;
End;

Procedure TfrmConciliacaoBancariaAtual.spbImprimirClick(Sender: TObject);
Begin
   frmEspelhoDaConciliacaoBancariaAtual := TfrmEspelhoDaConciliacaoBancariaAtual.Create(self);
   frmEspelhoDaConciliacaoBancariaAtual.sDataExtrato := datetostr(dtDiaExtrato.Date);
   frmEspelhoDaConciliacaoBancariaAtual.sCodPortador := qryLkpBanco.Fieldbyname('CODPORTADOR').asString;
   frmEspelhoDaConciliacaoBancariaAtual.Showmodal;
   frmEspelhoDaConciliacaoBancariaAtual.Free;
End;

Procedure TfrmConciliacaoBancariaAtual.dblkpBancoEnter(Sender: TObject);
Begin
   dblkpBanco.dropdown;
End;

// Sol..........: 31714/12802 - Paulo Nobre
// Sol..........: 31714/12902 - Paulo Nobre
// Sol 31714/13162  KTN 1887925 - Paulo Nobre

Function TfrmConciliacaoBancariaAtual.ConciliacaoAberta: Boolean;
Begin
   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.ADD('SELECT DATAEXTRATO    ');
   qryAux.SQL.ADD('FROM MOVEXTRATOBANCARIO    ');
   qryAux.SQL.ADD('WHERE DATAEXTRATO = ' + QuotedStr(Datetostr(dtDiaExtrato.Date)));
   qryAux.SQL.ADD('      AND CODPORTADOR = ' + qryLkpBanco.Fieldbyname('CODPORTADOR').asString);
   qryAux.SQL.ADD('      AND SITCONCILIACAO = ''A'' '); // Situação da conciliação = (A)berta
   qryAux.Open;
   ConciliacaoAberta := (Not qryAux.isEmpty And CdsExtratoAConciliar.isEmpty);
End;

// Sol 31714/13162  KTN 1887925 - Paulo Nobre

Procedure TfrmConciliacaoBancariaAtual.ExecutaConciliacaoManual_n_n;
Var sTipoLancExtrato, sTipoLancMovFinanc: String;
   // SOL 198796.13877 KTN 1918841 Otacilio
   //dValoMovExtrato, dValoMovFinanc: Double;
   dValoMovExtrato, dValoMovFinanc: Currency;
   bChequeBloq: Boolean;
   iIdLancConciliado: Integer;
Begin
   If Not (CdsExtratoAConciliar.Active) Or (CdsExtratoAConciliar.IsEmpty) Or
      Not (CdsMovFinAConciliar.Active) Or (CdsMovFinAConciliar.IsEmpty) Then
      Exit;

   bChequeBloq := False;
   sTextoMsg2 := '';
   stMsg.Caption := '';
   Cursor := crSQLWait;
   CdsExtratoAConciliar.DisableControls;
   CdsMovFinAConciliar.DisableControls;
   Try
      Try
         If Not dtmBaseDados.dbBaseDados.Intransaction Then
            dtmBaseDados.dbBaseDados.StartTransaction;

         dValoMovExtrato := 0;
         // Varre a movextratobancario para encontrar a soma total dos registros marcados
         CdsExtratoAConciliar.First;
         While Not (CdsExtratoAConciliar.EOF) Do
            Begin
               If (CdsExtratoAConciliar.FieldByName('CONCILIADO').AsString = 'S') Then // Sim
                  Begin
                     dValoMovExtrato := dValoMovExtrato + CdsExtratoAConciliar.FieldByName('VALORLANCTO').AsFloat;

                     If CdsExtratoAConciliar.FieldByName('TIPOLANCTO').AsString = 'C' Then // Crédito
                        sTipoLancExtrato := 'E' // Entrada
                     Else // Débito
                        sTipoLancExtrato := 'S'; // Saída
                  End;

               CdsExtratoAConciliar.Next;
            End;

         dValoMovFinanc := 0;
         // Varre o MovimFinanc para encontrar a soma total dos registros marcados
         CdsMovFinAConciliar.First;
         While Not (CdsMovFinAConciliar.EOF) Do
            Begin
               If (CdsMovFinAConciliar.FieldByName('CONCILIADO').AsString = 'S') Then // Sim
                  Begin
                     dValoMovFinanc := dValoMovFinanc + CdsMovFinAConciliar.FieldByName('VALORLANCFINAN').AsFloat;

                     sTipoLancMovFinanc := CdsMovFinAConciliar.FieldByName('ENTRADASAIDA').AsString
                  End;

               CdsMovFinAConciliar.Next;
            End;

         // Compara os Tipos (levando em conta 'E/S') e o Valores do Extrato com o do Movimento Financeiro
         If (sTipoLancMovFinanc = sTipoLancExtrato) And
            (dValoMovFinanc = dValoMovExtrato) Then
            Begin
               qryAux.Close;
               qryAux.SQL.Clear;
               qryAux.SQL.add('SELECT SEQLANCCONCILIADO.NEXTVAL SEQ FROM DUAL');
               qryAux.Open;
               iIdLancConciliado := qryAux.FieldByName('SEQ').AsInteger;

               CdsMovFinAConciliar.First;
               While Not (CdsMovFinAConciliar.EOF) Do
                  Begin
                     If (CdsMovFinAConciliar.FieldByName('CONCILIADO').AsString = 'S') Then // Com o Check marcado = 'S'
                        Begin
                           qryAux.Close;
                           qryAux.SQL.clear;
                           qryAux.SQL.ADD('UPDATE MOVIMFINANC SET CONCILIADO = ''S'' '); // Conciliado
                           qryAux.SQL.ADD(', IDLANCCONCILIADO = ' + inttostr(iIdLancConciliado));
                           qryAux.SQL.ADD(', DATACONCILIACAOBANCARIA = ' + quotedstr(datetostr(date)));

                           // SOL 201700 Kintana 1955228 - Paulo Nobre
                           If (CdsMovFinAConciliar.FieldByName('HISTPADFINAN').AsInteger In [14, 19, 20]) And // Deposito em Cheque e SICOB D+1 e SIVAT
                           (CdsMovFinAConciliar.FieldByName('DATADISPFINANC').AsDateTime > CdsMovFinAConciliar.FieldByName('DATALANCFINAN').AsDateTime) Then
                              Begin
                                 qryAux.SQL.ADD(', SITBLOQUEIOLANC = 1    '); // Bloqueado
                                 qryAux.SQL.ADD(', DATADESBLOQUEIO = NULL ');
                                 sTextoMsg1 := 'Cheque(s) e/ou Outro(s) bloqueado(s) nesta data: ';
                                 sTextoMsg2 := sTextoMsg2 + CdsExtratoAConciliar.FieldByName('NUMDOCUMENTO').AsString + ' - ' + floattostrf(CdsExtratoAConciliar.FieldByName('VALORLANCTO').AsFloat, ffcurrency, 12, 2) + '  |  ';
                                 bChequeBloq := True;
                              End;

                           qryAux.SQL.ADD('WHERE CODLANCFINANC = ' + CdsMovFinAConciliar.FieldByName('CODLANCFINANC').AsString);
                           If Not qryAux.Prepared Then
                              qryAux.Prepare;
                           qryAux.ExecSQL;
                        End;

                     CdsMovFinAConciliar.Next;
                  End;

               CdsExtratoAConciliar.First;
               While Not (CdsExtratoAConciliar.EOF) Do
                  Begin
                     If (CdsExtratoAConciliar.FieldByName('CONCILIADO').AsString = 'S') Then // Com o Check marcado = 'S'
                        Begin
                           qryAux.Close;
                           qryAux.SQL.clear;
                           qryAux.SQL.ADD('UPDATE MOVEXTRATOBANCARIO SET CONCILIADO = ''S'' '); // Conciliado
                           qryAux.SQL.ADD(', IDLANCCONCILIADO = ' + inttostr(iIdLancConciliado));
                           // Se for Depósito em cheque, Bloqueia também no Extrato
                           If bChequeBloq Then
                              qryAux.SQL.ADD(', SITBLOQUEIOLANC = 1 '); // Bloqueado
                           qryAux.SQL.ADD('WHERE IDMOVEXTRATOBANCARIO = ' + CdsExtratoAConciliar.FieldByName('IDMOVEXTRATOBANCARIO').AsString);
                           If Not qryAux.Prepared Then
                              qryAux.Prepare;
                           qryAux.ExecSQL;
                        End;

                     CdsExtratoAConciliar.Next;
                  End;

               If dtmBaseDados.dbBaseDados.Intransaction Then
                  dtmBaseDados.dbBaseDados.Commit;
            End
         Else
            Begin
               MsgDlg('Soma dos Valores do Extrato NÃO CONFERE com a Soma dos Valores do Financeiro OU ' + #13 +
                  'Os Tipos não são iguais (ex: E <> S). Verifique !' + #13 + #13 +
                  'Total marcado Extrato       : ' + FloatToStrf(dValoMovExtrato, ffnumber, 12, 2) + ' - ' + sTipoLancExtrato + #13 +
                  'Total marcado Financeiro : ' + FloatToStrf(dValoMovFinanc, ffnumber, 12, 2) + ' - ' + sTipoLancMovFinanc + #13 +
                  'Diferença                              : ' + FloatToStrf(Abs(dValoMovExtrato - dValoMovFinanc), ffnumber, 12, 2), 'Atenção', mtError, [mbOk], 0);
            End;
      Except
         On E: Exception Do
            Begin
               ShowMessage(e.Message);
               If dtmBaseDados.dbBaseDados.InTransaction Then
                  dtmBaseDados.dbBaseDados.Rollback;
            End;
      End;
   Finally
      CdsExtratoAConciliar.EnableControls;
      CdsMovFinAConciliar.EnableControls;
      CdsExtratoAConciliar.First;
      CdsMovFinAConciliar.First;
      Cursor := crDefault;
      stMsg.caption := sTextoMsg1 + sTextoMsg2;
   End;
End;

procedure TfrmConciliacaoBancariaAtual.spbMovBancarioClick(
  Sender: TObject);
begin
  try
    frmConcMovimentoBancario := TfrmConcMovimentoBancario.Create(Self);
    frmConcMovimentoBancario.iCodPortador := qryLkpBanco.FieldByName('CODPORTADOR').AsInteger;
    frmConcMovimentoBancario.lkpPortadorConta.Enabled := False;
    frmConcMovimentoBancario.dDataLancamento := dtDiaExtrato.Date;
    frmConcMovimentoBancario.ShowModal;

    //if frmConciliacaoBancariaAtual.ModalResult = mrOk then
      CarregarGrids;
  finally
    frmConcMovimentoBancario.Release;
  end;
end;

End.

