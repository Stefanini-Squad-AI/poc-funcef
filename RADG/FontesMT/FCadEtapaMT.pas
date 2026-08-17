unit FCadEtapaMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, TREdit,
  wwdblook, Spin, uCtrlTipoEtapa, Mask, wwdbedit,uCMTypes, DBCtrls,
  ComCtrls;

type
  TfrmCadEtapaMT = class(TFrmCadastroMT)
    lblNome: TLabel;
    dbedNome: TDBEdit;
    lblDescEtapa: TLabel;
    dbchkautoriz: TDBCheckBox;
    dbchkRetorna: TDBCheckBox;
    dbreDescricao: TDBRichEdit;
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
    _TipoEtapa : TCtrlTipoEtapa;
  public
    { Public declarations }
  end;

var
  frmCadEtapaMT: TfrmCadEtapaMT;

implementation

Uses uModulo, uSistema, uMensErro, dBaseDados;

{$R *.DFM}

procedure TfrmCadEtapaMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := False;
  if trim(dbedNome.Text)='' then begin
     MsgDlg('Obrigatório preencher o Nome da Etapa','Erro',mtError,[mbOk],0);
     dbedNome.SetFocus;
     exit;
  end;
  Accept := True;
end;

procedure TfrmCadEtapaMT.FormCreate(Sender: TObject);
begin
  inherited;
  _TipoEtapa := TCtrlTipoEtapa.Create;
  _TipoEtapa.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide,
                   Sistema.AppRemoteServer,True,nil,nil,False);
  //Atribui os ClientDataSets local a ser persistido pelo objeto de negócios
  _TipoEtapa.CdsRadTipoEtapa := cds;
  
  cds.Data := _TipoEtapa.Procurar(-1);
  
end;

procedure TfrmCadEtapaMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  _TipoEtapa.Free;
end;

procedure TfrmCadEtapaMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.FieldByName('FLGAUTORIZACAO').AsString := 'N';
  cds.FieldByName('FLGRETORETAPA').AsString  := 'N';
  dbedNome.SetFocus;
end;

procedure TfrmCadEtapaMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbedNome.SetFocus;
end;

procedure TfrmCadEtapaMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then Begin
     cds.Data := _TipoEtapa.Procurar(StrTointDef(MontaSelect.ValoresChave[0],0));
  end;

end;

procedure TfrmCadEtapaMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _TipoEtapa.AplicaOperacao(opApagar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadEtapaMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _TipoEtapa.AplicaOperacao(opAlterar,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadEtapaMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := _TipoEtapa.AplicaOperacao(opInserir,Sistema.IdEmpresa,Sistema.IdUsuario,Sistema.IdModulo);
end;

procedure TfrmCadEtapaMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _TipoEtapa.MessageInfo <> '' then
     MsgDlg('Ocorreu o seguinte erro : '+ _TipoEtapa.MessageInfo, 'Aviso', mtError,[mbOK],0);
end;

procedure TfrmCadEtapaMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  cds.Data := _TipoEtapa.Procurar(cds.FieldByName('IDTIPOETAPA').AsFloat);
end;

end.
