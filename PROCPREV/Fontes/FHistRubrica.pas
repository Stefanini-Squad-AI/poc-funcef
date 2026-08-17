unit FHistRubrica;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fSairAjuda, Db, DBTables, Wwquery, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  StdCtrls, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, MontaSelect;

type
  TfrmHistRubrica = class(TfrmSairAjuda)
    pnlIdentificacao: TPanel;
    edNome: TEdit;
    edRubrica: TEdit;
    edParadigma: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    wwDBGrid1: TwwDBGrid;
    ds: TwwDataSource;
    qry: TwwQuery;
    bbtnBuscaParticipante: TBitBtn;
    MontaSelectPart: TMontaSelect;
    procedure bbtnBuscaParticipanteClick(Sender: TObject);
    procedure AtualizaQry;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHistRubrica: TfrmHistRubrica;
  RegParadigma: String;

implementation

uses FCadProcesso, uDataBase, dBaseDados;

{$R *.DFM}

procedure TfrmHistRubrica.bbtnBuscaParticipanteClick(Sender: TObject);
begin
  inherited;
  MontaSelectPart.Executar;
  if (MontaSelectPart.ValoresChave.Count > 0) and (MontaSelectPart.ValoresChave[0] <> '') then
  begin
     edParadigma.Text := MontaSelectPart.ValoresChave[3];
     RegParadigma     := MontaSelectPart.ValoresChave[0];
  end
  else
  begin
     edParadigma.Text := '';
     RegParadigma     := '-1';
  end;
  AtualizaQry;
end;

procedure TfrmHistRubrica.AtualizaQry;
begin
  qry.Close;
  qry.ParamByName('IDPESSOA').AsString :=  frmCadProcesso.qry.FieldByName('IDRECLAMANTE').AsString;
  qry.ParamByName('IDRUBRICA').AsInteger := frmCadProcesso.qryObjeto.FieldByName('IDPROVENTO').AsInteger;
  qry.ParamByName('IDPARADIGMA').AsString := RegParadigma;
  qry.Open;
end;

procedure TfrmHistRubrica.FormCreate(Sender: TObject);
begin
  inherited;
  edNome.Text    := frmCadProcesso.edNomeRequerente.Text;

  if FazQuery(DtmBaseDados.Qry,'SELECT DESCRICAO FROM PROVDESC WHERE IDPROVENTO = ' +
              frmCadProcesso.qryObjeto.FieldByName('IDPROVENTO').AsString)
  then
     edRubrica.Text := DtmBaseDados.Qry.FieldByName('DESCRICAO').AsString;

  RegParadigma   := '-1';
  AtualizaQry;
end;

end.
