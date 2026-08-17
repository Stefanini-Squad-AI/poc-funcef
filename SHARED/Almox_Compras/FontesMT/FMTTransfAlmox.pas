unit FMTTransfAlmox;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, uCtrlAlmox, uCmTypes;

type
  TFrmMTTransfAlmox = class(TFrmCadastroMT)
    edAlmox: TEdit;
    Label1: TLabel;
    plnTransf: TPanel;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    BtnAdicionaTudo: TSpeedButton;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    dsAlmox: TwwDataSource;
    cdsAlmox: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
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
    Procedure Sel( n : Integer );
  public
    { Public declarations }
  end;

var
  FrmMTTransfAlmox: TFrmMTTransfAlmox;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, dBaseDados;

procedure TFrmMTTransfAlmox.FormCreate(Sender: TObject);
begin
  inherited;
  Almox := TCtrlAlmox.Create;
  Almox.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  Almox.cdsAlmox := cds;

  Sel(-1);
  MontaSelect.Filtro.Add('ALMOX.IDPESSOA = '+IntToStr(Sistema.IdEmpresa));
end;

procedure TFrmMTTransfAlmox.Sel(n: Integer);
begin

   cds.Data := Almox.ListAlmoxAtrib( n );
   cdsAlmox.Data := Almox.ListAlmoxNaoAtrib( n, Sistema.IdEmpresa);
end;

procedure TFrmMTTransfAlmox.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CmeCadastro.RepetirInsert := False;
  Inherited;
  If Trim(edAlmox.Text) = '' Then
    Begin
       MsgDlg('Não há Nenhum Almoxarifado selecionado','Atenção',mtWarning,[mbOk],0);
       bbtnCancelar.Click;
    End
  Else
    cds.Cancel;

end;

procedure TFrmMTTransfAlmox.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
      Begin
         Sel(StrToInt(MontaSelect.ValoresChave[0]) );
         edAlmox.Text := MontaSelect.ValoresChave[1];
      End;
end;

procedure TFrmMTTransfAlmox.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.Down Then
    Begin
       If Not cdsAlmox.IsEmpty Then
         Begin
            With cds Do
               Begin
                 Append;
                 FieldByName('CODALMOXARIFADO').asInteger := StrToIntDef(MontaSelect.ValoresChave[0],-1);
                 FieldByName('CODALMOXPERMITE').asInteger := cdsAlmox.FieldByName('CODALMOXARIFADO').asInteger;
                 FieldByName('DESCALMOX').asString        := cdsAlmox.FieldByName('DESCALMOX').asString;
                End;
            cdsAlmox.Delete;
         End;
    End;

end;

procedure TFrmMTTransfAlmox.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If CmeCadastro.Operacao in [opInserir,opAlterar] Then
    Begin
      If Not cds.IsEmpty Then
       Begin
          With cdsAlmox Do
             Begin
               Append;
               FieldByName('CODALMOXARIFADO').asInteger := cds.FieldByName('CODALMOXPERMITE').asInteger;
               FieldByName('DESCALMOX').asString        := cds.FieldByName('DESCALMOX').asString;
             End;
          cds.Delete;
       End;
    End;
end;

procedure TFrmMTTransfAlmox.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsAlmox.First;
  While Not cdsAlmox.Eof Do
     btnAdiciona.Click;

end;

procedure TFrmMTTransfAlmox.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;
  While Not cds.Eof Do
     btnRemove.Click;

end;

procedure TFrmMTTransfAlmox.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(Almox.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmMTTransfAlmox.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Almox.AssociaAlmoxTransf;
end;

procedure TFrmMTTransfAlmox.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := Almox.AssociaAlmoxTransf;
end;

end.


