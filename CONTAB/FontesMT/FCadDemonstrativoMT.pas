unit FCadDemonstrativoMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, StdCtrls, ExtCtrls, DBCtrls, wwdbedit, Wwdbspin, Mask,
  MontaSelect, Db, DBClient, uCMClientDataSet, CmEventosCadastro, ImgList,
  Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr,
  TB97Ctls, TB97, uCtrlDemonstrativo, uCMTypes;


type
  TFrmCadDemonstrativoMT = class(TFrmCadastroMT)
    lblFormaRecPag: TLabel;
    dbeDesc: TDBEdit;
    spnIncrementos: TwwDBSpinEdit;
    Label3: TLabel;
    dbeDescCompl1: TDBEdit;
    Label1: TLabel;
    dbeDescCompl2: TDBEdit;
    Label2: TLabel;
    rgNatureza: TDBRadioGroup;
    dbrgLinhaAcima: TDBRadioGroup;
    dbrgTracoAbaixo: TDBRadioGroup;
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroAfterConfirma(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure sbtnApagarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
  private
    { Private declarations }
    CtrlDemonstrativo :TCtrlDemonstrativo;

  public
    { Public declarations }
  end;

var
  FrmCadDemonstrativoMT: TFrmCadDemonstrativoMT;

implementation

uses dBaseDados, uModulo, uSistema, uString, uMensErro;

{$R *.DFM}

procedure TFrmCadDemonstrativoMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  if dbeDesc.canfocus then dbeDesc.SetFocus;

end;


procedure TFrmCadDemonstrativoMT.CmeCadastroFind(Sender: TObject);
begin
    If MontaSelect.RetornouValor Then
    Begin
      //Se houve busca, abre a query principal apenas com o registro buscado
      Cds.Data :=  CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,StrToFloat(MontaSelect.ValoresChave[0]),True);
    End;
   inherited;

end;

procedure TFrmCadDemonstrativoMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  CtrlDemonstrativo.CdsDemonstrativo.FieldByName('IDPESSOA').AsFloat        := Sistema.IdEmpresa;
  CtrlDemonstrativo.CdsDemonstrativo.FieldByName('DEMNATUREZA').AsString    := 'N';
  CtrlDemonstrativo.CdsDemonstrativo.FieldByName('FLGTRACOACIMA').AsString  := 'N';
  CtrlDemonstrativo.CdsDemonstrativo.FieldByName('FLGTRACOABAIXO').AsString := 'N';
  CtrlDemonstrativo.CdsDemonstrativo.FieldByName('DEMSEQUENCIA').AsInteger  := 10;
  dbeDesc.SetFocus;

end;

procedure TFrmCadDemonstrativoMT.FormCreate(Sender: TObject);
begin
  inherited;
  // *** Instancia a classe principal ***
  CtrlDemonstrativo := TCtrlDemonstrativo.Create;
  CtrlDemonstrativo.Initialize(dtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,
                     Sistema.ConnectionSide,Sistema.AppRemoteServer,True);

  CtrlDemonstrativo.CdsDemonstrativo := Cds;
  Cds.Data := CtrlDemonstrativo.ListDemonstrativo(-1,-1);

  //***  Inicializa monta select ***
  MontaSelect.Filtro.Add('DEMONSTRATIVO.IDPESSOA = ' + IntToStr(Sistema.IdEmpresa));

end;



procedure TFrmCadDemonstrativoMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlDemonstrativo.Free;

end;



procedure TFrmCadDemonstrativoMT.CmeCadastroAfterConfirma(Sender: TObject);
begin
 Cds.Data :=  CtrlDemonstrativo.ListDemonstrativo(Sistema.IdEmpresa,Cds.FieldByName('IDDEMONSTRATIVO').asFloat,True);

end;



procedure TFrmCadDemonstrativoMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlDemonstrativo.MessageInfo <> '' Then
     MsgDlg(CtrlDemonstrativo.MessageInfo,'Erro',mtError,[mbOK],0);
end;



procedure TFrmCadDemonstrativoMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  If Cds.State in [dsInsert, dsEdit]  Then
  Begin
    If (dbeDesc.Text = '') Then
    Begin
       MsgDlg('Descrição do Demonstrativo não informada.','Aviso',mtWarning,[mbOk],0);
       dbeDesc.SetFocus;
       Accept := False;
    End;
  End;


end;




procedure TFrmCadDemonstrativoMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlDemonstrativo.Gravar;
end;




procedure TFrmCadDemonstrativoMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlDemonstrativo.Gravar;

end;




procedure TFrmCadDemonstrativoMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlDemonstrativo.Gravar;
end;




procedure TFrmCadDemonstrativoMT.CmeCadastroCancel(Sender: TObject);
begin
  If Cds.State in [ dsInsert ] Then
     Cds.Data := CtrlDemonstrativo.ListDemonstrativo(-1,-1);
  inherited;

end;




procedure TFrmCadDemonstrativoMT.sbtnApagarClick(Sender: TObject);
begin
  if Cds.FieldByName('IDDEMONSTRATIVO').AsInteger < 0 then
  begin
     MsgDlg('Este tipo de demonstrativo é um padrão SPC e não pode ser exluído!','Aviso',mtWarning,[mbOk],0);
     sbtnApagar.Down := False;
  end
  else
   inherited;
end;

procedure TFrmCadDemonstrativoMT.sbtnAlterarClick(Sender: TObject);
begin
  if Cds.FieldByName('IDDEMONSTRATIVO').AsInteger < 0 then
  begin
     MsgDlg('Este tipo de demonstrativo é um padrão SPC e não pode ser alterado!','Aviso',mtWarning,[mbOk],0);
     sbtnAlterar.Down := False;
  end
  else
     inherited;

end;

end.
