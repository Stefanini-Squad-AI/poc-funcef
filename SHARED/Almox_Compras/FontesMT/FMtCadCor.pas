unit FMtCadCor;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, DBTables, Wwquery,uCtrlCor,
  FCadastroMT;

type
  TFrmMtCadCor = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodCor: TDBEdit;
    Label2: TLabel;
    dbedDescCor: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    Cor : TCtrlCor;
    Procedure Sel( s : String );
  public
    { Public declarations }
  end;

var
  FrmMtCadCor: TFrmMtCadCor;

implementation

{$R *.DFM}
Uses uMensErro,dBasedados, uSistema;


procedure TFrmMtCadCor.FormCreate(Sender: TObject);
begin
  inherited;
  Cor := TCtrlCor.Create;
  Cor.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Cor.cds := cds;
  sel('');
end;

procedure TFrmMtCadCor.Sel( s : String );
begin
  cds.Data := Cor.Procurar( s );
end;

procedure TFrmMtCadCor.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
    Sel(MontaSelect.ValoresChave[0]);
end;

procedure TFrmMtCadCor.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Cor.Free;
end;

procedure TFrmMtCadCor.CmeCadastroAfterConfirma(Sender: TObject);
begin
//  inherited;
    Sel(cds.FieldByName('CODCOR').AsString);
end;

procedure TFrmMtCadCor.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Cor.AplicaOperacao;
end;

procedure TFrmMtCadCor.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Cor.AplicaOperacao;
end;

procedure TFrmMtCadCor.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Cor.AplicaOperacao;
end;

procedure TFrmMtCadCor.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCodCor.Enabled := True;
  dbedCodCor.SetFocus;
end;

procedure TFrmMtCadCor.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedCodCor.Enabled := False;
  dbedDescCor.SetFocus;
end;

end.
