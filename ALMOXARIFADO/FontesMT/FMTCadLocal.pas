unit FMTCadLocal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Mask,
  DBCtrls,uCmTypes, uCtrlLocalizacao;

type
  TFrmMTCadLocal = class(TFrmCadastroMT)
    Label3: TLabel;
    edAlmox: TEdit;
    Label1: TLabel;
    edCodArtigo: TEdit;
    edDescArtigo: TEdit;
    Label2: TLabel;
    Label4: TLabel;
    edLoc: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    Localizacao : TCtrlLocalizacao;
    //
    Procedure Sel( CodArtigo : String );
  public
    { Public declarations }
  end;

var
  FrmMTCadLocal: TFrmMTCadLocal;

implementation

{$R *.DFM}

Uses uMensErro, DBaseDados, uSistema, uModulo;

procedure TFrmMTCadLocal.FormCreate(Sender: TObject);
begin
  inherited;
  EdAlmox.Text := Modulo.sAlmoxaUsuario;

  Localizacao := TCtrlLocalizacao.Create;
  Localizacao.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Localizacao.cds := cds;

  MontaSelect.Filtro.Add('SALDO.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa) );
  MontaSelect.Filtro.Add('SALDO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa) );

  Sel('');
end;

procedure TFrmMTCadLocal.Sel(CodArtigo: String);
begin
  cds.Data := Localizacao.GetLocalizacao ( Sistema.IdEmpresa,
                                           Modulo.iCodAlmoxa,
                                           CodArtigo);

  If Trim(CodArtigo) <> '' Then
     Begin
        edCodArtigo.Text  := MontaSelect.ValoresChave[0];
        edDescArtigo.Text := MontaSelect.ValoresChave[1];
     End;
end;

procedure TFrmMTCadLocal.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edLoc.SetFocus;
end;

procedure TFrmMTCadLocal.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
      Sel( MontaSelect.ValoresChave[0] );
end;

procedure TFrmMTCadLocal.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Localizacao.Gravar;
end;

procedure TFrmMTCadLocal.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(Localizacao.MessageInfo,'Erro',mtError,[mbOk],0);
end;

end.
