// Alterações:
{ --------------------------------------------------------------------------------------------------
Autor     : André Tavares
Data      : 31/11/2007
Pendência : 26667
Descrição : Alterei a query de SqlRateio, SqlRelPorDoc ( troquei as unions por union all)
{ --------------------------------------------------------------------------------------------------

{ --------------------------------------------------------------------------------------------------
Autor     : Marcus Oliveira
Data      : 12/04/2007
Pendência : 24823
Descrição : Ativa o portadorconta
{ --------------------------------------------------------------------------------------------------
Autor     : Marcus Oliveira
Data      : 21/03/2006
Pendência : 24780
Descrição : Alterado o Label do Favorecido para Banco Favorecido.
{--------------------------------------------------------------------------------
Rotina    : IsCpmfConsistente
Data      : 24/11/2006
Autor     : André Tavares
Descrição : a tela está utilizando o método da ctrlConcilia pois havia o mesmo método implementado 2 vezes
Pendência : 23827
--------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 02/03/2006
Pendência : 19184
Descrição : Inserido na qry SQLRateio, o campo TRD.FLGCALCULAIMPOSTO, para validar ativação do flg
            e informar no relatório.
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Rotina    : CdsLotesBeforePost
Autor     : Alex Pereira
Data      : 11/03/2005
Pendência : -
Descrição : Criada a possibilidade de se conciliar uma CPMF, mesmo divergente
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 20/01/2005
Pendência : 18392
Descrição : Desmarcar o flg OK e marcar o fgl Recalcula dos registros pintados de rosa
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 13/01/2005
Pendência : 18475
Descrição : Após a criação do lote e emissão da forma de pagamento (bordero/cheque/arquivo),
            se este mesmo lote é cancelado, a CPMF gerada não está sendo excluída da tela de Conciliação
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 20/12/2004
Pendência : 18349
Descrição : Verifcar se as CPMF's cadastradas na tabela de vigência são todas iguais
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 21/12/2004
Pendência : 18362
Descrição : Alterar o grid com campos novos
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Rodolpho da Silva
Data      : 21/12/2004
Pendência : 18363
Descrição : Inserir no final do grid as CPMF's não calculadas
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Alex Pererira
Data      : 24/08/2004
Pendência : 17419
Descrição : Implementar relatóirio para verificar os documentos que não
            calcularam CPMF
---------------------------------------------------------------------------------------------------}
{ --------------------------------------------------------------------------------------------------
Autor     : Alex Pererira
Data      : 03/08/2004
Descrição : Relatório CPMF por data - fazer o total previsto e o total
            calculado baterem com a tela de conciliação.
            Ajustando a diferença no último registro.
            Solução discutida com Darcy.
            Trocando o foco da CPMF prevista para CPMF calculada

Data      : 22/12/2004 - Restaurar o processo anterior
---------------------------------------------------------------------------------------------------}

{ --------------------------------------------------------------------------------------------------
Rotina    : -
Data      : 02/07/2003
Autor     : André Pontes
Descrição : Retirada da "orelha" onde se alterava a alíquota de todos os registros CPMF
---------------------------------------------------------------------------------------------------}
{*******************************************************}
{                                                       }
{ CM Soluções Informática  - Contas a Pagar \ Receber   }
{ ** Todos os Direitos Reservados                       }
{                                                       }
{ - Conciliação de CPMF                                 }
{ - Manutenção da Alíquota e Vigência de CPMF           }
{ - Baixa de CPMF                                       }
{ - Auditoria de CPMF                                   }
{                                                       }
{ Analista Responsável: Gustavo Viegas                  }
{ Atualizado Em: 26/12/2002                             }
{                                                       }
{*******************************************************}

unit FConciliaCPMFMT;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, CMProcuraSubTipo, Grids, Wwdbigrd,
   Wwdbgrid, ComCtrls, TREdit, Db, DBTables, Wwdatsrc, DBCtrls,
   ZipMstr, Menus, uCtrlConciliaCPMF, ImgList, wwdbdatetimepicker,
   CMDateTimePicker, DBClient, wwdblook, CMDBLookupCombo, uCMClientDataSet, uCmSqlParams,
   ppComm, ppRelatv, ppProd, ppClass, ppReport, ppCtrls, ppPrnabl, ppBands,
   ppCache, ppVar, ppDB, ppDBPipe, ppStrtch, ppSubRpt, uMidasUtil, FBaixaCPMFMT, uCtrlImpostoRetido;

type
   TTipoRelatCPMF = (trSintetico, trAnalitico, trAnaliticoInconsistente, trAnaliticoPorData, trFaltamRelacionamentos);

   TFrmConciliaCPMFMT = class(TfrmOkCancelar)
      PagCpmf: TPageControl;
      TbsConcilia: TTabSheet;
      PnlFiltro: TPanel;
      ProcForn: TCMProcuraForCli;
      GroupBox1: TGroupBox;
      DtProg: TCMDateTimePicker;
      GroupBox2: TGroupBox;
      ReNumLote: TRealEdit;
      BtnSeleciona: TBitBtn;
      PnlTotaVenc: TPanel;
      SbAdTodos: TBitBtn;
      SbAdInverte: TBitBtn;
      DsLotes: TwwDataSource;
      RgTipoSel: TRadioGroup;
      GroupBox3: TGroupBox;
      EdtCpmf: TRealEdit;
      BtnImprime: TBitBtn;
      CkbInconsistentes: TCheckBox;
      Lblval: TLabel;
      Bevel1: TBevel;
      TbsAuditoria: TTabSheet;
      ImlDocs: TImageList;
      BtnEmail: TBitBtn;
      BtnRecalcula: TBitBtn;
      BitBtn1: TBitBtn;
      BitBtn2: TBitBtn;
      Memo1: TMemo;
      RgDeviceOut: TRadioGroup;
      Bevel2: TBevel;
      Pb: TProgressBar;
      LblProgressInfo: TLabel;
      Bevel3: TBevel;
      PnlFileName: TPanel;
      Label2: TLabel;
      EdtNomeArquivo: TEdit;
      SpeedButton1: TSpeedButton;
      BtnProcessa: TBitBtn;
      BtnCancelaProc: TBitBtn;
      Bevel4: TBevel;
      TbsManutCpmf: TTabSheet;
      Panel1: TPanel;
      Label1: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      CMDateTimePicker1: TCMDateTimePicker;
      CMDateTimePicker2: TCMDateTimePicker;
      ReAliquota: TDBRealEdit;
      GrdManut: TwwDBGrid;
      BtnManutAll: TBitBtn;
      BtnManutInverte: TBitBtn;
      Bevel5: TBevel;
      BitBtn5: TBitBtn;
      Bevel6: TBevel;
      DsManutCpmf: TwwDataSource;
      TbsBaixas: TTabSheet;
      CmpBaixas: TCMProcuraForCli;
      dblkFormaPag: TwwDBLookupCombo;
      FormaPag: TLabel;
      Label5: TLabel;
      Label6: TLabel;
      DtProgBaixa: TCMDateTimePicker;
      ReNumLoteBaixa: TRealEdit;
      BtnSelBaixa: TBitBtn;
      Panel2: TPanel;
      grdBaixa: TwwDBGrid;
      Panel3: TPanel;
      btnMarcaTodasBaixas: TBitBtn;
      btnInverteBaixa: TBitBtn;
      Panel4: TPanel;
      BtnBaixa: TBitBtn;
      DsLotesBaixas: TwwDataSource;
      GrdLotes: TwwDBGrid;
      GroupBox4: TGroupBox;
      CmbContaBancaria: TCMDBLookupCombo;
      Label7: TLabel;
      CmbContaBancaria2: TCMDBLookupCombo;
      ppmDataRetencao: TPopupMenu;
      MnuAltDataRetencao: TMenuItem;
      DlgFile: TOpenDialog;
      ZipFile: TZipMaster;
      SQLContasCaixas: TCMSqlParams;
      CdsContasCaixas: TCMClientDataSet;
      SQLPortConta: TCMSqlParams;
      CdsPortConta: TCMClientDataSet;
      CdsManutCpmf: TCMClientDataSet;
      SQLManutCpmf: TCMSqlParams;
      CdsLotes: TCMClientDataSet;
      CdsLotesBaixas: TCMClientDataSet;
      SqlVerificaCPMF: TCMSqlParams;
      CdsVerificaCPMF: TCMClientDataSet;
      SqlCPFMNaoCalc: TCMSqlParams;
      CdsCPFMNaoCalc: TCMClientDataSet;
      Shape1: TShape;
      Label8: TLabel;
      Shape2: TShape;
      Label9: TLabel;
      rptLotesCPMF: TppReport;
      ppHeaderBand1: TppHeaderBand;
      ppDetailBand1: TppDetailBand;
      ppFooterBand1: TppFooterBand;
      ppDbLogo: TppDBImage;
      ppLbEmpresa: TppLabel;
      ppLbTitulo: TppLabel;
      ppLbDescricao: TppLabel;
      ppSystemVariable2: TppSystemVariable;
      ppLbNomeSistema: TppLabel;
      ppSystemVariable1: TppSystemVariable;
      ppLabel1: TppLabel;
      ppLabel2: TppLabel;
      ppLabel3: TppLabel;
      ppLabel4: TppLabel;
      ppLabel5: TppLabel;
      ppLabel6: TppLabel;
      ppLabel7: TppLabel;
      ppLine1: TppLine;
      ppLine2: TppLine;
    ppPipLinDadosRel: TppDBPipeline;
      ppDBText1: TppDBText;
      ppDBText2: TppDBText;
      ppDBText3: TppDBText;
      ppDBVlrLote: TppDBText;
      ppDBBaseCalc: TppDBText;
      ppDBVlrPrev: TppDBText;
      ppDBVlrCalc: TppDBText;
      ppSummaryBand1: TppSummaryBand;
      ppLabel8: TppLabel;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppDBCalc3: TppDBCalc;
      ppDBCalc4: TppDBCalc;
      ppLine3: TppLine;
      ppShpCorLinha: TppShape;
      ppLinhaDrilDraw: TppLine;
    ppLine4: TppLine;
    CdsDadosEmpresa: TCMClientDataSet;
    SqlDadosEmpresa: TCMSqlParams;
    ppPipLinDadosEmpresa: TppDBPipeline;
    dsDadosEmpresa: TwwDataSource;
    SqlRelPorDoc: TCMSqlParams;
    CdsRelPorDoc: TCMClientDataSet;
    dsRelPorDoc: TwwDataSource;
    ppPipLinRelPorDoc: TppDBPipeline;
    ppSubRepDoc: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel12: TppLabel;
    ppDBText8: TppDBText;
    ppLabel13: TppLabel;
    ppShape1: TppShape;
    ppSummaryBand2: TppSummaryBand;
    ppLine5: TppLine;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    SqlRateio: TCMSqlParams;
    CdsRateio: TCMClientDataSet;
    dsRateio: TwwDataSource;
    ppPipLinRateio: TppDBPipeline;
    ppSubRepRat: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppSummaryBand3: TppSummaryBand;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppLabel17: TppLabel;
    ppDBText11: TppDBText;
    ppLabel18: TppLabel;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppShape4: TppShape;
    ppLine6: TppLine;
    ppLabel16: TppLabel;
    ppLabel21: TppLabel;
    ppShpCorZebra: TppShape;
    CdsRelPorDocNUMLOTE: TFloatField;
    CdsRelPorDocCODDOCUMENTO: TFloatField;
    CdsRelPorDocNUMAPGR: TFloatField;
    CdsRelPorDocNOME: TStringField;
    CdsRelPorDocDATAEMISSAO: TDateTimeField;
    CdsRelPorDocVLRBASE: TFloatField;
    CdsRelPorDocCPMFCALC: TFloatField;
    CdsRelPorDocVLRLOTE: TFloatField;
    CdsRelPorDocCPMFPREV: TFloatField;
    ppDBText5: TppDBText;
    ppLabel11: TppLabel;
    ppDBText17: TppDBText;
    ppLabel22: TppLabel;
    ppDBText18: TppDBText;
    ppLabel23: TppLabel;
    ppLinhaDDSub1: TppLine;
    ppShpCorZebraSub2: TppShape;
    chkImprRelExp: TCheckBox;
    ppShape5: TppShape;
    ppLabel24: TppLabel;
    CMSqlParams1: TCMSqlParams;

      procedure BtnSelecionaClick(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure SbAdTodosClick(Sender: TObject);
      procedure SbAdInverteClick(Sender: TObject);
      procedure bbtnConfirmarClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure bbtnCancelarClick(Sender: TObject);
      procedure BtnImprimeClick(Sender: TObject);
      procedure PagCpmfChange(Sender: TObject);
      procedure LblvalClick(Sender: TObject);
      procedure BtnEmailClick(Sender: TObject);
      procedure BtnRecalculaClick(Sender: TObject);
      procedure BtnProcessaClick(Sender: TObject);
      procedure BtnCancelaProcClick(Sender: TObject);
      procedure SpeedButton1Click(Sender: TObject);
      procedure RgDeviceOutClick(Sender: TObject);
      procedure BtnManutAllClick(Sender: TObject);
      procedure BtnManutInverteClick(Sender: TObject);
      procedure BitBtn5Click(Sender: TObject);
      procedure BtnSelBaixaClick(Sender: TObject);
      procedure BtnBaixaClick(Sender: TObject);
      procedure GrdLotesCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure MnuAltDataRetencaoClick(Sender: TObject);
      procedure CdsLotesAfterOpen(DataSet: TDataSet);
      procedure CdsLotesBeforePost(DataSet: TDataSet);
      procedure CdsLotesBaixasAfterOpen(DataSet: TDataSet);
    procedure grdBaixaCalcCellColors(Sender: TObject; Field: TField;
      State: TGridDrawState; Highlight: Boolean; AFont: TFont;
      ABrush: TBrush);
    procedure btnMarcaTodasBaixasClick(Sender: TObject);
    procedure btnInverteBaixaClick(Sender: TObject);
    procedure GrdLotesTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure GrdLotesUpdateFooter(Sender: TObject);
    procedure ppShpCorLinhaPrint(Sender: TObject);
    procedure ppLbEmpresaPrint(Sender: TObject);
    procedure ppLbNomeSistemaPrint(Sender: TObject);
    procedure ppLbDescricaoPrint(Sender: TObject);
    procedure rptLotesCPMFStartPage(Sender: TObject);
    procedure rptLotesCPMFEndPage(Sender: TObject);
    procedure ppSubRepDocPrint(Sender: TObject);
    procedure ppSubRepRatPrint(Sender: TObject);
    procedure ppShpCorZebraPrint(Sender: TObject);
    procedure ppShpCorZebraSub2Print(Sender: TObject);
    procedure GrdLotesTopRowChanged(Sender: TObject);
    procedure CdsLotesAfterScroll(DataSet: TDataSet);

   private  // Private declarations

      bCancela: Boolean;
      fValorLote: Extended;

      procedure LimpaConsultas;

      procedure Progresso(Params: Array of Variant);
      //  Início - Rodolpho da Silva - P: 18349
      function  TrocaPontoOuVirgula(bPonto: Boolean; sValor: string): string;
      function  VerificaCPMF(sDataProgramada: string) : Boolean;
      //  Término - Rodolpho da Silva - P: 18349

      //  Início - Rodolpho - P: 18392 - 20/01/2005
      procedure DesmarcaFlgOk;
      //  Fim    - Rodolpho - P: 18392 - 20/01/2005

     // andré tavares - pendência 24417 - 06/02/2007 - envento para lançamento de arredondamento de cpmf (chamada do form de lançamento a ser associado na inteface)
     function lancaArredondamento(const idforcli: integer; const dataprog: TDateTime; const valor: double; const icodportforma: integer; var iNumDocArredonda : int64): boolean;

   public   // Public declarations

      TipoRelatCPMF, OldTipoRelatCPMF :TTipoRelatCPMF;
      OldImprimeRateio: Boolean;
      ImprimeRateio :Boolean;
      ConciliaCPMF: TCtrlConciliaCPMF;

   end;


var
  FrmConciliaCPMFMT: TFrmConciliaCPMFMT;



implementation
{$R *.DFM}
uses
   uDataBase, dBaseDados, uSistema, uIntegraBack, uFuncaoGeral, uDiasUteis,
   uMensErro, fSelTipoImpressaoCPMF, fTelaAut, JclMapi, uModulo,
   fAguarde, uString, FProgressCpmf, uCMFileUtils, uCtrlPadroes,
   uCMTypes, uCMMath, JclMath, uCMDialogs, FPreview, uCtrlParamIntegra;





procedure TFrmConciliaCPMFMT.BtnSelecionaClick(Sender: TObject);
var
  rValPrev :Double;
  dDataProgramada : TDateTime;
  iCodPortador : Integer;
  Decendio: TDecendio;
begin
  inherited;
//  Início - Rodolpho da Silva - P: 18349
  if VerificaCPMF(DtProg.Text) then
//  Término - Rodolpho da Silva - P: 18349

  begin
     if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Active then
     begin
       if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 then ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
       ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
     end;

     if (DtProg.Text = '') and
        (ReNumLote.Value = 0.00) then
     begin
        MsgDlg('Favor Informar a Data ou o Número do Lote.','Auditoria de CPMF', mtInformation,[mbOk],0);
         Repaint;
        Exit;
     end;


     if (ProcForn.Valida <> VcOk) then Exit;

     if CmbContaBancaria.Text = '' then
        iCodPortador := 0
     else
        iCodPortador := StrToIntDef(CmbContaBancaria.LookupValue,0);

     if DtProg.Text = '' then
       dDataProgramada := 0
     else
       dDataProgramada := DtProg.Date;

     CdsLotes.Data := ConciliaCPMF.SelLotes(ProcForn.ForCliReg.Id, Trunc(ReNumLote.Value), RgTipoSel.ItemIndex,
                      iCodPortador,  TrocaPontoOuVirgula(True,FloatToStr(EdtCpmf.Value)), dDataProgramada, rValPrev, EdtCpmf.Value, false, CkbInconsistentes.Checked);

//  Início - Rodolpho da Silva - P: 18349
    //  Verifica se o cds está ativo, caso esteja, é fechado
    if CdsCPFMNaoCalc.Active then
       CdsCPFMNaoCalc.Close;
    //  Passando valores aos parâmetros
    SqlCPFMNaoCalc.Prepare;
    SqlCPFMNaoCalc.ParamByName('IDBANCO').Clear;
    SqlCPFMNaoCalc.ParamByName('CODPORTADOR').Clear;
    SqlCPFMNaoCalc.ParamByName('NUMLOTE').Clear;

    //início - andre tavares - pendência - 23440 - 17/10/2006
    decendio := ConciliaCPMF.GetDecendioCPMF(dDataProgramada, 10, 2);
    SqlCPFMNaoCalc.ParamByName('DATAINI').AsDate := decendio.DataIni;
    SqlCPFMNaoCalc.ParamByName('DATAFIM').AsDate := decendio.DataFim;
    //fim - andre tavares - pendência - 23440 - 17/10/2006


    SqlCPFMNaoCalc.ParamByName('PERCENTUAL').AsFloat        := StrToFloat(EdtCpmf.Text);

    // Rodolpho - P: 18475 - 13/04/2005
    if ProcForn.ForCliReg.Id > 0 then
       SqlCPFMNaoCalc.ParamByName('IDBANCO').AsInteger      := ProcForn.ForCliReg.Id;
    if iCodPortador > 0 then
       SqlCPFMNaoCalc.ParamByName('CODPORTADOR').AsInteger := iCodPortador;
    if ReNumLote.Value > 0 then
       SqlCPFMNaoCalc.ParamByName('NUMLOTE').AsFloat        := ReNumLote.Value;
    SqlCPFMNaoCalc.Open;


    //  Abre o cds de Relatório por documento
    //  1º nível do sub-relatório
    if CdsRelPorDoc.Active then CdsRelPorDoc.Close;
    SqlRelPorDoc.Prepare;
    SqlRelPorDoc.ParamByName('DATA').AsDate := DtProg.Date;
    SqlRelPorDoc.Open;


    //  Abre o cds de rateio
    //  2º nível do sub-relatório
    if CdsRateio.Active then CdsRateio.Close;
    SqlRateio.Prepare;
    SqlRateio.ParamByName('DATA').AsDate := DtProg.Date;
    SqlRateio.Open;


    //  Abre o cds com os dados da empresa
    //  Também usado no relatório
    if CdsDadosEmpresa.Active then CdsDadosEmpresa.Close;
    SqlDadosEmpresa.Prepare;
    SqlDadosEmpresa.Open;


    //  Varre o CdsCPFMNaoCalc e insere no CdsLotes os reegistros encontrados
    while not CdsCPFMNaoCalc.Eof do
    begin
       CdsLotes.Append;
       CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString := 'N';
       CdsLotes.FieldByName('RECALCULA').AsString         := '1';
       CdsLotes.FieldByName('NUMLOTE').AsString           := CdsCPFMNaoCalc.FieldByName('NUMLOTE').AsString;
       CdsLotes.FieldByName('FAVORECIDO').AsString        := CdsCPFMNaoCalc.FieldByName('FAVORECIDO').AsString;
       CdsLotes.FieldByName('DATAEMISSAO').AsString       := CdsCPFMNaoCalc.FieldByName('DATAEMISSAO').AsString;
       CdsLotes.FieldByName('VALORLOTE').AsString         := CdsCPFMNaoCalc.FieldByName('VALORLOTE').AsString;
       CdsLotes.FieldByName('VALPREVISTO').AsString       := CdsCPFMNaoCalc.FieldByName('VALPREVISTO').AsString;
       CdsLotes.FieldByName('ORIGEM').AsString            := CdsCPFMNaoCalc.FieldByName('ORIGEM').AsString;

       //  Grava o registro e move o cursor para o próximo
       CdsLotes.Post;
       CdsCPFMNaoCalc.Next;
    end;

    // Início - Rodolpho - P: 18392 - 20/01/2005
    DesmarcaFlgOk;
    // Fim    - Rodolpho - P: 18392 - 20/01/2005
    //  Término - Rodolpho da Silva - P: 18349
  end;
end;




procedure TFrmConciliaCPMFMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ConciliaCPMF.Free;
end;




procedure TFrmConciliaCPMFMT.SbAdTodosClick(Sender: TObject);
begin
   inherited;

   if not(CdsLotes.IsEmpty) then
   begin
     Try
       CdsLotes.DisableControls;
       CdsLotes.First;
       while not(CdsLotes.EOF) do
       begin
         if TComponent(Sender).Tag = 0 then
         begin
            if ConciliaCPMF.IsCpmfConsistente(CdsLotes) then
            begin
               CdsLotes.Edit;
               CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString := 'S';
               CdsLotes.Post;
            end;
         end
         else
         begin
            if not(ConciliaCPMF.IsCpmfConsistente(cdsLotes)) then
            begin
               CdsLotes.Edit;
               CdsLotes.FieldByName('RECALCULA').AsInteger := 1;
               CdsLotes.Post;
            end;
         end;
         CdsLotes.Next;
       end;
       CdsLotes.First;
     finally
       CdsLotes.EnableControls;
     end;
   end;
end;




procedure TFrmConciliaCPMFMT.SbAdInverteClick(Sender: TObject);
begin
   inherited;
   if not(CdsLotes.IsEmpty) then
   begin
     Try
        CdsLotes.DisableControls;
        CdsLotes.First;
        while not(CdsLotes.EOF) do
        begin
           if TComponent(Sender).Tag = 0 then
           begin
              if ConciliaCPMF.IsCpmfConsistente(cdsLotes) then
              begin
                 CdsLotes.Edit;
                 if CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString = 'S' then
                    CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString := 'N'
                 else
                    CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString := 'S';
                 CdsLotes.Post;
              end;
           end
           else
           begin
              if not(ConciliaCPMF.IsCpmfConsistente(cdsLotes)) then
              begin
                 CdsLotes.Edit;
                 if CdsLotes.FieldByName('RECALCULA').AsInteger = 0 then
                    CdsLotes.FieldByName('RECALCULA').AsInteger := 1
                 else
                    CdsLotes.FieldByName('RECALCULA').AsInteger := 0;
                 CdsLotes.Post;
              end;
           end;

           CdsLotes.Next;
        end;
        CdsLotes.First;
     finally
        CdsLotes.EnableControls;
     end;
   end;
end;




procedure TFrmConciliaCPMFMT.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  if PagCpmf.ActivePage = TbsConcilia then
  begin
     Try
        if CdsLotes.State In [DsEdit, DsInsert] then CdsLotes.Post;

        if not(ConciliaCPMF.ProcessaConciliaCPMF(CdsLotes.Data,
                                                 (MsgDlg('Deseja Reprogramar os documentos não conciliados?','Confirmar',mtConfirmation, [mbYes,mbNo],0) = mrYes))) then
         begin
            MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);
            Repaint;
         end;

        if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Active then
        begin
          if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 then ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
          ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
        end;

        LimpaConsultas;
     finally
        CdsLotes.EnableControls
     end;
  end
end;




procedure TFrmConciliaCPMFMT.FormCreate(Sender: TObject);
begin
  inherited;
  ConciliaCPMF := TCtrlConciliaCPMF.Create;
  ConciliaCPMF.InitializeAs(Padroes);
  ConciliaCPMF.Progresso := Progresso;
  ConciliaCPMF.IdPessoa := Sistema.IdEmpresa;

  // andré tavares - pendência 24417 - 06/02/2007 - envento para lançamento de arredondamento de cpmf (chamada do form de lançamento a ser associado na inteface)
  ConciliaCPMF.onLancaArredondamento := lancaArredondamento;

  SQLPortConta.Prepare;
  SQLPortConta.Params[0].AsFloat := Sistema.IdEmpresa;
  SQLPortConta.Open;

  OldTipoRelatCPMF := trSintetico;
  OldImprimeRateio := True;

  ImprimeRateio := False;
  SQLContasCaixas.Sql.Clear;
  SQLContasCaixas.Sql.Add(' SELECT DESCRICAO,CODPORTFORMA, DMAIS, LANCAFINANC, PLANO, PLACONTA,  PLACONTACONTABCHQ, PLANOCONTABCHQ, FLGCONTABEMISCHQ  '+
                          ' FROM PORTADORFORMA '+
                          ' WHERE RECPAG = '''+ IntegraBack.RecPag + ''''+
                          //Marcus Oliveira P.24823 12/04/2007
                          ' AND NVL(FLGATIVO, ''S'') = ''S'' ' +

                          ' and PORTADORFORMA.IDPESSOA='  +IntToStr(Sistema.idEmpresa) + ' ORDER BY DESCRICAO');
  SQLContasCaixas.Open;

  TipoRelatCPMF := trSintetico;
  PagCpmf.ActivePage := TbsConcilia;

  LimpaConsultas;

// Daniel Simões - 25/01/2006 - Início------------------------------------------
  if ParamIntegra.Recpag = 'P' then
  begin
    HelpContext           := 30029;
    bbtnAjuda.HelpContext := 30029;
  end;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------

end;




procedure TFrmConciliaCPMFMT.bbtnCancelarClick(Sender: TObject);
begin
  inherited;
  ProcForn.Text := '';
  DtProg.Text := '';
  ReNumLote.Value := 0;
  LimpaConsultas;
end;




procedure TFrmConciliaCPMFMT.LimpaConsultas;
begin
  if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Active then
  begin
    if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 then ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
    ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
  end;

  CdsLotes.Data := ConciliaCPMF.SelLotesVazios;
  CdsLotesBaixas.Data := CdsLotes.Data;
end;




procedure TFrmConciliaCPMFMT.BtnImprimeClick(Sender: TObject);
begin
  inherited;
  //  Início - Rodolpho - 28/12/2004
  if chkImprRelExp.Checked then
  begin
     ppSubRepDoc.ExpandAll := true;
     ppSubRepRat.ExpandAll := true;
  end
  else
  begin
     ppSubRepDoc.ExpandAll := false;
     ppSubRepRat.ExpandAll := false;
  end;
  if not CdsLotes.IsEmpty then
     TFrmPreview.CreateModalPreview(Application,rptLotesCPMF,'Relatório de conciliação de CPMF');
  //  Término - Rodolpho - 28/12/2004
end;




procedure TFrmConciliaCPMFMT.PagCpmfChange(Sender: TObject);
begin
  inherited;
  BtnEmail.Visible       := (PagCpmf.ActivePage = TbsAuditoria);
  BtnImprime.Visible     := (PagCpmf.ActivePage = TbsConcilia);
  // Início - Rodolpho - P: 18392
  chkImprRelExp.Visible  := (PagCpmf.ActivePage = TbsConcilia);
  // Fim - Rodolpho - P: 18392
  BtnRecalcula.Visible   := (PagCpmf.ActivePage = TbsConcilia);
  bbtnCancelar.Visible   := (PagCpmf.ActivePage = TbsConcilia);
  bbtnConfirmar.Visible  := (PagCpmf.ActivePage = TbsConcilia);
  TB97oKCancelar.Visible := (PagCpmf.ActivePage <> TbsManutCpmf);
  BtnBaixa.Visible       := (PagCpmf.ActivePage = TbsBaixas);

  SQLManutCpmf.Open;
end;




procedure TFrmConciliaCPMFMT.LblvalClick(Sender: TObject);
begin
   inherited;
   CkbInconsistentes.Checked := not(CkbInconsistentes.Checked);
end;




procedure TFrmConciliaCPMFMT.BtnEmailClick(Sender: TObject);
var
  sMensagem :String;
begin
  inherited;
  if ((RgDeviceOut.ItemIndex = 1) Or (RgDeviceOut.ItemIndex = 2)) and
     (Trim(EdtNomeArquivo.Text) = '') then
   begin
    MsgDlg('Não foi informado o nome do arquivo de saída.','Auditoria de CPMF', mtInformation,[mbOk],0);
      Repaint;
   end
  else
    if not(FileExists(EdtNomeArquivo.Text)) then
    begin
       MsgDlg('O Arquivo com a auditoria da CPMF não foi gerado ou foi apagado.','Auditoria de CPMF', mtInformation,[mbOk],0);
       Repaint;
    end
    else
    begin

      ZipFile.FSpecArgs.Clear;
      ZipFile.FSpecArgs.Add(EdtNomeArquivo.Text);
      ZipFile.ZipFilename := EdtNomeArquivo.Text + '.Zip';;
      ZipFile.Add;

      sMensagem := 'Solicito o cadastramento dos Relacionamentos "Tipo de Desenbolso X Centro de Custo X Programa X CPMF" listados no arquivo em anexo' +
                  (#13+#10) + (#13+#10) + 'Grato.';

      JclSimpleSendMail('destino@email.com.br','','Cadastro de "Tipo de Desenbolso X Centro de Custo X Programa X CPMF"',sMensagem,ZipFile.ZipFilename);
    end;
end;




procedure TFrmConciliaCPMFMT.BtnRecalculaClick(Sender: TObject);
begin
  inherited;
  if CdsLotes.State In [DsEdit, DsInsert] then CdsLotes.Post;

  if not(ConciliaCPMF.Recalcula(CdsLotes.Data, Sistema.IdEspAcesso, Sistema.IdUsuario,
     ParamIntegra.Plano, Sistema.IdModulo, Sistema.UsaPlanoPatro, ParamIntegra.IntegraContab,
     ParamIntegra.PartidaDobrada, ParamIntegra.RecPag)) then
   begin
      MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);
      Repaint;
   end;

  if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Active then
  begin
    if ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.ChangeCount > 0 then ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.CancelUpdates;
    ConciliaCPMF.DtmConciliaCPMFMT.CdsRptConciliaCpmf.Close;
  end;

  BtnSeleciona.Click;
end;




procedure TFrmConciliaCPMFMT.BtnProcessaClick(Sender: TObject);
var
   bAchou :Boolean;

   function AtualizaControles(bStart :Boolean) :Boolean;
   begin
     Result := True;

     ConciliaCPMF.DtmConciliaCPMFMT.DsDados.DataSet := nil;
     bCancela := False;
     if bStart then
     begin
       if ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Active then
       begin
          Result := (MsgDlg('Existem registros já processados, deseja processar novamente ?','Auditoria de CPMF',mtError,[mbNo,mbYes],0) = IdYes);

          if not(Result) then Exit;

          if ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.ChangeCount > 0 then
             ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.CancelUpdates;
          ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Close;
       end;

       ConciliaCPMF.DtmConciliaCPMFMT.SQLResultado.Open;
       ConciliaCPMF.DtmConciliaCPMFMT.SQLTipoRecebDesemb.Open;
       ConciliaCPMF.DtmConciliaCPMFMT.SQLCCust.Open;
       ConciliaCPMF.DtmConciliaCPMFMT.SQLPrograma.Open;

       Pb.Max := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.RecordCount;
     end
     else
     begin
       ConciliaCPMF.DtmConciliaCPMFMT.SQLTipoRecebDesemb.Open;
       ConciliaCPMF.DtmConciliaCPMFMT.SQLCCust.Open;
       ConciliaCPMF.DtmConciliaCPMFMT.SQLPrograma.Open;
     end;

     Pb.Position := 0;

     BtnCancelaProc.Enabled   := bStart;
     BtnProcessa.Enabled      := not(bStart);
   end;

begin
  if ((RgDeviceOut.ItemIndex = 1) Or (RgDeviceOut.ItemIndex = 2)) and
     (Trim(EdtNomeArquivo.Text) = '') then
   begin
    MsgDlg('Não foi informado o nome do arquivo de saída.','Auditoria de CPMF', mtInformation,[mbOk],0);
      Repaint;
   end
  else
    Try
      if AtualizaControles(True) then
        while not(ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.EOF) and (not bCancela) do
        begin
          Pb.Position := Pb.Position + 1;
          LblProgressInfo.Caption := 'Processando Tipo de Desembolso ' + ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString + ' - ' + ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('DESCRICAO').AsString;
          Application.ProcessMessages;

          ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.First;
          while not(ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.EOF) do
          begin
            ConciliaCPMF.DtmConciliaCPMFMT.SQLTrdxCCxImposto.SQL.Text :=
// inicio - andre tavares - pendência 15373 - 27/05/2004
                      ' SELECT ' +
                      '   T.CODTIPRECDES, C.CODEXTERNO AS CODCENTROCUSTO, T.IDPROGRAMA ' +
                      ' FROM ' +
                      '   TIPRECDESXTIPAGRE T, CENTCUST C, (SELECT IDPESSOA, IDPLANCENTCUST FROM PARAMGLOBAL) P' +
                      ' WHERE ' +
                      '   T.CODTIPRECDES = ' + QuotedStr(Espaco(Trim(ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString),15)) + ' and ' +
                      '   T.RECPAG = ' + QuotedStr(IntegraBack.RecPag) + ' and ' +
                      '   T.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ' and ' +
                      '   T.CODCENTROCUSTO = ' + QuotedStr(Espaco(Trim(ConciliaCPMF.DtmConciliaCPMFMT.CDSCCust.FieldByName('CODCENTROCUSTO').AsString),10)) + ' and ' +
                      '   T.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' and ' +
                      '   T.IDPROGRAMA IS NULL AND C.CODCENTROCUSTO(+) = T.CODCENTROCUSTO AND ' +
                      '   C.IDPLANCENTCUST = P.IDPLANCENTCUST AND ' +
                      '   C.ATIVO = ''S'' AND ' +
                      '   P.IDPESSOA = T.IDPESSOA';
// fim - andre tavares - pendência 15373 - 27/05/2004
            ConciliaCPMF.DtmConciliaCPMFMT.SQLTrdxCCxImposto.Open;

             bAchou := not(ConciliaCPMF.DtmConciliaCPMFMT.CdsTrdxCCxImposto.IsEmpty);

            if not(bAchou) then
            begin
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Append;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('CODTIPRECDES').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('DESCRICAO').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('DESCRICAO').AsString;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('CODCENTROCUSTO').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('CODCENTROCUSTO').AsString;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('NOME').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('NOME').AsString;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('DESCPROGRAMA').AsString := '' ;
              ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Post;
            end;

              ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.First;
              while not(ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.EOF) do
              begin
                ConciliaCPMF.DtmConciliaCPMFMT.SQLTrdxCCxImposto.SQL.Text :=
// inicio - andre tavares - pendência 15373 - 27/05/2004
                      ' SELECT ' +
                      '   T.CODTIPRECDES, C.CODEXTERNO AS CODCENTROCUSTO, T.IDPROGRAMA ' +
                      ' FROM ' +
                      '   TIPRECDESXTIPAGRE T, CENTCUST C, (SELECT IDPESSOA, IDPLANCENTCUST FROM PARAMGLOBAL) P ' +
                      ' WHERE ' +
                      '   T.CODTIPRECDES = ' + QuotedStr(Espaco(Trim(ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString),15)) + ' and ' +
                      '   T.RECPAG = ' + QuotedStr(IntegraBack.RecPag) + ' and ' +
                      '   T.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa) + ' and ' +
                      '   T.CODCENTROCUSTO = ' + QuotedStr(Espaco(Trim(ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('CODCENTROCUSTO').AsString),10)) + ' and ' +
                      '   T.IDEMPRESA = ' + IntToStr(Sistema.IdEmpresa) + ' and ' +
                      '   T.IDPROGRAMA = ' + ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.FieldByName('IDPROGRAMA').AsString +
                      '  AND C.CODCENTROCUSTO(+) = T.CODCENTROCUSTO AND ' +
                      '   C.IDPLANCENTCUST = P.IDPLANCENTCUST AND ' +
                      '   C.ATIVO = ''S'' AND ' +
                      '   P.IDPESSOA = T.IDPESSOA';

// fim - andre tavares - pendência 15373 - 27/05/2004
                ConciliaCPMF.DtmConciliaCPMFMT.SQLTrdxCCxImposto.Open;

                bAchou := not(ConciliaCPMF.DtmConciliaCPMFMT.CdsTrdxCCxImposto.IsEmpty);

                if not(bAchou) then
                begin
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Append;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('CODTIPRECDES').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('CODTIPRECDES').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('DESCRICAO').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.FieldByName('DESCRICAO').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('CODCENTROCUSTO').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('CODCENTROCUSTO').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('NOME').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.FieldByName('NOME').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.FieldByName('DESCPROGRAMA').AsString := ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.FieldByName('DESCPROGRAMA').AsString;
                  ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.Post;
                end;

                ConciliaCPMF.DtmConciliaCPMFMT.CdsPrograma.Next;
              end;

            ConciliaCPMF.DtmConciliaCPMFMT.CdsCCust.Next;
          end;

          ConciliaCPMF.DtmConciliaCPMFMT.CdsTipoRecebDesemb.Next;
        end;

      ConciliaCPMF.DtmConciliaCPMFMT.RptDados.ResetDevices;

      Case RgDeviceOut.ItemIndex of
        0: ConciliaCPMF.DtmConciliaCPMFMT.RptDados.DeviceType := 'Screen';
        1: ConciliaCPMF.DtmConciliaCPMFMT.RptDados.DeviceType := 'ReportTextFile';
        2: ConciliaCPMF.DtmConciliaCPMFMT.RptDados.DeviceType := 'ExcelFile';
        3: ConciliaCPMF.DtmConciliaCPMFMT.RptDados.DeviceType := 'Printer';
      end;

      ConciliaCPMF.DtmConciliaCPMFMT.HbnAuditoria.Visible := ((RgDeviceOut.ItemIndex = 0) Or (RgDeviceOut.ItemIndex = 3));
      ConciliaCPMF.DtmConciliaCPMFMT.FbdAuditoria.Visible := ((RgDeviceOut.ItemIndex = 0) Or (RgDeviceOut.ItemIndex = 3));
      ConciliaCPMF.DtmConciliaCPMFMT.RptDados.ShowPrintDialog := ((RgDeviceOut.ItemIndex = 0) Or (RgDeviceOut.ItemIndex = 3));
      ConciliaCPMF.DtmConciliaCPMFMT.RptDados.ArchiveFileName := EdtNomeArquivo.Text;
      ConciliaCPMF.DtmConciliaCPMFMT.RptDados.TextFileName := EdtNomeArquivo.Text;

      ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado.First;
      ConciliaCPMF.DtmConciliaCPMFMT.DsDados.DataSet := ConciliaCPMF.DtmConciliaCPMFMT.CdsResultado;

      if RgDeviceOut.ItemIndex = 0 then
         TFrmPreview.CreateModalPreview(Self, ConciliaCPMF.DtmConciliaCPMFMT.RptDados, 'Auditoria de CPMF')
      else
         ConciliaCPMF.DtmConciliaCPMFMT.RptDados.Print;

      if bCancela then
          LblProgressInfo.Caption := 'Cancelamento Solicitado pelo usuario. Aguardando Comado...'
      else
          LblProgressInfo.Caption := 'Processamento Encerrado com sucesso. Aguardando Comando...';

      AtualizaControles(False);
    Except
      On E:Exception do
      begin
        LblProgressInfo.Caption := 'Processamento Encerrado com erros, verifique. Aguardando Comando...';
        AtualizaControles(False);
        MsgDlg(FormatErrorMessage(self,E,'Erro ao processar Auditoria de CPMF'),'Erro !',mtError,[mbOk],0);
        Repaint;
      end;
    end;
end;




procedure TFrmConciliaCPMFMT.BtnCancelaProcClick(Sender: TObject);
begin
   inherited;
   bCancela := True;
   Application.ProcessMessages;
end;




procedure TFrmConciliaCPMFMT.SpeedButton1Click(Sender: TObject);
begin
   inherited;
   DlgFile.FileName := '';

   Case RgDeviceOut.ItemIndex of
   1: DlgFile.Filter := 'Arquivo Text|*.txt';
   2: DlgFile.Filter := 'Arquivo Excel|*.xls';
   else
     Exit;
   end;

   if DlgFile.Execute then
   begin
      EdtNomeArquivo.Text := DlgFile.FileName;
   end;
end;




procedure TFrmConciliaCPMFMT.RgDeviceOutClick(Sender: TObject);
begin
   inherited;
   PnlFileName.Enabled := ((RgDeviceOut.ItemIndex = 1) Or (RgDeviceOut.ItemIndex = 2));
end;




procedure TFrmConciliaCPMFMT.BtnManutAllClick(Sender: TObject);
begin
   inherited;
   with CdsManutCpmf do
   begin
     DisableControls;
     First;
     while not(EOF) do
     begin
       Edit;
       FieldByName('ALTERA').AsInteger := 1;
       Post;
       Next;
     end;
     First;
     EnableControls;
   end;
end;




procedure TFrmConciliaCPMFMT.BtnManutInverteClick(Sender: TObject);
begin
   inherited;
   with CdsManutCpmf do
   begin
     DisableControls;
     First;
     while not(EOF) do
     begin
       Edit;
       if FieldByName('ALTERA').AsInteger = 1 then
         FieldByName('ALTERA').AsInteger := 0
       else
         FieldByName('ALTERA').AsInteger := 1;
       Post;
       Next;
     end;
     First;
     EnableControls;
   end;
end;




procedure TFrmConciliaCPMFMT.BitBtn5Click(Sender: TObject);
begin
   inherited;
   if ConciliaCPMF.AlteraAliquota(CdsManutCpmf.Data, ReAliquota.Value) then
   begin
     MsgDlg('Alíquota de CPMF alterada com sucesso','Auditoria de CPMF', mtInformation,[mbOk],0);
      Repaint;
   end
   else
   begin
     MsgDlg('Erro ao alterar alíquota de CPMF.' + (#13+#10) + ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);
      Repaint;
   end;
end;




procedure TFrmConciliaCPMFMT.BtnSelBaixaClick(Sender: TObject);
var
  dDataProgBaixa: TDateTime;
begin
  inherited;
  if DtProgBaixa.Date > Date then
  begin
     MsgDlg('Não é permitido efetuar pagamentos com data superior a de hoje.','Auditoria de CPMF', mtInformation,[mbOk],0);
      Repaint;
     Exit;
  end;

  if (DtProgBaixa.Text = '') and
     (StrToIntDef(ReNumLoteBaixa.Text, 0) = 0.00) then
  begin
     MsgDlg('Favor Informar a Data ou o Número do Lote.','Auditoria de CPMF', mtInformation,[mbOk],0);
      Repaint;
     Exit;
  end;

  if (CmpBaixas.Valida = VcOk) then
    if (Trim(dblkFormaPag.Text) = '') then
    begin
      MsgDlg('É obrigatório a indicação do Contas/Caixas x Forma Pagamento','Auditoria de CPMF', mtInformation,[mbOk],0);
      Repaint;
      if dblkFormaPag.CanFocus then dblkFormaPag.SetFocus;
    end
    else
    begin
      LimpaConsultas;

      if DtProgBaixa.text = '' then
         dDataProgBaixa := 0
      else
         dDataProgBaixa := DtProgBaixa.Date;

      CdsLotesBaixas.Data := ConciliaCPMF.SelLotesBaixa(dDataProgBaixa, StrToIntDef(CmbContaBancaria2.LookupValue,0),
                             CmpBaixas.ForCliReg.Id, StrToIntDef(ReNumLoteBaixa.Text, 0));
    end;
end;




procedure TFrmConciliaCPMFMT.BtnBaixaClick(Sender: TObject);
begin
   inherited;

   if not(CdsLotesBaixas.IsEmpty) then
   begin
    if CdsLotesBaixas.State In [DsEdit,DsInsert] then CdsLotesBaixas.Post;

    try

        if MsgDlg('Confirma baixa da(s) CPMF(s) selecionadas?','Confirmação',mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        begin
          Repaint;
          if not(ConciliaCPMF.BaixaCpmf(CdsLotesBaixas.Data, CmpBaixas.ForCliReg.Id, StrToInt(dblkFormaPag.LookupValue), Sistema.IdModulo,
             Sistema.IdUsuario, Sistema.IdEspAcesso, ParamIntegra.Plano, DtProgBaixa.Date, Sistema.UsaPlanoPatro,
             ParamIntegra.IntegraContab, ParamIntegra.PartidaDobrada)) then
          begin
             if (trim(ConciliaCPMF.MessageInfo) <> '') then
               MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);
             Repaint;
          end;

            LimpaConsultas;
            BtnSelBaixaClick(sender);

        end;
        Repaint;

    finally
      CdsLotesBaixas.enablecontrols;
    end;

  end;
end;


procedure TFrmConciliaCPMFMT.GrdLotesCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
   inherited;
//  Início - Rodolpho da Silva - P: 18363
   if not CdsLotes.IsEmpty then
   begin
      //  Pinta a linha caso a CPMF não tenha sido calculada
      if CdsLotes.FieldByName('DATARETENCAO').IsNull and not((gdSelected in State)) then
      begin
         ABrush.Color := $00B5FDFD; // Amarelo bebê
         AFont.Color  := 0;
      end
//  Término - Rodolpho da Silva - P: 18363

      else
      begin
         if not(ConciliaCPMF.IsCpmfConsistente(cdsLotes)) and not((gdSelected in State)) then
         begin
            //  Pinta a linha caso CPMF tenha divergência
            AFont.Color := 0;
            ABrush.Color := $008080FF; //  Rosa bebê
         end;
      end;
   end;
end;




procedure TFrmConciliaCPMFMT.MnuAltDataRetencaoClick(Sender: TObject);
var
  dData, dDataContabLote: TDateTime;
  iNunLote: Integer;
  ctrlImpostoRetido: TCtrlImpostoRetido;
  _cdsLoteAux: TClientDataset;
begin
  inherited;
  //pendência 26936 - 29/11/2007
  //esta data também é a data em que foi contabilizado o lançamento do documento e é a data programada do mesmo
  _cdsLoteAux := TClientDataset.Create(nil);
  _cdsLoteAux.Data := CdsLotes.Data;

  ctrlImpostoRetido := TCtrlImpostoRetido.Create;
  try
    ctrlImpostoRetido.InitializeAs(Padroes);
    _cdsLoteAux.Filtered := false;
    if (trim(CdsLotes.FieldByName('NUMLOTE').asString) <> '') then
      _cdsLoteAux.Filter := ' NUMLOTE = '+ CdsLotes.FieldByName('NUMLOTE').asString
    else
      _cdsLoteAux.Filter := ' CODLANCFINANC = '+ CdsLotes.FieldByName('CODLANCFINANC').asString;

    _cdsLoteAux.Filtered := true;

    dData := _cdsLoteAux.FieldByName('DATARETENCAO').AsDateTime;
    ctrlImpostoRetido.NumLote := _cdsLoteAux.FieldByName('NUMLOTE').asFloat; //para buscar o imposto e calcular a data
    if (trim(_cdsLoteAux.FieldByName('NUMLOTE').asString) <> '') then
      dDataContabLote := ConciliaCPMF.getDataContabLote(_cdsLoteAux.FieldByName('NUMLOTE').asString)
    else
      dDataContabLote := ConciliaCPMF.getDataContabLote(_cdsLoteAux.FieldByName('CODLANCFINANC').asString);

    dData := ctrlImpostoRetido.GetDataLancDocImposto(dData);

    if not(_cdsLoteAux.IsEmpty) and
      (InputDate(Self.Caption, 'CMPF do Lote Nº. ' + _cdsLoteAux.FieldByName('NUMLOTE').AsString +' Próxima data para CPMF: ', dData)) then
    begin

      //início pendência - 26936 - 28/11/2007 - agora não mais exixtirá o processo de alteração de data de retenção, será substituído
      //por repeprogramação.
      _cdsLoteAux.Data := copyClientDataset(_cdsLoteAux);
      if (MsgDlg('Deseja Reprogramar o documento não conciliados?','Confirmar',mtConfirmation, [mbYes,mbNo],0) = mrYes) then
      begin
        _cdsLoteAux.First;
        while not _cdsLoteAux.Eof do
        begin
          _cdsLoteAux.Edit;
          _cdsLoteAux.FieldByName('DATARETENCAO').AsDateTime := dData;
          _cdsLoteAux.Next;
        end;

        if (trunc(dData) < trunc(dDataContabLote)) then
        begin
          MsgDlg('A data programada não pode ser anterior à data de contabilização da baixa do lote.' ,'Erro !', mtError, [mbOk], 0);
        end
        else if not(ConciliaCPMF.ProcessaConciliaCPMF(_cdsLoteAux.Data, true, dData)) then
        begin
          MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);
          Repaint;
        end
        else
          BtnSelecionaClick(sender);

      end;
    end;
  finally
    ctrlImpostoRetido.free;
    _cdsLoteAux.free;

  end;


{
  dData := CdsLotes.FieldByName('DATARETENCAO').AsDateTime;

  if not(CdsLotes.IsEmpty) and
     InputDate(Self.Caption, 'Nova Data de Retenção Lote nº. ' + CdsLotes.FieldByName('NUMLOTE').AsString, dData) then
  begin
     if (CdsLotes.FieldByName('FLGCONFIRMARECPAG').AsString = 'N') Or
        (MsgDlg('Este lote já foi conciliado, deseja alterar a Data de Retenção mesmo assim?','Confirmar',mtConfirmation, [mbYes,mbNo],0)=mryes) then
     begin
        iNunLote := CdsLotes.FieldByName('NUMLOTE').AsInteger;

        if not(ConciliaCPMF.AlteraDataRetencao(CdsLotes.Data, iNunLote, dData, paramIntegra.IntegraContab, cdsLotes.fieldByName('IDIMPOSTORETIDO').asInteger) )then
         begin
           MsgDlg(ConciliaCPMF.MessageInfo,'Erro !',mtError,[mbOk],0);
            Repaint;
         end
         else // andre tavares - pendência 24748 - 20/03/2007
           MsgDlg('Data de Retenção alterada com sucesso.','Auditoria de CPMF', mtInformation,[mbOk],0);

        Repaint;
        BtnSeleciona.Click;
     end;
  end;
  }
//fim - pendência - 26936 - 28/11/2007 - agora não mais exixtirá o processo de alteração de data de retenção, será substituído


end;




procedure TFrmConciliaCPMFMT.CdsLotesAfterOpen(DataSet: TDataSet);
begin
   inherited;
   DataSet.FieldByName('DATARETENCAO').Visible := (DtProg.Text = '');

   TFloatField(DataSet.FieldByName('VALCALCULADO')).DisplayFormat    := '#,##0.00';
   TFloatField(DataSet.FieldByName('VALORLOTE')).DisplayFormat       := '#,##0.00';
   TFloatField(DataSet.FieldByName('VALPREVISTO')).DisplayFormat     := '#,##0.00';
   TFloatField(DataSet.FieldByName('VALORBASE')).DisplayFormat       := '#,##0.00';
end;




procedure TFrmConciliaCPMFMT.CdsLotesBeforePost(DataSet: TDataSet);
begin
   inherited;
   if (DataSet.FieldByName('FLGCONFIRMARECPAG').AsString = 'S') and not(ConciliaCPMF.IsCpmfConsistente(cdsLotes)) then
   begin
      //11/03/05 Alex Brasília
      if MsgDlg('Atenção o valor do lote está divergente. ' + #13 +
                'Deseja  conciliá-lo mesmo assim?','Conciliação de CPMF', mtConfirmation	,[mbYes,MbNo],0) = MrNo then begin
         Repaint;
         Abort;
      end;
   end;

   if (DataSet.FieldByName('RECALCULA').AsInteger = 1) and ConciliaCPMF.IsCpmfConsistente(cdsLotes) then
   begin
      MsgDlg('Não é nescessário recalcular CPMF Consistente ','Conciliação de CPMF', mtWarning	,[mbOk],0);
      Repaint;
      Abort;
   end;
end;




procedure TFrmConciliaCPMFMT.Progresso(Params: array of Variant);
begin
   if Params[0] = 0 then
   begin
      frmAguarde.Max := Params[1];
      frmAguarde.Mostra(Params[2]);
   end
   else
   begin
      if Params[0] = Params[1] then
      begin
         frmAguarde.Apaga;
      end
      else
      begin
         frmAguarde.Pos := Params[0];
      end;
   end;
end;




procedure TFrmConciliaCPMFMT.CdsLotesBaixasAfterOpen(DataSet: TDataSet);
begin
   inherited;
   TFloatField(DataSet.FieldByName('VALCALCULADO')).DisplayFormat    := '#,##0.00';
   TFloatField(DataSet.FieldByName('VALORLOTE')).DisplayFormat       := '#,##0.00';
   TFloatField(DataSet.FieldByName('VALPREVISTO')).DisplayFormat     := '#,##0.00';
   TFloatField(DataSet.FieldByName('VALORAUDITORIA')).DisplayFormat  := '#,##0.00';
end;




procedure TFrmConciliaCPMFMT.grdBaixaCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
begin
  inherited;
   if Field.Name = 'FLGCONFIRMARECPAG' then
      ABrush.Color := $00B5FDFD
   else
   begin
      if not(ConciliaCPMF.IsCpmfConsistente(cdsLotes)) and not((gdSelected in State)) then
      begin
         AFont.Color := 0;
         ABrush.Color := $008080FF;
      end;
   end;

end;




procedure TFrmConciliaCPMFMT.btnMarcaTodasBaixasClick(Sender: TObject);
begin
  inherited;
   if not(CdsLotesBaixas.IsEmpty) then
   begin
     Try
       CdsLotesBaixas.DisableControls;
       CdsLotesBaixas.First;
       while not(CdsLotesBaixas.EOF) do
       begin
          CdsLotesBaixas.Edit;
          CdsLotesBaixas.FieldByName('FLGCONFIRMARECPAG').AsString := 'S';
          CdsLotesBaixas.Post;
          CdsLotesBaixas.Next;
       end;
       CdsLotesBaixas.First;
     finally
       CdsLotesBaixas.EnableControls;
     end;
   end;

end;




procedure TFrmConciliaCPMFMT.btnInverteBaixaClick(Sender: TObject);
begin
  inherited;
   if not(CdsLotesBaixas.IsEmpty) then
   begin
     Try
       CdsLotesBaixas.DisableControls;
       CdsLotesBaixas.First;
       while not(CdsLotesBaixas.EOF) do
       begin
          CdsLotesBaixas.Edit;
          if CdsLotesBaixas.FieldByName('FLGCONFIRMARECPAG').AsString = 'S' then
             CdsLotesBaixas.FieldByName('FLGCONFIRMARECPAG').AsString := 'N'
          else
             CdsLotesBaixas.FieldByName('FLGCONFIRMARECPAG').AsString := 'S';
          CdsLotesBaixas.Post;
          CdsLotesBaixas.Next;
       end;
       CdsLotesBaixas.First;
     finally
       CdsLotesBaixas.EnableControls;
     end;
   end;

end;




function TFrmConciliaCPMFMT.VerificaCPMF(sDataProgramada: string): Boolean;
//  Início - Rodolpho da Silva - P: 18349
var
   sPercentual : string;
   bDivergencia: boolean;
   lListaDiverg: TStrings;
   
begin
   try
      if Trim(sDataProgramada) = '' then
      begin
         Result := False;
         MsgDlg('Informe a data programada!',Sistema.NomeAplicativo,mtWarning,[mbOk],0);
         if DtProg.CanFocus then DtProg.SetFocus;
         Exit;
      end
      else
      begin
         //  Definindo valores às variáveis
         lListaDiverg := TStringList.Create;
         bDivergencia := False;
         Result       := False;

         //  Passando os parâmetros à qry e abrindo-a em seguida
         SqlVerificaCPMF.Prepare;
         SqlVerificaCPMF.ParamByName('IDEMPRESA').AsInteger := Sistema.IdEmpresa;
         SqlVerificaCPMF.ParamByName('DATA').AsDate := StrToDate(sDataProgramada);
         SqlVerificaCPMF.Open;

         //  Pega o primeiro percentual do cds e passa-o para a variável
         //e em seguida, adiciona valores à lista de divergências
         sPercentual := CdsVerificaCPMF.FieldByName('PERCCUSTAGREG').AsString;
         lListaDiverg.Add('');


         //  Varre o cds para fazer a verificação da CPMF
         while not CdsVerificaCPMF.Eof do
         begin
            //  Verifica se o percentual anterior é diferente do percentual encontrado
            //  Caso seja, é ativado o flg "bDivergecia" e inserido na lista, a CPMF divergente
            if CdsVerificaCPMF.FieldByName('PERCCUSTAGREG').AsString <> sPercentual then
               bDivergencia := True
            else
               //  Se não for diferente, passa o percentual encontrado para a variável
               sPercentual := CdsVerificaCPMF.FieldByName('PERCCUSTAGREG').AsString;


             lListaDiverg.Add(CdsVerificaCPMF.FieldByName('PERCCUSTAGREG').AsString + ' - ' + CdsVerificaCPMF.FieldByName('DESCCUSTAGREG').AsString);
            //  Move o cursor ao próximo registro
            CdsVerificaCPMF.Next;
         end;


         //  Caso tenha sido encontrado divergências, envia a mensagem ao usuário
         //e mantém o Result = False
         if bDivergencia then
            MsgDlg('Houve divergências nas CPMF''s abaixo. Não será possível prosseguir ' + #13 +
                    'até que o erro seja corrigido.'                                      + #13 +
                   lListaDiverg.Text, Sistema.NomeAplicativo, mtWarning, [mbOk],0)
         else
         //  Caso não haja divergências...
         begin
            EdtCpmf.Value := StrToFloat(sPercentual);
            Result := true;
         end;
      end;

   finally
      CdsVerificaCPMF.Close;
      FreeAndNil(lListaDiverg);
   end;


end;
//  Término - Rodolpho da Silva - P: 18349




procedure TFrmConciliaCPMFMT.GrdLotesTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
//   Rodolpho da Silva - P: 18349  
  CdsLotes.IndexFieldNames := AFieldName;
end;




procedure TFrmConciliaCPMFMT.GrdLotesUpdateFooter(Sender: TObject);
var
    fValorBase, fValPrevisto, fValCalculado, fValorLote : Extended;
    cdsTemp : TCMClientDataSet;

begin
  inherited;
  fValorLote    := 0;
  fValorBase    := 0;
  fValPrevisto  := 0;
  fValCalculado := 0;

  try
    try
       cdsTemp := TCMClientDataSet.Create( nil );
       cdsTemp.Data := CdsLotes.Data;
       cdsTemp.First;

       while not cdsTemp.Eof do begin
         fValorLote    := fValorLote    + cdsTemp.FieldByName('VALORLOTE').AsFloat;
         fValorBase    := fValorBase    + cdsTemp.FieldByName('VALORBASE').AsFloat;
         fValPrevisto  := fValPrevisto  + cdsTemp.FieldByName('VALPREVISTO').AsFloat;
         fValCalculado := fValCalculado + cdsTemp.FieldByName('VALCALCULADO').AsFloat;
         cdsTemp.Next
       end;

       GrdLotes.ColumnByName('VALORLOTE').FooterValue    := FormatFloat('#,##0.00', fValorLote);
       GrdLotes.ColumnByName('VALORBASE').FooterValue    := FormatFloat('#,##0.00', fValorBase);
       GrdLotes.ColumnByName('VALPREVISTO').FooterValue  := FormatFloat('#,##0.00', fValPrevisto);
       GrdLotes.ColumnByName('VALCALCULADO').FooterValue := FormatFloat('#,##0.00', fValCalculado);


    except end;
  finally
    FreeAndNil( cdsTemp );
  end;
end;




function TFrmConciliaCPMFMT.TrocaPontoOuVirgula(bPonto: Boolean;
  sValor: string): string;
var
i, iItemsString: integer;
sValorFinal: string;

begin
//   Esta função troca todos as vírgulas encontradas na string
//passada por ponto, para poderem ser usadas nas qry's.
   Result       := '';
   iItemsString := Length(sValor);

   for i := 1 to iItemsString do
   begin
     //  Se for trocar vírgula por ponto...
     if bPonto then
     begin
        if sValor[i] = ',' then
           sValorFinal := sValorFinal + '.'
        else
           sValorFinal := sValorFinal + sValor[i];
     end
     else
     //  Se for trocar ponto por vírgula...
     begin
        if sValor[i] = '.' then
           sValorFinal := sValorFinal + ','
        else
           sValorFinal := sValorFinal + sValor[i];
     end;
   end;

   Result := sValorFinal;
end;




procedure TFrmConciliaCPMFMT.ppShpCorLinhaPrint(Sender: TObject);
begin
  inherited;
  ppShpCorLinha.Brush.Color := clWhite;

  if not CdsLotes.IsEmpty then
   begin
      //  Pinta a linha caso a CPMF não tenha sido calculada
      if CdsLotes.FieldByName('DATARETENCAO').IsNull then
         ppShpCorLinha.Brush.Color := $00B5FDFD // Amarelo bebê

      else
      begin
         if not(ConciliaCPMF.IsCpmfConsistente(cdsLotes)) then
            //  Pinta a linha caso CPMF tenha divergência
            ppShpCorLinha.Brush.Color := $008080FF; //  Rosa bebê
      end;
   end;
end;




procedure TFrmConciliaCPMFMT.ppLbEmpresaPrint(Sender: TObject);
begin
  inherited;
  ppLbEmpresa.Caption := Sistema.NomeEmpresa;
end;




procedure TFrmConciliaCPMFMT.ppLbNomeSistemaPrint(Sender: TObject);
begin
  inherited;
  ppLbNomeSistema.Caption := Sistema.NomeCompleto;
end;



procedure TFrmConciliaCPMFMT.ppLbDescricaoPrint(Sender: TObject);
begin
  inherited;
  ppLbDescricao.Caption := 'Data Programada:  ' + DtProg.Text;
end;




procedure TFrmConciliaCPMFMT.rptLotesCPMFStartPage(Sender: TObject);
begin
  inherited;
  CdsRelPorDoc.DisableControls;
  CdsRateio.DisableControls;
  CdsRelPorDoc.Filtered := true;
  CdsRateio.Filtered    := true;
end;




procedure TFrmConciliaCPMFMT.rptLotesCPMFEndPage(Sender: TObject);
begin
  inherited;
  CdsRelPorDoc.Filter   := '';
  CdsRateio.Filter      := '';
  CdsRateio.Filtered    := false;
  CdsRelPorDoc.Filtered := false;
  CdsRelPorDoc.EnableControls;
end;




procedure TFrmConciliaCPMFMT.ppSubRepDocPrint(Sender: TObject);
begin
  inherited;
    CdsRelPorDoc.Filter := 'NUMLOTE = ' + QuotedStr(IntToStr(CdsLotes.FieldByName('NUMLOTE').AsInteger));
end;




procedure TFrmConciliaCPMFMT.ppSubRepRatPrint(Sender: TObject);
begin
  inherited;
  CdsRateio.Filter := 'CODDOCUMENTO = ' + IntToStr(CdsRelPorDocCODDOCUMENTO.AsInteger);
end;




procedure TFrmConciliaCPMFMT.ppShpCorZebraPrint(Sender: TObject);
var
  fDiferenca : Extended;

begin
  inherited;
   //  Pinta a linha do 1º sub-report
   //  Extrai a diferença dos valores
   fDiferenca := CdsRelPorDocVLRLOTE.AsFloat - CdsRelPorDocVLRBASE.AsFloat;

   //  Se a difenreça estiver entre R$ 0,99 e -R$ 0,99, a linha não é considerada, porém
   //se a diferença estiver  maior que R$ 0,99 e -R$ 0,99, alinha é pintada, como marcador de texto
   if not ((fDiferenca > -1.00) and (fDiferenca < 1.00)) then
      ppShpCorZebra.Brush.Color := $008080FF // Rosa bebê
   else
      ppShpCorZebra.Brush.Color := clWhite;
end;




procedure TFrmConciliaCPMFMT.ppShpCorZebraSub2Print(Sender: TObject);
begin
  inherited;

  ppShpCorZebraSub2.Brush.Color := clWhite;

  //  Pinta a linha do 2º sub-report
  if CdsRateio.FieldByName('DESCCUSTAGREG').AsString = '' then
      ppShpCorZebraSub2.Brush.Color := $008080FF; // Rosa bebê

  // 24/02/2007 - Alex homologação - o verde prevalece sobre o rosa
  if CdsRateio.FieldByName('FLGCALCULAIMPOSTO').AsString = 'N' then
     ppShpCorZebraSub2.Brush.Color := $00A6FFA6; // Verde claro

end;



procedure TFrmConciliaCPMFMT.GrdLotesTopRowChanged(Sender: TObject);
begin
  inherited;
  //  Acerta as cores do grid
  (sender as TwwDBGrid).Invalidate;
end;



procedure TFrmConciliaCPMFMT.DesmarcaFlgOk;
begin
with CdsLotes do
   begin
      First;

      while not Eof do
      begin
        if not ConciliaCPMF.IsCpmfConsistente(cdsLotes) then
        begin
           Edit;
           FieldByName('FLGCONFIRMARECPAG').AsString := 'N';
           FieldByName('RECALCULA').AsString         := '1';
           Post;
        end;

        //  Move o cursor ao próximo foco
        Next;
      end;
   end;
end;

// andré tavares - pendência 24417 - 06/02/2007 - envento para lançamento de arredondamento de cpmf (chamada do form de lançamento a ser associado na inteface)
function TFrmConciliaCPMFMT.lancaArredondamento(const idforcli: integer; const dataprog: TDateTime; const valor: double; const icodportforma: integer; var iNumDocArredonda:int64): boolean;
var frmLancaArredonda: TFrmBaixaCPMFMT;
begin
  result := true;
  frmLancaArredonda := nil;
  frmLancaArredonda := TFrmBaixaCPMFMT.Create(Application);
  With frmLancaArredonda Do
  Try
      codportForma := iCodPortForma;
      RevalCpmf.Value := valor;
      Idfavorecido := IdForCli;
      DtProgBaixaF.Date := dataprog;
      ShowModal;
      result := (ModalResult = mrOk);
      if trim(frmLancaArredonda.messageInfo) <> '' then
      begin
        result := false;
      end;
  finally
    iNumDocArredonda := frmLancaArredonda.NumDocLancado;
    if assigned(frmLancaArredonda) then
      freeAndNil(frmLancaArredonda);
  end;

end;

procedure TFrmConciliaCPMFMT.CdsLotesAfterScroll(DataSet: TDataSet);
begin
  inherited;
  MnuAltDataRetencao.Enabled := (trunc(cdsLotes.FieldByName('DATARETENCAO').AsDateTime) > 0);
end;

end.
