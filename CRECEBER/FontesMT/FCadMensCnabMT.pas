{
andre tavares - pendência 18245 - 20/12/2004 - quando o documento estiver grupado,
gravar o campo CodGrupocnab na tabela MensagensCnab, assim a mensagem valerá para
o boleto que contem os documentos agrupados.


******************************************************************************
Últimas Atualizações:
17/10/2002 - Revisão completa do módulo - Fábio Barros
*****************************************************************************
}

unit FCadMensCnabMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, MontaSelect, DBTables, Wwdatsrc, TB97Ctls, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, TREdit, ComCtrls, wwdblook, IvDictio, IvMulti,
  IvEMulti, Wwqbe,  CmEventosCadastro, ImgList, DBClient, uCMClientDataSet,
  uCmSqlParams, FCadastroMT, uCMTypes, uCtrlParamIntegra, uCtrlMensagensCnab;

type
  TFrmCadMensCnabMT = class(TFrmCadastroMT)
    MonSelProc: TMontaSelect;
    Pnldocpendentes: TPanel;
    MemoDesc: TMemo;
    RgMens: TRadioGroup;
    NtbAplicaMens: TNotebook;
    Label1: TLabel;
    EdNumDoc: TEdit;
    Label2: TLabel;
    EdRazao: TEdit;
    btnProc: TSpeedButton;
    LblNumDocs: TLabel;
    LblTotDoc: TLabel;
    DbLcPortador: TwwDBLookupCombo;
    Label3: TLabel;
    CkbMens: TCheckBox;
    Label4: TLabel;
    CmbTipoDoc: TwwDBLookupCombo;
    sqlBanco: TCMSqlParams;
    cdsBanco: TCMClientDataSet;
    sqlTipoDoc: TCMSqlParams;
    cdsTipoDoc: TCMClientDataSet;
    cdsBloquete: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);

    Procedure CmeCadastroInsert(Sender: TObject);
    Procedure CmeCadastroEdit(Sender: TObject);
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeCadastroCancel(Sender: TObject);
    Procedure MostraMemo;
    procedure btnProcClick(Sender: TObject);
    procedure DbLcPortadorCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure sbtnApagarClick(Sender: TObject);
    procedure RgMensClick(Sender: TObject);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);

    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    { Private declarations }
    _CtrlMensagensCnab : TCtrlMensagensCnab;
    iCodDoc,
    iCodGrupoCnab      : LongInt; // andre tavares - pendência 18245 - adicionei este parâmetro opcional
    procedure LimpaTela;
  public
    { Public declarations }
  end;

var
  FrmCadMensCnabMT : TFrmCadMensCnabMT;

implementation

{$R *.DFM}

Uses uSistema, uMensErro, uDataBase, uModulo, dBaseDados;

procedure TFrmCadMensCnabMT.CmeCadastroInsert(Sender: TObject);
Begin
  inherited;
  EdNumDoc.Clear;
  EdRazao.Clear;
  btnProc.Enabled := True;
  MemoDesc.Clear;
  MemoDesc.SetFocus;
End;

procedure TFrmCadMensCnabMT.CmeCadastroEdit(Sender: TObject);
Begin
  inherited;
  btnProc.Enabled := False;
  RgMens.Enabled  := False;
  MemoDesc.SetFocus;
End;



procedure TFrmCadMensCnabMT.MostraMemo;
var
  x : Integer;
begin
  MemoDesc.Lines.Clear;
  with cds do
  begin
    for x := 1 To 9  do
    begin
      MemoDesc.Lines.Add(FieldByName('MENSAGEM'+IntToStr(x)).AsString);
    end;
  end;
end;



procedure TFrmCadMensCnabMT.CmeCadastroFind(Sender: TObject);
begin
  if (MontaSelect.RetornouValor) then
  begin
    btnProc.Enabled := False;
    cds.Data        := _CtrlMensagensCnab.ListMensagensCnab(StrToInt(MontaSelect.ValoresChave[0]));
    edNumDoc.Text   := MontaSelect.ValoresChave[1];
    edRazao.Text    := MontaSelect.ValoresChave[2];
    iCodDoc         := StrToIntDef(MontaSelect.ValoresChave[3], -1);
    iCodGrupoCnab   := StrToIntDef(MontaSelect.ValoresChave[4], -1); // andre tavares - pendência 18245 - adicionei este parâmetro opcional
    MostraMemo;
    inherited;
  end;
end;

procedure TFrmCadMensCnabMT.FormCreate(Sender: TObject);
begin
  inherited;
  btnProc.Enabled := False;

  MontaSelect.Filtro.Add('DOCUMENTO.IDPESSOA = ' + IntToStr(Sistema.IDEmpresa));
  MontaSelect.Filtro.Add('DOCUMENTO.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG = '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and b.idusuario='+inttostr(sistema.IdUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+'))');

  MonSelProc.Filtro.Add('DOCUMENTO.IDPESSOA = '  + IntToStr(Sistema.IDEmpresa));
  MonSelProc.Filtro.Add('DOCUMENTO.CODTIPDOC in (SELECT CODTIPDOC FROM TIPODOCRECPAG A WHERE A.RECPAG = '''+ParamIntegra.RecPag+''' and not exists  (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and b.idusuario='+inttostr(sistema.IdUsuario)+') '+ ' union  SELECT CODTIPDOC  FROM TIPODOCRECPAG a WHERE a.RECPAG = '''+ParamIntegra.RecPag+'''  and exists (select 1 from UsuarioxTpdocto b where recpag='+#39+ParamIntegra.recpag+#39+' and a.codtipdoc=b.codtipdoc and b.idusuario='+inttostr(sistema.idusuario)+'))');

  sqlBanco.Prepare;
  sqlBanco.ParamByName('pRECPAG').AsString       := ParamIntegra.RecPag;
  sqlBanco.ParamByName('pIDPESSOA').AsFloat      := Sistema.IDEmpresa;
  sqlBanco.Open;

  sqlTipoDoc.Prepare;
  sqlTipoDoc.ParamByName('pRECPAG').AsString     := ParamIntegra.RecPag;
  sqlTipoDoc.ParamByName('pIDUSUARIO').AsInteger := sistema.idusuario;
  sqlTipoDoc.Open;

  _CtrlMensagensCnab      := TCtrlMensagensCnab.Create;
  _CtrlMensagensCnab.Initialize(DtmBaseDados.dbBaseDados,True,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  _CtrlMensagensCnab._Cds := Cds;
  Cds.Data                := _CtrlMensagensCnab.ListMensagensCnab(-1);
end;

procedure TFrmCadMensCnabMT.btnProcClick(Sender: TObject);
begin
  inherited;
  if MonSelProc.Executar = MrOk then
  begin
    edNumDoc.Text := MonSelProc.ValoresChave[1];
    edRazao.Text  := MonSelProc.ValoresChave[2];
    iCodDoc       := StrToIntDef(MonSelProc.ValoresChave[0], -1);
    iCodGrupoCnab := StrToIntDef(MonSelProc.ValoresChave[3], -1); // andre tavares - pendência 18245 - adicionei este parâmetro opcional
  end;
end;

procedure TFrmCadMensCnabMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;

  cds.Close; 
  RgMens.Enabled  := True;
end;

procedure TFrmCadMensCnabMT.DbLcPortadorCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if DbLcPortador.Text = '' then
  begin
    LblTotDoc.Caption := '0';
    Exit;
  end;
  cdsBloquete.Data := _CtrlMensagensCnab.ListBloquete(DbLcPortador.LookupValue,
                                                      ParamIntegra.RecPag,
                                                      CmbTipoDoc.LookupValue);
  if not cdsBloquete.IsEmpty then
    LblTotDoc.Caption := IntToStr(cdsBloquete.RecordCount)
  else
    LblTotDoc.Caption := '0';
end;

procedure TFrmCadMensCnabMT.sbtnApagarClick(Sender: TObject);
begin
  inherited;
  LimpaTela;
end;

procedure TFrmCadMensCnabMT.RgMensClick(Sender: TObject);
begin
  inherited;
  NtbAplicaMens.PageIndex := RgMens.ItemIndex;
  iCodDoc                 := -1;
  iCodGrupoCnab           := -1;// andre tavares - pendência 18245 - adicionei este parâmetro opcional
end;

procedure TFrmCadMensCnabMT.LimpaTela;
begin
  btnProc.Enabled   := False;
  EdNumDoc.Text     := '';
  EdRazao.Text      := '';
  DbLcPortador.Text := '';
  LblTotDoc.Caption := '0';
  MemoDesc.Lines.Clear;
End;

procedure TFrmCadMensCnabMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  if _CtrlMensagensCnab.MessageInfo <> '' Then
    MsgDlg(_CtrlMensagensCnab.MessageInfo, 'Erro' ,mtError,[mbOK],0);
end;

procedure TFrmCadMensCnabMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  _CtrlMensagensCnab.DeletaMensagens(iCodDoc, iCodGrupoCnab);
end;

procedure TFrmCadMensCnabMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (iCodGrupoCnab <> -1) then  //andre tavares - pendência 18245 - adicionei este parâmetro opcional
    icodDoc := -1;
  _CtrlMensagensCnab.GravarMensagensCnab(iCodDoc,
                                         NtbAplicaMens.PageIndex,
                                         MemoDesc.Lines[0],
                                         MemoDesc.Lines[1],
                                         MemoDesc.Lines[2],
                                         MemoDesc.Lines[3],
                                         MemoDesc.Lines[4],
                                         MemoDesc.Lines[5],
                                         MemoDesc.Lines[6],
                                         MemoDesc.Lines[7],
                                         MemoDesc.Lines[8],
                                         MemoDesc.Lines[9],
                                         cdsBloquete.Data,
                                         ckbMens.Checked,
                                         iCodGrupoCnab); //andre tavares - pendência 18245 - adicionei este parâmetro opcional
end;

procedure TFrmCadMensCnabMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  if (iCodGrupoCnab <> -1) then  //andre tavares - pendência 18245 - adicionei este parâmetro opcional
    icodDoc := -1;
  _CtrlMensagensCnab.GravarMensagensCnab(iCodDoc,
                                         NtbAplicaMens.PageIndex,
                                         MemoDesc.Lines[0],
                                         MemoDesc.Lines[1],
                                         MemoDesc.Lines[2],
                                         MemoDesc.Lines[3],
                                         MemoDesc.Lines[4],
                                         MemoDesc.Lines[5],
                                         MemoDesc.Lines[6],
                                         MemoDesc.Lines[7],
                                         MemoDesc.Lines[8],
                                         MemoDesc.Lines[9],
                                         cdsBloquete.Data,
                                         ckbMens.Checked,
                                         iCodGrupoCnab); //andre tavares - pendência 18245 - adicionei este parâmetro opcional
  Cds.Data := _CtrlMensagensCnab.ListMensagensCnab(-1);
end;

procedure TFrmCadMensCnabMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
// início - André Tavares - pendência 17041 - 21/05/2004
  if MemoDesc.Lines.Count > 10 then
  begin
    MsgDlg('Erro Incluir no Máximo de 10 Linhas Para Mensagens!','Atenção',MtWarning,[MbOk],0);
    Accept := False;
  end;
// fim - André Tavares - pendência 17041 - 21/05/2004

  if (NtbAplicaMens.PageIndex = 1) and (LblTotDoc.Caption = '0') then
  begin
    MsgDlg('Não Existem Documentos Pendentes para este tipo de cobrança','Atenção',MtWarning,[MbOk],0);
    Accept := False;
  end;
end;

procedure TFrmCadMensCnabMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  RgMens.Enabled := True;
end;

procedure TFrmCadMensCnabMT.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  _CtrlMensagensCnab.Free;
end;

end.
