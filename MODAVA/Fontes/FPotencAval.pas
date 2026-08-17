unit FPotencAval;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, fSairAjuda,
  MAHlpBtn, StdCtrls, Buttons, ExtCtrls, DBTables, Wwquery, Db, Wwtable, Wwdatsrc, Grids,
  Wwdbigrd, Wwdbgrid, Mask, DBCtrls, OleCtrls, chartfx3, MontaSelect, IvDictio, IvMulti,
  IvEMulti, TB97Tlbr, wwdblook, wwdbdatetimepicker, CMDateTimePicker, TB97,
  TB97Ctls;

type
  TfrmPotencAval = class(TfrmSairAjuda)
    Panel2: TPanel;
    ds: TwwDataSource;
    tblPessoal: TwwTable;
    tblFuncio: TwwTable;
    ds2: TwwDataSource;
    qryAval: TwwQuery;
    tblSitFunc: TwwTable;
    ds3: TwwDataSource;
    sbtnProcurar: TSpeedButton;
    gbxFaixaData: TGroupBox;
    Label3: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    GroupBox1: TGroupBox;
    dbedMatric: TDBEdit;
    dbedNome: TDBEdit;
    dsSit: TwwDataSource;
    dbedSit: TDBEdit;
    dsCar: TwwDataSource;
    tblCargo: TwwTable;
    dbedCargo: TDBEdit;
    gbxPotenc: TGroupBox;
    qryGrupo: TwwQuery;
    dblcGrupo: TwwDBLookupCombo;
    qryAvalDATAREAL: TDateTimeField;
    qryAvalAVALIACAO: TFloatField;
    qryAvalPOTENCIAL: TIntegerField;
    qryAvalIDPESSOA: TFloatField;
    qryAvalCODTIPOAVAL: TFloatField;
    qryAvalNUMSEQ: TFloatField;
    qryDesemp: TwwQuery;
    Chart1: TChartfx;
    MontaSelect: TMontaSelect;
    dbgrAval: TwwDBGrid;
    bbtnConfirmar: TBitBtn;
    ToolbarSep971: TToolbarSep97;
    pnlGrid: TPanel;
    pnlGrafico: TPanel;
    procedure sbtnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryAvalCalcFields(DataSet: TDataSet);
  private
    Tam, TamY: integer;
    CharHor: variant;
    Ymax: double;
    DescSer: array[1..2] of string;
  end;

var
  frmPotencAval: TfrmPotencAval;

implementation

uses uMensErro, UsoGeralRH;

{$R *.DFM}

procedure TfrmPotencAval.FormCreate(Sender: TObject);
begin
  inherited;
  DescSer[1] := 'Avaliação';
  DescSer[2] := 'Potencial';
    
  if (sUsuXccusto <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.CODCENTROCUSTO IN ' + sUsuXccusto);

  if (sUsuXfilial <> '') then
    MontaSelect.Filtro.Add('FUNCIONARIO.IDESTAB IN ' + sUsuXfilial);

  tblSitFunc.Open;
  tblFuncio.Open;
  tblPessoal.Open;
  tblCargo.Open;
  qryGrupo.Open;
  EdData1.Date   := (Date-3652);
  EdData2.Date   := Date;
  dblcGrupo.Text := qryGrupo.FieldByName('DESCGRPFUNC').asString;
  sbtnProcurarClick(Self);
end;

procedure TfrmPotencAval.qryAvalCalcFields(DataSet: TDataSet);
var
  TotPot: integer;
  CodGrp, sSql: string;
begin
  inherited;
  CodGrp := qryGrupo.FieldByName('CODGRPFUNC').asString;
  TotPot := 0;
  qryDesemp.Close;
  qryDesemp.SQL.Clear;
  sSQL:= 'Select PESOFATGRP.PESO, HSTDESEMP.GRAU ' +
         'from PESOFATGRP,HSTDESEMP where HSTDESEMP.IDPESSOA = ' +
         tblPessoal.FieldByName('IDPESSOA').asString +
         ' and HSTDESEMP.CODTIPOAVAL = ' +
         qryAval.FieldByName('CODTIPOAVAL').asString +
         ' and HSTDESEMP.NUMSEQ = ' +
         qryAval.FieldByName('NUMSEQ').asString +
         ' and PESOFATGRP.CODGRPFUNC = ''' + CodGrp +
         ''' and PESOFATGRP.IDFATORAVAL = HSTDESEMP.IDFATORAVAL';

  qryDesemp.SQL.Add(sSql);
  try
    qryDesemp.Open;
  except
    on E: EDBEngineError do
    begin
      MsgDlg('Erro na leitura de avaliações.','Informação',mtInformation,[mbOk,mbHelp],0);
      exit;
    end;
  end;

  qryDesemp.First;
  while not(qryDesemp.EOF) do
  begin
    TotPot := TotPot + qryDesemp.FieldByName('GRAU').asInteger *
                       qryDesemp.FieldByName('PESO').asInteger;
    qryDesemp.Next;
  end;
  qryAval.FieldByName('POTENCIAL').asInteger := TotPot;
end;

procedure TfrmPotencAval.sbtnProcurarClick(Sender: TObject);
begin
  Chart1.Visible    := false;
  Chart1.SendToBack;
  dbgrAval.Visible  := false;
  sbtnProcurar.Down := false;
  MontaSelect.Executar;
  if (MontaSelect.ValoresChave.Count > 0) and (MontaSelect.ValoresChave[0] <> '') then
    tblFuncio.FindKey([StrToInt(MontaSelect.ValoresChave[0])]);
end;

procedure TfrmPotencAval.bbtnConfirmarClick(Sender: TObject);
var
  I3: double;
  I, I1, I2: integer;
begin
  inherited;
  dbgrAval.Visible := false;
  Chart1.Visible   := false;
  Chart1.SendToBack;

  qryAval.Close;
  qryAval.ParamByName('DATA1').asDateTime := EdData1.Date;
  qryAval.ParamByName('DATA2').asDateTime := EdData2.Date;
  qryAval.ParamByName('IDPESSOA').asFloat := tblPessoal.FieldByName('IDPESSOA').asFloat;
  {qryAval.SQL.Clear;
  qryAval.SQL.Add('Select HSTAVAL.DATAREAL,HSTAVAL.AVALIACAO, (HSTAVAL.POTENCIAL) ');
  qryAval.SQL.Add('from TIPOAVAL,HSTAVAL where HSTAVAL.IDPESSOA = ');
  qryAval.SQL.Add(tblPessoal.FieldByName('IDPESSOA').AsString);
  qryAval.SQL.Add(' and HSTAVAL.CODTIPOAVAL = TIPOAVAL.CODTIPOAVAL');
  qryAval.SQL.Add(' and TIPOAVAL.FLGTIPOAVAL < 2');
  qryAval.SQL.Add(' and HSTAVAL.DATAREAL >= To_Date('''+EdData1.Text+''',''dd/mm/yyyy'')');
  qryAval.SQL.Add(' and HSTAVAL.DATAREAL <= To_Date('''+EdData2.Text+''',''dd/mm/yyyy'')');
  qryAval.SQL.Add(' order by HSTAVAL.DATAREAL');}
  qryAval.Open;

  // Preenche os Dados do Chart
  Tam := 0;
  while not(qryAval.EOF) do
  begin
    Inc(Tam);
    qryAval.Next;
  end;
  qryAval.First;

  if (Tam > 0) then
  begin
    TamY    := 2;
    CharHor := VarArrayCreate([1, TamY, 1, Tam], varInteger);
    for I1:=1 to TamY do
      for I2:=1 to Tam do
        CharHor[I1,I2] := 0;

    I1 := 0;
    while not(qryAval.EOF) do
    begin
      Inc(I1);
      CharHor[1, I1] := qryAval.FieldByName('AVALIACAO').asInteger;
      CharHor[2, I1] := qryAval.FieldByName('POTENCIAL').asInteger;
      qryAval.Next;
    end;

    qryAval.First;
    Chart1.ChartType := 1;
    Chart1.Decimals  := 0;
    Chart1.OpenDataEx({COD_VALUES}1,{TamY}2,Tam);
    for I1:=0 to (TamY-1) do
    begin
      Chart1.ThisSerie  := I1;
      Chart1.SerLeg[I1] := DescSer[I1+1];

      for I:=0 to (Tam-1) do
      begin
        Chart1.Value[I] := CharHor[I1+1,I+1];
        if (Chart1.Value[I] > Ymax) then
          Ymax := Chart1.Value[I];
      end;
    end;

    I3 := 1;
    while (Ymax > I3) do
      I3 := I3*10;

    I3 := Int(I3 / 20);    // Escala de Y
    Chart1.Adm[1] := Ymax; // Valor Máximo de Y
    Chart1.Adm[4] := I3;   // Escala de Y
    Chart1.CloseData({COD_VALUES}1); // Fecha o canal VALUES 
    Chart1.Visible := true;
    Chart1.BringToFront;
  end;
  dbgrAval.Visible := true;
end;

end.
