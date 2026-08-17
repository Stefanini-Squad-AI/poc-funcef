unit FCadGrpProcessoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlGrpProcesso, Mask, wwdbedit,uCMTypes, DBCtrls;

type
  TfrmCadGrpProcessoMT = class(TFrmCadastroMT)
    Label1: TLabel;
    edDesc: TDBEdit;
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
    _GrpProcesso : TCtrlGrpProcesso;
  public
    { Public declarations }
  end;

var
  frmCadGrpProcessoMT: TfrmCadGrpProcessoMT;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmCadGrpProcessoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if trim(edDesc.Text)='' then begin
     MsgDlg('Obrigatório preencher a Descrição','Erro',mtError,[mbOk],0);
     edDesc.SetFocus;
     exit;
  end;
  Accept := True;
end;

procedure TfrmCadGrpProcessoMT.FormCreate(Sender: TObject);
begin
  inherited;
  _GrpProcesso := TCtrlGrpProcesso.Create;
  _GrpProcesso.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _GrpProcesso.CdsRadGrupoProcesso := cds;
  
  cds.Data := _GrpProcesso.Procurar(-1);
  
end;

procedure TfrmCadGrpProcessoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _GrpProcesso.Free;
end;

procedure TfrmCadGrpProcessoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
end;

procedure TfrmCadGrpProcessoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  edDesc.SetFocus;
end;

procedure TfrmCadGrpProcessoMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := _GrpProcesso.Procurar(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;

end;

procedure TfrmCadGrpProcessoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrpProcesso.AplicaOperacao(opApagar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrpProcessoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrpProcesso.AplicaOperacao(opAlterar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrpProcessoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _GrpProcesso.AplicaOperacao(opInserir,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadGrpProcessoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _GrpProcesso.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _GrpProcesso.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadGrpProcessoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  cds.Data := _GrpProcesso.Procurar(cds.FieldByName('IDGRUPOPROCESSO').AsFloat);
end;

end.
