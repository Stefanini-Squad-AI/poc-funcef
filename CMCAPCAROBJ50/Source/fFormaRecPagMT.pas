//***************************************************************************************
//Rotina.............: CmeCadastroEdit e CmeCadastroApplyEdit 
//N. SIG.............: 111234
//Data da Alteração..: 19/11/2020
//Alteração Form.....: fFormaRecPagMT
//Responsável........: André Imakawa
//Descrição..........: Rotina não estava registrando informações na tabela
//					   FORMARECPAGXTIPOFORMARECPAG
//***************************************************************************************
//Rotina.............: FormCreate, CmeCadastroFind, CmeCadastroCancel, CmeCadastroBeforeConfirma,
//                     CmeCadastroInsert, CmeCadastroEdit, CmeCadastroApplyDelete, CmeCadastroApplyEdit,
//                     CmeCadastroApplyInsert 
//N. SIG.............: 102320
//Data da Alteração..: 30/09/2020
//Alteração Form.....: fFormaRecPagMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de campo para identificação de Tipo de Pagamento/Recebimento.
//***************************************************************************************
//Rotina.............: FormCreate, CmeCadastroFind, chkListaFavorecidoClick, chkListaTitulosClick
//N. SIG.............: 99868
//Data da Alteração..: 02/09/2020
//Alteração Form.....: fFormaRecPagMT
//Responsável........: Cássio Florencio Rovaroto
//Descrição..........: Inclusão de novos campos para parametrização de Forma de Pagamento.
//***************************************************************************************
//Rotina.............: chkFlgArquivoClick, FormCreate, CmeCadastroFind
//N. SIG.............: 101753
//Data da Alteração..: 24/08/2020
//Alteração Form.....: fFormaRecPagMT
//Responsável........: Cássio Florencio Rovaroto 
//Descrição..........: Inclusão de campo para indicação de Remessa Eletrônica.
//***************************************************************************************
//Rotina.............: ListFormaRecPag
//N. SIG.............: 100343
//Data da Alteração..: 12/06/2020
//Alteração Form.....: fFormaRecPagMT
//Responsável........: Cássio Florencio Rovaroto 
//Descrição..........: Inclusão de campo para tratamento de pagamento de Autônomos.
//***************************************************************************************
unit fFormaRecPagMT;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, DBCtrls,
  Mask, uCtrlFormaRecPag, uCMTypes, wwdbedit, wwdblook;

type
  TfrmFormaRecPagMT = class(TFrmCadastroMT)
    lblFormaRecPag: TLabel;
    dbedFormaRecPag: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    wwDBEdit1: TwwDBEdit;
    Label1: TLabel;
    chkPgtoAutonomoPF: TCheckBox;
    chkFlgArquivo: TCheckBox;
    chkListaTitulos: TCheckBox;
    chkListaFavorecido: TCheckBox;
    lblTipoForma: TLabel;
    cmbTipoForma: TwwDBLookupCombo;
    cdsDet: TCMClientDataSet;
    cdsTipoFormaRecPag: TCMClientDataSet;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CmeCadastroApplyDelete(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroApplyInsert(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroBeforeConfirma(sender: TObject;
      var Accept: Boolean);
    procedure CmeCadastroAbortConfirma(sender: TObject;
      OrigemAbortConfirma: TOrigemAbortConfirma);
    procedure chkPgtoAutonomoPFClick(Sender: TObject);
    procedure chkFlgArquivoClick(Sender: TObject);
    procedure chkListaFavorecidoClick(Sender: TObject);
    procedure chkListaTitulosClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
  private
    { Private declarations }
    CtrlFormaRecPag : TCtrlFormaRecPag;
    fCodForma: integer;
    fPossuiParametrizacao: Boolean; //Cássio Rovaroto - SIG nº 102320
    fExcluiParametrizacao: Boolean; //Cássio Rovaroto - SIG nº 102320
  public
    { Public declarations }
  end;

var
  frmFormaRecPagMT: TfrmFormaRecPagMT;

implementation

uses uMensErro,DBaseDados, uDataBase, uCtrlParamIntegra, uSistema;

{$R *.DFM}

procedure TfrmFormaRecPagMT.FormCreate(Sender: TObject);
begin
  If ParamIntegra.RecPag = 'R' Then
  begin
    Caption               := 'Tipo de Cobrança';
    HelpContext           := 40068;
    bbtnAjuda.HelpContext := 40068;
  end
  Else
  begin
    Caption               := 'Forma de Pagamento';
// Daniel Simões - 25/01/2006 - Início------------------------------------------
    HelpContext           := 30048;
    bbtnAjuda.HelpContext := 30048;
// Daniel Simões - 25/01/2006 - Fim---------------------------------------------
  end;

  CtrlFormaRecPag := TCtrlFormaRecPag.Create;
  CtrlFormaRecPag.Initialize(DtmBaseDados.dbBaseDados,true,Sistema.ConnectionType,Sistema.ConnectionSide, Sistema.AppRemoteServer, True);
  CtrlFormaRecPag.cds := cds;
  CtrlFormaRecPag.cdsFormaRecPagXTipoFormaRecPag := cdsDet;

  cds.data := CtrlFormaRecPag.ListFormaRecPag(0,-1);
  cdsDet.Data := CtrlFormaRecPag.ListFormaRecPagXTipoFormaRecPag(-1);
  cdsTipoFormaRecPag.Data:=  CtrlFormaRecPag.ListTipoFormaRecPag();

  inherited;
  MontaSelect.Filtro.Add('FORMARECPAG.RECPAG = ''' +  ParamIntegra.RecPag + '''');
  MontaSelect.Filtro.Add('FORMARECPAG.IDPESSOA = ' + IntToStr(Sistema.idEmpresa)) ;

  //Cássio Rovaroto - SIG nº 101753 - Início
  if ParamIntegra.RecPag =  'P' then
  begin
    chkFlgArquivo.Visible := True;
    chkPgtoAutonomoPF.Visible := True;
    //Cássio Rovaroto - SIG nº 99868 - Início
    chkListaFavorecido.Visible := True;
    chkListaTitulos.Visible := True;
    //Cássio Rovaroto - SIG nº 99868 - Fim
  end
  else
  begin
    chkPgtoAutonomoPF.Visible := False;
    //Cássio Rovaroto - SIG nº 99868 - Início
    chkListaFavorecido.Visible := False;
    chkListaTitulos.Visible := False;
    //Cássio Rovaroto - SIG nº 99868 - Fim
    lblTipoForma.Visible := False;
    cmbTipoForma.Visible:= False; // Cássio Rovaroto - SIG nº 102320
  end;
  //Cássio Rovaroto - SIG nº 101753 - Fim

  //Cássio Rovaroto - SIG nº 102320 - Início
  fCodForma := -1;
  fExcluiParametrizacao := False;
  fPossuiParametrizacao := False;
  //Cássio Rovaroto - SIG nº 102320 - Fim
end;

procedure TfrmFormaRecPagMT.CmeCadastroInsert(Sender: TObject);
begin
  inherited;
  cds.fieldbyname('IDUSUARIOINCLUSAO').AsInteger := Sistema.idUsuario;
  cds.fieldbyname('IDPESSOA').AsInteger          := Sistema.idEmpresa;
  cds.fieldbyname('RECPAG').AsString             := ParamIntegra.RecPag ;
  cds.fieldbyname('FLGDADOSBANCARIOS').AsString  := 'N';
  dbedFormaRecPag.setfocus;
  cdsDet.Insert; //Cássio Rovaroto - SIG nº102320 - Início
end;

procedure TfrmFormaRecPagMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  cds.data := CtrlFormaRecPag.listFormaRecPag(0,StrToIntDef(MontaSelect.ValoresChave[0],0)); // Andre Imakawa - SIG 111234
  cds.edit;  // Andre Imakawa - SIG 111234
  dbedFormaRecPag.setfocus;

  cdsDet.Insert; //Cássio Rovaroto - SIG nº102320 - Início // Andre Imakawa - SIG 111234
  cdsDet.FieldByName('IDTIPOFORMARECPAG').AsInteger := Cds.FieldByName('TIPOFORMA').AsInteger; // Andre Imakawa - SIG 111234

end;

procedure TfrmFormaRecPagMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  If MontaSelect.RetornouValor Then
  begin
     cds.data := CtrlFormaRecPag.listFormaRecPag(0,StrToIntDef(MontaSelect.ValoresChave[0],0));
     //Cássio Rovaroto - SIG nº102320 - Início
     cdsDet.Data := CtrlFormaRecPag.ListFormaRecPagXTipoFormaRecPag(StrToInt(MontaSelect.ValoresChave[0]));
     fCodForma := cds.FieldByName('CODFORMA').asInteger;
     fPossuiParametrizacao:= not cdsDet.IsEmpty;
     //Cássio Rovaroto - SIG nº102320 - Fim
  end;

  //Cássio Rovaroto - SIG nº 100343 - Início
  if not cds.IsEmpty then
  begin
    chkPgtoAutonomoPF.Checked := Cds.FieldByName('FLGPAGTOAUTONOMO').asString = '1';
    chkFlgArquivo.Checked := Cds.FieldByName('FLGARQUIVO').asString = 'S'; //Cássio Rovaroto - SIG nº 1017537
    //Cássio Rovaroto - SIG nº 99868 - Início
    chkListaFavorecido.Checked := Cds.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString = 'S';
    chkListaTitulos.Checked := Cds.FieldByName('FLGPERMITETITULOSPAGTO').AsString = 'S';
    //Cássio Rovaroto - SIG nº 99868 - Fim
  end;
  //Cássio Rovaroto - SIG nº 100343 - Fim
end;

procedure TfrmFormaRecPagMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  CtrlFormaRecPag.free;
end;

procedure TfrmFormaRecPagMT.CmeCadastroApplyDelete(sender: TObject;
  var Accept: Boolean);
var
  bSucesso: Boolean;
begin
  inherited;
  //Cássio Rovaroto - SIG nº102320 - Início
  bSucesso := True;

  if fPossuiParametrizacao then
    bSucesso :=  CtrlFormaRecPag.ExcluiParametrizacaoRecPag(fCodForma);

  if bSucesso then
    Accept := CtrlFormaRecPag.GravarFormaRecPag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario)
  else
    Accept := False;
  //Cássio Rovaroto - SIG nº102320 - Fim
end;

procedure TfrmFormaRecPagMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
var
  bSucesso: Boolean;
begin
  inherited;
  //Cássio Rovaroto - SIG nº102320 - Início
  bSucesso := True;

  if fExcluiParametrizacao then
    bSucesso :=  CtrlFormaRecPag.ExcluiParametrizacaoRecPag(fCodForma);
  // Andre Imakawa - SIG 111234 - Inicio
  if bSucesso then
  begin
    Accept := CtrlFormaRecPag.GravarFormaRecPag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, fPossuiParametrizacao);
    if Accept then
    begin
      cdsDet.Close;
      cdsDet.Data := CtrlFormaRecPag.ListFormaRecPagXTipoFormaRecPag(fCodForma);
    end;
  end
  else
    Accept := False;
  //Cássio Rovaroto - SIG nº102320 - Fim
  // Andre Imakawa - SIG 111234 - Fim
end;

procedure TfrmFormaRecPagMT.CmeCadastroApplyInsert(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  //Cássio Rovaroto - SIG nº102320 - Início
  Accept := CtrlFormaRecPag.GravarFormaRecPag(Sistema.IdEmpresa, Sistema.IdModulo, Sistema.IdUsuario, fPossuiParametrizacao);

  if Accept then
  begin
    cdsDet.Close;
    cdsDet.Data := CtrlFormaRecPag.ListFormaRecPagXTipoFormaRecPag(-1);
  end;
  //Cássio Rovaroto - SIG nº102320 - Fim
end;

procedure TfrmFormaRecPagMT.CmeCadastroBeforeConfirma(sender: TObject;
  var Accept: Boolean);
var sforma : string;
begin
  inherited;
  If Cds.State in [dsEdit, DsInsert] Then
  Begin
     //Cássio Rovaroto - SIG nº102320 - Início
     if cmbTipoForma.Text <> EmptyStr  then // Andre Imakawa - SIG 111234
     begin
      fExcluiParametrizacao := True;
      fPossuiParametrizacao := True;
     end;

     if (cmbTipoForma.Text <> EmptyStr) then // Andre Imakawa - SIG 111234
     begin
      cdsDet.FieldByName('IDTIPOFORMARECPAG').AsInteger := Cds.FieldByName('TIPOFORMA').AsInteger;
      cdsDet.Post;
     end;
     //Cássio Rovaroto - SIG nº102320 - Fim

     //Faz a verificação do preenchimento dos campos
     if dbedFormaRecPag.Text  = ''  then
     begin
        If ParamIntegra.RecPag = 'P' Then sForma := 'Pagamento'
        Else sForma := 'Recebimento';
        MsgDlg('Favor indicar a Forma de ' + sForma,'Aviso',mtError,[mbOk],0);
        dbedFormaRecPag.SetFocus;
        accept := false;
     end;
  End;
end;

procedure TfrmFormaRecPagMT.CmeCadastroAbortConfirma(sender: TObject;
  OrigemAbortConfirma: TOrigemAbortConfirma);
begin
  inherited;
  If CtrlFormaRecPag.MessageInfo <> '' Then
     MsgDlg(CtrlFormaRecPag.MessageInfo,'Erro',mtError,[mbOK],0);
end;

procedure TfrmFormaRecPagMT.chkPgtoAutonomoPFClick(Sender: TObject);
begin
  inherited;
  if cds.State in [dsEdit, DsInsert] then
  begin
    if chkPgtoAutonomoPF.Checked then
      Cds.FieldByName('FLGPAGTOAUTONOMO').asInteger := 1
    else
      Cds.FieldByName('FLGPAGTOAUTONOMO').asInteger := 0;
  end;

end;

procedure TfrmFormaRecPagMT.chkFlgArquivoClick(Sender: TObject);
begin
  inherited;
  //Cássio Rovaroto - SIG nº 101753 - Início
  if cds.State in [dsEdit, DsInsert] then
  begin
    if chkFlgArquivo.Checked then
      cds.FieldByName('FLGARQUIVO').asString := 'S'
    else
      cds.FieldByName('FLGARQUIVO').asString := 'N';
  end;
  //Cássio Rovaroto - SIG nº 101753 - Fim
end;

procedure TfrmFormaRecPagMT.chkListaFavorecidoClick(Sender: TObject);
begin
  inherited;

  if Cds.State in [dsEdit, dsInsert] then
    if chkListaFavorecido.Checked then
      Cds.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString :=  'S'
    else
      Cds.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString :=  'N';
end;

procedure TfrmFormaRecPagMT.chkListaTitulosClick(Sender: TObject);
begin
  inherited;

  if Cds.State in [dsEdit, dsInsert] then
    if chkListaTitulos.Checked then
      Cds.FieldByName('FLGPERMITETITULOSPAGTO').AsString :=  'S'
    else
      Cds.FieldByName('FLGPERMITETITULOSPAGTO').AsString :=  'N';
end;

procedure TfrmFormaRecPagMT.FormResize(Sender: TObject);
begin
  inherited;
  if ParamIntegra.RecPag = 'R' then
    frmFormaRecPagMT.Height := 249;
end;

procedure TfrmFormaRecPagMT.CmeCadastroCancel(Sender: TObject);
begin
  //Cássio Rovaroto - SIG nº 102320 - Início
  chkPgtoAutonomoPF.Checked := Cds.FieldByName('FLGPAGTOAUTONOMO').asString = '1';
  chkFlgArquivo.Checked := Cds.FieldByName('FLGARQUIVO').asString = 'S';
  chkListaFavorecido.Checked := Cds.FieldByName('FLGPERMITELISTAFAVORECIDO').AsString = 'S';
  chkListaTitulos.Checked := Cds.FieldByName('FLGPERMITETITULOSPAGTO').AsString = 'S';
  //Cássio Rovaroto - SIG nº 102320 - Fim

  inherited;
end;

end.
