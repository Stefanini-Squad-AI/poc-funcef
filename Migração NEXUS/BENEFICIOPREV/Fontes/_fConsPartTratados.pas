// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Augusto
// Data        : 09/05/2005
// Pendencia   : 19171
// Alteração   : Mostrar Plano Previdenciário 
//------------------------------------------------------------------------------
unit fConsPartTratados;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, DBTables, Wwquery, ComCtrls,
  wwriched, Grids, Wwdbigrd, Wwdbgrid, MontaSelect, ppBands, ppVar,
  ppCtrls, ppPrnabl, ppClass, ppCache, ppProd, ppReport, ppEndUsr, ppDB,
  ppComm, ppRelatv, ppDBPipe, ppDBBDE, ppStrtch, ppMemo,
  Pptypes, FPreview;


type
  TfrmConsPartTratados = class(TfrmOkCancelar)
    grpDadosParticipantes: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    btnProcurar: TBitBtn;
    lblParticipante: TStaticText;
    Panel1: TPanel;
    dbgrdTratados: TwwDBGrid;
    Label1: TLabel;
    Panel2: TPanel;
    wwDBRichEdit1: TwwDBRichEdit;
    qryPartTratado: TwwQuery;
    dsPartTratado: TwwDataSource;
    Label2: TLabel;
    MontaSelect1: TMontaSelect;
    lblMatricula: TStaticText;
    lblNumBenef: TStaticText;
    lblEspecie: TStaticText;
    lblBeneficio: TStaticText;
    btnListagem: TBitBtn;
    ppPartTratados: TppBDEPipeline;
    ppdsnPartTratados: TppDesigner;
    rpPartTratados: TppReport;
    ppHeaderBand13: TppHeaderBand;
    ppDBImage12: TppDBImage;
    ppDBText185: TppDBText;
    ppDBText186: TppDBText;
    ppDBText187: TppDBText;
    ppDBText188: TppDBText;
    ppDBText189: TppDBText;
    ppDBText190: TppDBText;
    ppDBText191: TppDBText;
    ppLabel182: TppLabel;
    ppDBText192: TppDBText;
    ppLabel183: TppLabel;
    ppLine53: TppLine;
    ppDetailBand14: TppDetailBand;
    ppFooterBand13: TppFooterBand;
    ppLine54: TppLine;
    ppLabel185: TppLabel;
    ppSystemVariable25: TppSystemVariable;
    ppSummaryBand12: TppSummaryBand;
    qryFundacao: TwwQuery;
    dsFundacao: TwwDataSource;
    ppFundacao: TppBDEPipeline;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText6: TppDBText;
    ppDBMemo1: TppDBMemo;
    BitBtn1: TBitBtn;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppShape1: TppShape;
    lblEntidade: TStaticText;
    Label3: TLabel;
    qryBeneficiario: TwwQuery;
    qryMantenedora: TwwQuery;
    stMantenedora: TStaticText;
    Label4: TLabel;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel4: TppLabel;
    ppDBText7: TppDBText;
    ppLabel2: TppLabel;
    ppLabel5: TppLabel;
    ppLabel8: TppLabel;
    ppLabel6: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    EdPlanPrev: TStaticText;
    Label5: TLabel;
    procedure btnProcurarClick(Sender: TObject);
    procedure qryPartTratadoAfterOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure btnListagemClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MontaSelect1BeforeOpenCds(var sqlText: String;
      strListParams: TStringList);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    sMesCobMS : String;
    { Private declarations }

    Procedure MontaQuery(pIdpessoa, pNumProcINSS, pMesCob: String);
  public
    { Public declarations }
  end;

var
  frmConsPartTratados: TfrmConsPartTratados;

implementation

{$R *.DFM}

procedure TfrmConsPartTratados.btnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaSelect1.Executar;
  If MontaSelect1.RetornouValor Then
    MontaQuery(MontaSelect1.ValoresChave[0], MontaSelect1.ValoresChave[1],
               sMesCobMS);
end;

procedure TfrmConsPartTratados.qryPartTratadoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  // Se a query retornar algum registro então prencher os campos na tela.
  btnListagem.Enabled := Not DataSet.IsEmpty;
  With  qryBeneficiario Do Begin
    If Not IsEmpty Then
    Begin
      lblParticipante.Caption := FieldByName('NOME').AsString;
      lblMatricula.Caption    := FieldByname('MATRICULA').AsString;
      lblNumBenef.Caption     := FieldByname('NUMPROCINSS').AsString;
      lblEspecie.Caption      := FieldByName('ESPECIE').AsString;
      lblBeneficio.Caption    := FieldByname('NOMEBENEFICIO').AsString;
      lblEntidade.Caption     := FieldByname('PLANOCONTABIL').AsString;
      stMantenedora.Caption   := qryMantenedora.FieldByName('NOMEMANTENEDORA').AsString;
      EdPlanPrev.Caption      := FieldByname('NOMEPLANO').AsString; 
    end Else
    Begin // Limpa campos caso não encontre nada!
      lblParticipante.Caption := '';
      lblMatricula.Caption    := '';
      lblNumBenef.Caption     := '';
      lblEspecie.Caption      := '';
      lblBeneficio.Caption    := '';
      lblEntidade.Caption     := '';
      stMantenedora.Caption   := '';            
      EdPlanPrev.Caption      := ''; 
    End;
  End;
end;

procedure TfrmConsPartTratados.FormShow(Sender: TObject);
begin
  inherited;
  WindowState := wsMaximized;
end;

procedure TfrmConsPartTratados.btnListagemClick(Sender: TObject);
begin
  inherited;
  MontaQuery(MontaSelect1.ValoresChave[0],'','');

  ppdsnPartTratados.Report.Template.SaveTo   := stFile;
  ppdsnPartTratados.Report.Template.Format   := ftASCII;
  ppdsnPartTratados.Report.Device            := dvScreen;
  if sMesCobMS <> '' Then
    TFrmPreview.CreateModalPreview(Application, ppdsnPartTratados.Report, 'Relação de Participantes Tratados - Mês: ' + sMesCobMS)
  else
    TFrmPreview.CreateModalPreview(Application, ppdsnPartTratados.Report, 'Relação de Participantes Tratados');
end;

procedure TfrmConsPartTratados.BitBtn1Click(Sender: TObject);
begin
  inherited;
  MontaQuery('-1','','');

  ppdsnPartTratados.Report.Template.SaveTo   := stFile;
  ppdsnPartTratados.Report.Template.Format   := ftASCII;
  ppdsnPartTratados.Report.Device            := dvScreen;
  if sMesCobMS <> '' Then
    TFrmPreview.CreateModalPreview(Application, ppdsnPartTratados.Report, 'Relação de Participantes Tratados - Mês: ' + sMesCobMS)
  else
    TFrmPreview.CreateModalPreview(Application, ppdsnPartTratados.Report, 'Relação de Participantes Tratados');
end;

procedure TfrmConsPartTratados.MontaQuery(pIdpessoa, pNumProcINSS, pMesCob: String);
begin
  if pNumProcINSS <> '' Then Begin
    qryBeneficiario.Close;
    qryBeneficiario.ParamByName('NUMPROC').AsString := pNumProcINSS;
    qryBeneficiario.Open;

    qryMantenedora.Close;
    qryMantenedora.ParamByName('NUMPROC').AsString := pNumProcINSS;
    qryMantenedora.Open;
  end;

  qryPartTratado.SQL.Clear;
  qryPartTratado.Sql.Add(
    ' SELECT D.MESCOBRANCA, D.MESREFERENCIA, P.NOME, D.SEQUENCIAL,  D.NUMPROCINSS, PPC.NOME PLANO, ' +
    '   PD.DESCRICAO RUBRICA, B.NOME NOME_BENEF, B.CODBENEFICIO, D.RUBRICAINSS,  D.IDRUBRICA, ' +
    '   NVL(EL.MATRICULA,D.MATRICULA) MATRICULA, D.OBSERVACAO, D.VALORINSS, D.SEQUENCIAL ' +
    ' FROM DETCONCINSS D, PESSOA P, PROVDESC PD, ' +
    ' 	 PLANPREVCONTABIL PPC, BENEFICIO B, ' +
    ' 	 ELEGPATRO EL ' +
    ' WHERE 1 = 1 ');

    If StrToInt(pIdPessoa) > 0 Then
      qryPartTratado.Sql.Add(' AND D.IDPESSOA = ' + pIdPessoa );
    If pNumProcINSS <> '' Then
      qryPartTratado.Sql.Add(' AND D.NUMPROCINSS = ' + QuotedStr(pNumProcINSS));
    If pMesCob <> '' Then
      qryPartTratado.Sql.Add(' AND D.MESCOBRANCA = ' + QuotedStr(pMesCob));


    qryPartTratado.Sql.Add(
    '   AND D.IDPESSOA 	    = P.IDPESSOA ' +
    '   AND PD.IDPROVENTO   = D.IDRUBRICA ' +
    '   AND PPC.IDPLANOPREV = D.IDPLANOPREV ' +
    '   AND B.IDBENEFICIO(+)= D.IDBENEFICIO ' +
    '   AND EL.IDPESSOA(+)  = D.IDPESSOA ' +
    '   AND D.FLGTRATADO    = 1 ' +
    ' ORDER BY 1,2,3,4 ' );
  qryPartTratado.Open;

  If StrToInt(pIdPessoa) > 0 Then
    dbgrdTratados.DataSource := dsPartTratado
  Else dbgrdTratados.DataSource := nil;

end;

procedure TfrmConsPartTratados.FormCreate(Sender: TObject);
begin
  inherited;
  qryFundacao.Open;
end;

procedure TfrmConsPartTratados.MontaSelect1BeforeOpenCds(
  var sqlText: String; strListParams: TStringList);
begin
  inherited;
  sMesCobMS := strListParams.Values['D.MESCOBRANCA'];
end;

procedure TfrmConsPartTratados.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
end;



end.