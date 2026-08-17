unit FSelRelTrein;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls,
  TB97, ComCtrls, Db, DBTables, Wwtable, TB97Tlbr, IvDictio, IvMulti,
  IvEMulti, Wwquery, wwdbdatetimepicker, CMDateTimePicker;

type
  // Usado no método de impressão dos relatórios
  TDispositivo = (tpImpressora, tpVideo);

  TfrmSelRelTrein = class(TCMParamRel)
    TabSheet1: TTabSheet;
    gbxFaixaData: TGroupBox;
    Label1: TLabel;
    EdData1: TCMDateTimePicker;
    EdData2: TCMDateTimePicker;
    rgFormaRel: TRadioGroup;
    gbxSelEstado: TGroupBox;
    cbxRealProgr: TCheckBox;
    cbxRealNaoProgr: TCheckBox;
    cbxNaoRealProgr: TCheckBox;
    cbxNaoRealNaoProgr: TCheckBox;
    rgTipoCusto: TRadioGroup;
    tblTipCurso: TwwQuery;
    gbxResumo: TGroupBox;
    cmbResumo: TComboBox;
    rgIncluiExternos: TRadioGroup;
    procedure EdData1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
  private
    procedure ImprimirRelatorios(Dispositivo: TDispositivo);
  public
    procedure PreparaTipoCurso;
    procedure ZeraTipoCurso;
    procedure SomaTipoCurso(IdTipo: string; IndProgr:integer; ResCusto:double;
      ResHoras:integer);
  end;

var
  frmSelRelTrein: TfrmSelRelTrein;
  TamRes, iSelCurso: integer;
  MsgTitulo, sTipo : string;
  TotQtd, TotHor: array[1..4] of integer;
  TotRes: array[1..4] of double;
  AcuRes, HorRes, QtdRes, CodRes, CodRes2 : variant;
  Imprime, FazRes1, FazRes2, FazRes3, FazRes4: boolean;

implementation

uses fTelaAut, rTreinPess, rTreinCurso, rTreinEntid;

{$R *.DFM}

procedure TfrmSelRelTrein.FormCreate(Sender: TObject);
begin
  inherited;
  cmbResumo.ItemIndex := 0;
  cmbResumo.Text      := 'Tipo de Curso';
  EdData1.Date        := (Date-365);
  EdData2.Date        := Date;
end;

procedure TfrmSelRelTrein.EdData1Change(Sender: TObject);
begin
  inherited;
  rbtnVisualizar.Enabled := false;
  rbtnImprimir.Enabled   := false;
  if (EdData1.Text <> '') and (EdData2.Text <> '') and (EdData1.Date <= EdData2.Date) then
  begin
    rbtnVisualizar.Enabled := true;
    rbtnImprimir.Enabled   := true;
  end;
end;

procedure TfrmSelRelTrein.ImprimirRelatorios(Dispositivo: TDispositivo);
begin
  PreparaTipoCurso;
  sTipo     := '';
  iSelCurso := -1;
  FazRes1   := cbxRealProgr.Checked;
  FazRes2   := cbxRealNaoProgr.Checked;
  FazRes3   := cbxNaoRealProgr.Checked;
  FazRes4   := cbxNaoRealNaoProgr.Checked;
  Imprime   := (Dispositivo = tpImpressora);

  case (rgFormaRel.ItemIndex) of
    0 : AbrirForm(RelTreinPess, TRelTreinPess, false);
    1 :
    begin
      relTreinCurso := TrelTreinCurso.Create(Self);
      relTreinCurso.Show;
      Self.WindowState := wsNormal;
    end;
    2 :
    begin
      relTreinEntid := TrelTreinEntid.Create(Self);
      relTreinEntid.Show;
      Self.WindowState := wsNormal;
    end;
  end;
end;

procedure TfrmSelRelTrein.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  ImprimirRelatorios(tpVideo);
end;

procedure TfrmSelRelTrein.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  ImprimirRelatorios(tpImpressora);
end;

procedure TfrmSelRelTrein.ZeraTipoCurso;
var
  Ind, Ind1: integer;
begin
  for Ind:=1 to TamRes do
    for Ind1:=1 to 4 do
    begin
      QtdRes[Ind,Ind1] := 0;
      HorRes[Ind,Ind1] := 0;
      AcuRes[Ind,Ind1] := 0;
    end;
    for Ind1:=1 to 4 do
    begin
      TotQtd[Ind1] := 0;
      TotHor[Ind1] := 0;
      TotRes[Ind1] := 0;
    end;
end;

procedure TfrmSelRelTrein.SomaTipoCurso(IdTipo : String; IndProgr : Integer;
  ResCusto : Double; ResHoras : Integer);
var
  Ind: integer;
begin
  if (IdTipo <> '-1') then
  begin
    for Ind:=1 to TamRes do
    begin
      if (CodRes2[Ind] = IdTipo) then
      begin
        AcuRes[Ind, IndProgr] := AcuRes[Ind, IndProgr] + ResCusto;
        HorRes[Ind, IndProgr] := HorRes[Ind, IndProgr] + ResHoras;
        QtdRes[Ind, IndProgr] := QtdRes[Ind, IndProgr] + 1;
        break;
      end;
    end;
  end;
  TotQtd[IndProgr] := TotQtd[IndProgr] + 1;
  TotHor[IndProgr] := TotHor[IndProgr] + ResHoras;
  TotRes[IndProgr] := TotRes[IndProgr] + ResCusto;
end;

procedure TfrmSelRelTrein.PreparaTipoCurso;
begin
  tblTipCurso.Close;
  tblTipCurso.Sql.Clear;
  if (cmbResumo.ItemIndex = 0) then
    tblTipCurso.Sql.Add('SELECT TO_CHAR(T.IDTIPOCURSO) AS CODTIPO, ' +
                        'T.IDTIPOCURSO, T.DESCRICAO ' +
                        'FROM TIPCURSO T  ORDER BY IDTIPOCURSO')
  else
  if (cmbResumo.ItemIndex = 1) then
    tblTipCurso.Sql.Add('SELECT C.CODCENTROCUSTO AS CODTIPO, ' +
                        'TO_NUMBER(C.CODCENTROCUSTO) AS IDTIPOCURSO, C.CODCENTROCUSTO, ' +
                        'RTRIM(C.NOME) AS DESCRICAO ' +
                        'FROM CENTCUST C ORDER BY CODTIPO')
  else
  if (cmbResumo.ItemIndex = 2) then
    tblTipCurso.Sql.Add('SELECT (SUBSTR(TO_CHAR(T.IDTIPOCURSO) || ''0000000'',1,7) || ' +
                        'SUBSTR(RTRIM(C.CODCENTROCUSTO)||''0000000000'',1,10)) AS CODTIPO, ' +
                        'T.IDTIPOCURSO, C.CODCENTROCUSTO, ' +
                        'RTRIM(T.DESCRICAO) || '' - '' || RTRIM(C.NOME) AS DESCRICAO ' +
                        'FROM TIPCURSO T, CENTCUST C ORDER BY IDTIPOCURSO,CODCENTROCUSTO')
  else
    tblTipCurso.Sql.Add('SELECT (SUBSTR(TO_CHAR(T.IDTIPOCURSO) || ''0000000'',1,7) || ' +
                        'SUBSTR(RTRIM(C.CODCENTROCUSTO)||''0000000000'',1,10)) AS CODTIPO, ' +
                        'T.IDTIPOCURSO, C.CODCENTROCUSTO, ' +
                        'RTRIM(C.NOME) || '' - '' || RTRIM(T.DESCRICAO) AS DESCRICAO ' +
                        'FROM TIPCURSO T, CENTCUST C ORDER BY CODCENTROCUSTO,IDTIPOCURSO');
  tblTipCurso.Open;
  TamRes  := tblTipCurso.RecordCount;
  CodRes  := VarArrayCreate([1, TamRes], varVariant);
  CodRes2 := VarArrayCreate([1, TamRes], varVariant);
  TamRes  := 0;
  while not(tblTipCurso.EOF) do
  begin
    TamRes := TamRes + 1;
    CodRes[TamRes] := tblTipCurso.FieldByName('CODTIPO').AsString;
    CodRes2[TamRes] := tblTipCurso.FieldByName('CODTIPO').AsString;
    tblTipCurso.Next;
  end;
  tblTipCurso.First;
  QtdRes := VarArrayCreate([1, TamRes, 1, 4], varInteger);
  HorRes := VarArrayCreate([1, TamRes, 1, 4], varInteger);
  AcuRes := VarArrayCreate([1, TamRes, 1, 4], varDouble);
end;

end.
