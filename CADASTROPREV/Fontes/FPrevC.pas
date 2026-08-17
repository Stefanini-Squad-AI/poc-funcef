unit FPrevC;

{-------------------------------------------------------------------------------
Nº SOL.....: 207951/18304
Data       : 15/07/2016
Responsável: Felipe Azevedo dos Santos
Descrição..: Criação da funcionalidaded.
-------------------------------------------------------------------------------}

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, Wwdatsrc,
  DBTables, Wwquery, MontaSelect;

type
  TfrmPrevC = class(TfrmSairAjuda)
    pnlTopo: TPanel;
    dbgrdPrevC: TwwDBGrid;
    edtMatricula: TEdit;
    edtNome: TEdit;
    lblMatricula: TLabel;
    lblNome: TLabel;
    qry: TwwQuery;
    ds: TwwDataSource;
    btnProcurar: TBitBtn;
    MontaEmpregados: TMontaSelect;
    procedure btnProcurarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrevC: TfrmPrevC;

implementation

{$R *.DFM}

procedure TfrmPrevC.btnProcurarClick(Sender: TObject);
begin
  inherited;
  MontaEmpregados.Executar;

  if (MontaEmpregados.RetornouValor) then
  begin
     edtMatricula.Text := MontaEmpregados.ValoresChave[1];
     edtNome.Text := MontaEmpregados.ValoresChave[2];

     qry.Close;
     qry.ParamByName('IDPESSOA').AsString := MontaEmpregados.ValoresChave[0];
     qry.Open;
  end;
end;

procedure TfrmPrevC.FormCreate(Sender: TObject);
begin
  inherited;
  
  qry.Close;
  qry.ParamByName('IDPESSOA').AsInteger := -1;
  qry.Open;
end;

end.
