unit FMTCadUsuxAlmox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, Grids, Wwdbigrd, Wwdbgrid, Buttons, MontaSelect,
  Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList, Wwdatsrc,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, TB97Tlbr, TB97Ctls, TB97, ExtCtrls,
  uCtrlAlmox, uCmTypes;

type
  TFrmMTCadUsuxAlmox = class(TFrmCadastroMT)
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    EdUsu: TEdit;
    Label1: TLabel;
    dsAlmox: TwwDataSource;
    cdsAlmox: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
  private
    { Private declarations }
    Almox : TCtrlAlmox;
    
    Procedure Sel( n : Double );
  public
    { Public declarations }
  end;

var
  FrmMTCadUsuxAlmox: TFrmMTCadUsuxAlmox;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, dBaseDados;

procedure TFrmMTCadUsuxAlmox.FormCreate(Sender: TObject);
begin
  inherited;
  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Almox.CdsAlmox := Cds;

  Sel(-1 );
  edUsu.Clear;
end;

procedure TFrmMTCadUsuxAlmox.Sel( n : Double );
begin
 cds.Data := Almox.ListAlmoxAtrib( n ,Sistema.IdEmpresa);
 cdsAlmox.Data := Almox.ListAlmoxNaoAtrib( n, Sistema.IdEmpresa);

end;

procedure TFrmMTCadUsuxAlmox.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
      Begin
         Sel(StrToInt(MontaSelect.ValoresChave[0]) );
         edUsu.Text := MontaSelect.ValoresChave[1];
      End;
end;

procedure TFrmMTCadUsuxAlmox.CmeCadastroInsert(Sender: TObject);
begin
   CmeCadastro.RepetirInsert := False;
   Inherited;
   If Trim(edUsu.Text) = '' Then
     Begin
         MsgDlg('Não há Nenhum usuário selecionado','Atenção',mtWarning,[mbOk],0);
         bbtnCancelar.Click;
     End
   Else
     cds.Cancel;
end;

procedure TFrmMTCadUsuxAlmox.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.down Then
    Begin
       If Not cdsAlmox.IsEmpty Then
         Begin
            With cds Do
               Begin
                 Append;
                 FieldByName('IDUSUARIO').asFloat         := StrToFloat(MontaSelect.ValoresChave[0]);
                 FieldByName('IDPESSOA').asInteger        := Sistema.IdEmpresa;
                 FieldByName('CODALMOXARIFADO').asInteger := cdsAlmox.FieldByName('CODALMOXARIFADO').asInteger;
                 FieldByName('DESCALMOX').asString        := cdsAlmox.FieldByName('DESCALMOX').asString;
                 Post;
                End;
            cdsAlmox.Delete;
         End;
    End;
end;

procedure TFrmMTCadUsuxAlmox.BtnRemoveClick(Sender: TObject);
begin
  inherited;
 If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
      If Not cds.IsEmpty Then
       Begin
          With cdsAlmox Do
             Begin
               Append;
               FieldByName('CODALMOXARIFADO').asInteger := cds.FieldByName('CODALMOXARIFADO').asInteger;
               FieldByName('DESCALMOX').asString        := cds.FieldByName('DESCALMOX').asString;
               Post;
             End;
          cds.Delete;
       End;
    End;
end;

procedure TFrmMTCadUsuxAlmox.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsAlmox.First;
  While Not cdsAlmox.Eof Do
    btnAdiciona.Click;
end;

procedure TFrmMTCadUsuxAlmox.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;
  While Not cds.Eof Do
    btnRemove.Click;
end;

procedure TFrmMTCadUsuxAlmox.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(Almox.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmMTCadUsuxAlmox.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Almox.AtribuirAlmoxarifado;
end;

procedure TFrmMTCadUsuxAlmox.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Almox.AtribuirAlmoxarifado;
end;

end.
