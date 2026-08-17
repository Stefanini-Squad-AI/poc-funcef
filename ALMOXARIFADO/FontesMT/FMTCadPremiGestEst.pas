unit FMTCadPremiGestEst;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlPremiGestEstoque, TREdit, uCmTypes;

type
  TFrmMTCadPremiGestEst = class(TFrmCadastroMT)
    Label3: TLabel;
    edAlmox: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    edTmpRessupMed: TDBRealEdit;
    edQtdeMin: TDBRealEdit;
    edPontoRepos: TDBRealEdit;
    edConsMed: TDBRealEdit;
    edQtdeMax: TDBRealEdit;
    edIntervalRessup: TDBRealEdit;
    edCodArtigo: TEdit;
    Bevel1: TBevel;
    edDescArtigo: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
  private
    { Private declarations }
    PremiGestEstoque : TCtrlPremiGestEstoque;
    //
    Procedure Sel( CodArtigo : String );
  public
    { Public declarations }
  end;

var
  FrmMTCadPremiGestEst: TFrmMTCadPremiGestEst;

implementation

{$R *.DFM}
Uses  DBaseDados, uSistema, uModulo, uMensErro;

procedure TFrmMTCadPremiGestEst.FormCreate(Sender: TObject);
begin
  inherited;
  PremiGestEstoque := TCtrlPremiGestEstoque.Create;
  PremiGestEstoque.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  PremiGestEstoque.cds := cds;

  EdAlmox.Text := Modulo.sAlmoxaUsuario;

  MontaSelect.Filtro.Add('SALDO.CODALMOXARIFADO = '+IntToStr(Modulo.iCodAlmoxa) );
  MontaSelect.Filtro.Add('SALDO.IDPESSOA = '+IntToStr(Sistema.IdEmpresa) );

  Sel('');
end;

procedure TFrmMTCadPremiGestEst.Sel(CodArtigo: String);
begin
  cds.Data := PremiGestEstoque.GetPremiGestEstoque(Sistema.IdEmpresa,
                                                    Modulo.iCodAlmoxa,
                                                    CodArtigo);

  If Trim(CodArtigo) <> '' Then
     Begin
        edCodArtigo.Text  := MontaSelect.ValoresChave[0];
        edDescArtigo.Text := MontaSelect.ValoresChave[1];
     End;
end;

procedure TFrmMTCadPremiGestEst.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
   edTmpRessupMed.SetFocus;
end;

procedure TFrmMTCadPremiGestEst.CmeCadastroFind(Sender: TObject);
begin
  inherited;
   If MontaSelect.RetornouValor Then
      Sel( MontaSelect.ValoresChave[0] );
end;

procedure TFrmMTCadPremiGestEst.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := PremiGestEstoque.Gravar; 
end;

procedure TFrmMTCadPremiGestEst.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(PremiGestEstoque.MessageInfo,'Erro',mtError,[mbOk],0);
end;

end.
