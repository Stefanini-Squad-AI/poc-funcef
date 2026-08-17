unit FCadRegrasContabMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97,
  ExtCtrls, DBCtrls, Mask, ActiveX, COMObj, OleCtrls, uCtrlRegrasContab,
  MSScriptControl_TLB, CMContabRegra, CmEventosCadastro, ImgList,
  FCadastroMT, DBClient, uCMClientDataSet,{$IFNDEF VERSAO0505} uCMTypes {$ENDIF};


type
  TfrmCadRegrasContabMT = class(TFrmCadastroMT)
    Label1: TLabel;
    dbeREGDESC: TDBEdit;
    dbmREGSCRIPT: TDBMemo;
    btnChecaScript: TBitBtn;
    DBCheckBox1: TDBCheckBox;
    ScriptControl: TScriptControl;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnChecaScriptClick(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
  private
    { Private declarations }
    CtrlRegrasContab : TCtrlRegrasContab;

  public
    { Public declarations }
    RegraContab : TCMContabRegra;

  end;

var
  frmCadRegrasContabMT: TfrmCadRegrasContabMT;

implementation

uses  uSistema, FSM_FxLib {FSM_FxLibCMSE}, uDatabase, dBaseDados,uModulo,uMensErro;

{$R *.DFM}

procedure TfrmCadRegrasContabMT.FormCreate(Sender: TObject);
begin
  inherited;

   // *** Instancia a classe principal pre-planilha ***
  CtrlRegrasContab := TCtrlRegrasContab.Create;
  CtrlRegrasContab.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                             Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlRegrasContab.CdsRegrasContab   := Cds;
  Cds.Data := CtrlRegrasContab.ListRegrasContab(-1,-1,tpAmbas);

  // *** Adiciona mascara para o monta select ***
  MontaSelect.Filtro.Add('REGRASCONTAB.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

  OleInitialize(nil);
  RegraContab := TCMContabRegra.Create(nil);
  RegraContab.CtrlTelaObject :=  CtrlRegrasContab;
  ScriptControl.AddObject('Regra', RegraContab ,  false);


end;


procedure TfrmCadRegrasContabMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlRegrasContab.Free;
end;

procedure TfrmCadRegrasContabMT.btnChecaScriptClick(Sender: TObject);
begin
  inherited;
  try
    ScriptControl.ExecuteStatement(dbmREGSCRIPT.Text);
    MsgInfo('O Script da Regra está correto!');
  except
    on E : Exception do
      MsgError('Existe erros no Script da Regra!' + #13 + E.Message);
  end;

end;

procedure TfrmCadRegrasContabMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  dbeREGDESC.SetFocus;

end;

procedure TfrmCadRegrasContabMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  Begin
    Cds.Data := CtrlRegrasContab.ListRegrasContab(Sistema.IdEmpresa, StrToFloat(MontaSelect.ValoresChave[0]),tpAmbas)
  End;

end;

procedure TfrmCadRegrasContabMT.FormDestroy(Sender: TObject);
begin
  inherited;
  OleUnInitialize;

end;


procedure TfrmCadRegrasContabMT.sbtnInserirClick(Sender: TObject);
begin
  inherited;
  dbeREGDESC.SetFocus;
end;

procedure TfrmCadRegrasContabMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlRegrasContab.MessageInfo <> '' Then
     MsgDlg(CtrlRegrasContab.MessageInfo,'Erro',mtError,[mbOK],0);

end;

procedure TfrmCadRegrasContabMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRegrasContab.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);
end;

procedure TfrmCadRegrasContabMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRegrasContab.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);

end;

procedure TfrmCadRegrasContabMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  Accept := CtrlRegrasContab.Gravar(Sistema.IdEmpresa,Sistema.IdModulo,Sistema.IdUsuario);

end;

procedure TfrmCadRegrasContabMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin
    Cds.FieldByName('IDPESSOA').AsInteger := Sistema.IdEmpresa;
    Cds.FieldByName('REGATIVA').AsString := 'S';
  End;

end;

procedure TfrmCadRegrasContabMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlRegrasContab.ListRegrasContab(-1,-1,tpAmbas);

end;

procedure TfrmCadRegrasContabMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
  inherited;
  Cds.Data := CtrlRegrasContab.ListRegrasContab(Sistema.IdEmpresa,Cds.FieldByName('REGCODIGO').asFloat,tpAmbas);

end;

end.
