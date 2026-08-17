unit FMTCadTipoPerda;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, uCtrlTipoPerda, uCmTypes;

type
  TFrmMTCadTipoPerda = class(TFrmCadastroMT)
    LbDesc: TLabel;
    edDesc: TDBEdit;
    chkConsumo: TDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    TipoPerda : TCtrlTipoPerda;
    Procedure Sel( n : Double);
  public
    { Public declarations }
  end;

var
  FrmMTCadTipoPerda: TFrmMTCadTipoPerda;

implementation

{$R *.DFM}

{ TFrmMTCadTipoPerda }

Uses uSistema,DBaseDados, uMensErro;

procedure TFrmMTCadTipoPerda.Sel(n: Double);
begin
   cds.data := TipoPerda.GetTipoPerda(n);
end;

procedure TFrmMTCadTipoPerda.FormCreate(Sender: TObject);
begin
  inherited;
  TipoPerda := TCtrlTipoPerda.Create;
  TipoPerda.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  TipoPerda.cds := cds;
  Sel(-1);
end;

procedure TFrmMTCadTipoPerda.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  EdDesc.SetFocus;
  cds.FieldByName('CONSUMO').AsString := 'S';
end;

procedure TFrmMTCadTipoPerda.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  EdDesc.SetFocus;
end;

procedure TFrmMTCadTipoPerda.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
     Sel( StrToInt(MontaSelect.ValoresChave[0]) );
end;

procedure TFrmMTCadTipoPerda.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoPerda.AplicaOperacao;
end;

procedure TFrmMTCadTipoPerda.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoPerda.AplicaOperacao;
end;

procedure TFrmMTCadTipoPerda.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := TipoPerda.AplicaOperacao;
end;

procedure TFrmMTCadTipoPerda.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
 MsgDlg(TipoPerda.MessageInfo,'Erro',mtError,[mbOk],0);
end;

end.
