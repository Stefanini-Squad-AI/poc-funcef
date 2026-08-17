unit fCadLinha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, TREdit, DBCtrls, wwdblook, Mask,
  CmEventosCadastro, ImgList;

type
  TfrmCadLinha = class(TFrmCadastroGridCS)
    Label1: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    qryEmprTransp: TwwQuery;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    dblcEmpre: TwwDBLookupCombo;
    DBComboBox1: TDBComboBox;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBRealEdit1: TDBRealEdit;
    qryIDLINHATRANSP: TFloatField;
    qryIDPESSOA: TFloatField;
    qryNUMLINHATRANSP: TStringField;
    qryVLRLINHATRANSP: TFloatField;
    qryDESCRICAO: TStringField;
    qryTIPOLINHATRANSP: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    Procedure CmeCadastroFind(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  frmCadLinha: TfrmCadLinha;

implementation

{$R *.DFM}

procedure TfrmCadLinha.FormCreate(Sender: TObject);
begin
  qry.Open;
  qryEmprTransp.Open;
  inherited;
end;

procedure TfrmCadLinha.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qry.Close;
  qryEmprTransp.Close;
  inherited;
end;

procedure TfrmCadLinha.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
    qry.Locate ('IDLINHATRANSP', MontaSelect.ValoresChave[0], []);
end;

end.
