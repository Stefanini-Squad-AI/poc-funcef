{===============================================================================
Criação   : Thiago Melo
SOL / KIN : 143297 / 928391
Descrição : Inclusão de Grupo Mestre nos relatórios e gráficos
===============================================================================}

unit FCadSubGrpRelatoriosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, fcTreeView, Db, Wwquery;

type
  TfrmCadSubGrpRelatorios = class(TfrmOkCancelar)
    TreeReports: TfcTreeView;
    memGrupoRelatorio: TMemo;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure bbtnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TreeReportsDblClick(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure TreeReportsChange(TreeView: TfcCustomTreeView;
      Node: TfcTreeNode);
  private
    FResult: TModalResult;
    FIdGrupoMestre: Double;
    FDescricaoGrupoMestre: String;
    FIdGrupoRelatorio: Double;
    FOrigem: SmallInt;
    procedure SetIdGrupoMestre(const Value: Double);
    procedure SetDescricaoGrupoMestre(const Value: String);
    procedure MontaArvore;
    procedure SetIdGrupoRelatorio(const Value: Double);
    procedure InsereArvoreRecursiva (Pai : TfcTreeNode; idGrupoRelatorio : Double; Origem : SmallInt);
    procedure SetOrigem(const Value: SmallInt);
    { Private declarations }
  public
    { Public declarations }
    property Result: TModalResult read FResult;
    property IdGrupoRelatorio : Double read FIdGrupoRelatorio write SetIdGrupoRelatorio;
    property IdGrupoMestre : Double read FIdGrupoMestre write SetIdGrupoMestre;
    property DescricaoGrupoMestre : String read FDescricaoGrupoMestre write SetDescricaoGrupoMestre;
    property Origem : SmallInt read FOrigem write SetOrigem;
  end;


var
  frmCadSubGrpRelatorios: TfrmCadSubGrpRelatorios;

implementation

uses FTelaAut, FCadGrupoRelatorioMT;

{$R *.DFM}

procedure TfrmCadSubGrpRelatorios.bbtnConfirmarClick(Sender: TObject);
begin
  FResult := MB_OK;
  inherited;
end;

procedure TfrmCadSubGrpRelatorios.bbtnCancelarClick(Sender: TObject);
begin
  FResult := mrCancel;
  FIdGrupoMestre        := 0;
  FDescricaoGrupoMestre := '';
  FIdGrupoRelatorio     := 0;
  FOrigem               := 0;

  inherited;
end;

procedure TfrmCadSubGrpRelatorios.bbtnSairClick(Sender: TObject);
begin
  FIdGrupoMestre        := 0;
  FDescricaoGrupoMestre := '';
  FIdGrupoRelatorio     := 0;
  FOrigem               := 0;
  FResult := mrCancel;
  inherited;
end;

procedure TfrmCadSubGrpRelatorios.SetIdGrupoMestre(const Value: Double);
begin
  FIdGrupoMestre := Value;
end;

procedure TfrmCadSubGrpRelatorios.SetDescricaoGrupoMestre(
  const Value: String);
begin
  FDescricaoGrupoMestre := Value;
end;

procedure TfrmCadSubGrpRelatorios.SetIdGrupoRelatorio(const Value: Double);
begin
  FIdGrupoRelatorio := Value;
end;

procedure TfrmCadSubGrpRelatorios.MontaArvore;
var
  TreeGrupo, TreePai, TreeFilho: TfcTreeNode;
  qryGrupo, qryGrupoMestre, qryGrupoMestreFilho : TwwQuery;
  idGrupoRelatorio : Double;
  Sair : Boolean;
  a, x, y, z : Integer;
  GruposMestre : String;
Begin
  qryGrupo := TwwQuery.Create(Nil);
  qryGrupo.DataBaseName := 'BaseDados';

  qryGrupoMestre := TwwQuery.Create(Nil);
  qryGrupoMestre.DataBaseName := 'BaseDados';

  TreePai   := nil;
  TreeFilho := nil;
  TreeGrupo := nil;

  TreeReports.Items.Clear;

  try
    qryGrupo.Close;
    qryGrupo.Sql.Clear;
    qryGrupo.Sql.Add('SELECT');
    qryGrupo.Sql.Add('idgruporelatorio,');
    qryGrupo.Sql.Add('idgrupomestre,');
    qryGrupo.Sql.Add('descricao,');
    qryGrupo.Sql.Add('origemcmgr');
    qryGrupo.Sql.Add('  FROM GRUPORELATORIO');
    qryGrupo.Sql.Add(' WHERE ORIGEMCMGR IN (0, 1)');
    qryGrupo.Sql.Add('   AND idgrupomestre = 0');
    qryGrupo.Sql.Add(' ORDER BY descricao');
    qryGrupo.Open;

    while not qryGrupo.Eof do begin
      TreePai := TreeReports.Items.Add(nil,qryGrupo.FieldByName('descricao').AsString);
      TreePai.StringData  := qryGrupo.FieldByName('idgruporelatorio').AsString;
      TreePai.StringData2 := qryGrupo.FieldByName('idgrupomestre').AsString + ' / Origem: ' + Trim(qryGrupo.FieldByName('origemcmgr').AsString);

      Sair := False;
      x :=  0;
      y := -1;

      qryGrupoMestre.Close;
      qryGrupoMestre.Sql.Clear;
      qryGrupoMestre.Sql.Add('SELECT');
      qryGrupoMestre.Sql.Add('idgruporelatorio,');
      qryGrupoMestre.Sql.Add('idgrupomestre,');
      qryGrupoMestre.Sql.Add('descricao,');
      qryGrupoMestre.Sql.Add('origemcmgr');
      qryGrupoMestre.Sql.Add('  FROM GRUPORELATORIO');
      qryGrupoMestre.Sql.Add(' WHERE idgrupomestre = ' + IntToStr(qryGrupo.FieldByName('idgruporelatorio').AsInteger));
      qryGrupoMestre.Sql.Add(' AND ORIGEMCMGR = ' + qryGrupo.FieldByName('ORIGEMCMGR').AsString);
      qryGrupoMestre.Open;

      if not qryGrupoMestre.IsEmpty then begin
        while not qryGrupoMestre.Eof do begin
          TreeGrupo := TreeReports.Items.AddChild(TreePai,qryGrupoMestre.FieldByName('descricao').AsString);
          TreeGrupo.StringData  := qryGrupoMestre.FieldByName('idgruporelatorio').AsString;
          TreeGrupo.StringData2 := qryGrupoMestre.FieldByName('idgrupomestre').AsString  + ' / Origem: ' + Trim(qryGrupoMestre.FieldByName('origemcmgr').AsString);

          idGrupoRelatorio := qryGrupoMestre.FieldByName('idgruporelatorio').AsInteger;
          InsereArvoreRecursiva (TreeGrupo, qryGrupoMestre.FieldByName('idgruporelatorio').AsFloat, qryGrupoMestre.FieldByName('origemcmgr').AsInteger);
          qryGrupoMestre.Next;
        end;
      end;
      qryGrupo.Next;
    end;
  finally
    qryGrupo.Close;
    qryGrupoMestre.Close;

    FreeAndNil(qryGrupo);
    FreeAndNil(qryGrupoMestre);
  end;
end;

procedure TfrmCadSubGrpRelatorios.FormCreate(Sender: TObject);
begin
  inherited;
  MontaArvore;
end;

procedure TfrmCadSubGrpRelatorios.TreeReportsDblClick(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Close;
end;

procedure TfrmCadSubGrpRelatorios.TreeReportsChange(
  TreeView: TfcCustomTreeView; Node: TfcTreeNode);
begin
  inherited;
  FIdGrupoMestre        := StrToInt(Copy(Node.StringData2, 0, 1));
  FDescricaoGrupoMestre := TreeReports.Selected.Text;
  FIdGrupoRelatorio     := StrToInt(Node.StringData);
  FOrigem               := StrToInt(Copy(Node.StringData2, Length(Node.StringData2), 1));

  memGrupoRelatorio.Lines.Clear;

  memGrupoRelatorio.Lines.Add('Relatório. Nº ' + Node.Stringdata + ' - ' + Node.Stringdata2);
  memGrupoRelatorio.Lines.Add(TreeReports.Selected.Text);
end;

procedure TfrmCadSubGrpRelatorios.InsereArvoreRecursiva (Pai : TfcTreeNode; idGrupoRelatorio : Double; Origem : SmallInt);
var
  qryConsulta, qryInsere : TwwQuery;
  TreeFilho: TfcTreeNode;
begin
  qryConsulta := TwwQuery.Create(Self);
  qryConsulta.DataBaseName := 'BaseDados';

  try
    qryConsulta.Close;
    qryConsulta.Sql.Clear;
    qryConsulta.Sql.Add('SELECT');
    qryConsulta.Sql.Add('idgruporelatorio,');
    qryConsulta.Sql.Add('idgrupomestre,');
    qryConsulta.Sql.Add('descricao,');
    qryConsulta.Sql.Add('origemcmgr');
    qryConsulta.Sql.Add('  FROM GRUPORELATORIO');
    qryConsulta.Sql.Add(' WHERE idgrupomestre = ' + FloatToStr(idGrupoRelatorio));
    qryConsulta.Sql.Add('   AND ORIGEMCMGR    = ' + IntToStr(Origem));
    qryConsulta.Open;

    if not qryConsulta.IsEmpty then begin
      while not qryConsulta.Eof do begin
        TreeFilho := TreeReports.Items.AddChild(Pai,qryConsulta.FieldByName('descricao').AsString);
        TreeFilho.StringData  := qryConsulta.FieldByName('idgruporelatorio').AsString;
        TreeFilho.StringData2 := qryConsulta.FieldByName('idgrupomestre').AsString + ' / Origem: ' + Trim(qryConsulta.FieldByName('origemcmgr').AsString);

        InsereArvoreRecursiva (TreeFilho, qryConsulta.FieldByName('idgruporelatorio').AsFloat, qryConsulta.FieldByName('origemcmgr').AsInteger);
        qryConsulta.Next;
      end;
    end;
  finally
    qryConsulta.Close;
    FreeAndNil(qryConsulta);
  end;
end;

procedure TfrmCadSubGrpRelatorios.SetOrigem(const Value: SmallInt);
begin
  FOrigem := Value;
end;

end.

