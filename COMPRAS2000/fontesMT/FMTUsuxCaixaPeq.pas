unit FMTUsuxCaixaPeq;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlCaixaPequeno,
  Mask, wwdbedit, CMDBLookupCombo, DBCtrls, Wwdbspin ,uCMTypes, CMProcuraSubTipo,
  Grids, Wwdbigrd, Wwdbgrid;

type
  TfrmMTUsuxCaixaPeq = class(TFrmCadastroMT)
    cdsCaixasDisp: TCMClientDataSet;
    Label1: TLabel;
    EdUsu: TEdit;
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    grdTranf: TwwDBGrid;
    GrdTodos: TwwDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    dsCaixasDisp: TwwDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
  private
    { Private declarations }
    CaixaPequeno : TCtrlCaixaPequeno;
    Procedure Adiciona;
    Procedure Remove;
    Procedure Sel( n : Double );

  public
    { Public declarations }
  end;

var
  frmMTUsuxCaixaPeq: TfrmMTUsuxCaixaPeq;
  iIdUsuario      : Double;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmMTUsuxCaixaPeq.FormCreate(Sender: TObject);
begin
  inherited;
  CaixaPequeno := TCtrlCaixaPequeno.Create;
  CaixaPequeno.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  CaixaPequeno.CdsCaixaPequeno := cds;
  //
  Sel(-1);
  //
end;

procedure TfrmMTUsuxCaixaPeq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CaixaPequeno.Free;
end;

procedure TfrmMTUsuxCaixaPeq.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     Sel(StrToFloat(MontaSelect.ValoresChave[0]));
     EdUsu.Text := MontaSelect.ValoresChave[1];
  end;

end;

procedure TfrmMTUsuxCaixaPeq.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if CaixaPequeno.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ CaixaPequeno.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmMTUsuxCaixaPeq.CmeCadastroAfterConfirma(Sender: TObject);
begin
  //inherited;
  Sel(iIdUsuario);
end;

procedure TfrmMTUsuxCaixaPeq.Adiciona;
begin
   If Not cdsCaixasDisp.IsEmpty Then Begin
      With Cds Do Begin
         Append;
         FieldByName('IDUSUARIO').AsFloat        := iIdUsuario;
         FieldByName('IDCAIXAPEQUENO').AsFloat   := cdsCaixasDisp.FieldByName('IDCAIXAPEQUENO').AsFloat;
         FieldByName('DESCCAIXAPEQ').asString    := cdsCaixasDisp.FieldByName('DESCCAIXAPEQ').asString;
      End;
      cdsCaixasDisp.Delete;
   End;
end;

procedure TfrmMTUsuxCaixaPeq.Remove;
begin
   If Not cds.IsEmpty Then Begin
      With cdsCaixasDisp Do Begin
         Append;
         FieldByName('IDCAIXAPEQUENO').asInteger := cds.FieldByName('IDCAIXAPEQUENO').asInteger;
         FieldByName('DESCCAIXAPEQ').asString    := cds.FieldByName('DESCCAIXAPEQ').asString;
      End;
      cds.Delete;
   End;
end;

procedure TfrmMTUsuxCaixaPeq.Sel(n: Double);
begin
  iIdUsuario         := n;
  cds.Data           := CaixaPequeno.ListaCaixaPequeno(Sistema.idempresa,n,0,False);
  cdsCaixasDisp.Data := CaixaPequeno.ListaCaixaPequeno(Sistema.idempresa,n,0,True);
end;

procedure TfrmMTUsuxCaixaPeq.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  Adiciona;
end;

procedure TfrmMTUsuxCaixaPeq.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  Remove;
end;

procedure TfrmMTUsuxCaixaPeq.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  cdsCaixasDisp.First;
  While not cdsCaixasDisp.Eof do
     Adiciona;
end;

procedure TfrmMTUsuxCaixaPeq.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  cds.First;
  While not cds.Eof do
     Remove;
end;

procedure TfrmMTUsuxCaixaPeq.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  If Trim(edUsu.Text) = '' Then Begin
     MsgDlg('Não há Nenhum usuário selecionado','Atenção',mtWarning,[mbOk],0);
     bbtnCancelar.Click;
  End Else
     cds.Cancel;
end;

procedure TfrmMTUsuxCaixaPeq.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CaixaPequeno.AplicaOperacaoUsuxCxPeq;
end;

procedure TfrmMTUsuxCaixaPeq.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  sbtnAlterar.Enabled := True;
end;

end.
