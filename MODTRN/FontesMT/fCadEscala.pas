unit fCadEscala;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CmEventosCadastro, ImgList, DBClient, uCMClientDataSet, uCtrlEscalaConceitos;

type
  TfrmCadEscala = class(TFrmCadastroMT)
    Label10: TLabel;
    dbspeQtdSt: TwwDBSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    dbedConceito1: TDBEdit;
    dbedConceito2: TDBEdit;
    dbedConceito3: TDBEdit;
    dbedConceito4: TDBEdit;
    dbedConceito5: TDBEdit;
    dbedConceito6: TDBEdit;
    Label7: TLabel;
    dbedCodigo: TDBEdit;
    Image1: TImage;
    Label8: TLabel;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure dbspeQtdStChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlEscalaConceitos: TCtrlEscalaConceitos;

    procedure Sel(IdEscala: double);
    function  GravarRegistro: boolean;
  end;

var
  frmCadEscala: TfrmCadEscala;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmCadEscala.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlEscalaConceitos := TCtrlEscalaConceitos.Create;
  CtrlEscalaConceitos.InitializeAs(Padroes);
  CtrlEscalaConceitos.Cds := Cds;

  Sel(-1);
end;

procedure TfrmCadEscala.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlEscalaConceitos);
  inherited;
end;

procedure TfrmCadEscala.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadEscala.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadEscala.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadEscala.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadEscala.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarRegistro;
end;

procedure TfrmCadEscala.dbspeQtdStChange(Sender: TObject);
begin
  Label1.Visible  := (dbspeQtdSt.Value >= 1);
  dbedConceito1.Visible := (dbspeQtdSt.Value >= 1);
  Label2.Visible  := (dbspeQtdSt.Value >= 2);
  dbedConceito2.Visible := (dbspeQtdSt.Value >= 2);
  Label3.Visible  := (dbspeQtdSt.Value >= 3);
  dbedConceito3.Visible := (dbspeQtdSt.Value >= 3);
  Label4.Visible  := (dbspeQtdSt.Value >= 4);
  dbedConceito4.Visible := (dbspeQtdSt.Value >= 4);
  Label5.Visible  := (dbspeQtdSt.Value >= 5);
  dbedConceito5.Visible := (dbspeQtdSt.Value >= 5);
  Label6.Visible  := (dbspeQtdSt.Value >= 6);
  dbedConceito6.Visible := (dbspeQtdSt.Value >= 6);
end;

procedure TfrmCadEscala.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
  Cds.FieldByName('QTDECONCEITOS').asInteger := 6;
end;

procedure TfrmCadEscala.bbtnConfirmarClick(Sender: TObject);
var
  bInserindo: boolean;
begin
  bInserindo := (Cds.State = dsInsert);
  inherited;
  if not(bInserindo) then
    CmeCadastroFind(Sender);
end;

// ----------------------------------------------------------------------------------------
// Funções do Form
// ----------------------------------------------------------------------------------------

procedure TfrmCadEscala.Sel(IdEscala: double);
begin
  Cds.Data := CtrlEscalaConceitos.ListGeral(IdEscala);
  if (IdEscala = -1) then
    dbspeQtdSt.Value := 6;
end;

function TfrmCadEscala.GravarRegistro: boolean;
begin
  Result := CtrlEscalaConceitos.Gravar;
  if not(Result) then
    raise Exception.Create(CtrlEscalaConceitos.MessageInfo);
end;

end.
