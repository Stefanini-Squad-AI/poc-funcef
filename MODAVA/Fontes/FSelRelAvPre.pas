unit FSelRelAvPre;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCMParamRel, MAHlpBtn, StdCtrls, Buttons, ExtCtrls, wwdblook,
  Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, TB97,
  ComCtrls, TB97Tlbr, IvDictio, IvMulti, IvEMulti;
                          
type
  TfrmSelRelAvPre = class(TCMParamRel)
    qryPessoal: TwwQuery;
    ds: TwwDataSource;
    dsAval: TwwDataSource;
    qryAval: TwwQuery;
    TabSheet1: TTabSheet;
    wwDBGrid1: TwwDBGrid;
    Panel2: TPanel;
    gbxOrdem: TGroupBox;
    cmbOrderBy: TComboBox;
    gbxNome: TGroupBox;
    dblcNome: TwwDBLookupCombo;
    rgObserv: TRadioGroup;
    procedure FormCreate(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelRelAvPre: TfrmSelRelAvPre;

implementation

uses RAvPre, UsoGeralRH;

{$R *.DFM}

procedure TfrmSelRelAvPre.FormCreate(Sender: TObject);
begin
  inherited;
  qryPessoal.Close;
  qryPessoal.Sql.Clear;
  qryPessoal.Sql.Add('Select P.IDPESSOA, P.NOME ');
  qryPessoal.Sql.Add(' from PESSOA P, FUNCIONARIO F ');
  qryPessoal.Sql.Add(' where P.IDPESSOA = F.IDPESSOA ');
  if sUsuXccusto <> '' then
     qryPessoal.Sql.Add(' and F.CODCENTROCUSTO IN ' + sUsuXccusto);

  if sUsuXfilial <> '' then
     qryPessoal.Sql.Add(' and F.IDESTAB IN ' + sUsuXfilial);

  qryPessoal.Sql.Add(' order by upper(P.NOME)');
  qryPessoal.Open;
  dblcNome.SelText := qryPessoal.FieldByName('NOME').Value;
  cmbOrderBy.ItemIndex := 0;
end;

procedure TfrmSelRelAvPre.rbtnVisualizarClick(Sender: TObject);
begin
  inherited;
  relAvPre := TrelAvPre.Create(Self);
  relAvPre.qr.Preview;
  Self.WindowState := wsNormal;
  //relAvPre.Free;
end;

procedure TfrmSelRelAvPre.rbtnImprimirClick(Sender: TObject);
begin
  inherited;
  relAvPre := TrelAvPre.Create(Self);
  relAvPre.qr.Print;
  Self.WindowState := wsNormal;
  //relAvPre.Free;
end;


procedure TfrmSelRelAvPre.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if  Field = Nil  then  begin
   { Executa a query }
   qryAval.Close;
   qryAval.SQL.Clear;
   qryAval.SQL.Add('Select HSTAVAL.DATAPLAN, HSTAVAL.DATAREAL,');
   qryAval.SQL.Add('HSTAVAL.AVALIACAO, HSTAVAL.AVALIADOR, ');
   qryAval.SQL.Add('HSTAVAL.NUMSEQ, TIPOAVAL.CODTIPOAVAL, TIPOAVAL.DESCRTIPOAVAL ');
   qryAval.SQL.Add('from HSTAVAL, TIPOAVAL where HSTAVAL.IDPESSOA = ');
   qryAval.SQL.Add(qryPessoal.FieldByName('IDPESSOA').AsString);
   qryAval.SQL.Add(' and HSTAVAL.CODTIPOAVAL = TIPOAVAL.CODTIPOAVAL ');
   qryAval.SQL.Add(' and TIPOAVAL.FLGTIPOAVAL < 2');
   qryAval.SQL.Add(' order by DATAREAL desc');
   qryAval.Open;

   rbtnVisualizar.Enabled := not qryAval.Eof;
   rbtnImprimir.Enabled   := not qryAval.Eof;

   qryAval.FieldByName('DATAPLAN').DisplayLabel := 'Data Planejada';
   qryAval.FieldByName('DATAREAL').DisplayLabel := 'Data Real';
   qryAval.FieldByName('AVALIACAO').DisplayLabel := 'Avaliação';
   qryAval.FieldByName('AVALIADOR').DisplayLabel := 'Avaliador';
  end;
end;


end.
