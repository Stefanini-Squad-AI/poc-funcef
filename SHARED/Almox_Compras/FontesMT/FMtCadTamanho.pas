unit FMtCadTamanho;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd,
  Wwdbgrid, ExtCtrls, Mask, DBCtrls, uCtrlTamanho, FCadastroMT, uCMTypes;

type
  TFrmMtCadTamanho = class(TFrmCadastroMT)
    Label1: TLabel;
    dbedCodTamanho: TDBEdit;
    Label2: TLabel;
    dbedDescTamanho: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
  private
    { Private declarations }
    Tamanho : TCtrlTamanho;
    Procedure Sel( s : String );
  public
    { Public declarations }

  end;

var
  FrmMtCadTamanho: TFrmMtCadTamanho;

implementation

{$R *.DFM}

Uses uMensErro,dBasedados, uSistema;

procedure TFrmMtCadTamanho.FormCreate(Sender: TObject);
begin
  inherited;
  Tamanho := TCtrlTamanho.Create;
  Tamanho.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Tamanho.cds := cds;
  Sel('');
end;

procedure TFrmMtCadTamanho.Sel( s : String );
begin
   cds.Data := Tamanho.Procurar( s );
end;

procedure TFrmMtCadTamanho.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  IF MontaSelect.RetornouValor Then
     Sel(MontaSelect.ValoresChave[0]);
end;

procedure TFrmMtCadTamanho.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Tamanho.Free;
end;

procedure TFrmMtCadTamanho.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := Tamanho.AplicaOperacao;
end;

procedure TFrmMtCadTamanho.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := Tamanho.AplicaOperacao;
end;

procedure TFrmMtCadTamanho.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := Tamanho.AplicaOperacao;
end;

procedure TFrmMtCadTamanho.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(Tamanho.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TFrmMtCadTamanho.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  Sel(cds.FieldByName('CODTAMANHO').AsString);
end;

procedure TFrmMtCadTamanho.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedCodTamanho.Enabled := True;
  dbedCodTamanho.SetFocus;
end;

procedure TFrmMtCadTamanho.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedCodTamanho.Enabled := False;
  dbedDescTamanho.SetFocus;
end;

end.
