{*******************************************************************************
 Autor.....: Paulo Nobre
 Chamado...: WO21525
 Data      : 22/05/2025
 Descrição : .Comentado a atribuição default = 0 na combobox do Primônio Social
              no FormShow.
             .Incluso a passagem do valor da combobox do Primônio Social na
              função: CtrlSPCConsiste.ProcessaRentabilidade...
{*******************************************************************************
 Autor.....: Paulo Nobre
 Chamado...: WO17588
 Data      : 02/08/2024
 Descrição : Por sugestão da Gestora em permitir que seja apurado o mesmo
             resultado tanto para 1 item selecionado quanto para vários, a
             melhor implementação foi colocar a opção "Nenhum" como default
             na combo "Patrimônio Social".
{*******************************************************************************
 Autor.....: Arnaldo Vicente Scarin
 Chamado...: WO13056 - Contabilidade - Rentabilidade contábil
 Data      : 02/08/2024
 Descrição : Correção do Relatorio de Rentabilidade Contábil, que está apresentando
             erro ao mostrar a Rentabilidade do Periodo
{*******************************************************************************
 Autor.....: Arnaldo Vicente Scarin
 SIG.......: 12742 - Contabilidade - Rentabilidade contábil
 Data      : 22/07/2024
 Descrição : Correção do Relatorio de Rentabilidade Contábil, que está apresentando
             erro ao não mostrar o valor do Ultimo Mês no resumo das contas
             selecionadas
{*******************************************************************************
 Autor.....: Marcelo Cardoso Santos Filho
 SIG.......: 26555
 Data      : 16/02/2017
 Descrição : Inclusão do grupo Patrimônio Social
{*******************************************************************************
Rotina..........: TFrmRentabilidadeContabilMT.bbtnImprimirClick
N. Sol..........: 157360
N. Kintana......: 1254510
Data............: 19/09/2011
Responsável.....: Otacilio Aquino
Descrição.......: Permitir a exportação para csv dados sintetico
{*******************************************************************************
Rotina..........: TFrmRentabilidadeContabilMT.bbtnConfirmarClick
N. Sol..........: 148651
N. Kintana......: 1055987
Data............: 10/12/2010
Responsável.....: Paulo Nobre
Descrição.......: Permitir a exportação pra csv
{*******************************************************************************
Rotina..........: TFrmRentabilidadeContabilMT.bbtnConfirmarClick
                  TFrmRentabilidadeContabilMT.ppCalcAcumuladoMensalPrint
N. Sol..........: 120911
N. Kintana......: 576909
Data............: 25/06/2009
Responsável.....: Marilza Colpani
Descrição.......: Acerto do resultado no relatório de Rentabilidade Contábil
                 apresentado em março/2009, para o seguimento Imóveis em Construção.
*******************************************************************************}

Unit FRentabilidadeContabilMT;

Interface

{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 07/06/2007
  Pendência    : 28065
  Descrição    : Ajuste na apuração do saldo inicial
{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 07/06/2007
  Pendência    : 28056
  Descrição    : Ajuste na totalização do relatório
{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 05/12/2007
  Pendência    : 26719
  Descrição    : Inclusão do controle de PeriodoXPlano para as selecionar as
                 rentabilidades disponiveis
{------------------------------------------------------------------------------
  Desenvolvedor: Augusto
  Data         : 27/10/2007
  Pendência    : 26719
  Metodo       : Relatorio
  Descrição    : Acerto nas totalizações mensais
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 19/09/2007
  Pendência    : 26384
  Metodo       : Botão Cancelar
  Descrição    : zerar o CDSRentab pra não por lixo no resultado e corrigido o valor mensal.
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 05/09/2007
  Pendência    : 26237
  Metodo       : diversos
  Descrição    : Corrigido cálculo de rentabilidade, corrigida query q trazia valores inválido.
                 quando não existia valor.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Marcus Oliveira
  Data         : 19/09/2006
  Pendência    : 22024
  Metodo       : diversos
  Descrição    : Se não for passada nenhuma rentabilidade contabil trazer todas
                 as rentabilidades.
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Rodolpho da Silva
  Data         : 09/05/2006
  Pendência    : 22202
  Metodo       : diversos
  Descrição    : Implementado flg que desconsidera as contas de encerramento de
                 resultado, além de melhorias na tela
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 08/09/05
  Pendência    : Erro no cálculo da rentabilidade
  Metodo       : btOk.Click
  Descrição    : Inserido o roundCm nas rotinas de acumular os valores
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Rodolpho da Silva
  Data         : 02/09/05
  Pendência    : 20096 - Imprimir a rentabilidade para dias não úteis
  Metodo       : btOk.Click
  Descrição    : Correção de cálculos nos valores de rentabilidade mensal
------------------------------------------------------------------------------}
{------------------------------------------------------------------------------
  Desenvolvedor: Alex Pereira
  Data         : 26/07/05
  Pendência    : 19813 - Imprimir a rentabilidade para dias não úteis
  Metodo       : sqlBuscaContab
                 MontaQuery
  Solução      : Criada uma query virtual com todos os dias do fluxo para totalizar
                 todos os dias
------------------------------------------------------------------------------}

Uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, StdCtrls, wwdbdatetimepicker, CMDateTimePicker, IvDictio,
   IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, ComCtrls,
   Grids, Wwdbigrd, Wwdbgrid, dxTL, dxCntner, uCtrlParamIntegra, Db,
   DBClient, uCMClientDataSet, uCtrlSPCConsiste, uCtrlPeriodo, uCtrlContab,
   uCtrlPlanoData,
   dBaseDados, uSistema, Mask, wwclient, uCmSqlParams,
   Wwdatsrc, wwdblook, uMensErro, uDiasUteis, JclStrings, uCtrlPadroes,
   ppBands, ppClass, ppCtrls, ppVar, ppPrnabl, ppCache, ppProd, ppReport,
   CmParamReport, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, FPreview,
   FProgresso, ppStrtch, ppSubRpt, uCMMath, ppModule, raCodMod, ppParameter,
   wwdbedit, Wwdotdot, Wwdbcomb, QExport3Dialog, jpeg, DBTables, CMDatabase;

Type
   TFrmRentabilidadeContabilMT = Class(TfrmOkCancelar)
      grpDatas: TGroupBox;
      bbtnImprimir: TBitBtn;
      CdsSpcConsiste: TCMClientDataSet;
      dsPlanoPrev: TDataSource;
      dsPatro: TDataSource;
      CdsResult: TCMClientDataSet;
      dsResult: TwwDataSource;
      lblMes: TLabel;
      dblkPeriodo: TwwDBLookupCombo;
      dblkExercicio: TwwDBLookupCombo;
      lblExercicio: TLabel;
      dblkPeriodoFim: TwwDBLookupCombo;
      lblMesFinal: TLabel;
      cdsExercicio: TCMClientDataSet;
      cdsPeriodo: TCMClientDataSet;
      cdsPeriodoFim: TCMClientDataSet;
      ppBDEPipeline1: TppBDEPipeline;
      CdsFundacao: TCMClientDataSet;
      dsFundacao: TwwDataSource;
      pplFundacao: TppBDEPipeline;
      ppReport1: TppReport;
      pgcPatroPlanoResult: TPageControl;
      tbsPlanoPatro: TTabSheet;
      tbsResult: TTabSheet;
      grpPatro: TGroupBox;
      dbgrPatro: TwwDBGrid;
      grpPlanoPrev: TGroupBox;
      dbgrPlanoPrev: TwwDBGrid;
      grpResultados: TGroupBox;
      dbgResult: TwwDBGrid;
      CdsPatro: TCMClientDataSet;
      CdsPlanoPrev: TCMClientDataSet;
      chkDesconsidera: TCheckBox;
      tbRentab: TTabSheet;
      dbgridRentab: TwwDBGrid;
      dsSpcConsiste: TDataSource;
      CMSqlParams1: TCMSqlParams;
      dsRentab: TwwDataSource;
      dbPlREntab: TppBDEPipeline;
      cdsRentab: TCMClientDataSet;
      dbPlREntabppField1: TppField;
      CMSqlParams2: TCMSqlParams;
      ppParameterList1: TppParameterList;
      GroupBox1: TGroupBox;
      Label1: TLabel;
      CbCusto: TwwDBComboBox;
      Label2: TLabel;
      CbOutros: TwwDBComboBox;
      bbExportar: TBitBtn;
      QExport3Dialog1: TQExport3Dialog;
      bbtnInverte: TBitBtn;
      QExport3Dialog2: TQExport3Dialog;
      btnExportar_Sintetico: TBitBtn;
      lblPatrimonioSocial: TLabel;
      CbPatriSocial: TwwDBComboBox;
      lblCoast: TLabel;
      lblPatriSocial: TLabel;
      lbloutros: TLabel;
      ppHeaderBand2: TppHeaderBand;
      ppLabel26: TppLabel;
      ppLabel29: TppLabel;
      ppLabel30: TppLabel;
      ppLabel31: TppLabel;
      ppLabel32: TppLabel;
      ppLabel33: TppLabel;
      ppLabel34: TppLabel;
      ppLabel35: TppLabel;
      lbPatro: TppLabel;
      lbPlano: TppLabel;
      ppLabel38: TppLabel;
      ppLabel39: TppLabel;
      ppLabel40: TppLabel;
      ppLabel41: TppLabel;
      ppLabel42: TppLabel;
      ppLabel53: TppLabel;
      ppDBImage2: TppDBImage;
      ppLabel54: TppLabel;
      ppLine4: TppLine;
      lbObs: TppLabel;
      ppDetailBand1: TppDetailBand;
      shpCorZebra: TppShape;
      lbVlrRentDia: TppDBText;
      ppDBText17: TppDBText;
      ppDBText16: TppDBText;
      ppDBText15: TppDBText;
      ppDBText14: TppDBText;
      ppDBText13: TppDBText;
      ppDBText11: TppDBText;
      ppDBText18: TppDBText;
      ppDBText5: TppDBText;
      ppFooterBand2: TppFooterBand;
      ppLine2: TppLine;
      lbSistema: TppLabel;
      ppSystemVariable3: TppSystemVariable;
      ppSystemVariable1: TppSystemVariable;
      ppSummaryBand2: TppSummaryBand;
      ppSubReport1: TppSubReport;
      ppChildReport1: TppChildReport;
      ppTitleBand1: TppTitleBand;
      ppLabel5: TppLabel;
      ppLabel7: TppLabel;
      ppLabel8: TppLabel;
      ppLabel10: TppLabel;
      ppLine3: TppLine;
      ppLabel9: TppLabel;
      ppLabel14: TppLabel;
      LblMesExtenso: TppLabel;
      ppLabel15: TppLabel;
      ppDetailBand2: TppDetailBand;
      ppDBText2: TppDBText;
      ppDBText4: TppDBText;
      ppDBText6: TppDBText;
      ppDBText7: TppDBText;
      ppDBText8: TppDBText;
      ppLabel11: TppLabel;
      ppLabel12: TppLabel;
      ppDBText10: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      raCodeModule1: TraCodeModule;
      ppGroup1: TppGroup;
      ppGroupHeaderBand1: TppGroupHeaderBand;
      ppLabel21: TppLabel;
      ppDBText3: TppDBText;
      ppLabel27: TppLabel;
      ppGroupFooterBand1: TppGroupFooterBand;
      ppLabel3: TppLabel;
      ppLabel6: TppLabel;
      vAcumPeriodo: TppVariable;
      dbRentPer: TppDBText;
      ppLabel13: TppLabel;
      ppLine6: TppLine;
      ppDBCalc1: TppDBCalc;
      ppGroup2: TppGroup;
      ppGroupHeaderBand2: TppGroupHeaderBand;
      ppLabel2: TppLabel;
      ppDBText1: TppDBText;
      ppLabel43: TppLabel;
      ppLabel44: TppLabel;
      ppLabel45: TppLabel;
      ppLabel46: TppLabel;
      ppLabel47: TppLabel;
      ppLabel48: TppLabel;
      ppLabel51: TppLabel;
      ppLabel49: TppLabel;
      ppLine1: TppLine;
      ppLabel50: TppLabel;
      ppGroupFooterBand2: TppGroupFooterBand;
      ppLabel1: TppLabel;
      ppLabel4: TppLabel;
      ppLine5: TppLine;
      vAcumMensal: TppVariable;
      dbRentMensal: TppDBText;
      ppCalcAcumuladoMensal: TppDBCalc;
      raCodeModule2: TraCodeModule;
      Procedure FormCreate(Sender: TObject);
      Procedure FormClose(Sender: TObject; Var Action: TCloseAction);
      Procedure bbtnConfirmarClick(Sender: TObject);
      Procedure dblkExercicioCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure bbtnImprimirClick(Sender: TObject);
      Procedure ppReport1BeforePrint(Sender: TObject);
      Procedure ppLabel29Print(Sender: TObject);
      Procedure ppLabel33Print(Sender: TObject);
      Procedure ppLabel42Print(Sender: TObject);
      Procedure ppLabel54Print(Sender: TObject);
      Procedure bbtnCancelarClick(Sender: TObject);
      Procedure CdsResultAfterOpen(DataSet: TDataSet);
      Procedure cdsPlanoPrevAfterOpen(DataSet: TDataSet);
      Procedure dbgrPatroCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbgrPatroTopRowChanged(Sender: TObject);
      Procedure lbSistemaPrint(Sender: TObject);
      Procedure lbObsPrint(Sender: TObject);
      Procedure shpCorZebraPrint(Sender: TObject);
      Procedure dbgridRentabCalcCellColors(Sender: TObject; Field: TField;
         State: TGridDrawState; Highlight: Boolean; AFont: TFont;
         ABrush: TBrush);
      Procedure dbRentPerPrint(Sender: TObject);
      Procedure lbVlrRentDiaPrint(Sender: TObject);
      Procedure ppGroupFooterBand1AfterPrint(Sender: TObject);
      Procedure ppSubReport1Print(Sender: TObject);
      Procedure ppGroupFooterBand2AfterPrint(Sender: TObject);
      Procedure ppCalcAcumuladoMensalPrint(Sender: TObject);
      Procedure dblkPeriodoCloseUp(Sender: TObject; LookupTable,
         FillTable: TDataSet; modified: Boolean);
      Procedure bbExportarClick(Sender: TObject);
      procedure bbtnSelTudoClick(Sender: TObject);
      procedure bbtnInverteClick(Sender: TObject);
      procedure pgcPatroPlanoResultChange(Sender: TObject);
      procedure CdsSpcConsisteAfterOpen(DataSet: TDataSet);
      procedure FormShow(Sender: TObject);
      procedure btnExportar_SinteticoClick(Sender: TObject);

   Private
      FdVlrRentPeriodo: Double;
      FsAcumuladoDoUltimoMes: String;
      iqtdpass, iqtdmes: integer;

      Procedure SetdVlrRentPeriodo(Const Value: Double);

      // WO13056 - Contabilidade - Rentabilidade contábil
      // Alterador por Arnaldo Vicente Scarin em 02/08/2024
      procedure LocalizaAdicionaRentabilidade(const pConta: String);
   Private
      { Private declarations }

      CtrlPeriodo: TCtrlPeriodo;
      CtrlContab: TCtrlContab;
      CtrlSPCConsiste: TCtrlSPCConsiste;
      CtrlPlanoData: TCtrlPlanoData;

      Property dVlrRentPeriodo: Double Read FdVlrRentPeriodo Write SetdVlrRentPeriodo;

      Procedure SelecionaRentabilidade();

   Public

      { Public declarations }
      Procedure Progresso(vParam: Array Of variant);
      Procedure CalculoRentabilidade;

   End;

Var
   FrmRentabilidadeContabilMT: TFrmRentabilidadeContabilMT;

Implementation
Var //Para Imprimir todos no relatório.
   ImpTodos: Boolean;

   {$R *.DFM}

Procedure TFrmRentabilidadeContabilMT.FormCreate(Sender: TObject);
Begin
   Inherited;

   CtrlPeriodo := TCtrlPeriodo.Create;
   CtrlPeriodo.Initialize(dtmBaseDados.dbBaseDados, True, Sistema.ConnectionType,
      Sistema.ConnectionSide, Sistema.AppRemoteServer, False);

   CdsExercicio.Data := CtrlPeriodo.ListExercicios(Sistema.IdEmpresa, True);

   CtrlContab := TCtrlContab.Create;
   CtrlContab.InitializeAs(CtrlPeriodo);

   If Not CtrlContab.SelecionaParametros(Sistema.IdEmpresa) Then
      MsgDlg('Não foi possível selecionar os parâmetros contábeis. ' + #13 +
         'Motivo: ' + CtrlContab.MessageInfo, 'Erro', mtError, [mbOk], 0);

   CtrlSPCConsiste := TCtrlSPCConsiste.Create;
   CtrlSPCConsiste.InitializeAs(CtrlPeriodo);

   CtrlPlanoData := TCtrlPlanoData.Create;
   CtrlPlanoData.InitializeAs(CtrlPeriodo);

   cdsRentab.data := CtrlSPCConsiste.AbreCdsRentab;

   CdsPlanoPrev.Data := CtrlSPCConsiste.ListaPlano;
   CdsPatro.Data := CtrlSPCConsiste.ListaPatro;
   CdsFundacao.Data := CtrlSPCConsiste.ListaImagem(Sistema.IdEmpresa);
   cdsResult.Data := CtrlSPCConsiste.AbreCdsResult;

   CtrlSPCConsiste.Progresso := Progresso;
   pgcPatroPlanoResult.ActivePageIndex := 0;

End;

Procedure TFrmRentabilidadeContabilMT.FormClose(Sender: TObject;
   Var Action: TCloseAction);
Begin

   FreeAndNil(CtrlPlanoData);

   FreeAndNil(CtrlPeriodo);
   FreeAndNil(CtrlContab);
   FreeAndNil(CtrlSPCConsiste);

   Inherited;

End;

Procedure TFrmRentabilidadeContabilMT.bbtnConfirmarClick(Sender: TObject);
Var
   sMes, sPlano, sPatro: String;
   iAtivo, iCAtivo: integer;
Begin
   Inherited;
   CdsResult.Data := CtrlSPCConsiste.AbreCdsResult;

   //Testa os períodos escolhidos
   If (StrToInt(dblkPeriodoFim.LookupValue) < StrToInt(dblkPeriodo.LookupValue)) Then
      Begin
         MsgDlg('O período final não pode ser um mês anterior ao período do mês inicial', 'Aviso', mtWarning, [mbOK], 0);
         dblkPeriodoFim.SetFocus;
         Exit;
      End;

   //Marilza Colpani 25/06/2009 N.Sol: 120911 - N.Kintana: 576909
   // Variáveis que guardam a quantidade de meses escolhidos para a geração dos relatório.
   iqtdpass := 0;
   iqtdmes := 1 + StrToInt(dblkPeriodoFim.LookupValue) - StrToInt(dblkPeriodo.LookupValue);

   //Testa se foi escolhido a Patro
   cdsPatro.First;
   While Not cdsPatro.EOF Do
      Begin
         If cdsPatro.FieldByName('MARCA').AsString = 'S' Then
            Begin
               If Trim(sPatro) = '' Then
                  sPatro := trim(IntToStr(cdsPatro.FieldByName('IDPESSOA').AsInteger))
               Else
                  sPatro := sPatro + ',' + trim(IntToStr(cdsPatro.FieldByName('IDPESSOA').AsInteger));
            End;
         cdsPatro.Next;
      End;

   //Testa se foi escolhido o Plano Previdenciário
   cdsPlanoPrev.First;
   While Not cdsPlanoPrev.EOF Do
      Begin
         If cdsPlanoPrev.FieldByName('MARCA').AsString = 'S' Then
            Begin
               If Trim(sPlano) = '' Then
                  sPlano := trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger))
               Else
                  sPlano := sPlano + ',' + trim(IntToStr(cdsPlanoPrev.FieldByName('IDPLANOPREV').AsInteger));
            End;
         cdsPlanoPrev.Next;
      End;

   Try

      CdsSpcConsiste.DisableControls;

      CdsSpcConsiste.Filtered := False;
      CdsSpcConsiste.Filter := 'Marca = ''S'' ';
      CdsSpcConsiste.Filtered := True;

      Case CdsSpcConsiste.RecordCount Of
         0: Begin
               MsgDlg('Pelo menos uma rentabilidade deve ser escolhida', 'Atenção', mtWarning, [mbOk], 0);
               CdsSpcConsiste.Filtered := False;
               pgcPatroPlanoResult.ActivePage := tbRentab;
               exit;

            End;

         1: Begin
               dVlrRentPeriodo := vAcumPeriodo.AsDouble;
               If Not CtrlSPCConsiste.ProcessaRentabilidade(StrToInt(dblkExercicio.LookupValue),
                                                            StrToInt(dblkPeriodo.LookupValue),
                                                            StrToInt(dblkPeriodoFim.LookupValue),
                                                            CdsSpcConsiste.FieldbyName('IDSPCCONSISTE').AsInteger,
                                                            sPlano, sPatro, chkDesconsidera.Checked,
                                                            cdsResult, FdVlrRentPeriodo, Sistema.IdEmpresa,
                                                            CdsSpcConsiste.FieldbyName('PLANO').AsInteger,
                                                            CbCusto.Value[1],
                                                            CbOutros.Value[1],
                                                            CbPatriSocial.Value[1] // Paulo Nobre - WO21525
                                                           ) Then
                  MsgDlg('Houve um erro ao processar a rentabilidade contábil. ' + #13 +
                         'Motivo: ' + CtrlSPCConsiste.MessageInfo, 'Erro', mtError, [mbOk], 0);

               CdsSpcConsiste.Filtered := False;
            End;

      Else
         Begin
            CdsSpcConsiste.first;
            While Not CdsSpcConsiste.Eof Do
            Begin
               dVlrRentPeriodo := vAcumPeriodo.AsDouble;
               If Not CtrlSPCConsiste.ProcessaRentabilidade(StrToInt(dblkExercicio.LookupValue),
                                                            StrToInt(dblkPeriodo.LookupValue),
                                                            StrToInt(dblkPeriodoFim.LookupValue),
                                                            CdsSpcConsiste.FieldbyName('IDSPCCONSISTE').AsInteger,
                                                            sPlano, sPatro, chkDesconsidera.Checked,
                                                            cdsResult, FdVlrRentPeriodo, Sistema.IdEmpresa,
                                                            -1,
                                                            CbCusto.Value[1],
                                                            CbOutros.Value[1],
                                                            CbPatriSocial.Value[1] //MARCELO CARDOSO - SIG26555
                                                           ) Then
                  MsgDlg('Houve um erro ao processar a rentabilidade contábil. ' + #13 +
                         'Motivo: ' + CtrlSPCConsiste.MessageInfo, 'Erro', mtError, [mbOk], 0);

               LocalizaAdicionaRentabilidade(CdsResult.fieldbyName('DESCRICAO').AsString);
               CdsSpcConsiste.Next;
            End;
            CdsSpcConsiste.Filtered := False;
         End;
      End;

   Finally
      CdsSpcConsiste.EnableControls;

   End;

   grpPatro.Enabled              := False;
   grpPlanoPrev.Enabled          := False;
   pnlFundo.Enabled              := True;
   bbtnConfirmar.Enabled         := False;
   bbtnCancelar.Enabled          := True;
   bbtnImprimir.Enabled          := True;
   bbExportar.Enabled            := True;
   
   //Otacilio Aquino 19/09/2011 N.Sol: 157360 - N.Kintana: 1254510
   btnExportar_Sintetico.Enabled := True;

   //Faz o Clone para usar os valores no Sumário
   CalculoRentabilidade;

   //Marcus Oliveira disparar logo o imprimir
   // SOL
//   bbtnImprimir.Click;

End;

Procedure TFrmRentabilidadeContabilMT.dblkExercicioCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   dblkPeriodo.LookupValue := '';
   CdsPeriodo.Close;
   If trim(dblkExercicio.Text) <> '' Then
      Begin
         dblkPeriodo.Enabled := True;
         CdsPeriodo.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa, tbpTodos,
            StrToInt(trim(dblkExercicio.Text)), 0);

         dblkPeriodoFim.Enabled := True;
         CdsPeriodoFim.Data := CtrlPeriodo.ListPeriodo(Sistema.IdEmpresa, tbpTodos,
            StrToInt(trim(dblkExercicio.Text)), 0);
      End
   Else
      Begin
         dblkPeriodo.Enabled := False;
         dblkPeriodoFim.Enabled := False;
      End;
End;

Procedure TFrmRentabilidadeContabilMT.bbtnImprimirClick(Sender: TObject);
Begin
   Inherited;
   If dblkPeriodoFim.Text = '' Then
      ppLabel53.Caption := 'Rentabilidade Acumulada'
   Else
      ppLabel53.Caption := 'Rentabilidade Contábil'; //+ UpperCase(copy(dblkPeriodoFim.Text,1,1)) + LowerCase(copy(dblkPeriodoFim.Text,2,length(dblkPeriodoFim.Text)));

   TFrmPreview.CreateModalPreview(Application, ppReport1, 'Rentabilidade Contábil - Relatório');
End;

Procedure TFrmRentabilidadeContabilMT.ppReport1BeforePrint(Sender: TObject);
Var
   sTexto: String;
Begin
   Inherited;

   Try
      CdsPlanoPrev.DisableControls;
      CdsPatro.DisableControls;

      // Plano
      CdsPlanoPrev.First;
      While Not CdsPlanoPrev.Eof Do
         Begin
            If CdsPlanoPrev.FieldByName('MARCA').AsString = 'S' Then
               Begin
                  If Trim(sTexto) <> '' Then
                     sTexto := sTexto + ',  ' + CdsPlanoPrev.FieldByName('NOME').AsString
                  Else
                     sTexto := CdsPlanoPrev.FieldByName('NOME').AsString;
               End;

            CdsPlanoPrev.Next;
         End;

      If Trim(sTexto) <> '' Then
         lbPlano.Caption := sTexto
      Else
         lbPlano.Caption := 'Todos';

      // Patrocinadora
      sTexto := '';
      CdsPatro.First;
      While Not CdsPatro.Eof Do
         Begin
            If CdsPatro.FieldByName('MARCA').AsString = 'S' Then
               Begin
                  If Trim(sTexto) <> '' Then
                     sTexto := sTexto + ',  ' + CdsPatro.FieldByName('NOME').AsString
                  Else
                     sTexto := CdsPatro.FieldByName('NOME').AsString;
               End;

            CdsPatro.Next;
         End;

      If Trim(sTexto) <> '' Then
         lbPatro.Caption := sTexto
      Else
         lbPatro.Caption := 'Todos';

      CdsPlanoPrev.First;
      CdsPatro.First;

   Finally
      CdsPlanoPrev.EnableControls;
      CdsPatro.EnableControls;

   End;

End;

Procedure TFrmRentabilidadeContabilMT.ppLabel29Print(Sender: TObject);
Begin
   Inherited;
   ppLabel29.Text := dblkExercicio.LookupValue;
End;

Procedure TFrmRentabilidadeContabilMT.ppLabel33Print(Sender: TObject);
Begin
   Inherited;
   ppLabel33.Text := dblkPeriodo.Text;
End;

Procedure TFrmRentabilidadeContabilMT.ppLabel42Print(Sender: TObject);
Begin
   Inherited;
   ppLabel42.Text := dblkPeriodoFim.Text;
   LblMesExtenso.Text := dblkPeriodoFim.Text;
   ppLabel15.Text := dblkPeriodoFim.Text;
End;

Procedure TFrmRentabilidadeContabilMT.ppLabel54Print(Sender: TObject);
Begin
   Inherited;
   pplabel54.Text := Sistema.NomeEmpresa;
End;

Procedure TFrmRentabilidadeContabilMT.bbtnCancelarClick(Sender: TObject);
Begin
   Inherited;
   cdsResult.Close;
   pgcPatroPlanoResult.Pages[1].TabVisible := False;
   pgcPatroPlanoResult.ActivePage          := tbsPlanoPatro;
   bbtnConfirmar.Enabled                   := True;
   bbtnCancelar.Enabled                    := False;
   bbtnImprimir.Enabled                    := False;
   bbExportar.Enabled                      := False;
   grpPatro.Enabled                        := True;
   grpPlanoPrev.Enabled                    := True;

   //Otacilio Aquino 19/09/2011 N.Sol: 157360 - N.Kintana: 1254510
   btnExportar_Sintetico.Enabled           := False;
   
   cdsRentab.EmptyDataSet;

End;

Procedure TFrmRentabilidadeContabilMT.CdsResultAfterOpen(
   DataSet: TDataSet);
Begin
   Inherited;
   TFloatField(cdsResult.FieldByName('DATA')).DisplayFormat := 'dd/mm/yyyy';
   TFloatField(cdsResult.FieldByName('ATIVO')).DisplayFormat := '#,##0.00';
   TFloatField(cdsResult.FieldByName('PASSIVO')).DisplayFormat := '#,##0.00';
   TFloatField(cdsResult.FieldByName('LIQUIDO')).DisplayFormat := '#,##0.00';
   TFloatField(cdsResult.FieldByName('RECEITA')).DisplayFormat := '#,##0.00';
   TFloatField(cdsResult.FieldByName('DESPESA')).DisplayFormat := '#,##0.00';
   TFloatField(cdsResult.FieldByName('MES')).DisplayFormat := '#,##0.00';
   TFloatField(cdsResult.FieldByName('DIA')).DisplayFormat := '#,##0.00';
   TFloatField(cdsResult.FieldByName('RENTDIA')).DisplayFormat := '#.##000';
   TFloatField(cdsResult.FieldByName('RENTMENSAL')).DisplayFormat := '#.##000';
   TFloatField(cdsResult.FieldByName('RENTPERIODO')).DisplayFormat := '#.##000';

End;

Procedure TFrmRentabilidadeContabilMT.cdsPlanoPrevAfterOpen(
   DataSet: TDataSet);
Begin
   Inherited;
   TStringField(DataSet.FieldByName('NOME')).ReadOnly := True;
End;

Procedure TFrmRentabilidadeContabilMT.dbgrPatroCalcCellColors(
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

Procedure TFrmRentabilidadeContabilMT.dbgrPatroTopRowChanged(
   Sender: TObject);
Begin
   Inherited;
   (sender As TwwDBGrid).Invalidate;
End;

Procedure TFrmRentabilidadeContabilMT.Progresso(vParam: Array Of variant);
// 0 (1-Mostra,2-Anda,3-Esconde)
// 1 Legenda
// 2 Minimo
// 3 Posicao
// 4 Máximo
//
Begin
   Case vParam[0] Of
      1: Begin
            frmProgresso.MostraFormProgresso(vParam[1], False, False, True, vParam[2], vParam[3]);
         End;

      2: Begin
            frmProgresso.AndaFormProgresso(vParam[3], vParam[4]);
         End;

      3: Begin
            frmProgresso.EscondeFormProgresso;
         End;
   End;

   Application.ProcessMessages;
   Repaint;
End;

Procedure TFrmRentabilidadeContabilMT.lbSistemaPrint(Sender: TObject);
Begin
   Inherited;
   lbSistema.Caption := Sistema.NomeAplicativo;
End;

Procedure TFrmRentabilidadeContabilMT.lbObsPrint(Sender: TObject);
Begin
   Inherited;
   If chkDesconsidera.Checked Then
      lbObs.Caption := 'Contas de encerramento de resultado desconsideradas'
   Else
      lbObs.Caption := '';
End;

Procedure TFrmRentabilidadeContabilMT.shpCorZebraPrint(Sender: TObject);
Begin
   Inherited;
   If shpCorZebra.Brush.Color = clWhite Then
      shpCorZebra.Brush.Color := $00E2E2E2
   Else
      shpCorZebra.Brush.Color := clWhite;
End;

Procedure TFrmRentabilidadeContabilMT.dbgridRentabCalcCellColors(
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

Procedure TFrmRentabilidadeContabilMT.CalculoRentabilidade;
Var
   dDia, dLiqdiaAnt: double;

Begin

   CdsResult.First;
   CdsResult.Next;

   While Not CdsResult.eof Do
      Begin
         dDia := CdsResult.FieldByName('DIA').AsFloat;

         CdsResult.Prior;

         dLiqdiaAnt := CdsResult.FieldByName('LIQUIDO').AsFloat;

         CdsResult.Next;
         CdsResult.edit;

         If dLiqdiaAnt <> 0 Then

            CdsResult.FieldByName('RENTDIA').AsFloat := ((dDia / dLiqdiaAnt) + 1)
         Else
            CdsResult.FieldByName('RENTDIA').AsFloat := 1;

         CdsResult.post;
         CdsResult.Next;

      End;

End;

Procedure TFrmRentabilidadeContabilMT.SetdVlrRentPeriodo(
   Const Value: Double);
Begin
   FdVlrRentPeriodo := Value;
End;

Procedure TFrmRentabilidadeContabilMT.dbRentPerPrint(Sender: TObject);
Begin
   Inherited;
   CdsResult.Edit;
   CdsResult.FieldByName('RENTPERIODO').AsFloat := ((vAcumPeriodo.Value - 1) * 100);
   CdsResult.Post;

End;

Procedure TFrmRentabilidadeContabilMT.lbVlrRentDiaPrint(Sender: TObject);
Begin

   Inherited;

   //Seta quando inicia o periodo

   If CtrlSPCConsiste.EUltimoDiaMes(CdsResult.fieldbyname('DATA').AsDateTime) Then
      Begin
         CdsResult.edit;
         //CdsResult.FieldByName('RENTMENSAL').AsFloat := ( ( CdsResult.FieldByName('RENTDIA').AsFloat * vAcumMensal.Value) -1 ) * 100;
         CdsResult.post;
         vAcumMensal.Value := 1
      End
   Else
      vAcumMensal.Value := (CdsResult.FieldByName('RENTDIA').AsFloat * vAcumMensal.Value);

   If vAcumPeriodo.Value = 0 Then
      vAcumPeriodo.Value := 1
   Else
      vAcumPeriodo.Value := (cdsResult.FieldByName('RENTDIA').AsFloat * vAcumPeriodo.Value);

End;

// WO13056 - Contabilidade - Rentabilidade contábil
// Alterador por Arnaldo Vicente Scarin em 02/08/2024
procedure TFrmRentabilidadeContabilMT.LocalizaAdicionaRentabilidade(const pConta : String);
// Alterado por Arnaldo V. Scarin em 09/03/2009 - SOL 110681 Kintana 506853
   Function Localizar(oPesquisa: String): Boolean;
   Begin
      Result := False;
      cdsRentab.First;
      While Not cdsRentab.Eof Do
         Begin
            If cdsRentab.FieldByName('DESCRICAO').asString = oPesquisa Then
               Begin
                  Result := True;
                  break;
               End;
            cdsRentab.Next;
         End;
   End;
begin
   // Alterado por Arnaldo V. Scarin em 09/03/2009 - SOL 110681 Kintana 506853
   // Essa alteração se fez necessária, por mais estranha que seja, por que quando era feita uma pesquisa com
   // o metodo locate do clientDataSet gerava um exception que indicava o erro dentro da Kernel.DLL ou da
   // Midas.DLL. Por conta disso, foi feito esse método localizar, que se baseia numa pesquisa sequencial para
   // localizar a existencia ou não de um registro.
   // Linha Original: if not ( cdsRentab.Locate('DESCRICAO', CdsResult.fieldbyname('DESCRICAO').AsString, [LoCaseInsensitive]) ) then

   If Not Localizar(pConta) Then
   Begin
     cdsRentab.Append;
     cdsRentab.FieldByName('DESCRICAO').AsString := pConta;
   End
   Else
     cdsRentab.Edit;

   // WO13056 - Contabilidade - Rentabilidade contábil
   // Alterador por Arnaldo Vicente Scarin em 02/08/2024
   if cdsRentab.fieldbyname('ULT_MES').AsString = '' then
     cdsRentab.fieldbyname('ULT_MES').AsString := FormatFloat('#,##0.00', CtrlSPCConsiste.ValorUltimoMesDisponibilidade);
end;

Procedure TFrmRentabilidadeContabilMT.ppGroupFooterBand1AfterPrint(Sender: TObject);
Begin
   Inherited;

   vAcumPeriodo.Value := 0;
   // Só adiciona a rentabilidade quando ela não existir, pra não correr risco de navegação, repetila. Só pega a ultima linha do mes.

   LocalizaAdicionaRentabilidade(CdsResult.fieldbyName('DESCRICAO').AsString);

   cdsRentab.fieldbyname('LIQUIDO').AsFloat := CdsResult.fieldbyname('LIQUIDO').AsFloat;
   cdsRentab.fieldbyname('MES').AsFloat := CdsResult.fieldbyname('MES').AsFloat;
   cdsRentab.fieldbyname('RENTMENSAL').AsFloat := CdsResult.fieldbyname('RENTMENSAL').AsFloat;
   cdsRentab.fieldbyname('RENTPERIODO').AsFloat := CdsResult.fieldbyname('RENTPERIODO').AsFloat;

   cdsRentab.Post;

   FsAcumuladoDoUltimoMes := '0,00';

End;

Procedure TFrmRentabilidadeContabilMT.ppSubReport1Print(Sender: TObject);
Begin
   Inherited;
   cdsRentab.IndexFieldNames := 'DESCRICAO';

End;

Procedure TFrmRentabilidadeContabilMT.ppGroupFooterBand2AfterPrint(
   Sender: TObject);
Begin
   Inherited;
   vAcumMensal.Value := 0;
End;

Procedure TFrmRentabilidadeContabilMT.ppCalcAcumuladoMensalPrint(Sender: TObject);
Begin
   Inherited;
   //Marilza Colpani 25/06/2009 N.Sol: 120911 - N.Kintana: 576909
   If iqtdmes > iqtdpass Then
      Begin
         If (ppCalcAcumuladoMensal.Text <> '0,00') Then
            FsAcumuladoDoUltimoMes := ppCalcAcumuladoMensal.Text
         Else
            FsAcumuladoDoUltimoMes := '0,00';
         inc(iqtdpass);
      End
   Else
      iqtdpass := 0;
   // Fim
End;

Procedure TFrmRentabilidadeContabilMT.SelecionaRentabilidade();

   Procedure LocalizaPeriodo(pDbLookup: TwwDBLookupCombo);
   Begin
      If pDbLookup.LookupTable.Locate('PERNOME', pDbLookup.Text, [loPartialKey]) Then
         pDbLookup.LookupValue := dblkPeriodoFim.LookupTable.fieldByName('PerNumero').AsString
      Else
         pDbLookup.LookupValue := '-1';
   End;

Var iPlano: Integer;
Begin
   cdsSPCConsiste.Close;

   If (trim(dblkPeriodo.Text) <> '') And (Trim(dblkPeriodoFim.Text) <> '') Then
      Begin
         If dblkPeriodo.LookupValue = '' Then
            LocalizaPeriodo(dblkPeriodo);

         If dblkPeriodoFim.LookupValue = '' Then
            LocalizaPeriodo(dblkPeriodoFim);

         If (CtrlPlanoData.PlanoNoPeriodo(StrToInt(dblkExercicio.LookupValue),
            StrToInt(dblkPeriodo.LookupValue),
            StrToInt(dblkPeriodoFim.LookupValue))) Then
            iPlano := CtrlPlanoData.Plano
         Else
            Begin
               MsgDlg(CtrlPlanoData.MessageInfo, Sistema.NomeModulo, mtWarning, [mbOk], 0);
               Exit;
            End;
         cdsSPCConsiste.Data := CtrlSPCConsiste.SelecionaTipoRentConabil(iPlano);
         cdsSPCConsiste.First;
      End;
End;

//Cássio - SOL Nº 43993 KINTANA Nº 523266

Procedure TFrmRentabilidadeContabilMT.dblkPeriodoCloseUp(Sender: TObject;
   LookupTable, FillTable: TDataSet; modified: Boolean);
Begin
   Inherited;
   SelecionaRentabilidade();
End;

Procedure TFrmRentabilidadeContabilMT.bbExportarClick(Sender: TObject);
Begin
   Inherited;
   QExport3Dialog1.Execute;
End;

procedure TFrmRentabilidadeContabilMT.bbtnSelTudoClick(Sender: TObject);
begin
  inherited;
   CdsSpcConsiste.DisableControls;
   CdsSpcConsiste.First;
   While Not CdsSpcConsiste.Eof Do
      Begin
         CdsSpcConsiste.Edit;
         CdsSpcConsiste.FieldByName('Marca').AsString := 'S';

         CdsSpcConsiste.Next;
      End;
   CdsSpcConsiste.First;
   CdsSpcConsiste.EnableControls;
end;

procedure TFrmRentabilidadeContabilMT.bbtnInverteClick(Sender: TObject);
begin
  inherited;
   CdsSpcConsiste.DisableControls;
   CdsSpcConsiste.First;
   While Not CdsSpcConsiste.Eof Do
      Begin
         CdsSpcConsiste.Edit;
         if CdsSpcConsiste.FieldByName('Marca').AsString = 'S' then
            CdsSpcConsiste.FieldByName('Marca').AsString := 'N'
         else
            CdsSpcConsiste.FieldByName('Marca').AsString := 'S';

         CdsSpcConsiste.Next;
      End;
   CdsSpcConsiste.First;
   CdsSpcConsiste.EnableControls;
end;

procedure TFrmRentabilidadeContabilMT.pgcPatroPlanoResultChange(
  Sender: TObject);
begin
  inherited;
 if pgcPatroPlanoResult.ActivePage = tbsPlanoPatro then
 begin
    bbtnInverte.Enabled := False;
 end
 else
     if (pgcPatroPlanoResult.ActivePage = tbRentab) and (not CdsSpcConsiste.IsEmpty) then
      begin
        bbtnInverte.Enabled := True;
      end;



end;

procedure TFrmRentabilidadeContabilMT.CdsSpcConsisteAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if (pgcPatroPlanoResult.ActivePage = tbRentab) and (not CdsSpcConsiste.IsEmpty) then
      begin
        bbtnInverte.Enabled := True;
      end;
end;

procedure TFrmRentabilidadeContabilMT.FormShow(Sender: TObject);
begin
  inherited;
  bbExportar.Caption            := 'Exportar' + #13 + 'Analítico';
  btnExportar_Sintetico.Caption := 'Exportar' + #13 + 'Sintético';

  // Paulo Nobre - WO17588
//  CbPatriSocial.ItemIndex := 0; // "Nenhum" como default     // Paulo Nobre - WO21525
  //
end;

procedure TFrmRentabilidadeContabilMT.btnExportar_SinteticoClick(
  Sender: TObject);
begin
  inherited;
  //Otacilio Aquino 19/09/2011 N.Sol: 157360 - N.Kintana: 1254510  Inicio
  FrmPreview := TFrmPreview.Create(Application);
  FrmPreview.ppViewer1.Visible := False;
  FrmPreview.ppViewer1.Report  := ppReport1;
  FrmPreview.ppViewer1.Report.ResetDevices;
  FrmPreview.ppViewer1.Report.PrintToDevices;
  FreeAndNil(FrmPreview);
  QExport3Dialog2.Execute;
  //Otacilio Aquino 19/09/2011 N.Sol: 157360 - N.Kintana: 1254510  Fim
end;


End.

