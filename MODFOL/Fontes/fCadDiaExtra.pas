unit fCadDiaExtra;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, Mask, wwdblook,
  wwdbdatetimepicker, CMDateTimePicker, CmEventosCadastro, ImgList;

type
  TfrmCadDiaExtra = class(TFrmCadastroGridCS)
    lblNome: TLabel;
    dblcFunc: TwwDBLookupCombo;
    lblDataExtra: TLabel;
    dbdeDataExtra: TCMDateTimePicker;
    qryFunc: TwwQuery;
    procedure FormCreate(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure dblcFuncCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
  private
//    OldFieldName: string;

  public
    { Public declarations }
  end;

var
  frmCadDiaExtra: TfrmCadDiaExtra;

implementation

uses uMensErro, uDataBase, UsoGeralRH;

{$R *.DFM}

procedure TfrmCadDiaExtra.FormCreate(Sender: TObject);
begin
  inherited;
  MontaSelect.Filtro.Clear;

  // Estabelecimento(s) habilitados para o usuário
  if (sUsuXfilial <> '') then
  begin
    MontaSelect.Filtro.Add ('FUNCIONARIO.IDESTAB IN ' +sUsuXfilial);
    qry.SQL[7]     := '  (F.IDESTAB IN ' +sUsuXfilial+ ') AND';
    qryFunc.SQL[5] := '  (F.IDESTAB IN ' +sUsuXfilial+ ') AND';
  end;

  // C. de Custo(s) habilitado(s) para o usuário
  if (sUsuXccusto <> '') then
  begin
    MontaSelect.Filtro.Add ('FUNCIONARIO.CODCENTROCUSTO IN ' +sUsuXccusto);
    qry.SQL[8]     := '  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND';
    qryFunc.SQL[6] := '  (F.CODCENTROCUSTO IN ' +sUsuXccusto+ ') AND';
  end;

  with (MontaSelect.Filtro) do
  begin
    Add ('DIAEXTRATRAB.IDPESSOA = FUNCIONARIO.IDPESSOA');
    Add ('DIAEXTRATRAB.IDPESSOA = PESSOA.IDPESSOA');
    Add ('FUNCIONARIO.IDPESSOA  = PESSOA.IDPESSOA');
  end;

//  OldFieldName := qry.SQL[qry.SQL.Count-1];
  qry.Open;
  qryFunc.Open;
end;

procedure TfrmCadDiaExtra.dbGrdTitleButtonClick(Sender: TObject; AFieldName: String);
{const
  CAMPOS: array[1..3] of string = ('MATRICULA','NOME','DIATRAB');
var
  sAuxDESC: string;}
begin
  inherited;
{  dbGrd.SelectRecord.asString
  CAMPOS
  if (OldFieldName = AFieldName) then
    sAuxDESC := ' DESC'
  else
    sAuxDESC := '';

  qry.Close;
  qry.SQL[qry.SQL.Count-1] := AFieldName + sAuxDESC;
  qry.Open;
  dbGrd.RedrawGrid;

  OldFieldName := AFieldName + sAuxDESC;}
end;

procedure TfrmCadDiaExtra.dblcFuncCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qry.FieldByName('NOME').asString      := dblcFunc.Text;
  qry.FieldByName('MATRICULA').asString := qryFunc.FieldByName('MATRICULA').asString;
end;

procedure TfrmCadDiaExtra.sbtnProcurarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TfrmCadDiaExtra.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDPESSOA;DIATRAB',
      VarArrayOf([MontaSelect.ValoresChave[0],MontaSelect.ValoresChave[1]]), []);
end;

procedure TfrmCadDiaExtra.CmeCadastroConfirma(Sender: TObject);
begin
  try
    AplicaAlteracoes([qry]);
  except
    raise;
  end;
  inherited;
end;

end.
