// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    :  Ádler Teodoro de Souza
// Data        :  13/05/2009
// Pendência   : SOL 116806 KINTANA 549481
// Descricao   :  Alteração de gravação de arquivos de log na raiz do disco C: .
//------------------------------------------------------------------------------
unit fParamEstAvalTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSelPessoalMT,
  uCmSqlParams, Db, DBClient, uCMClientDataSet, Wwdatsrc, CmParamReport, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, ExtCtrls, wwdblook, CMDateTimePicker,
  wwdbdatetimepicker, Spin, TEdNum, ComCtrls, DBTables, CheckLst, uCtrlCurso, uCtrlHistPessoa,
  OleCtrls, chartfx3, TREdit, uCtrlGlobalRH, ColorCheckListBox, USistema;

type
  TfrmParamEstAvalTrein = class(TfrmSelPessoalMT)
    tbshGrafico: TTabSheet;
    gbxCursos: TGroupBox;
    chklstCurso: TColorCheckListBox;
    bbtnSelTodos: TBitBtn;
    bbtnInverteSel: TBitBtn;
    CdsCurso: TCMClientDataSet;
    gbxFaixaData: TGroupBox;
    Label9: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    gbxEntid: TGroupBox;
    chklstEntid: TColorCheckListBox;
    bbtnSelEntid: TBitBtn;
    bbtnInverteEntid: TBitBtn;
    CdsEntid: TCMClientDataSet;
    Chart1: TChartfx;
    gbxMaxAval: TGroupBox;
    redMaxAval: TRealEdit;
    dsAvalTrein: TwwDataSource;
    CdsAvalTrein: TCMClientDataSet;
    sqlAvalTrein: TCMSqlParams;
    rgCursoAluno: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure bbtnSelTodosClick(Sender: TObject);
    procedure bbtnInverteSelClick(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnSelEntidClick(Sender: TObject);
    procedure bbtnInverteEntidClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    CtrlCurso: TCtrlCurso;
    CtrlHistPessoa: TCtrlHistPessoa;
    CtrlGlobalRH: TCtrlGlobalRH;

    ListaIdCurso, ListaIdEntid: TStringList;

    sTipo, sListaFunc, sCurso, sEntid: string;
  public
    constructor Create(AOwner: TComponent; TipoRelatorio: string); reintroduce;
  end;

var
  frmParamEstAvalTrein: TfrmParamEstAvalTrein;

implementation

uses uCtrlPadroes, uCtrlFuncoesRH, uMensErro, dCds;

{$R *.DFM}

constructor TfrmParamEstAvalTrein.Create(AOwner: TComponent; TipoRelatorio: string);
begin
  sTipo := TipoRelatorio;
  inherited Create(AOwner);
end;

procedure TfrmParamEstAvalTrein.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlGlobalRH := TCtrlGlobalRH.Create;
  CtrlGlobalRH.InitializeAs(Padroes);
  
  CtrlHistPessoa := TCtrlHistPessoa.Create;
  CtrlHistPessoa.InitializeAs(Padroes);

  CtrlCurso := TCtrlCurso.Create;
  CtrlCurso.InitializeAs(Padroes);

  ListaIdCurso := TStringList.Create;
  ListaIdEntid := TStringList.Create;

  dmCds.Cds.Data := CtrlGlobalRH.GetParamRH('VALMAXAVALTRN,FLGAVALALUNO');
  redMaxAval.Value := dmCds.Cds.FieldByName('VALMAXAVALTRN').asInteger;
  if (redMaxAval.Value = 0) then
    redMaxAval.Value := 100
  else
    gbxMaxAval.Visible := false;

  rgCursoAluno.Visible := (dmCds.Cds.FieldByName('FLGAVALALUNO').asInteger = 1);

  // Preenche ChkList dos Cursos
  CdsCurso.Data := CtrlCurso.ListGeral;
  chklstCurso.Items.Clear;
  while not(CdsCurso.EOF) do
  begin
    ListaIdCurso.Add(CdsCurso.FieldByName('IDCURSO').asString);
    chklstCurso.Items.Add(CdsCurso.FieldByName('DESCRICAO').asString);
    CdsCurso.Next;
  end;

  // Preenche ChkList das Entidades
  CdsEntid.Data := CtrlHistPessoa.ListEntidadeTreinamento;
  chklstEntid.Items.Clear;
  while not(CdsEntid.EOF) do
  begin
    ListaIdEntid.Add(CdsEntid.FieldByName('IDPESSOA').asString);
    chklstEntid.Items.Add(CdsEntid.FieldByName('NOME').asString);
    CdsEntid.Next;
  end;

  edData1.Date := Date - 365;
  edData2.Date := Date;
end;

procedure TfrmParamEstAvalTrein.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHistPessoa);
  FreeAndNil(CtrlCurso);
  FreeAndNil(ListaIdCurso);
  FreeAndNil(ListaIdEntid);
  inherited;
end;

procedure TfrmParamEstAvalTrein.bbtnSelTodosClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCurso.Items.Count-1 do
    chklstCurso.Checked[c] := true;
  chklstCurso.Repaint;
end;

procedure TfrmParamEstAvalTrein.bbtnInverteSelClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstCurso.Items.Count-1 do
    chklstCurso.Checked[c] := not(chklstCurso.Checked[c]);
  chklstCurso.Repaint;
end;

procedure TfrmParamEstAvalTrein.bbtnSelEntidClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEntid.Items.Count-1 do
    chklstEntid.Checked[c] := true;
  chklstEntid.Repaint;
end;

procedure TfrmParamEstAvalTrein.bbtnInverteEntidClick(Sender: TObject);
var
  c: integer;
begin
  for c:=0 to chklstEntid.Items.Count-1 do
    chklstEntid.Checked[c] := not(chklstEntid.Checked[c]);
  chklstEntid.Repaint;
end;

procedure TfrmParamEstAvalTrein.bbtnConfirmarClick(Sender: TObject);
var
  c, I1, I2: integer;
  I3: double;
  iTamX, iTamY: integer;
  CharCod, CharTit: variant;
  YMax: double;
  S1, S2, S3: String;
const
  ListaDescricao: array [1..4] of String = ('Ruim','Regular','Bom','Ótimo');
begin
  inherited;
  FU.CriaListaOpcoes(chklstCurso, ListaIdCurso, sCurso, ',', false);
  FU.CriaListaOpcoes(chklstEntid, ListaIdEntid, sEntid, ',', false);

  c:=0;
  while not(CdsPrincipal.EOF) do
  begin
    if (c = 0) then
    begin
      sListaFunc := CdsPrincipal.FieldByName('IDPESSOA').asString;
      Inc(c);
    end
    else
      sListaFunc := sListaFunc +','+ CdsPrincipal.FieldByName('IDPESSOA').asString;

    CdsPrincipal.Next;
  end;

  with (sqlAvalTrein.SQL) do
  begin
    Clear;
    Add('SELECT IDFATORAVAL, DESCRICAO FROM FATORAVALCURSO');
    if rgCursoAluno.ItemIndex = 0 then
      Add('WHERE NVL(INDAPLICACAO,0) IN (0,2)')
    else
      Add('WHERE NVL(INDAPLICACAO,0) IN (1,2)');
    Add('ORDER BY IDFATORAVAL');
  end;
  sqlAvalTrein.Open;

  iTamX := CdsAvalTrein.RecordCount;
  iTamY := 1;

  CharCod := VarArrayCreate([1, iTamX], varInteger);
  CharTit := VarArrayCreate([1, iTamX], varVariant);

  I1 := 0;
  while not CdsAvalTrein.Eof do
  begin
    inc(I1);
    CharCod[I1] := CdsAvalTrein.FieldByName('IDFATORAVAL').asInteger;
    CharTit[I1] := trim(CdsAvalTrein.FieldByName('DESCRICAO').asString);
    CdsAvalTrein.Next;
  end;

  CdsAvalTrein.Close;

  I3 := round(redMaxAval.Value / 4);
  S1 := FloatToStr(I3);
  S2 := FloatToStr(I3-1);
  S3 := FloatToStr(redMaxAval.Value);

  with (sqlAvalTrein.SQL) do
  begin
    Clear;
    Add('SELECT A.IDFATORAVAL,');
    Add('       SUM(A.AVALCURSO) * 100 / COUNT(*) / '+S3+ ' AS MEDIA');
    Add('FROM HSTTRN H, AVALCURSO A, FATORAVALCURSO F');
    Add('WHERE  H.IDPESSOA = A.IDPESSOA');

    if sCurso <> '' then
      Add('AND     H.IDCURSO IN (' +sCurso+ ')');

    if sEntid <> '' then
      Add('AND     H.IDENTIDINSTR IN (' +sEntid+ ')');

    Add('AND    H.IDPESSOA IN (' +sListaFunc+ ')');

    Add('AND H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(EdData1.Text)+ ',''DD/MM/YYYY'')');
    Add('    AND TO_DATE(' +QuotedStr(EdData2.Text)+ ',''DD/MM/YYYY'')');

    Add('AND    H.IDCURSO  = A.IDCURSO');
    Add('AND    H.NUMSEQ   = A.NUMSEQ');
    Add('AND    A.IDFATORAVAL = F.IDFATORAVAL');
    Add('AND    F.FLGAVALCURSO = 0');

    if rgCursoAluno.ItemIndex = 0 then
      Add('AND NVL(A.FLGCURSOALUNO,0) = 0')
    else
      Add('AND NVL(A.FLGCURSOALUNO,0) = 1');

    Add('GROUP BY A.IDFATORAVAL');

    Add('UNION');
    Add('SELECT A.IDFATORAVAL,');
    Add('       SUM(A.AVALCURSO * 100 / E.QTDECONCEITOS) / COUNT(*) AS MEDIA');
    Add('FROM HSTTRN H, AVALCURSO A, FATORAVALCURSO F, ESCALACONCEITOS E');
    Add('WHERE  H.IDPESSOA = A.IDPESSOA');

    if sCurso <> '' then
      Add('AND     H.IDCURSO IN (' +sCurso+ ')');

    if sEntid <> '' then
      Add('AND     H.IDENTIDINSTR IN (' +sEntid+ ')');

    Add('AND    H.IDPESSOA IN (' +sListaFunc+ ')');

    Add('AND H.DATREFIM BETWEEN TO_DATE(' +QuotedStr(EdData1.Text)+ ',''DD/MM/YYYY'')');
    Add('    AND TO_DATE(' +QuotedStr(EdData2.Text)+ ',''DD/MM/YYYY'')');


    if rgCursoAluno.ItemIndex = 0 then
      Add('AND NVL(A.FLGCURSOALUNO,0) = 0')
    else
      Add('AND NVL(A.FLGCURSOALUNO,0) = 1');

    Add('AND    H.IDCURSO  = A.IDCURSO');
    Add('AND    H.NUMSEQ   = A.NUMSEQ');
    Add('AND    A.IDFATORAVAL = F.IDFATORAVAL');
    Add('AND    F.FLGAVALCURSO = 1');
    Add('AND    F.IDESCALACONCEITOS = E.IDESCALACONCEITOS');
    Add('GROUP BY A.IDFATORAVAL');
    Add('ORDER BY 1');

//    SaveToFile('c:\qry.txt');
    SaveToFile(Sistema.RetornaCaminhoArquivos(Sistema.IdEmpresa)+'\qry.txt');//Ádler Teodoro de Souza SOL 116806 KINTANA 549481
  sqlAvalTrein.Open;

  if (CdsAvalTrein.IsEmpty) then
  begin
    pnResult.SendToBack;
    bbtnOutraVezClick(Sender);
    MsgDlg('Não Há Dados a Serem Exibidos.', 'Aviso', mtWarning, [mbOk,mbHelp], 0);
    exit;
  end;

  Chart1.OpenDataEx(1,iTamY,iTamX);
  Chart1.ChartType := 2;
  Chart1.Decimals := 0;
  Chart1.Title[2] := 'Estatística das Avaliações do Treinamento';
  Chart1.Title[3] := 'Valores Representam Percentuais das Avaliações Máximas Possíveis';

  for I2 := 0 to iTamY-1 do
  begin
    Chart1.ThisSerie := I2;
    for I1 := 0 to iTamX-1 do
      Chart1.Value[I1] := 0;
  end;

  YMax := 100;

  for c := 1 to iTamX do
     Chart1.Legend[c-1] := CharTit[c];

  while not(CdsAvalTrein.EOF) do
  begin
    for c := 1 to iTamX do
    begin
      if CharCod[c] = CdsAvalTrein.FieldByName('IDFATORAVAL').asInteger then
      begin
         Chart1.ThisSerie := 0;

         Chart1.Value[c-1] := Chart1.Value[c-1] +
              CdsAvalTrein.FieldByName('MEDIA').asInteger;

         break;
      end;
    end;
    CdsAvalTrein.Next;
  end;

  I3 := 1;
  while (YMax > I3) do
    I3 := I3*10;

  I3 := Int(I3 / 20); // Escala de Y

  Chart1.Adm[1] := YMax; // Valor Máximo de Y
  Chart1.Adm[4] := I3; // Escala de Y
  Chart1.CloseData(1);

  ExecutarIrPaginaResult;

end;
end;
end.

