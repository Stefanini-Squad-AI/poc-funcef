unit fCadHonorAdvog;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, FCadastroMT,
  wwdbedit, Wwdbspin, StdCtrls, Mask, DBCtrls, IvDictio, IvMulti, IvEMulti, MontaSelect,
  DBTables, Db, Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  CmEventosCadastro, ImgList, DBClient, uCMClientDataSet, uCtrlHonorAdvog,
  wwdbdatetimepicker, CMDateTimePicker, TREdit;

type
  TfrmCadHonorAdvog = class(TFrmCadastroMT)
    Label10: TLabel;
    dbspeQtdSt: TwwDBSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    dbedCodigo: TDBEdit;
    dbedValRec: TDBRealEdit;
    dtedDataReal: TCMDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroFind(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    CtrlHonorAdvog: TCtrlHonorAdvog;

    procedure Sel(IdHonorAdvog: double);
    function  GravarHonorAdvog: boolean;
  end;

var
  frmCadHonorAdvog: TfrmCadHonorAdvog;

implementation

uses uMensErro, uCtrlPadroes, uSistema, uCMTypes;

{$R *.DFM}

procedure TfrmCadHonorAdvog.FormCreate(Sender: TObject);
begin
  inherited;
  CtrlHonorAdvog := TCtrlHonorAdvog.Create;
  CtrlHonorAdvog.InitializeAs(Padroes);
  CtrlHonorAdvog.CdsHonorAdvog := Cds;

  Sel(-1);
end;

procedure TfrmCadHonorAdvog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(CtrlHonorAdvog);
  inherited;
end;

procedure TfrmCadHonorAdvog.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if (MontaSelect.RetornouValor) then
    Sel(StrToFloat(MontaSelect.ValoresChave[0]));
end;

procedure TfrmCadHonorAdvog.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
end;

procedure TfrmCadHonorAdvog.CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarHonorAdvog;
end;

procedure TfrmCadHonorAdvog.CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarHonorAdvog;
end;

procedure TfrmCadHonorAdvog.CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
begin
  inherited;
  Accept := GravarHonorAdvog;
end;

procedure TfrmCadHonorAdvog.CmeCadastroInsert(Sender: TObject);
begin
  Sel(-1);
  inherited;
end;

procedure TfrmCadHonorAdvog.bbtnConfirmarClick(Sender: TObject);
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

procedure TfrmCadHonorAdvog.Sel(IdHonorAdvog: double);
begin
  Cds.Data := CtrlHonorAdvog.ListHonorAdvog(IdHonorAdvog);
end;

function TfrmCadHonorAdvog.GravarHonorAdvog: boolean;
begin
  Result := CtrlHonorAdvog.GravarHonorAdvog;
  if not(Result) then
    raise Exception.Create(CtrlHonorAdvog.MessageInfo);
end;

end.
