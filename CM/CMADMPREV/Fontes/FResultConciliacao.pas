// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// -----------------------------------------------------------------------------
// Alteração..: SB1Click
// Nº ATENDER.: 4498-4676
// Data.......: 256/10/2023
// Responsável: Edilaine
// Descrição..: Remover filtro de TXT na seleção de arquivos
//------------------------------------------------------------------------------
// Pendência   : SIG 92110
// Responsável : Andre Imakawa / Rafael Leite
// Data        : 23/09/2019
// Descrição   : objeto aRubricaINSS só possui 4 posições
//------------------------------------------------------------------------------
// Pendência   : SOL 137572-4661 KINTANA 1252969
// Responsável : Viniicus Ferreira
// Data        : 27/10/2011
// Descrição   : Validação das informações INSS
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Rotina      : MontaQueryRubrica
// Data        : 26/09/2006
// Pendência   : 23328
// Alteração   : Alterações para exibir total da rubrica, independente do plano
//               (criado sub-select para totalizar por rubrica)
// A query funciona, porém o relatório não foi testado pq na tela de filtro não são exibidas
// rubricas por causa do filtro FLGRUBCENTRAL = 1 (não há rubricas cadastradas com essa flg)
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Rotina      : MontaQueryEspecie
// Data        : 26/09/2006
// Pendência   : 23328
// Alteração   : Alterações para exibir total da rubrica, independente do plano
//               (criado sub-select para totalizar por rubrica)
// A query funciona, porém o relatório não foi testado pq na tela de filtro não são exibidas
// rubricas por causa do filtro FLGRUBCENTRAL = 1 (não há rubricas cadastradas com essa flg)
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Rotina      : RelValoresManuais
// Data        : 22/09/2006
// Pendência   : 23328
// Alteração   : Quebra e totalização por Plano
//------------------------------------------------------------------------------
// Autor(a)    : André Pontes
// Rotina      : RelValoresMantenedoras
// Data        : 10/08/2006
// Pendência   : 21449
// Alteração   : Indicação, no cabeçalho do relatórios, se o mesmo se refere ao
//               arquivo original ou se inclui entradas manuais
//------------------------------------------------------------------------------
//  Autor      : Gleyber
//  Rotina     : FormCreate e FormClose
//  Data       : 19/05/2006
//  Pendencia  : -----
//  Alteração  : Implementação para criar o datamodule DtmRelatBeneficios e
//               destrui-lo quando fechar o form.
// -----------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 07/10/2005
// Pendencia   : 19985
// Alteração   : Novo relatório de Valores por Mantenedora (Entradas Manuais) 
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 18/05/2005
// Pendencia   : 18441
// Alteração   : Invisivel; guia Divergências encontradas e a legenda (TabSheet2).
//                          campos "Valores superiores a" e "Exibe Divergências" no cabeçalho da tela.
//                          botão "Consultar".
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 09/05/2005
// Pendencia   : 19171
// Alteração   : Novo filtro Plano Previdenciário para relatórios
//------------------------------------------------------------------------------
// Autor(a)    : Augusto
// Data        : 25/02/2005
// Alteração   : Acerto na composição do sAnoMesCobranca
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 13/08/2004
// Pendencia   : 17653
// Rotina      :
// Alteração   : Nova ordenação para o relatório de Diferenças do INSS
//------------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 13/08/2004
// Pendencia   : 17384
// Rotina      : RelLeituraArquivo
// Alteração   : Incluído no relatório de leitura do arquivo DATAPREV o Mês de
//               Competência.
//------------------------------------------------------------------------------
unit FResultConciliacao;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
   TB97Tlbr, TB97, ExtCtrls, Spin, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
   Wwquery, Wwdatsrc, TREdit, FPreview,  Pptypes, ComCtrls, Menus, ppEndUsr,
   ppCtrls, ppDB, ppBands, ppVar, ppPrnabl, ppClass, ppCache, ppProd,
   ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Mask, wwdbedit, Wwdbspin,
  wwdblook, CheckLst, ppModule, raCodMod, ppParameter;

type
   TRubricaINSS = Record
      CodRubrica  : String[4];
      Valor       : Double;
   end;

   TDetalhe = Record
      TipoDetalhe       : String[1];   // 1-Credito Concessão
                                       // 2-Credito Manutencao
                                       // 3-PAB
                                       // 4-GLOSA
      Rubrica           : array of TRubricaINSS;
      NumeroBeneficio   : String[10];
      FlgTemRubrica     : String[1];
   end;


   TfrmResultConciliacao = class(TfrmSairAjuda)
      dsINSSxPrisma: TwwDataSource;
      qryINSSxMant: TwwQuery;
      bbtnProcurar: TBitBtn;
      ToolbarSep971: TToolbarSep97;
      pnlTopo: TPanel;
      lblMes: TLabel;
      cboxMes: TComboBox;
      lblAnoMes: TLabel;
      seAno: TSpinEdit;
      Label1: TLabel;
      btnImprimir: TBitBtn;
      edtVlrSup: TEdit;
      Label9: TLabel;
      btnImprimir1: TBitBtn;
      pgTipo: TPageControl;
      tabDadosImport: TTabSheet;
      Panel1: TPanel;
      tabDivergencia: TTabSheet;
      Panel2: TPanel;
      dbGrid: TwwDBGrid;
      pnlTotais: TPanel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      edTotalINSS: TRealEdit;
      edTotalMant: TRealEdit;
      edDiferenca: TRealEdit;
      dbGridDadosImport: TwwDBGrid;
      pnlLegenda: TPanel;
      Shape1: TShape;
      Shape2: TShape;
      Shape3: TShape;
      Label5: TLabel;
      Label6: TLabel;
      Label7: TLabel;
      Label8: TLabel;
      qryDadosImport: TwwQuery;
      dsDadosImport: TwwDataSource;
      cboxExibeDivergencias: TCheckBox;
      tabRelatorios: TTabSheet;
      Panel3: TPanel;
      OpenDialog1: TOpenDialog;
      pnlLocalizaArquivo: TPanel;
      qryVirtual: TwwQuery;
      pnlGridLeituraArq: TPanel;
      wwDBGrid1: TwwDBGrid;
      dsVirtual: TwwDataSource;
      UpdateSQL1: TUpdateSQL;
      ppLeituraArq: TppBDEPipeline;
      prLeituaArq: TppReport;
      ppHeaderBand15: TppHeaderBand;
      ppDBImage14: TppDBImage;
      ppDBText212: TppDBText;
      ppDBText213: TppDBText;
      ppDBText214: TppDBText;
      ppDBText215: TppDBText;
      ppDBText216: TppDBText;
      ppDBText217: TppDBText;
      ppDBText218: TppDBText;
      ppLabel206: TppLabel;
      ppDBText219: TppDBText;
      ppLabel210: TppLabel;
      ppLine62: TppLine;
      ppLabel212: TppLabel;
      ppLabel214: TppLabel;
      ppLine64: TppLine;
      ppDetailBand16: TppDetailBand;
      ppDBText220: TppDBText;
      ppDBText221: TppDBText;
      ppFooterBand15: TppFooterBand;
      ppLine63: TppLine;
      ppLabel213: TppLabel;
      ppSystemVariable27: TppSystemVariable;
      ppSummaryBand13: TppSummaryBand;
      ppLabel1: TppLabel;
      ppDBText1: TppDBText;
      ppDBCalc1: TppDBCalc;
      ppDBCalc2: TppDBCalc;
      ppLabel2: TppLabel;
      ppdsnLeituraArq: TppDesigner;
      qryFundacao: TwwQuery;
      dsFundacao: TwwDataSource;
      ppFundacao: TppBDEPipeline;
      shp1: TppShape;
      qryVirtualRUBRICA: TFloatField;
      qryVirtualQUANTIDADE: TFloatField;
      qryVirtualVALOR: TFloatField;
      qryVirtualTIPO: TFloatField;
      ppLabel3: TppLabel;
      ppDBText2: TppDBText;
      qryVirtualVALORINFO: TFloatField;
      ppLabel4: TppLabel;
      ppDBText3: TppDBText;
      ppDBCalc3: TppDBCalc;
      Button1: TButton;
      qryAux: TwwQuery;
      Label10: TLabel;
      reArq: TRichEdit;
      Button3: TButton;
      edtArquivo: TEdit;
      SpeedButton1: TSpeedButton;
      qryFolhaFuncef: TwwQuery;
      qryReembolso: TwwQuery;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    Panel5: TPanel;
    wwDBGrid3: TwwDBGrid;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RealEdit1: TRealEdit;
    RealEdit2: TRealEdit;
    RealEdit3: TRealEdit;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    Label14: TLabel;
    rgrpRelatorios: TRadioGroup;
    Panel8: TPanel;
    SpeedButton2: TSpeedButton;
    Edit1: TEdit;
    Panel9: TPanel;
    wwDBGrid4: TwwDBGrid;
    Button2: TButton;
    RichEdit1: TRichEdit;
    Button4: TButton;
    tbsFiltroDifINSS: TTabSheet;
    pnlFiltro: TPanel;
    DBcboEntidadeContabil2: TwwDBLookupCombo;
    qryLookEntidadeContabil: TwwQuery;
    qryLookEntidadeContabilNOME: TStringField;
    qryLookEntidadeContabilIDPLANOPREV: TFloatField;
    Label15: TLabel;
    cbMes: TComboBox;
    dbspano: TwwDBSpinEdit;
    Label16: TLabel;
    qryRubricaAcertoOrigem: TwwQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    FloatField2: TFloatField;
    chklstRubricas: TCheckListBox;
    Label17: TLabel;
    Label18: TLabel;
    edDifSuperior: TEdit;
    qryBeneficiario: TwwQuery;
    rgFiltro: TRadioGroup;
    pplblMesComp: TppLabel;
    Label19: TLabel;
    DbLkcPlanPrev: TwwDBLookupCombo;
    QryPlanPrev: TwwQuery;
    ppValorMantManual: TppBDEPipeline;
    dsValorMantManual: TwwDataSource;
    qryValorMantManual: TwwQuery;
    ppdsnValorMantManual: TppDesigner;
    rbValorMantManual: TppReport;
    qryValorMantManualPLANO: TStringField;
    qryValorMantManualMANTENEDORA: TStringField;
    qryValorMantManualVALOR_NO_MES_CREDITO: TFloatField;
    qryValorMantManualVALOR_NO_MES_DEBITO: TFloatField;
    qryValorMantManualVALOR_FORA_DO_MES_CREDITO: TFloatField;
    qryValorMantManualVALOR_FORA_DO_MES_DEBITO: TFloatField;
    qryValorMantManualVALOR_CREDITO: TFloatField;
    qryValorMantManualVALOR_DEBITO: TFloatField;
    ppParameterList1: TppParameterList;
    ppHeaderBand14: TppHeaderBand;
    ppShape13: TppShape;
    ppDBImage13: TppDBImage;
    ppDBText167: TppDBText;
    ppDBText168: TppDBText;
    ppDBText193: TppDBText;
    ppDBText196: TppDBText;
    ppDBText199: TppDBText;
    ppDBText201: TppDBText;
    ppDBText202: TppDBText;
    ppLabel194: TppLabel;
    ppDBText203: TppDBText;
    ppLabel196: TppLabel;
    ppLabel205: TppLabel;
    lblMesRefVlrMant: TppLabel;
    ppDetailBand15: TppDetailBand;
    BandaVM: TppShape;
    ppDBText204: TppDBText;
    ppDBText208: TppDBText;
    ppDBText209: TppDBText;
    ppDBText210: TppDBText;
    ppDBText211: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppFooterBand14: TppFooterBand;
    ppLine45: TppLine;
    ppLabel198: TppLabel;
    ppSystemVariable26: TppSystemVariable;
    ppSummaryBand10: TppSummaryBand;
    ppShape15: TppShape;
    ppLabel216: TppLabel;
    ppDBCalc69: TppDBCalc;
    ppLine65: TppLine;
    ppLabel217: TppLabel;
    ppLabel218: TppLabel;
    ppLine1: TppLine;
    ppDBCalc4: TppDBCalc;
    ppVariable1: TppVariable;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppShape1: TppShape;
    ppLabel199: TppLabel;
    ppLabel209: TppLabel;
    ppLabel200: TppLabel;
    ppLabel203: TppLabel;
    ppLabel204: TppLabel;
    ppLabel207: TppLabel;
    ppLabel208: TppLabel;
    ppGroupFooterBand1: TppGroupFooterBand;
    raCodeModule1: TraCodeModule;
    ppDBText6: TppDBText;
    ppLine2: TppLine;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppDBCalc10: TppDBCalc;
    ppLabel5: TppLabel;
    ppDBText7: TppDBText;
    qryVirtualSITUACAO: TStringField;
    ppLeituraArqppField6: TppField;

      procedure bbtnProcurarClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
      procedure dbGridCalcCellColors(Sender: TObject; Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont; ABrush: TBrush);
      procedure btnImprimirClick(Sender: TObject);
      procedure edtVlrSupKeyPress(Sender: TObject; var Key: Char);
      procedure btnImprimir1Click(Sender: TObject);
      procedure cboxMesChange(Sender: TObject);
      procedure pgTipoChange(Sender: TObject);
      procedure qryDadosImportBeforeOpen(DataSet: TDataSet);
      procedure qryINSSxMantAfterOpen(DataSet: TDataSet);
      procedure qryDadosImportAfterOpen(DataSet: TDataSet);
      procedure SB1Click(Sender: TObject);
      procedure rgrpRelatoriosClick(Sender: TObject);
      procedure ppDetailBand16BeforeGenerate(Sender: TObject);
      procedure ppDBText2GetText(Sender: TObject; var Text: String);
      procedure Button1Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
    procedure cbMesChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);


   private  // Private declarations

      sAnoMesCobranca : String;
      MesAno          : String;
      aRubricaINSS    : array of TRubricaINSS;
      aRubGrupoTipo4  : array of TRubricaINSS;
      CodRubINSS      : array[0..800] of Integer;
      procedure LimpaParametros(const qry: TwwQuery);

      procedure MontaQuery(sMesAno:String);

      //Relatórios
      procedure RelValoresProvisionados;
      procedure RelNaoPagosINSS;
      procedure RelBenefNIden;
      procedure RelValoresMantenedoras(const iManual: Integer);
      procedure RelValoresManuais;
      procedure RelDifProvPagos;
      procedure RelBenefEspecie;
      procedure RelBenefRubrica;
      procedure RelPAB;
      procedure RelGlosa;
      procedure RelListaExcecoes;
      procedure RelLeituraArquivo;
      procedure ListagemRubricas;
      procedure RelDiferencaINSSxFolhaBen;
      procedure RelDiferencaFolhaBen;
      procedure RelDiferencaFolhaBenSint;
      procedure MontaQueryEspecie(qry: Twwquery; pCodEspecie, pMesAno: String);
      procedure MontaQueryRubrica(qry: Twwquery; pCodRubrica, pMesAno: String);
      procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);

   public   // Public declarations

      LDetalhe : TDetalhe;

   end;



var
   frmResultConciliacao: TfrmResultConciliacao;



implementation
{$R *.DFM}
uses
   USistema, UdataBase,UmensErro, UAdmPrev, DRelatBeneficios,
   fAguarde, fParamRelEspecieRI, fParamRelRubricaRI;




procedure TfrmResultConciliacao.LimpaParametros(const qry: TwwQuery);
var
   i: integer;
begin
   // fecha a query p/ evitar problemas
   qry.Close;

   // prepara a query se já não estiver preparada
   if not(qry.Prepared) then qry.Prepare;

   // zera os parâmetros
   for i := 0 to (qry.ParamCount - 1) do
   begin
      qry.Params[i].Bound := False;
      qry.Params[i].Clear;
      qry.Params[i].Bound := True;
   end;
end;



procedure TfrmResultConciliacao.bbtnProcurarClick(Sender: TObject);
var
   Mes     :String;
   dTotalINSS, dTotalMant, dDiferenca : double;
begin
  inherited;
  // Critica Dados
  if (seAno.Text   = '') Or (cboxMes.Text = '') then begin
    ShowMessage('Faltam Preencher Campos ...');
    seAno.SetFocus;
    Exit;
  end;

  if trim(edtVlrSup.Text) <> '' then
    try // critica valor
      StrToFloat(trim(edtVlrSup.Text));
    except
      ShowMessage('Valor inválido!');
      Exit;
    end;

// Transforma data em AnoMes
  if (cboxMes.ItemIndex + 1) < 10 then
    Mes := '0'+IntToStr((cboxMes.ItemIndex + 1))
  else
    Mes := IntToStr((cboxMes.ItemIndex + 1));

  MesAno :=  IntToStr(seAno.Value) + '/' + Mes ;

// Verifica na DetConc os Dados desejados na consulta

  With qryINSSxMant Do
  begin
    MontaQuery(MesAno);
    // Calcular Totais
    if IsEmpty then
    begin
       dTotalINSS := 0;
       dTotalMant := 0;
       dDiferenca := 0;
       edTotalINSS.Value := dTotalINSS;
       edTotalMant.Value := dTotalMant;
       edDiferenca.Value := dDiferenca;
    end else
    begin
       First;
       DisableControls;
       dTotalINSS := 0;
       dTotalMant := 0;
       dDiferenca := 0;
       while not Eof do
       begin
          dTotalINSS := dTotalINSS + FieldByName('VALORINSS').AsFloat;
          dTotalMant := dTotalMant + FieldByName('VALORMANT').AsFloat;
          Next;
       end;
       First;
       EnableControls;
       dDiferenca := dTotalINSS - dTotalMant;
       edTotalINSS.Value := dTotalINSS;
       edTotalMant.Value := dTotalMant;
       edDiferenca.Value := dDiferenca;
    end;

  end;
end;

procedure TfrmResultConciliacao.FormShow(Sender: TObject);
var sSQL : string;
    AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cboxMes.ItemIndex := AMonth - 1;
     cboxMes.Text      := cboxMes.Items[cboxMes.ItemIndex];
  end;
  seAno.Text   := IntToStr(AYear);

  edTotalINSS.Value := 0;
  edTotalMant.Value := 0;
  edDiferenca.Value := 0;
  WindowState := wsMaximized;

  pgTipo.ActivePageIndex := 0;
  pgTipo.OnChange(Self);
end;

procedure TfrmResultConciliacao.dbGridCalcCellColors(Sender: TObject;
  Field: TField; State: TGridDrawState; Highlight: Boolean; AFont: TFont;
  ABrush: TBrush);
begin
  inherited;
  // Se tiver valor no INSS e nao tiver na mantenedora
  // Entao usar AMARELO
  // Senao Se tiver valor da mantenedora e não tiver no INSS
  //       Entao  AZUL
  //       Senao Se tiver valor nos dois mas os valores forem diferentes
  //             Entao usar BRANCO
  with qryINSSxMant do
  begin
    if (not Active) or (IsEmpty) then Exit;

    if Field.FieldNo = 1
    then ABrush.Color := clBtnFace
    else begin
       if (FieldbyName('VALORINSS').AsFloat >= 0) and (FieldbyName('VALORMANT').AsFloat <= 0)
       then begin
          ABrush.Color := $0080FFFF;
          AFont.Color  := clWindowText;
          Highlight    := False;
       end
       else if (FieldbyName('VALORINSS').AsFloat <= 0) and (FieldbyName('VALORMANT').AsFloat >= 0)
            then begin
               ABrush.Color := $00FF8080;
               AFont.Color  := clWindowText;
               Highlight    := False;
            end
            else begin
               ABrush.Color := clWhite;
               AFont.Color  := clWindowText;
               Highlight    := False;
            end;
    end;
  end;
end;

procedure TfrmResultConciliacao.btnImprimirClick(Sender: TObject);
begin
  inherited;
  // Verifica qual relatório foi selecionado para exibição.
  // É disparada uma procidure para ativar a chamada ao rel. referente.

   case rgrpRelatorios.ItemIndex of
      0: RelValoresProvisionados;
      1: RelNaoPagosINSS;
      2: RelBenefNIden;
      3: RelValoresMantenedoras(0);
      4: RelValoresManuais; 
      5: RelValoresMantenedoras(2);
      6: RelDifProvPagos;
      7: RelBenefEspecie;
      8: RelBenefRubrica;
      9: RelPAB;
     10: RelGlosa;
     11: RelListaExcecoes;
     12: RelLeituraArquivo;
     13: ListagemRubricas;
     14: RelDiferencaINSSxFolhaBen;
     15: RelDiferencaFolhaBen;       
     16: RelDiferencaFolhaBenSint;   
  end;
end;



procedure TfrmResultConciliacao.edtVlrSupKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if key in ['A'..'Z','a'..'z','.'] then
    key := #0;
end;

procedure TfrmResultConciliacao.MontaQuery(sMesAno: String);
begin

  // Abre arquivo dos dados importados
  qryDadosImport.Close;
  qryDadosImport.ParamByName('MESREFERENCIA').AsString := sMesAno;
  qryDadosImport.Open;

  if Not cboxExibeDivergencias.Checked then Exit;

  With qryINSSxMant Do
  begin
    SQL.Clear;
    SQL.Add(' SELECT  D.MESREFERENCIA, ' +
            '         D.NUMPROCINSS, ' +
            '         D.IDBENEFICIO, ' +
            '         D.SEQUENCIAL, ' +
            '         D.IDPLANOPREV, ' +
            '         D.IDRUBRICA, ' +
            '         D.SINONIMO, ' +
            '         D.IDPESSOA, ' +
            '         D.CODCONCESSORINSS, ' +
            '         NVL(D.VALORINSS,0) VALORINSS, ' +
            '         D.CODMANTENEDORINSS, ' +
            '         NVL(D.VALORMANT,0) VALORMANT, ' +
            '         PD.CODPROVDESC, ' +
            '         PD.DESCRPROVDESC, ' +
            '         P.NOME ' +
            ' FROM    DETCONCINSS D, PROVDESC PD, PESSOA P '+
            ' WHERE   D.MESREFERENCIA = '''+ sMesAno +'''');
    if Trim(edtVlrSup.Text) <> '' then
      SQL.Add( '   AND   (NVL(D.VALORINSS,0) - NVL(D.VALORMANT,0)) > '+ OraNumero(edtVlrSup.Text));

    SQL.Add( '   AND   NVL(D.VALORINSS,0) <> NVL(D.VALORMANT,0) '+
             '   AND   D.IDRUBRICA = PD.IDPROVENTO '+
             '   AND   P.IDPESSOA  = D.IDPESSOA'+
             ' ORDER   BY P.NOME ');
    Open;
  end;
end;

procedure TfrmResultConciliacao.btnImprimir1Click(Sender: TObject);
begin
  inherited;
  // este botão atende os dois tipo de relatórios, dependendo a aba que o
  // usuário estiver. (Dados Importados / Divergências)

  if pgTipo.ActivePageIndex = 0 then
  begin // Dados Importados
    With DtmRelatBeneficios Do
    begin
      qryDadosImport.Close;
      qryDadosImport.ParamByName('MESREFERENCIA').AsString := MesAno;
      qryDadosImport.Open;
      lblMesReferencia2.Caption := MesAno;

      ppdsnDadosImport.Report.Template.SaveTo   := stFile;
      ppdsnDadosImport.Report.Template.Format   := ftASCII;
      ppdsnDadosImport.Report.Device            := dvScreen;
      TFrmPreview.CreateModalPreview(Application, ppdsnDadosImport.Report, 'Reembolso INSS - Dados Importados');
    end;
  end else
  begin
    With DtmRelatBeneficios Do
    begin // Divergências.
      qryProvProvisionados.Close;
      qryProvProvisionados.ParamByName('MESREFERENCIA').AsString := MesAno;
      qryProvProvisionados.Open;
      lblMesReferencia.Caption := MesAno;

      qryProvResumoSigla.Close;
      qryProvResumoSigla.ParamByName('MESREFERENCIA').AsString := MesAno;
      qryProvResumoSigla.Open;

      ppDsgnProvProvisionados.Report.Template.SaveTo   := stFile;
      ppDsgnProvProvisionados.Report.Template.Format   := ftASCII;
      ppDsgnProvProvisionados.Report.Device            := dvScreen;
      TFrmPreview.CreateModalPreview(Application, ppDsgnProvProvisionados.Report, 'Reembolso INSS - Proventos Provisionados');
    end;
  end;

end;

procedure TfrmResultConciliacao.cboxMesChange(Sender: TObject);
var
  Mes: String;
begin
  inherited;
// Transforma data em AnoMes
  if (cboxMes.ItemIndex + 1) < 10 then
    Mes := '0'+IntToStr((cboxMes.ItemIndex + 1))
  else
    Mes := IntToStr((cboxMes.ItemIndex + 1));

  MesAno :=  IntToStr(seAno.Value) + '/' + Mes ;

end;

procedure TfrmResultConciliacao.pgTipoChange(Sender: TObject);
begin
  inherited;
  // controla a exibição da legenda.
  pnlLegenda.Visible := pgTipo.ActivePageIndex = 1;
  Case pgTipo.ActivePageIndex of
    0:
      begin
        btnImprimir1.Caption := 'Dados Importados';
        btnImprimir1.Width := 140;
      end;
    1:
      begin
        btnImprimir1.Caption := 'Provisão';
        btnImprimir1.Width := 80;
        cboxExibeDivergencias.Visible := False;
      end;

    2: // relatórios
      begin
        cboxMes.OnChange(self);
      end;
  end;
end;

procedure TfrmResultConciliacao.qryDadosImportBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Mostra('Aguarde! Abrindo consulta (Dados Importados)...');
end;

procedure TfrmResultConciliacao.qryINSSxMantAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;

procedure TfrmResultConciliacao.qryDadosImportAfterOpen(DataSet: TDataSet);
begin
  inherited;
  frmAguarde.Apaga;
end;



procedure TfrmResultConciliacao.RelBenefEspecie;
begin
   // Relatório 020.236
   // Abrir form do filtro.
   try
      Application.CreateForm(TfrmParamRelEspecieRI, frmParamRelEspecieRI);

      if frmParamRelEspecieRI.Showmodal = mrOk then
      begin
         with dtmRelatBeneficios Do
         begin
            MontaQueryEspecie(qryEspecie, frmParamRelEspecieRI.sCodEspecie, MesAno);

            lblTituloEspecie.Caption               := frmParamRelEspecieRI.sCodEspecie2;
            lblMesRefEpecie.Caption                := MesAno;

            ppDsnEspecie.Report.Template.SaveTo    := stFile;
            ppDsnEspecie.Report.Template.Format    := ftASCII;
            ppDsnEspecie.Report.Device             := dvScreen;

            TFrmPreview.CreateModalPreview(Application, ppDsnEspecie.Report, 'Reembolso INSS - Beneficiários Por Espécie');
         end;
      end;

   finally
      frmParamRelEspecieRI.Free;
   end;
end;



procedure TfrmResultConciliacao.RelBenefNIden;
begin
  // Relatório 020.208
  with DtmRelatBeneficios Do
  begin
    qryNLocalizados.Close;;
    qryNLocalizados.ParamByname('MESREFERENCIA').AsString := MesAno;
    qryNLocalizados.Open;
    lblMesRefNIden.Caption := MesAno;
    ppDsnNLocalizados.Report.Template.SaveTo   := stFile;
    ppDsnNLocalizados.Report.Template.Format   := ftASCII;
    ppDsnNLocalizados.Report.Device            := dvScreen;
    TFrmPreview.CreateModalPreview(Application, ppDsnNLocalizados.Report, 'Reembolso INSS - Resultado da Conciliação');
  end;

end;

procedure TfrmResultConciliacao.RelBenefRubrica;
begin
   // Relatório 020.234
   // Abrir form do filtro.
   try

      Application.CreateForm(TfrmParamRelRubricaRI,frmParamRelRubricaRI);
      if frmParamRelRubricaRI.Showmodal = mrOk then
      begin
         with DtmRelatBeneficios Do
         begin
            MontaQueryRubrica(qryRubrica, frmParamRelRubricaRI.sRubrica, MesAno);

            lblTituloRubrica.Caption               := frmParamRelRubricaRI.sRubrica;
            lblMesRefRub.Caption                   := MesAno;

            ppDsnRubrica.Report.Template.SaveTo    := stFile;
            ppDsnRubrica.Report.Template.Format    := ftASCII;
            ppDsnRubrica.Report.Device             := dvScreen;

            TFrmPreview.CreateModalPreview(Application, ppDsnRubrica.Report, 'Reembolso INSS - Beneficiários Por Rubrica');
         end;
      end;

   finally
      frmParamRelEspecieRI.Free;
   end;
end;




procedure TfrmResultConciliacao.RelDifProvPagos;
begin
   // Relatório 020.235
   with DtmRelatBeneficios Do
   begin
      qryResultINSS.Close;
      qryResultINSS.ParamByname('PMESREFERENCIA').AsString := MesAno;
      qryResultINSS.Open;

      lblMesRefResult.Caption                   := MesAno;
      ppDsgnResultINSS.Report.Template.SaveTo   := stFile;
      ppDsgnResultINSS.Report.Template.Format   := ftASCII;
      ppDsgnResultINSS.Report.Device            := dvScreen;

      TFrmPreview.CreateModalPreview(Application, ppDsgnResultINSS.Report, 'Reembolso INSS - Resultado da Conciliação');
   end;
end;



procedure TfrmResultConciliacao.RelGlosa;
begin
   // Relatório 020.223
   with DtmRelatBeneficios Do
   begin
      qryGlosa.Close;
      qryGlosa.ParamByname('PMESREFERENCIA').AsString := MesAno;
      qryGlosa.Open;

      lblMesRefGlosa.Caption              := MesAno;
      ppDsnGlosa.Report.Template.SaveTo   := stFile;
      ppDsnGlosa.Report.Template.Format   := ftASCII;
      ppDsnGlosa.Report.Device            := dvScreen;

      TFrmPreview.CreateModalPreview(Application, ppDsnGlosa.Report, 'Relação de Valores Glosados Pelo INSS');
   end;
end;



procedure TfrmResultConciliacao.RelPAB;
begin
   // Relatório 020.225
   with dtmRelatBeneficios Do
   begin
      qryPAB.Close;
      qryPAB.ParamByname('PMESREFERENCIA').AsString := MesAno;
      qryPAB.Open;

      lblMesRefPAB.Caption             := MesAno;
      ppDsnPAB.Report.Template.SaveTo  := stFile;
      ppDsnPAB.Report.Template.Format  := ftASCII;
      ppDsnPAB.Report.Device           := dvScreen;

      TFrmPreview.CreateModalPreview(Application, ppDsnPAB.Report, 'Relatório de Pagamentos de Alteração de Benefício - PAB');
   end;
end;



procedure TfrmResultConciliacao.RelValoresMantenedoras(const iManual: Integer);
var
   sTitulo : String;
begin
   sTitulo := 'Relação de Valores Por Entidade / Mantenedora';

   // Relatório 020.217
   with dtmRelatBeneficios do
   begin
      LimpaParametros(dtmRelatBeneficios.qryValorMant);

      qryValorMant.ParamByname('MESCOBRANCA').AsString := MesAno;

      // -------------------------------------------------------------------------------------------
      case iManual of

         0:
         begin
            qryValorMant.ParamByname('PFLGMANUAL').AsInteger := 0;
            sTitulo := sTitulo + ' - ARQUIVO ORIGINAL';  
         end;

         1: qryValorMant.ParamByname('PFLGMANUAL').AsInteger := 1;

         2: sTitulo := sTitulo + ' - COM ENTRADAS MANUAIS'; 

      end;
      // -------------------------------------------------------------------------------------------

      qryValorMant.Open;

      rptValorMant_lblTitulo.Caption         := sTitulo; 
      lblMesRefVlrMant.Caption               := MesAno;

      ppDsnValorMant.Report.Template.SaveTo  := stFile;
      ppDsnValorMant.Report.Template.Format  := ftASCII;
      ppDsnValorMant.Report.Device           := dvScreen;

      TFrmPreview.CreateModalPreview(Application, ppDsnValorMant.Report, 'Relação de Valores por Mantenedora');
   end;
end;

procedure TfrmResultConciliacao.RelValoresProvisionados;
begin
  //
end;



procedure TfrmResultConciliacao.MontaQueryEspecie(qry: Twwquery; pCodEspecie, pMesAno: String);
begin
   qry.SQL.Clear;
   qry.SQL.Text :=

   'SELECT '                                                                  + #13 +
   '   PL.NOME AS ENTIDADE, BF.DATAINICIOFUND, '                              + #13 +
   '   B.CODBENEFICIO, DP.MATRICULA, P.NOME, '                                + #13 +
   '   D.NUMPROCINSS, D.VALORINSS, PD.CODPROVDESC, '                          + #13 +
   '   RXI.RUBRICAINSS, ' + QuotedStr(pMesAno) + 'AS MESREFERENCIA '          + #13 +

   'FROM '                                                                    + #13 +
   '   PESSOA        P,   '                                                   + #13 +
   '   BENEFBFCIARIO BF,  '                                                   + #13 +
   '   DEPENTIT      DP,  '                                                   + #13 +
   '   PROVDESC      PD,  '                                                   + #13 +
   '   RUBRICAXINSS  RXI, '                                                   + #13 +
   '   BENEFICIO     B,   '                                                   + #13 +
   '   PLANPREV      PL,  '                                                   + #13 +

   '   ( '                                                                    + #13 +
   '   SELECT '                                                               + #13 +
   '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFICIO, '    + #13 +
   '      SUM(NVL(DCI.VALORINSS, 0)) AS VALORINSS, '                          + #13 +
   '      SUM(NVL(DCI.VALORMANT, 0)) AS VALORMANT '                           + #13 +
   '   FROM '                                                                 + #13 +
   '      DETCONCINSS DCI '                                                   + #13 +
   '   WHERE '                                                                + #13 +
   '      DCI.MESREFERENCIA = ' + QuotedStr(pMesAno)                          + #13 +
   '   GROUP BY '                                                             + #13 +
   '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFICIO '     + #13 +
   '   ) D '                                                                  + #13 +

   'WHERE '                                                                   + #13 +
   '       B.CODBENEFICIO     IN (' + pCodEspecie + ') '                      + #13 +
   '   AND P.IDPESSOA         = D.IDPESSOA '                                  + #13 +
   '   AND BF.IDPESSOA        = D.IDPESSOA '                                  + #13 +
   '   AND BF.IDBENEFICIO     = D.IDBENEFICIO '                               + #13 +
   '   AND BF.NUMPROCINSS     = D.NUMPROCINSS '                               + #13 +
   '   AND DP.IDPESSOA        = D.IDPESSOA '                                  + #13 +
   '   AND D.IDRUBRICA        = RXI.IDRUBRICA '                               + #13 +
   '   AND B.IDBENEFICIO      = D.IDBENEFICIO '                               + #13 +
   '   AND PL.IDPLANOPREV     = BF.IDPLANOPREV '                              + #13 +
   '   AND PD.IDPROVENTO      = D.IDRUBRICA '                                 + #13 +

   'ORDER BY '                                                                + #13 +
   '   PL.NOME, P.NOME';

   qry.Open;
end;



procedure TfrmResultConciliacao.MontaQueryRubrica(qry: Twwquery; pCodRubrica, pMesAno: String);
begin
   qry.SQL.Clear;
   qry.SQL.Text :=

   'SELECT '                                                                  + #13 +
   '   PL.NOME AS ENTIDADE, BF.DATAINICIOFUND, B.CODBENEFICIO, '              + #13 +
   '   DP.MATRICULA, P.NOME, D.NUMPROCINSS, D.VALORINSS, '                    + #13 +
   '   PD.CODPROVDESC, RXI.RUBRICAINSS '                                      + #13 +

   'FROM '                                                                    + #13 +
   '   PESSOA        P,    '                                                  + #13 +
   '   BENEFBFCIARIO BF,   '                                                  + #13 +
   '   DEPENTIT      DP,   '                                                  + #13 +
   '   PROVDESC      PD,   '                                                  + #13 +
   '   RUBRICAXINSS  RXI,  '                                                  + #13 +
   '   BENEFICIO     B,    '                                                  + #13 +
   '   PLANPREV      PL,   '                                                  + #13 +

   '   ( '                                                                    + #13 +
   '   SELECT '                                                               + #13 +
   '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFICIO, '    + #13 +
   '      SUM(NVL(DCI.VALORINSS, 0)) AS VALORINSS, '                          + #13 +
   '      SUM(NVL(DCI.VALORMANT, 0)) AS VALORMANT '                           + #13 +
   '   FROM '                                                                 + #13 +
   '      DETCONCINSS DCI '                                                   + #13 +
   '   WHERE '                                                                + #13 +
   '      DCI.MESREFERENCIA = ' + QuotedStr(pMesAno)                          + #13 +
   '   GROUP BY '                                                             + #13 +
   '      DCI.IDPESSOA, DCI.NUMPROCINSS, DCI.IDRUBRICA, DCI.IDBENEFICIO '     + #13 +
   '   ) D '                                                                  + #13 +

   'WHERE '                                                                   + #13 +
   '       RXI.RUBRICAINSS    IN (' + pCodRubrica + ') '                      + #13 +
   '   AND P.IDPESSOA         = D.IDPESSOA '                                  + #13 +
   '   AND BF.IDPESSOA        = D.IDPESSOA '                                  + #13 +
   '   AND BF.IDBENEFICIO     = D.IDBENEFICIO '                               + #13 +
   '   AND BF.NUMPROCINSS     = D.NUMPROCINSS '                               + #13 +
   '   AND DP.IDPESSOA        = D.IDPESSOA '                                  + #13 +
   '   AND D.IDRUBRICA        = RXI.IDRUBRICA '                               + #13 +
   '   AND B.IDBENEFICIO      = D.IDBENEFICIO '                               + #13 +
   '   AND PL.IDPLANOPREV     = BF.IDPLANOPREV '                              + #13 +
   '   AND PD.IDPROVENTO      = D.IDRUBRICA '                                 + #13 +

   'ORDER BY '                                                                + #13 +
   '   PL.NOME, P.NOME';

   qry.Open;
end;



procedure TfrmResultConciliacao.RelListaExcecoes;
begin
  with DtmRelatBeneficios Do
  begin
    qryListaExcecoes.Close;;
    qryListaExcecoes.ParamByname('MESREFERENCIA').AsString := MesAno;
    qryListaExcecoes.Open;
    lblTituloListaExcecoes.Caption := MesAno;
    ppDsnPAB.Report.Template.SaveTo   := stFile;
    ppDsnPAB.Report.Template.Format   := ftASCII;
    ppDsnPAB.Report.Device            := dvScreen;
    TFrmPreview.CreateModalPreview(Application, ppDsnListaExcecoes.Report, 'Lista de Exceções');
  end;


end;

procedure TfrmResultConciliacao.RelLeituraArquivo;
  {==>}
  Function RubProvento(pRubrica: String): Integer;
  { 1 = Proventos
    2 = Descontos
    3 = Informativa  }
  begin
    if ((Copy(pRubrica,2,1) = '1') And
       ((Copy(pRubrica,1,1) = '1') Or
        (Copy(pRubrica,1,1) = '2') Or
        (Copy(pRubrica,1,1) = '4'))) Or
       ((Copy(pRubrica,2,1) = '2') And
        (Copy(pRubrica,1,1) = '9'))
        then
      Result := 1
    else if ((Copy(pRubrica,2,1) = '2') And
            ((Copy(pRubrica,1,1) = '2') Or
             (Copy(pRubrica,1,1) = '4'))) Or
            ((Copy(pRubrica,1,1) = '9') And
             (Copy(pRubrica,2,1) = '1')) Or
            ((Copy(pRubrica,1,1) = '1') And
             (Copy(pRubrica,2,1) = '2')) then
      Result := 2
    else Result := 3;
  end;

var
  wArq          : TextFile;
  iCont,
  wTipoLinha,
  i             : Integer;
  wLinha        : String;

begin
  // Lê o arquivo da DataPrev e soma os valores das rubricas

  qryVirtual.Close;
  qryVirtual.Open;
  SetLength(aRubricaINSS,4);
  SetLength(aRubGrupoTipo4,9);
  pnlGridLeituraArq.Visible := True;

  // Abre dlg para localiazar arquivo.
  AssignFile(wArq, edtArquivo.Text);
  Reset(wArq);
  iCont := 0;
  frmAguarde.Mostra('Aguarde! Processando Informações...');
  While Not Eof(wArq) Do
  begin
    // Lê a Linha
    Readln(wArq,wLinha);
    Application.ProcessMessages;

    // Caso Linha vazia pula
    if Trim(wLinha) = '' then Continue;

    // Guarda Tipo de Linha
    wTipoLinha:=StrToInt(Copy(wLinha,1,1));

    // Executa Processamento da linha 3
    if  Not (wTipoLinha in [3,4])then Continue;

    // ***** REGISTRO TIPO 3 - DETALHE *****
    if wTipoLinha = 3 then
    begin
      LDetalhe.FlgTemRubrica := Copy(wLinha,73,73);
      LDetalhe.TipoDetalhe     := Copy(wLinha,42,01);
      aRubricaINSS[0].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,74,03);
      aRubricaINSS[0].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,77,9)+','+Copy(wLinha,86,2)));

      aRubricaINSS[1].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,88,03);
      aRubricaINSS[1].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,91,9)+','+Copy(wLinha,100,2)));

      aRubricaINSS[2].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,102,03);
      aRubricaINSS[2].Valor      := StrToFloat(ClienteNumero(Copy(wLinha,105,9)+','+Copy(wLinha,114,2)));

      aRubricaINSS[3].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,116,03);
      aRubricaINSS[3].Valor      := StrToFloat(ClienteNumero(Copy(wLinha,119,9)+','+Copy(wLinha,128,2)));

      // varre as 4 rubricas
      For i := 0 to 3 Do
      begin
        Application.ProcessMessages;

        if (Copy(aRubricaINSS[I].CodRubrica,2,3) = '000') Or
           (aRubricaINSS[I].Valor = 0) then Continue;

        if (qryVirtual.Locate('RUBRICA',aRubricaINSS[I].CodRubrica,[])) then
        begin
          // Acumula
          qryVirtual.Edit;
          Case RubProvento(aRubricaINSS[I].CodRubrica) Of
            1 : qryVirtual.FieldByName('VALOR').AsFloat := qryVirtual.FieldByName('VALOR').AsFloat +
                                                             aRubricaINSS[I].Valor;
            2 : qryVirtual.FieldByName('VALOR').AsFloat := qryVirtual.FieldByName('VALOR').AsFloat -
                                                             aRubricaINSS[I].Valor;
            3 : qryVirtual.FieldByName('VALORINFO').AsFloat := qryVirtual.FieldByName('VALORINFO').AsFloat +
                                                             aRubricaINSS[I].Valor;
          end; // Case
          qryVirtual.FieldByName('QUANTIDADE').AsFloat := qryVirtual.FieldByName('QUANTIDADE').AsFloat + 1;
          qryVirtual.Post;
        end else
        begin
          // Inclui
          qryVirtual.Insert;
          qryVirtual.FieldByName('RUBRICA').AsString := aRubricaINSS[I].CodRubrica;

          // SOL 137572-4661 KINTANA 1252969 - Vinicius Ferreira - Inicio
          qryAux.SQL.Clear;
          qryAux.SQL.Add(' SELECT * FROM RUBRICAXINSS WHERE RUBRICAINSS = '+ aRubricaINSS[I].CodRubrica );
          qryAux.open;
          if qryAux.IsEmpty then
            qryVirtual.FieldByName('SITUACAO').AsString := 'Não Existente'
          else
            qryVirtual.FieldByName('SITUACAO').AsString := 'Existente';
          // SOL 137572-4661 KINTANA 1252969 - Vinicius Ferreira - Fim
          
          if RubProvento(aRubricaINSS[I].CodRubrica) = 1 then
          begin
            qryVirtual.FieldByName('VALOR').AsFloat := aRubricaINSS[I].Valor;
            qryVirtual.FieldByName('TIPO').AsInteger := 1;
          end else if RubProvento(aRubricaINSS[I].CodRubrica) = 2 then
          begin
            qryVirtual.FieldByName('VALOR').AsFloat :=  - aRubricaINSS[I].Valor;
            qryVirtual.FieldByName('TIPO').AsInteger := 2;
          end else
          begin
            qryVirtual.FieldByName('TIPO').AsInteger := 3;
            qryVirtual.FieldByName('VALORINFO').AsFloat :=  - aRubricaINSS[I].Valor;
          end;
          qryVirtual.FieldByName('QUANTIDADE').AsFloat := 1;
          qryVirtual.Post;
        end;
      end; // For i := 0 to 3 Do
    end else if LDetalhe.FlgTemRubrica = '1' then
    begin
      // ***** REGISTRO TIPO 4 - RUBRICA *****
      aRubGrupoTipo4[0].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,25,03);;
      aRubGrupoTipo4[0].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,28,9)+','+Copy(wLinha,37,2)));
      aRubGrupoTipo4[1].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,39,03);;
      aRubGrupoTipo4[1].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,42,9)+','+Copy(wLinha,51,2)));
      aRubGrupoTipo4[2].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,53,03);;
      aRubGrupoTipo4[2].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,56,9)+','+Copy(wLinha,65,2)));
      aRubGrupoTipo4[3].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,67,03);;
      aRubGrupoTipo4[3].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,70,9)+','+Copy(wLinha,79,2)));
      aRubGrupoTipo4[4].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,81,03);;
      aRubGrupoTipo4[4].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,84,9)+','+Copy(wLinha,93,2)));
      aRubGrupoTipo4[5].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,95,03);;
      aRubGrupoTipo4[5].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,98,9)+','+Copy(wLinha,107,2)));
      aRubGrupoTipo4[6].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,109,03);;
      aRubGrupoTipo4[6].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,112,9)+','+Copy(wLinha,121,2)));
      aRubGrupoTipo4[7].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,123,03);;
      aRubGrupoTipo4[7].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,126,9)+','+Copy(wLinha,135,2)));
      aRubGrupoTipo4[8].CodRubrica  := LDetalhe.TipoDetalhe + Copy(wLinha,137,03);;
      aRubGrupoTipo4[8].Valor       := StrToFloat(ClienteNumero(Copy(wLinha,140,9)+','+Copy(wLinha,149,2)));

      // varre as 9 rubricas
      For i := 0 to 8 Do
      begin
        Application.ProcessMessages;

        if (Copy(aRubGrupoTipo4[I].CodRubrica,2,3) = '000') Or
           (aRubGrupoTipo4[I].Valor = 0) then Continue;     // André/Rafael - 23/09/2019  SIG 92110

        if (qryVirtual.Locate('RUBRICA',aRubGrupoTipo4[I].CodRubrica,[])) then
        begin
          // Acumula
          qryVirtual.Edit;
          Case RubProvento(aRubGrupoTipo4[I].CodRubrica) Of
            1 : qryVirtual.FieldByName('VALOR').AsFloat := qryVirtual.FieldByName('VALOR').AsFloat +
                                                             aRubGrupoTipo4[I].Valor;
            2 : qryVirtual.FieldByName('VALOR').AsFloat := qryVirtual.FieldByName('VALOR').AsFloat -
                                                             aRubGrupoTipo4[I].Valor;
            3 : qryVirtual.FieldByName('VALORINFO').AsFloat := qryVirtual.FieldByName('VALORINFO').AsFloat +
                                                             aRubGrupoTipo4[I].Valor;
          end; // Case
          qryVirtual.FieldByName('QUANTIDADE').AsFloat := qryVirtual.FieldByName('QUANTIDADE').AsFloat + 1;
          qryVirtual.Post;
        end else
        begin
          // Inclui
          qryVirtual.Insert;
          qryVirtual.FieldByName('RUBRICA').AsString := aRubGrupoTipo4[I].CodRubrica;

          // SOL 137572-4661 KINTANA 1252969 - Vinicius Ferreira - Inicio
            qryAux.SQL.Clear;
            qryAux.SQL.Add(' SELECT * FROM RUBRICAXINSS WHERE RUBRICAINSS = '+ aRubGrupoTipo4[I].CodRubrica );// André/Rafael - 23/09/2019  SIG 92110
            qryAux.open;
            if qryAux.IsEmpty then
              qryVirtual.FieldByName('SITUACAO').AsString := 'Não Existente'
            else
              qryVirtual.FieldByName('SITUACAO').AsString := 'Existente';
          
          // SOL 137572-4661 KINTANA 1252969 - Vinicius Ferreira - Fim

          if RubProvento(aRubGrupoTipo4[I].CodRubrica) = 1 then
          begin
            qryVirtual.FieldByName('VALOR').AsFloat := aRubGrupoTipo4[I].Valor;
            qryVirtual.FieldByName('TIPO').AsInteger := 1;
          end else if RubProvento(aRubGrupoTipo4[I].CodRubrica) = 2 then
          begin
            qryVirtual.FieldByName('VALOR').AsFloat :=  - aRubGrupoTipo4[I].Valor;
            qryVirtual.FieldByName('TIPO').AsInteger := 2;
          end else
          begin
            qryVirtual.FieldByName('TIPO').AsInteger := 3;
            qryVirtual.FieldByName('VALORINFO').AsFloat :=  - aRubGrupoTipo4[I].Valor;
          end;
          qryVirtual.FieldByName('QUANTIDADE').AsFloat := 1;
          qryVirtual.Post;
        end;
      end; // For i := 0 to 8 Do


    end;
    // contador
    Inc(iCont);
    Application.ProcessMessages;
  end; // While Not Eof(wArq) Do

  // Abre o relatório com o somatório.
  pnlGridLeituraArq.Visible := False;

  qryFundacao.close;
  //qryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao; //SOL 137572-4661 KINTANA 1252969 - Vinicius Ferreira
  qryFundacao.ParamByName('pFundacao').AsInteger := Sistema.IdEmpresa; //SOL 137572-4661 KINTANA 1252969 - Vinicius Ferreira
  qryFundacao.Open;
  frmAguarde.Apaga;
  pplblMesComp.Caption                     := 'Mês de Competência: '+cboxMes.Text+'/'+seAno.Text;  
  ppdsnLeituraArq.Report.Template.SaveTo   := stFile;
  ppdsnLeituraArq.Report.Template.Format   := ftASCII;
  ppdsnLeituraArq.Report.Device            := dvScreen;
  TFrmPreview.CreateModalPreview(Application, ppdsnLeituraArq.Report, 'Resultado da Leitura do Arquivo DataPrev');

  CloseFile(wArq);    //edilaine WO4498-4676

end;

procedure TfrmResultConciliacao.SB1Click(Sender: TObject);
begin
  inherited;
  if (OpenDialog1.Execute) then
    Edit1.Text        := UpperCase(OpenDialog1.FileName);
  Edit1.Refresh;
  edtArquivo.Text   := UpperCase(OpenDialog1.FileName);


  //edilaine WO4498-4676 : inicio
  if Edit1.Text <> '' then
    with TStringList.create do
     try
       LoadFromFile(Edit1.Text);
       SaveToFile(Edit1.Text);
     finally
       Free;
     end;
  //edilaine WO4498-4676: fim

//  edtArquivo.Refresh;
end;

procedure TfrmResultConciliacao.rgrpRelatoriosClick(Sender: TObject);
begin
  inherited;
  pnlLocalizaArquivo.Enabled :=  rgrpRelatorios.ItemIndex = 10;
  if (rgrpRelatorios.ItemIndex = 14) or (rgrpRelatorios.ItemIndex = 15) or
     (rgrpRelatorios.ItemIndex = 16) Then Begin
     pnlFiltro.Visible := True;
     pnlFiltro.Enabled := True;
     PageControl1.ActivePageIndex := 2;
     qryLookEntidadeContabil.Close;
     qryLookEntidadeContabil.Open;

     QryPlanPrev.Close;
     QryPlanPrev.Open;

     qryRubricaAcertoOrigem.Close;
     qryRubricaAcertoOrigem.Open;
     CriaLista(chklstRubricas,qryRubricaAcertoOrigem);
  end
  else Begin
     pnlFiltro.Visible := False;
     pnlFiltro.Enabled := False;
     PageControl1.ActivePageIndex := 1;
  end;
end;

procedure TfrmResultConciliacao.ppDetailBand16BeforeGenerate(
  Sender: TObject);
begin
  inherited;
  if qryVirtual.FieldByName('TIPO').AsInteger = 3 then
    shp1.Brush.Color := clGray
  else if qryVirtual.FieldByName('TIPO').AsInteger = 1 then
    shp1.Brush.Color := clwhite
  else if qryVirtual.FieldByName('TIPO').AsInteger = 2 then
    shp1.Brush.Color := clSilver;
end;

procedure TfrmResultConciliacao.ppDBText2GetText(Sender: TObject;
  var Text: String);
begin
  inherited;
  if Text = '1' then
    Text := 'Provento'
  else if Text = '2' then
    Text := 'Desconto'
  else Text := 'Informativa';
end;

procedure TfrmResultConciliacao.Button1Click(Sender: TObject);
var
  wArq,
  wSaida          :TextFile;
  wLinha,
  sNUMPROCINSS    : String;
  i,
  wTipoLinha      : Integer;
begin
  inherited;
  // abre arquivo DataPrev
  if (OpenDialog1.Execute) then
    edtArquivo.Text   := UpperCase(OpenDialog1.FileName);

  // Abre dlg para localiazar arquivo.
  AssignFile(wArq, edtArquivo.Text);
  Reset(wArq);

  AssignFile(wSaida, edtArquivo.Text+'_SAIDA' );
  ReWrite(wSaida);

  i := 0;

  While Not Eof(wArq) Do
  begin
    // Lê a Linha
    Readln(wArq,wLinha);
    Application.ProcessMessages;
    label10.Caption := IntToStr(i);
    Inc(i);

    // Caso Linha vazia pula
    if Trim(wLinha) = '' then Continue;

    // Guarda Tipo de Linha
    wTipoLinha:=StrToInt(Copy(wLinha,1,1));

    // Executa Processamento da linha 3
    if  wTipoLinha <> 3 then Continue;

    sNUMPROCINSS := Copy(wLinha,02,10);

    // localiza na tabela DETCONCINSS
    qryAux.SQL.Clear;
    qryAux.SQL.Add(' SELECT 1 FROM DETCONCINSS ' +
                   ' WHERE MESCOBRANCA = ''' + MesAno + ''''+
                   '   AND NUMPROCINSS = ' + sNUMPROCINSS );
    qryAux.open;
    if qryAux.IsEmpty then
    begin
      // localiza na tabela TEMPCONCINSS
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT 1 FROM TEMPCONCINSS ' +
                     ' WHERE MESPROCESSAMENTO = ''' + MesAno + ''''+
                     '   AND NUMPROCINSS = ' + sNUMPROCINSS );
      qryAux.open;
    end else if qryAux.IsEmpty then
    // grava no arquivo de saida.
      WriteLn(wSaida,wLinha);
  end; // while

  CloseFile(wArq);
  CloseFile(wSaida);

  ShowMessage('Terminado!');
end;



procedure TfrmResultConciliacao.Button3Click(Sender: TObject);
var
  wArq,
  wSaida          :TextFile;
  wLinha,
  sIdRubrica,
  sNUMPROCINSS    : String;
  i,
  iCont,
  wTipoLinha      : Integer;
begin
  inherited;
  TRY
  iCont := 0;

  // abre arquivo DataPrev
  SetLength(LDetalhe.Rubrica,4);

  if (OpenDialog1.Execute) then
    edtArquivo.Text   := UpperCase(OpenDialog1.FileName);

  // Abre dlg para localiazar arquivo.
  AssignFile(wArq, edtArquivo.Text);
  Reset(wArq);

  AssignFile(wSaida, edtArquivo.Text+'_SAIDA' );
  ReWrite(wSaida);

  While Not Eof(wArq) Do
  begin
    Application.ProcessMessages;
    Label10.Caption := IntToStr(iCont);
    Inc(iCont);

    ReadLn(wArq,wLinha);

    LDetalhe.NumeroBeneficio := Copy(wLinha,02,10);
    LDetalhe.TipoDetalhe     := Copy(wLinha,42,01);

    LDetalhe.Rubrica[0].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,74,03);
    LDetalhe.Rubrica[1].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,88,03);
    LDetalhe.Rubrica[2].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,102,03);
    LDetalhe.Rubrica[3].CodRubrica := LDetalhe.TipoDetalhe + Copy(wLinha,116,03);

    // Procura na TEMPCONCINSS
    For i := 0 To 3 Do
    begin
      if Copy(LDetalhe.Rubrica[I].CodRubrica,2,3) = '000' then Break;

      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT 1 FROM TEMPCONCINSS '+
                     ' WHERE MESPROCESSAMENTO = ''' + MesAno +''''+
                     '   AND CODRUBRICA1 = ' + LDetalhe.Rubrica[I].CodRubrica +
                     '   AND NUMPROCINSS = ' + LDetalhe.NumeroBeneficio );
      qryAux.Open;
      if Not qryAux.IsEmpty then Continue;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT 1 FROM TEMPCONCINSS '+
                     ' WHERE MESPROCESSAMENTO = ''' + MesAno +''''+
                     '   AND CODRUBRICA2 = ' + LDetalhe.Rubrica[I].CodRubrica +
                     '   AND NUMPROCINSS = ' + LDetalhe.NumeroBeneficio );
      qryAux.Open;
      if Not qryAux.IsEmpty then Continue;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT 1 FROM TEMPCONCINSS '+
                     ' WHERE MESPROCESSAMENTO = ''' + MesAno +''''+
                     '   AND CODRUBRICA3 = ' + LDetalhe.Rubrica[I].CodRubrica +
                     '   AND NUMPROCINSS = ' + LDetalhe.NumeroBeneficio );
      qryAux.Open;
      if Not qryAux.IsEmpty then Continue;
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT 1 FROM TEMPCONCINSS '+
                     ' WHERE MESPROCESSAMENTO = ''' + MesAno +''''+
                     '   AND CODRUBRICA4 = ' + LDetalhe.Rubrica[I].CodRubrica +
                     '   AND NUMPROCINSS = ' + LDetalhe.NumeroBeneficio );
      qryAux.Open;
    end;

    // Se achar na tabela TEMPCONCINSS não precisa procurar na DETCONCINSS
    if Not qryAux.IsEmpty then Continue;

    // Procura na DETCONCINSS
    For i := 0 To 3 Do
    begin
      if Copy(LDetalhe.Rubrica[I].CodRubrica,2,3) = '000' then Break;

      //  Localiza Rubrica
      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT IDRUBRICA FROM RUBRICAXINSS '+
                     ' WHERE RUBRICAINSS = ' + LDetalhe.Rubrica[I].CodRubrica );
      qryAux.Open;
      if qryAux.IsEmpty then
      begin
        WriteLn(wSaida,'RUBRICA NÃO ASSOCIADA - '+wLinha);
        Continue;
      end;

      sIdRubrica := qryAux.FieldByname('IDRUBRICA').AsString;

      qryAux.SQL.Clear;
      qryAux.SQL.Add(' SELECT 1 FROM DETCONCINSS '+
                     ' WHERE MESCOBRANCA = ''' + MesAno +''''+
                     '   AND NUMPROCINSS = ' + LDetalhe.NumeroBeneficio +
                     '   AND IDRUBRICA = ' + sIdRubrica); 
      qryAux.Open;

      if qryAux.IsEmpty then
      begin
        WriteLn(wSaida,wLinha);
        Break;
      end;
    end;


  end;

  finally  // except        //edilaine WO4498-4676 
    CloseFile(wArq);
    CloseFile(wSaida);
  end;

end;

procedure TfrmResultConciliacao.RelDiferencaINSSxFolhaBen;
var
   varfields : variant;
   i, ilinha, iContRub, iPlano : Integer;
   sIdProvento, sRubricaINSS, sNumProc, sEspecieFolha, sBenefFolha, sNomePlano, sEspecie : String;
   nDifer : Double;
Begin
   sIdProvento  := '';
   sRubricaINSS := '';
   iContRub     := 0;
   // Preencher Rubricas selecionadas
   for i := 0 to chklstRubricas.Items.Count - 1 do
   begin
      if not chklstRubricas.checked[i] then continue;

      if not qryRubricaAcertoOrigem.Locate('IDPROVENTO',CodRubINSS[i],[loCaseInsensitive])
      then continue;
      if iContRub > 0 Then Begin
         sIdProvento  := sIdProvento  + ',' ;
         sRubricaINSS := sRubricaINSS + ',' ;
      end;
      // Adicionar string das rubricas INSS e PROVDESC
      sIdProvento  := sIdProvento  + qryRubricaAcertoOrigem.FieldByName('IdProvento').AsString;
      sRubricaINSS := sRubricaINSS + qryRubricaAcertoOrigem.FieldByName('RubricaINSS').AsString;
      inc(iContRub);
   end;  //for

   if rgFiltro.ItemIndex = 1 Then Begin     
   end else Begin       {Iniciar por Reembolso}
      qryFolhaFuncef.SQL.Clear;
      qryFolhaFuncef.Close;
      qryFolhaFuncef.SQL.Text := 'SELECT H.MES,H.MESCOBRANCA, H.IDPESSOA, H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVENTO,' +
          ' DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,0,H.VALORPROVENTO,0) AS VALORPROVENTOSINAL, ' +
          ' DECODE(P.FLGDESCONTO,1,''(-)'',0,''(+)'') AS SINAL, TO_CHAR(DATAPAGAMENTO,''DD/MM/YYYY'') AS DATAPAGTO,' +
          ' H.NUMPROCINSS, SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, H.FONTEPAGADORA,  ' +
          ' H.IDPLANOCONTABIL, PL.NOME AS NOMEPLANO, PS.NOME AS NOMEBENEF , R.RUBRICAINSS, ' +
          ' NVL( DP.MATRICULA,E.MATRICULA) AS MATRICULA, TOTAL.VALOR AS TOTAL ' +
          ' FROM HISTRUBSAL H, PESSOA PS, PROVDESC P, PLANPREVCONTABIL PL, ' +
          ' RUBRICAXINSS R, ELEGPATRO E, DEPENTIT DP, ' +
          '      (SELECT H.NUMPROCINSS, SUM(DECODE(P.FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0)) AS VALOR ' +
          '      FROM HISTRUBSAL H, PROVDESC P ' +
          '      WHERE (MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ' +
          '            (H.IDMODULO in (18,21))      AND ' ;
      if sIdProvento <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA IN ( '+  sIdProvento + ')) AND ' ;
      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA = P.IDPROVENTO) AND ';
      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.FONTEPAGADORA = 2 ) AND ' +
          '            (H.FLGESTORNO = 0 ) ' +    
          '             GROUP BY H.NUMPROCINSS) TOTAL    ' +
          ' WHERE (H.MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ' +
          '       (H.IDMODULO in (18,21))            AND ' ;
      if sIdProvento <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA IN ( '+  sIdProvento + ')) AND ' ;

      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
         '        (H.IDRUBRICA = P.IDPROVENTO)       AND '+
          '       (H.FONTEPAGADORA   = 2) AND ' +
          '       (H.FLGESTORNO = 0 ) AND ' +    
          '       (H.IDPLANOCONTABIL = PL.IDPLANOPREV) AND ' +
          '       (H.IDPESSOA        = PS.IDPESSOA)    AND ' +
          '       (H.IDRUBRICA       = R.IDRUBRICA)    AND ' +
          '       (H.IDPESSOA        = E.IDPESSOA(+))  AND ' +
          '       (H.IDPESSOA        = DP.IDPESSOA(+)) AND ' +
          '       (H.IDPESSOA       <> DP.IDTITULAR(+))   AND ' +     
          '       (H.NUMPROCINSS     = TOTAL.NUMPROCINSS(+)) ' +
          ' ORDER BY H.NUMPROCINSS, H.IDPESSOA ';
      qryFolhaFuncef.Open;

      qryReembolso.Close;
      qryReembolso.SQL.Clear;
      qryReembolso.SQL.Text := 'SELECT D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS, ' +
          '       DECODE(P.FLGDESCONTO,1,-D.VALORINSS,0,D.VALORINSS,0) AS VALORINSSSINAL, ' +
          '       DECODE(P.FLGDESCONTO,1,''(-)'',0,''(+)'') AS SINAL, D.ESPECIE, PE.NOME AS NOMEBENEF, ' +
          '       SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, R.RUBRICAINSS, D.IDPESSOA, ' +
          '       PL.NOME AS NOMEPLANO, D.IDPLANOPREV,  TOTAL.VALOR AS TOTAL, ' +
          '       NVL(DP.MATRICULA,E.MATRICULA) AS MATRICULA, D.MATRICULA AS MATRICULADETCONC '+
          ' FROM DETCONCINSS D, PROVDESC P, RUBRICAXINSS R,PESSOA PE, PLANPREVCONTABIL PL, '+
          '      ELEGPATRO E, DEPENTIT DP, '+
          '      (SELECT H.NUMPROCINSS,H.ESPECIE, SUM(DECODE(P.FLGDESCONTO,0,VALORINSS,1,-VALORINSS,0)) AS VALOR ' +
          '       FROM DETCONCINSS H, PROVDESC P ' +
          '       WHERE (H.MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ';
      if sRubricaINSS <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '             (H.RUBRICAINSS IN ( '+  sRubricaINSS + ')) AND ';

      if DBcboEntidadeContabil2.Text <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '            (H.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';

      If DbLkcPlanPrev.Text <> '' Then
        qryReembolso.SQL.Text := qryReembolso.SQL.Text+' (H.IDPLANOPREVPREV = '+DbLkcPlanPrev.LookupValue+') AND ';


      qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '             (H.IDRUBRICA = P.IDPROVENTO) AND ' +
          '             ((H.CODMANTENEDORA IS NULL) OR (H.CODMANTENEDORA IN (14,99))) '+
          '              GROUP BY NUMPROCINSS,ESPECIE ) TOTAL ' +
          ' WHERE (D.MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ';
      if sRubricaINSS <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.RUBRICAINSS IN ( '+  sRubricaINSS + ')) AND ' ;
      if DBcboEntidadeContabil2.Text <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';

      If DbLkcPlanPrev.Text <> '' Then
        qryReembolso.SQL.Text := qryReembolso.SQL.Text+' (D.IDPLANOPREVPREV = '+DbLkcPlanPrev.LookupValue+') AND ';

      qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.IDRUBRICA   = P.IDPROVENTO) AND ' +
          '       (D.IDRUBRICA   = R.IDRUBRICA)  AND ' +
          '       (D.IDPESSOA    = PE.IDPESSOA(+))  AND ' +
          '       (D.IDPLANOPREV = PL.IDPLANOPREV) AND ' +
          '       (D.NUMPROCINSS = TOTAL.NUMPROCINSS(+)) AND ' +
          '       (D.ESPECIE     = TOTAL.ESPECIE(+)) AND' +
          '       (D.IDPESSOA    = E.IDPESSOA(+))  AND ' +
          '       (D.IDPESSOA    = DP.IDPESSOA(+)) AND ' +
          '       (D.IDPESSOA    <> DP.IDTITULAR(+)) AND ' +
          '       ((D.CODMANTENEDORA IS NULL) OR (D.CODMANTENEDORA IN (14,99))) '+

          ' ORDER BY D.NUMPROCINSS ';
      qryReembolso.Open;
//      DtmRelatBeneficios.qryDifReembINSS.Close;
      DtmRelatBeneficios.cdsDifReemb.Close;
//      DtmRelatBeneficios.qryDifReembINSS.Open;
      DtmRelatBeneficios.CMSQLDifReemb.Open;
      DtmRelatBeneficios.pplMesCobranca.Caption := sAnoMesCobranca;
      while not qryReembolso.EOF Do Begin
          iLinha := 1;
          qryBeneficiario.Close;
          qryBeneficiario.ParamByName('numprocinss').AsString := qryReembolso.FieldByName('NUMPROCINSS').AsString;
          qryBeneficiario.ParamByName('idpessoa').AsString    := qryReembolso.FieldByName('IDPESSOA').AsString;
          qryBeneficiario.Open;
          sEspecieFolha := '';
          sBenefFolha   := '';
          if not qryBeneficiario.EOF Then Begin
             sEspecieFolha := qryBeneficiario.FieldByName('CODBENEFICIO').AsString;
             sBenefFolha   := qryBeneficiario.FieldByName('NOME').AsString;
          end;
          sNumProc := qryReembolso.FieldByName('NUMPROCINSS').AsString;

          if qryFolhaFuncef.Locate('NUMPROCINSS',qryReembolso.FieldByName('NUMPROCINSS').AsString,[loCaseInsensitive, loPartialKey]) Then Begin
            nDifer := qryReembolso.FieldByName('TOTAL').AsFloat - qryFolhaFuncef.FieldByName('TOTAL').AsFloat;
          end
          else Begin
            nDifer := qryReembolso.FieldByName('TOTAL').AsFloat;
          end;

          while (not qryReembolso.EOF) and (sNumProc = qryReembolso.FieldByName('NUMPROCINSS').AsString )Do Begin

             if abs(nDifer) >= abs(StrtoFloat(ClienteNumero(edDifSuperior.text))) Then Begin
                DtmRelatBeneficios.cdsDifReemb.Append;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('IDPLANOPREV').AsInteger := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEPLANO').AsString    := qryReembolso.FieldByName('NOMEPLANO').AsString;

                iPlano     := qryReembolso.FieldByName('IDPLANOPREV').AsInteger;
                sNomePlano := qryReembolso.FieldByName('NOMEPLANO').AsString;

                DtmRelatBeneficios.cdsDifReemb.FieldByName('ESPECIE').AsString      := qryReembolso.FieldByName('ESPECIE').AsString;
                sEspecie   := qryReembolso.FieldByName('ESPECIE').AsString;  

                if qryReembolso.FieldByName('MATRICULA').AsString = '' Then
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('MATRICULA').AsString    := qryReembolso.FieldByName('MATRICULADETCONC').AsString
                else
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('MATRICULA').AsString    := qryReembolso.FieldByName('MATRICULA').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NB').AsString           := qryReembolso.FieldByName('NUMPROCINSS').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEBENEF').AsString    := qryReembolso.FieldByName('NOMEBENEF').AsString;
                if (not qryFolhaFuncef.EOF) and (qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString  = sNumProc) Then Begin
                   if qryFolhaFuncef.FieldByName('NOMEBENEF').AsString <> '' Then
                      DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEBENEF').AsString    := qryFolhaFuncef.FieldByName('NOMEBENEF').AsString;
                end;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('RUBINSS').AsString      := qryReembolso.FieldByName('RUBRICAINSS').AsString;
                if qryReembolso.FieldByName('SINAL').AsString = '(-)' Then
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORINSS').AsFloat   := - qryReembolso.FieldByName('VALORINSS').AsFloat
                else
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORINSS').AsFloat   := qryReembolso.FieldByName('VALORINSS').AsFloat;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORINSSSINAL').AsFloat   := qryReembolso.FieldByName('VALORINSSSINAL').AsFloat;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('SINALREEMB').AsString   := qryReembolso.FieldByName('SINAL').AsString;
                if (not qryFolhaFuncef.EOF) and (qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString  = sNumProc) Then Begin

                   DtmRelatBeneficios.cdsDifReemb.FieldByName('RUBFUNCEF').AsString    := qryFolhaFuncef.FieldByName('RUBRICAINSS').AsString;
                   if qryFolhaFuncef.FieldByName('SINAL').AsString = '(-)' Then
                      DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').AsFloat   := - qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat
                   else
                      DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').AsFloat   := qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat;
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORPROVENTOSINAL').AsFloat :=  qryFolhaFuncef.FieldByName('VALORPROVENTOSINAL').AsFloat;
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('SINALDESEMB').AsString  := qryFolhaFuncef.FieldByName('SINAL').AsString;
                   qryFolhaFuncef.Next;
                end
                else Begin
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('RUBFUNCEF').Clear;
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').Clear;
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('SINALDESEMB').Clear;
                end;
                if iLinha = 1 Then
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('DIFERENCA').AsFloat  := nDifer
                else
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('DIFERENCA').Clear;
                inc(iLinha);
                DtmRelatBeneficios.cdsDifReemb.Post;
             end;
             qryReembolso.Next;
          end;
          {continuar a ler a qryFolhaFuncef para descarregar os registros restantes}
          while (not qryFolhaFuncef.EOF) and
                (qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString  = sNumProc) and
                (abs(nDifer) >= abs(StrtoFloat(ClienteNumero(edDifSuperior.text)))) Do Begin
             DtmRelatBeneficios.cdsDifReemb.Append;

             DtmRelatBeneficios.cdsDifReemb.FieldByName('IDPLANOPREV').AsInteger := iPlano;
             DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEPLANO').AsString    := sNomePlano;
             DtmRelatBeneficios.cdsDifReemb.FieldByName('NB').AsString           := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
             DtmRelatBeneficios.cdsDifReemb.FieldByName('ESPECIE').AsString      := sEspecie;

             if qryFolhaFuncef.FieldByName('NOMEBENEF').AsString <> '' Then
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEBENEF').AsString    := qryFolhaFuncef.FieldByName('NOMEBENEF').AsString;

             DtmRelatBeneficios.cdsDifReemb.FieldByName('RUBFUNCEF').AsString    := qryFolhaFuncef.FieldByName('RUBRICAINSS').AsString;
             if qryFolhaFuncef.FieldByName('SINAL').AsString = '(-)' Then
               DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').AsFloat   := - qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat
             else
               DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').AsFloat   := qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat;
             DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORPROVENTOSINAL').AsFloat :=  qryFolhaFuncef.FieldByName('VALORPROVENTOSINAL').AsFloat;
             DtmRelatBeneficios.cdsDifReemb.FieldByName('SINALDESEMB').AsString  := qryFolhaFuncef.FieldByName('SINAL').AsString;
             DtmRelatBeneficios.cdsDifReemb.Post;
             qryFolhaFuncef.Next;
          end;
      end;
   end;

   DtmRelatBeneficios.ppLabel227.Caption      := 'Relação de Diferença dos Proventos pagos por conta do INSS';
   DtmRelatBeneficios.ppdDifReembINSS.Report.Template.SaveTo  := stFile;
   DtmRelatBeneficios.ppdDifReembINSS.Report.Template.Format  := ftASCII;
   DtmRelatBeneficios.ppdDifReembINSS.Report.Device           := dvScreen;

   TFrmPreview.CreateModalPreview(Application, DtmRelatBeneficios.ppdDifReembINSS.Report, 'Relação de Diferença dos Proventos pagos por conta do INSS');
end;


procedure TfrmResultConciliacao.RelDiferencaFolhaBen;
var
   varfields : variant;
   i, ilinha, iContRub, iPlano : Integer;
   sIdProvento, sRubricaINSS, sNumProc, sEspecieFolha, sBenefFolha, sNomePlano : String;
   nDifer : Double;
Begin
   sIdProvento  := '';
   sRubricaINSS := '';
   iContRub     := 0;
   // Preencher Rubricas selecionadas
   for i := 0 to chklstRubricas.Items.Count - 1 do
   begin
      if not chklstRubricas.checked[i] then continue;

      if not qryRubricaAcertoOrigem.Locate('IDPROVENTO',CodRubINSS[i],[loCaseInsensitive])
      then continue;
      if iContRub > 0 Then Begin
         sIdProvento  := sIdProvento  + ',' ;
         sRubricaINSS := sRubricaINSS + ',' ;
      end;

      // Adicionar string das rubricas INSS e PROVDESC
      sIdProvento  := sIdProvento  + qryRubricaAcertoOrigem.FieldByName('IdProvento').AsString;
      sRubricaINSS := sRubricaINSS + qryRubricaAcertoOrigem.FieldByName('RubricaINSS').AsString;
      inc(iContRub);
   end;  //for

   if rgFiltro.ItemIndex = 1 Then Begin     
   end else Begin       {Iniciar por Reembolso}
      qryFolhaFuncef.SQL.Clear;
      qryFolhaFuncef.Close;
      qryFolhaFuncef.SQL.Text := 'SELECT H.MES,H.MESCOBRANCA, H.IDPESSOA, H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVENTO,' +
          ' DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,0,H.VALORPROVENTO,0) AS VALORPROVENTOSINAL, ' +
          ' DECODE(P.FLGDESCONTO,1,''(-)'',0,''(+)'') AS SINAL, TO_CHAR(DATAPAGAMENTO,''DD/MM/YYYY'') AS DATAPAGTO,' +
          ' H.NUMPROCINSS, SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, H.FONTEPAGADORA,  ' +
          ' H.IDPLANOCONTABIL, PL.NOME AS NOMEPLANO, PS.NOME AS NOMEBENEF , R.RUBRICAINSS, ' +
          ' NVL( DP.MATRICULA,E.MATRICULA) AS MATRICULA, TOTAL.VALOR AS TOTAL ' +
          ' FROM HISTRUBSAL H, PESSOA PS, PROVDESC P, PLANPREVCONTABIL PL, ' +
          ' RUBRICAXINSS R, ELEGPATRO E, DEPENTIT DP, ' +
          '      (SELECT H.NUMPROCINSS, SUM(DECODE(P.FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0)) AS VALOR ' +
          '      FROM HISTRUBSAL H, PROVDESC P ' +
          '      WHERE (MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ' +
          '            (H.IDMODULO in (18,21))      AND ' ;
      if sIdProvento <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA IN ( '+  sIdProvento + ')) AND ' ;
      if DBcboEntidadeContabil2.Text <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';
      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA = P.IDPROVENTO) AND ';
      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.FONTEPAGADORA = 2 ) AND ' +
          '            (H.FLGESTORNO = 0 ) ' +    
          '             GROUP BY H.NUMPROCINSS) TOTAL    ' +
          ' WHERE (H.MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ' +
          '       (H.IDMODULO in (18,21))            AND ' ;
      if sIdProvento <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA IN ( '+  sIdProvento + ')) AND ' ;


      if DBcboEntidadeContabil2.Text <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';
      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
         '        (H.IDRUBRICA = P.IDPROVENTO)       AND '+
          '       (H.FONTEPAGADORA   = 2) AND ' +
          '       (H.FLGESTORNO = 0 ) AND ' +    
          '       (H.IDPLANOCONTABIL = PL.IDPLANOPREV) AND ' +
          '       (H.IDPESSOA        = PS.IDPESSOA)    AND ' +
          '       (H.IDRUBRICA       = R.IDRUBRICA)    AND ' +
          '       (H.IDPESSOA        = E.IDPESSOA(+))  AND ' +
          '       (H.IDPESSOA        = DP.IDPESSOA(+)) AND ' +
          '       (H.IDPESSOA       <> DP.IDTITULAR(+))   AND ' +     
          '       (H.NUMPROCINSS     = TOTAL.NUMPROCINSS(+)) ' +
          ' ORDER BY H.NUMPROCINSS, H.IDPESSOA ';
      qryFolhaFuncef.Open;

      qryReembolso.Close;
      qryReembolso.SQL.Clear;
      qryReembolso.SQL.Text := 'SELECT D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS, ' +
          '       DECODE(P.FLGDESCONTO,1,-D.VALORINSS,0,D.VALORINSS,0) AS VALORINSSSINAL, ' +
          '       DECODE(P.FLGDESCONTO,1,''(-)'',0,''(+)'') AS SINAL, D.ESPECIE, PE.NOME AS NOMEBENEF, ' +
          '       SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, R.RUBRICAINSS, D.IDPESSOA, ' +
          '       PL.NOME AS NOMEPLANO, D.IDPLANOPREV,  TOTAL.VALOR AS TOTAL, ' +
          '       NVL(DP.MATRICULA,E.MATRICULA) AS MATRICULA, D.MATRICULA AS MATRICULADETCONC '+
          ' FROM DETCONCINSS D, PROVDESC P, RUBRICAXINSS R,PESSOA PE, PLANPREVCONTABIL PL, '+
          '      ELEGPATRO E, DEPENTIT DP, '+
          '      (SELECT H.NUMPROCINSS,H.ESPECIE, SUM(DECODE(P.FLGDESCONTO,0,VALORINSS,1,-VALORINSS,0)) AS VALOR ' +
          '       FROM DETCONCINSS H, PROVDESC P ' +
          '       WHERE (H.MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ';
{ não filtrar rubricas     if sRubricaINSS <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '             (H.RUBRICAINSS IN ( '+  sRubricaINSS + ')) AND ';}
{      if DBcboEntidadeContabil2.Text <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '            (H.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';}

      qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '             (H.IDRUBRICA = P.IDPROVENTO) AND ' +
          '             ((H.CODMANTENEDORA IS NULL) OR (H.CODMANTENEDORA IN (14,99))) '+
          '              GROUP BY NUMPROCINSS,ESPECIE ) TOTAL ' +
          ' WHERE (D.MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ';
      if sRubricaINSS <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.RUBRICAINSS IN ( '+  sRubricaINSS + ')) AND ' ;
      if DBcboEntidadeContabil2.Text <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';

      If DbLkcPlanPrev.Text <> '' Then
        qryReembolso.SQL.Text := qryReembolso.SQL.Text+' (D.IDPLANOPREVPREV = '+DbLkcPlanPrev.LookupValue+') AND ';

      qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.IDRUBRICA   = P.IDPROVENTO) AND ' +
          '       (D.IDRUBRICA   = R.IDRUBRICA)  AND ' +
          '       (D.IDPESSOA    = PE.IDPESSOA(+))  AND ' +
          '       (D.IDPLANOPREV = PL.IDPLANOPREV) AND ' +
          '       (D.NUMPROCINSS = TOTAL.NUMPROCINSS(+)) AND ' +
          '       (D.ESPECIE     = TOTAL.ESPECIE(+)) AND' +
          '       (D.IDPESSOA    = E.IDPESSOA(+))  AND ' +
          '       (D.IDPESSOA    = DP.IDPESSOA(+)) AND ' +
          '       (D.IDPESSOA    <> DP.IDTITULAR(+)) AND ' +
          '       ((D.CODMANTENEDORA IS NULL) OR (D.CODMANTENEDORA IN (14,99))) '+
          ' ORDER BY D.NUMPROCINSS ';
      qryReembolso.Open;


      DtmRelatBeneficios.cdsDifReemb.Close;
      DtmRelatBeneficios.CMSQLDifReemb.Open;
      DtmRelatBeneficios.pplMesCobranca.Caption := sAnoMesCobranca;

      qryFolhaFuncef.First;
      while not qryFolhaFuncef.EOF Do Begin
          iLinha := 1;

          if not qryReembolso.Locate('NUMPROCINSS',qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString,[loCaseInsensitive, loPartialKey]) Then Begin
            if DBcboEntidadeContabil2.Text <> '' Then
              if qryFolhaFuncef.FieldByName('IDPLANOCONTABIL').AsInteger <> StrtoInt(DBcboEntidadeContabil2.LookupValue) Then Begin
                qryFolhaFuncef.Next;
                continue;
              end;
              sNumProc := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
              while (not qryFolhaFuncef.EOF) and (sNumProc = qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString) Do Begin
                if DBcboEntidadeContabil2.Text <> '' Then
                  if (qryFolhaFuncef.FieldByName('IDPLANOCONTABIL').AsInteger <> StrtoInt(DBcboEntidadeContabil2.LookupValue)) Then Begin
                    qryFolhaFuncef.Next;
                    continue;
                  end;

                DtmRelatBeneficios.cdsDifReemb.Append;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('IDPLANOPREV').AsInteger := qryFolhaFuncef.FieldByName('IDPLANOCONTABIL').AsInteger;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEPLANO').AsString    := qryFolhaFuncef.FieldByName('NOMEPLANO').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('ESPECIE').AsString      := sEspecieFolha;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('MATRICULA').AsString    := qryFolhaFuncef.FieldByName('MATRICULA').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NB').AsString           := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEBENEF').AsString    := qryFolhaFuncef.FieldByName('NOMEBENEF').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('RUBFUNCEF').AsString    := qryFolhaFuncef.FieldByName('RUBRICAINSS').AsString;

                if qryFolhaFuncef.FieldByName('SINAL').AsString = '(-)' Then
                  DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').AsFloat   := - qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat
                else
                  DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').AsFloat   := qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat;

                DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORPROVENTOSINAL').AsFloat :=  qryFolhaFuncef.FieldByName('VALORPROVENTOSINAL').AsFloat;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('SINALDESEMB').AsString  := qryFolhaFuncef.FieldByName('SINAL').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('RUBINSS').Clear;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORINSS').Clear;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORINSSSINAL').Clear;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('SINALREEMB').Clear;

                if iLinha = 1 Then
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('DIFERENCA').AsFloat  := qryFolhaFuncef.FieldByName('TOTAL').AsFloat
                else
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('DIFERENCA').Clear;

                inc(iLinha);
                DtmRelatBeneficios.cdsDifReemb.Post;
                qryFolhaFuncef.Next;
              end; { While }

          end else
             qryFolhaFuncef.Next;
      end; { while not qryFolhaFuncef }

   end;
   DtmRelatBeneficios.ppLabel227.Caption      := 'Relação de Proventos Pagos e não reembolsados';
   DtmRelatBeneficios.ppdDifReembINSS.Report.Template.SaveTo  := stFile;
   DtmRelatBeneficios.ppdDifReembINSS.Report.Template.Format  := ftASCII;
   DtmRelatBeneficios.ppdDifReembINSS.Report.Device           := dvScreen;

   TFrmPreview.CreateModalPreview(Application, DtmRelatBeneficios.ppdDifReembINSS.Report, 'Relação de Proventos Pagos e não reembolsados');

end;



procedure TfrmResultConciliacao.ListagemRubricas;
begin
   with dtmRelatBeneficios do
   begin
      qryListagemRubricas.Close;
      qryListagemRubricas.ParamByname('MESCOBRANCA').AsString := MesAno;
      qryListagemRubricas.Open;

      qrySubListagemRubricas.Open;

      lblMesAnoListagemRubricas.Caption            := MesAno;
      dsnppListagemRubricas.Report.Template.SaveTo := stFile;
      dsnppListagemRubricas.Report.Template.Format := ftASCII;
      dsnppListagemRubricas.Report.Device          := dvScreen;

      TFrmPreview.CreateModalPreview(Application, dsnppListagemRubricas.Report, 'Listagem das Rubricas Importadas');
   end;
end;



procedure TfrmResultConciliacao.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
var
   i : Integer;
begin
  chkListX.Items.Clear;
  i:=0;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('RUBRICAINSS').AsString + ' - ' + FieldByName('DESCRICAO').AsString );
        CodRubINSS[i] := FieldByName('IDPROVENTO').AsInteger;
        inc(i);
        Next;
     end;
  end;
end;


procedure TfrmResultConciliacao.cbMesChange(Sender: TObject);
begin
  inherited;
   sAnoMesCobranca := FormatFloat('0000', dbspano.Value) + '/' +
                      FormatFloat('00', (cbMes.ItemIndex + 1));
end;

procedure TfrmResultConciliacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  dtmRelatBeneficios.Free; 
  QryPlanPrev.Close;
  inherited;
end;

procedure TfrmResultConciliacao.RelDiferencaFolhaBenSint;
var
   varfields : variant;
   i, ilinha, iContRub, iPlano : Integer;
   sIdProvento, sRubricaINSS, sNumProc, sEspecieFolha, sBenefFolha, sNomePlano : String;
   nDifer : Double;
Begin
   sIdProvento  := '';
   sRubricaINSS := '';
   iContRub     := 0;
   // Preencher Rubricas selecionadas
   for i := 0 to chklstRubricas.Items.Count - 1 do
   begin
      if not chklstRubricas.checked[i] then continue;
      if not qryRubricaAcertoOrigem.Locate('IDPROVENTO',CodRubINSS[i],[loCaseInsensitive])
      then continue;
      if iContRub > 0 Then Begin
         sIdProvento  := sIdProvento  + ',' ;
         sRubricaINSS := sRubricaINSS + ',' ;
      end;
      // Adicionar string das rubricas INSS e PROVDESC
      sIdProvento  := sIdProvento  + qryRubricaAcertoOrigem.FieldByName('IdProvento').AsString;
      sRubricaINSS := sRubricaINSS + qryRubricaAcertoOrigem.FieldByName('RubricaINSS').AsString;
      inc(iContRub);
   end;  //for

   if rgFiltro.ItemIndex = 1 Then Begin     
   end else Begin       {Iniciar por Reembolso}
      qryFolhaFuncef.SQL.Clear;
      qryFolhaFuncef.Close;
      qryFolhaFuncef.SQL.Text := 'SELECT H.MES,H.MESCOBRANCA, H.IDPESSOA, H.IDRUBRICA, H.CODPROVDESC, H.VALORPROVENTO,' +
          ' DECODE(P.FLGDESCONTO,1,-H.VALORPROVENTO,0,H.VALORPROVENTO,0) AS VALORPROVENTOSINAL, ' +
          ' DECODE(P.FLGDESCONTO,1,''(-)'',0,''(+)'') AS SINAL, TO_CHAR(DATAPAGAMENTO,''DD/MM/YYYY'') AS DATAPAGTO,' +
          ' H.NUMPROCINSS, SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, H.FONTEPAGADORA,  ' +
          ' H.IDPLANOCONTABIL, PL.NOME AS NOMEPLANO, PS.NOME AS NOMEBENEF , R.RUBRICAINSS, ' +
          ' NVL( DP.MATRICULA,E.MATRICULA) AS MATRICULA, TOTAL.VALOR AS TOTAL ' +
          ' FROM HISTRUBSAL H, PESSOA PS, PROVDESC P, PLANPREVCONTABIL PL, ' +
          ' RUBRICAXINSS R, ELEGPATRO E, DEPENTIT DP, ' +
          '      (SELECT H.NUMPROCINSS, SUM(DECODE(P.FLGDESCONTO,0,VALORPROVENTO,1,-VALORPROVENTO,0)) AS VALOR ' +
          '      FROM HISTRUBSAL H, PROVDESC P ' +
          '      WHERE (H.IDMODULO in (18,21))      AND ' ;
      if sIdProvento <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA IN ( '+  sIdProvento + ')) AND ' ;
      if DBcboEntidadeContabil2.Text <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';
      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA = P.IDPROVENTO) AND ';
      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.FONTEPAGADORA = 2 ) AND ' +
          '            (H.FLGESTORNO = 0 ) ' +    
          '             GROUP BY H.NUMPROCINSS) TOTAL    ' +
          ' WHERE      (H.IDMODULO in (18,21))            AND ' ;
      if sIdProvento <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDRUBRICA IN ( '+  sIdProvento + ')) AND ' ;



      if DBcboEntidadeContabil2.Text <> '' Then
         qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
          '            (H.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';
      qryFolhaFuncef.SQL.Text := qryFolhaFuncef.SQL.Text +
         '        (H.IDRUBRICA = P.IDPROVENTO)       AND '+
          '       (H.FONTEPAGADORA   = 2) AND ' +
          '       (H.FLGESTORNO = 0 ) AND ' +    
          '       (H.IDPLANOCONTABIL = PL.IDPLANOPREV) AND ' +
          '       (H.IDPESSOA        = PS.IDPESSOA)    AND ' +
          '       (H.IDRUBRICA       = R.IDRUBRICA)    AND ' +
          '       (H.IDPESSOA        = E.IDPESSOA(+))  AND ' +
          '       (H.IDPESSOA        = DP.IDPESSOA(+)) AND ' +
          '       (H.IDPESSOA       <> DP.IDTITULAR(+))   AND ' +     
          '       (H.NUMPROCINSS     = TOTAL.NUMPROCINSS(+)) ' +
          ' ORDER BY H.NUMPROCINSS, H.IDPESSOA ';
      qryFolhaFuncef.Open;

      qryReembolso.Close;
      qryReembolso.SQL.Clear;
      qryReembolso.SQL.Text := 'SELECT D.MESREFERENCIA, D.MESCOBRANCA, D.NUMPROCINSS, D.VALORINSS, ' +
          '       DECODE(P.FLGDESCONTO,1,-D.VALORINSS,0,D.VALORINSS,0) AS VALORINSSSINAL, ' +
          '       DECODE(P.FLGDESCONTO,1,''(-)'',0,''(+)'') AS SINAL, D.ESPECIE, PE.NOME AS NOMEBENEF, ' +
          '       SUBSTR(P.DESCRICAO,1,30) AS DESCRRUBRICA, R.RUBRICAINSS, D.IDPESSOA, ' +
          '       PL.NOME AS NOMEPLANO, D.IDPLANOPREV,  TOTAL.VALOR AS TOTAL, ' +
          '       NVL(DP.MATRICULA,E.MATRICULA) AS MATRICULA, D.MATRICULA AS MATRICULADETCONC '+
          ' FROM DETCONCINSS D, PROVDESC P, RUBRICAXINSS R,PESSOA PE, PLANPREVCONTABIL PL, '+
          '      ELEGPATRO E, DEPENTIT DP, '+
          '      (SELECT H.NUMPROCINSS,H.ESPECIE, SUM(DECODE(P.FLGDESCONTO,0,VALORINSS,1,-VALORINSS,0)) AS VALOR ' +
          '       FROM DETCONCINSS H, PROVDESC P ' +
          '       WHERE ';

      qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '             (H.IDRUBRICA = P.IDPROVENTO) AND ' +
          '             ((H.CODMANTENEDORA IS NULL) OR (H.CODMANTENEDORA IN (14,99))) '+
          '              GROUP BY NUMPROCINSS,ESPECIE ) TOTAL ' +
          ' WHERE (D.MESCOBRANCA = ' +    QuotedStr(sAnoMesCobranca)  + ') AND ';
      if sRubricaINSS <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.RUBRICAINSS IN ( '+  sRubricaINSS + ')) AND ' ;
      if DBcboEntidadeContabil2.Text <> '' Then
         qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.IDPLANOPREV = ' + DBcboEntidadeContabil2.LookupValue  + ') AND ';

      If DbLkcPlanPrev.Text <> '' Then
        qryReembolso.SQL.Text := qryReembolso.SQL.Text+' (D.IDPLANOPREVPREV = '+DbLkcPlanPrev.LookupValue+') AND ';

      qryReembolso.SQL.Text := qryReembolso.SQL.Text +
          '       (D.IDRUBRICA   = P.IDPROVENTO) AND ' +
          '       (D.IDRUBRICA   = R.IDRUBRICA)  AND ' +
          '       (D.IDPESSOA    = PE.IDPESSOA(+))  AND ' +
          '       (D.IDPLANOPREV = PL.IDPLANOPREV) AND ' +
          '       (D.NUMPROCINSS = TOTAL.NUMPROCINSS(+)) AND ' +
          '       (D.ESPECIE     = TOTAL.ESPECIE(+)) AND' +
          '       (D.IDPESSOA    = E.IDPESSOA(+))  AND ' +
          '       (D.IDPESSOA    = DP.IDPESSOA(+)) AND ' +
          '       (D.IDPESSOA    <> DP.IDTITULAR(+)) AND ' +
          '       ((D.CODMANTENEDORA IS NULL) OR (D.CODMANTENEDORA IN (14,99))) '+
          ' ORDER BY D.NUMPROCINSS ';
      qryReembolso.Open;

      //qryFolhaFuncef.SQL.SaveToFile('C:\TEMP\RELCONC.TXT');

      DtmRelatBeneficios.cdsDifReemb.Close;
{      DtmRelatBeneficios.cdsDifReemb.Open;
      DtmRelatBeneficios.cdsDifReemb.CancelUpdates;
      DtmRelatBeneficios.cdsDifReemb.Close;}
      DtmRelatBeneficios.CMSQLDifReemb.Open;
      DtmRelatBeneficios.pplMesCobranca.Caption := sAnoMesCobranca;

      {ao acabar a query do Reembolso, partir da query da Folha e para cada registro
       não encontrado na query do Reembolso, inserir na query do relatório }

//  a pedido do Rogerio esta rotina foi desativada em 10.09.2004
      qryFolhaFuncef.First;
      while not qryFolhaFuncef.EOF Do Begin
          iLinha := 1;

          if not qryReembolso.Locate('NUMPROCINSS',qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString,[loCaseInsensitive, loPartialKey]) Then Begin
            if DBcboEntidadeContabil2.Text <> '' Then
              if qryFolhaFuncef.FieldByName('IDPLANOCONTABIL').AsInteger <> StrtoInt(DBcboEntidadeContabil2.LookupValue) Then Begin
                qryFolhaFuncef.Next;
                continue;
              end;
              sNumProc := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
              while (not qryFolhaFuncef.EOF) and (sNumProc = qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString) Do Begin
                if DBcboEntidadeContabil2.Text <> '' Then
                  if (qryFolhaFuncef.FieldByName('IDPLANOCONTABIL').AsInteger <> StrtoInt(DBcboEntidadeContabil2.LookupValue)) Then Begin
                    qryFolhaFuncef.Next;
                    continue;
                  end;

                DtmRelatBeneficios.cdsDifReemb.Append;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('IDPLANOPREV').AsInteger := qryFolhaFuncef.FieldByName('IDPLANOCONTABIL').AsInteger;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEPLANO').AsString    := qryFolhaFuncef.FieldByName('NOMEPLANO').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('ESPECIE').AsString      := sEspecieFolha;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('MATRICULA').AsString    := qryFolhaFuncef.FieldByName('MATRICULA').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NB').AsString           := qryFolhaFuncef.FieldByName('NUMPROCINSS').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('NOMEBENEF').AsString    := qryFolhaFuncef.FieldByName('NOMEBENEF').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('RUBFUNCEF').AsString    := qryFolhaFuncef.FieldByName('RUBRICAINSS').AsString;

                if qryFolhaFuncef.FieldByName('SINAL').AsString = '(-)' Then
                  DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').AsFloat   := - qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat
                else
                  DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORFUNCEF').AsFloat   := qryFolhaFuncef.FieldByName('VALORPROVENTO').AsFloat;

                DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORPROVENTOSINAL').AsFloat :=  qryFolhaFuncef.FieldByName('VALORPROVENTOSINAL').AsFloat;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('SINALDESEMB').AsString  := qryFolhaFuncef.FieldByName('SINAL').AsString;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('RUBINSS').Clear;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORINSS').Clear;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('VALORINSSSINAL').Clear;
                DtmRelatBeneficios.cdsDifReemb.FieldByName('SINALREEMB').Clear;

                if iLinha = 1 Then
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('DIFERENCA').AsFloat  := qryFolhaFuncef.FieldByName('TOTAL').AsFloat
                else
                   DtmRelatBeneficios.cdsDifReemb.FieldByName('DIFERENCA').Clear;

                inc(iLinha);
                DtmRelatBeneficios.cdsDifReemb.Post;
                qryFolhaFuncef.Next;
              end; { While }

          end else
             qryFolhaFuncef.Next;
      end; { while not qryFolhaFuncef }

   end;
   DtmRelatBeneficios.ppLabel227.Caption      := 'Relação de Proventos Pagos e não reembolsados';
   DtmRelatBeneficios.ppdDifReembINSS.Report.Template.SaveTo  := stFile;
   DtmRelatBeneficios.ppdDifReembINSS.Report.Template.Format  := ftASCII;
   DtmRelatBeneficios.ppdDifReembINSS.Report.Device           := dvScreen;

   TFrmPreview.CreateModalPreview(Application, DtmRelatBeneficios.ppdDifReembINSS.Report, 'Relação de Proventos Pagos e não reembolsados');

end;



procedure TfrmResultConciliacao.RelValoresManuais;
var
  sSQL : String;
begin
   sSQL :=
   'SELECT '                                                                                                                               + #13 +
   '  NVL(PPC.NOME, ''Não Indicado'') AS PLANO, '                                                                                          + #13 +
   '  CASE '                                                                                                                               + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV = 02    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REPLAN'' '                     + #13 +
   '    WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 02    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REPLAN EXPREVHAB'' '           + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV = 66    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REPLAN MIGRADO'' '             + #13 +
   '    WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REPLAN EXPREVHAB MIGRADO'' '   + #13 +
   '    WHEN D.IDPLANOPREV = 19 AND D.IDPLANOPREVPREV = 19    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REB 1998'' '                   + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 99)            THEN ''NÃO IDENTIFICADO'' '           + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 6)             THEN ''EMPREGADO FUNCEF'' '           + #13 +
   '    WHEN D.IDPLANOPREV = 66 AND D.IDPLANOPREVPREV = 66    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REB 2002'' '                   + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 3)             THEN ''CAIXA-SRH'' '                  + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 2)             THEN ''PMPP'' '                       + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 5)             THEN ''CAIXA-SEGUROS'' '              + #13 +
   '  end AS MANTENEDORA, '                                                                                                                + #13 +

   { Valores }
   '  SUM( ' +
   '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , ''10'', DECODE(D.MESCOBRANCA, D.MESREFERENCIA, D.VALORINSS, 0), 0) ' +
   '     ) AS VALOR_NO_MES_CREDITO, '                                                                                                      + #13 +

   '  SUM( ' +
   '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , ''30'', DECODE(D.MESCOBRANCA, D.MESREFERENCIA, D.VALORINSS, 0), 0) ' +
   '     ) AS VALOR_NO_MES_DEBITO, '                                                                                                       + #13 +

   '  SUM( ' +
   '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , ''10'', DECODE(D.MESCOBRANCA, D.MESREFERENCIA, 0, D.VALORINSS), 0) ' +
   '     ) AS VALOR_FORA_DO_MES_CREDITO, '                                                                                                 + #13 +

   '  SUM( ' +
   '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , ''30'', DECODE(D.MESCOBRANCA, D.MESREFERENCIA, 0, D.VALORINSS), 0) ' +
   '     ) AS VALOR_FORA_DO_MES_DEBITO, '                                                                                                  + #13 +

   { Somatórios }
   '  SUM( ' +
   '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , ''10'', DECODE(D.MESCOBRANCA, D.MESREFERENCIA, D.VALORINSS, 0), 0) + ' +
   '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , ''10'', DECODE(D.MESCOBRANCA, D.MESREFERENCIA, 0, D.VALORINSS), 0)   ' +
   '     ) AS VALOR_CREDITO, '                                                                                                             + #13 +

   '  SUM( ' +
   '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , ''30'', DECODE(D.MESCOBRANCA, D.MESREFERENCIA, D.VALORINSS, 0), 0) + ' +
   '      DECODE(SUBSTR(D.RUBRICAINSS, 1, 2) , ''30'', DECODE(D.MESCOBRANCA, D.MESREFERENCIA, 0, D.VALORINSS), 0)  ' +
   '     ) AS VALOR_DEBITO '                                                                                                               + #13 +

   'FROM '                                          + #13 +
   '   DETCONCINSS      D,  '                       + #13 +
   '   PLANPREVCONTABIL PPC '                       + #13 +
   'WHERE '                                         + #13 +
   '       D.MESCOBRANCA  = ' + QuotedStr(MesAno)   + #13 +
   '   AND D.FLGMANUAL   <> ''0'' '                 + #13 +
   '   AND D.IDPLANOPREV  = PPC.IDPLANOPREV(+) '    + #13 +

   'GROUP BY '                                                                                                                             + #13 +
   '  PPC.NOME, '                                                                                                                          + #13 +
   '  CASE '                                                                                                                               + #13 +
   '    WHEN D.IDPLANOPREV = 02 AND D.IDPLANOPREVPREV = 02    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REPLAN''                   '   + #13 +
   '    WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 02    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REPLAN EXPREVHAB''         '   + #13 +
   '    WHEN D.IDPLANOPREV = 02 AND D.IDPLANOPREVPREV = 66    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REPLAN MIGRADO''           '   + #13 +
   '    WHEN D.IDPLANOPREV = 22 AND D.IDPLANOPREVPREV = 66    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REPLAN EXPREVHAB MIGRADO'' '   + #13 +
   '    WHEN D.IDPLANOPREV = 19 AND D.IDPLANOPREVPREV = 19    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REB 1998''          '          + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 99)            THEN ''NÃO IDENTIFICADO''  '          + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 6)             THEN ''EMPREGADO FUNCEF''  '          + #13 +
   '    WHEN D.IDPLANOPREV = 66 AND D.IDPLANOPREVPREV = 66    AND (NVL(D.CODMANTENEDORA,14) IN (14)) THEN ''REB 2002''          '          + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 3)             THEN ''CAIXA-SRH''         '          + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 2)             THEN ''PMPP''              '          + #13 +
   '    WHEN D.IDPLANOPREV = 2  AND D.IDPLANOPREVPREV IS NULL AND (D.CODMANTENEDORA = 5)             THEN ''CAIXA-SEGUROS''     '          + #13 +
   '  END '                                                                                                                                + #13 +
   'ORDER BY '                                                                                                                             + #13 +
   '  PPC.NOME, MANTENEDORA ';

   qryValorMantManual.Close;
   qryValorMantManual.SQL.Clear;
   qryValorMantManual.SQL.Text := sSQL;
   qryValorMantManual.Open;

   lblMesRefVlrMant.Caption                     := MesAno;

   ppDsnValorMantManual.Report.Template.SaveTo  := stFile;
   ppDsnValorMantManual.Report.Template.Format  := ftASCII;
   ppDsnValorMantManual.Report.Device           := dvScreen;


   TFrmPreview.CreateModalPreview(Application, ppDsnValorMantManual.Report, 'Relação de Valores por Mantenedora');
end;



procedure TfrmResultConciliacao.FormCreate(Sender: TObject);
begin
  inherited;

  try
    Application.CreateForm(TdtmRelatBeneficios, dtmRelatBeneficios);
  except
    MessageDlg(
      'Erro ao criar datamodule "TdtmRelatBeneficios".'+#13+#10+
      'Favor contatar o suporte da CM.', mtError, [mbOK], 0);
  end;
end;



procedure TfrmResultConciliacao.RelNaoPagosINSS;
begin
   //
end;


end.
