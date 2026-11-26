unit FCadUFINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, CmEventosCadastro, ImgList, Db, Wwdatsrc, MontaSelect,
  DBTables, IvDictio, IvMulti, IvEMulti, Wwquery, MAHlpBtn, StdCtrls,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBCtrls, Mask, UDataBase, wwdbedit;

type
  TfrmCadUFINSS = class(TFrmCadastroGridCS)
    qryEstado: TQuery;
    dbcmbEstado: TDBLookupComboBox;
    dsEstado: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    dbcmbEstadoCentral: TDBLookupComboBox;
    Label3: TLabel;
    Label4: TLabel;
    qrySIGLA: TStringField;
    qryCODORGAOLOCAL: TStringField;
    qrySINONIMO: TStringField;
    qrySIGLACENTRAL: TStringField;
    qryUFLOCAL: TStringField;
    qryUFCENTRAL: TStringField;
    wwDBEdit1: TwwDBEdit;
    wwDBEdit2: TwwDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadUFINSS: TfrmCadUFINSS;

implementation

{$R *.DFM}

procedure TfrmCadUFINSS.FormCreate(Sender: TObject);
begin
  inherited;
  qryEstado.Open;
end;

procedure TfrmCadUFINSS.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
//
end;

procedure TfrmCadUFINSS.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  // Críticas.

  AplicaAlteracoes([qry]);

  // atualiza a grid.
  qry.Close;
  qry.Open;
end;

procedure TfrmCadUFINSS.CmeCadastroFind(Sender: TObject);
var
  varFields : variant;
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    varFields := VarArrayCreate([0,2],varVariant);
    varFields[0] := MontaSelect.ValoresChave[0];
    varFields[1] := MontaSelect.ValoresChave[1];
    varFields[2] := MontaSelect.ValoresChave[2];

    qry.Locate('SIGLA;CODORGAOLOCAL;SINONIMO',varFields,[loCaseInsensitive])
  End;
end;



end.