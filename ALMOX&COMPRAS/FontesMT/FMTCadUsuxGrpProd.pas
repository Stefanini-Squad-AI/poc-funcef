unit FMTCadUsuxGrpProd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, uCtrlGrupoProd, uCmTypes;

type
  TFrmMTCadUsuxGrpProd = class(TFrmCadastroMT)
    EdUsu: TEdit;
    Label1: TLabel;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    dsGrpProd: TwwDataSource;
    cdsGrpProd: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    iIdUsuario : Integer;
    GrupoProd  : TCtrlGrupoProd;
    Procedure Sel( n : Integer ); 
  public
    { Public declarations }
  end;

var
  FrmMTCadUsuxGrpProd: TFrmMTCadUsuxGrpProd;

implementation

{$R *.DFM}
Uses uSistema, uMensErro, dBaseDados;

procedure TFrmMTCadUsuxGrpProd.FormCreate(Sender: TObject);
begin
  inherited;
  GrupoProd := TCtrlGrupoProd.Create;
  GrupoProd.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,Sistema.AppRemoteServer,True);
  GrupoProd.Cds := Cds;

  Sel(-1 );
  edUsu.Clear;
end;

procedure TFrmMTCadUsuxGrpProd.Sel( n : Integer);
begin
   iIdUsuario := n;

   cds.Data        := GrupoProd.ListGrupoAtribUsu(n,Sistema.IdEmpresa);
   cdsGrpProd.Data := GrupoProd.ListGrupoNaoAtribUsu(n,Sistema.IdEmpresa);
end;

procedure TFrmMTCadUsuxGrpProd.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsGrpProd.First;
  While Not cdsGrpProd.Eof Do
     btnAdiciona.Click;

end;

procedure TFrmMTCadUsuxGrpProd.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.Down Then
    Begin
       If Not cdsGrpProd.IsEmpty Then
         Begin
            With cds Do
               Begin
                 Append;
                 FieldByName('IDUSUARIO').asInteger    := iIdUsuario;
                 FieldByName('IDPESSOA').asInteger     := Sistema.IdEmpresa;
                 FieldByName('CODGRUPOPROD').asString  := cdsGrpProd.FieldByName('CODGRUPOPROD').asString;
                 FieldByName('DESCGRUPOPROD').asString := cdsGrpProd.FieldByName('DESCGRUPOPROD').asString;
                End;
            cdsGrpProd.Delete;
         End;
    End;

end;

procedure TFrmMTCadUsuxGrpProd.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  If sbtnInserir.Down Then
    Begin
      If Not cds.IsEmpty Then
       Begin
          With cdsGrpProd Do
             Begin
               Append;
               FieldByName('CODGRUPOPROD').asString  := cds.FieldByName('CODGRUPOPROD').asString;
               FieldByName('DESCGRUPOPROD').asString := cds.FieldByName('DESCGRUPOPROD').asString;
             End;
          cds.Delete;
       End;
    End;

end;

procedure TFrmMTCadUsuxGrpProd.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;
  While Not cds.Eof Do
     btnRemove.Click;

end;

procedure TFrmMTCadUsuxGrpProd.CmeCadastroInsert(Sender: TObject);
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

procedure TFrmMTCadUsuxGrpProd.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
      Begin
         Sel(StrToInt(MontaSelect.ValoresChave[0]) );
         edUsu.Text := MontaSelect.ValoresChave[1];
      End;
end;

procedure TFrmMTCadUsuxGrpProd.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GrupoProd.AtribuiUsuxGrupo;
end;

procedure TFrmMTCadUsuxGrpProd.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GrupoProd.AtribuiUsuxGrupo;
end;

procedure TFrmMTCadUsuxGrpProd.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := GrupoProd.AtribuiUsuxGrupo;
end;

procedure TFrmMTCadUsuxGrpProd.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  MsgDlg(GrupoProd.MessageInfo,'Erro',mtError,[mbOk],0);
end;

procedure TFrmMTCadUsuxGrpProd.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Sel( iIdUsuario );
end;

end.
