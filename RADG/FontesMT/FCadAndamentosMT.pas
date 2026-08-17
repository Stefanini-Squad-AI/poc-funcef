unit FCadAndamentosMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlAndamentos, Mask, wwdbedit,uCMTypes;

type
  TfrmCadAndamentosMT = class(TFrmCadastroMT)
    lblNome: TLabel;
    dbedNome: TwwDBEdit;
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    _Andamentos : TCtrlAndamentos;
  public
    { Public declarations }
  end;

var
  frmCadAndamentosMT: TfrmCadAndamentosMT;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmCadAndamentosMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if trim(dbedNome.Text)='' then begin
     MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOk],0);
     dbedNome.SetFocus;
     exit;
  end;
  Accept := True;
end;

procedure TfrmCadAndamentosMT.FormCreate(Sender: TObject);
begin
  inherited;
  _Andamentos := TCtrlAndamentos.Create;
  _Andamentos.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _Andamentos.CdsRadAndamento := cds;
  
  cds.Data := _Andamentos.Procurar(-1);
  
end;

procedure TfrmCadAndamentosMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _Andamentos.Free;
end;

procedure TfrmCadAndamentosMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  dbedNome.SetFocus;
end;

procedure TfrmCadAndamentosMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedNome.SetFocus;
end;

procedure TfrmCadAndamentosMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := _Andamentos.Procurar(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;

end;

procedure TfrmCadAndamentosMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _Andamentos.AplicaOperacao(opApagar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadAndamentosMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _Andamentos.AplicaOperacao(opAlterar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadAndamentosMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _Andamentos.AplicaOperacao(opInserir,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadAndamentosMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _Andamentos.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _Andamentos.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadAndamentosMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  cds.Data := _Andamentos.Procurar(cds.FieldByName('IDANDAMENTO').AsFloat);
end;

end.
