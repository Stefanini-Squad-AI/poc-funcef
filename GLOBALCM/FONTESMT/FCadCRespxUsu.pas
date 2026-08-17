unit FCadCRespxUsu;

{-------------------------------------------------------------------------------
Pendência: 15150
Data     : 19-22/12/2003
Mudanças : Tela refeita, continha diversos problemas, dentre eles, a declaração
           do CodCentroRespon como integer.
-------------------------------------------------------------------------------}

{ ------------------------------------------------------------------------------
 p: 15258 - 23/01/2006

1. Adicionoei no MontaSelect o campo CODEXTERNO para espelhar o código externo
   ao invés do código real (CODCENTRORESPON).

2. Ao invés de passar o código de responsabilidade para o edit que exibe o
   mesmo, botei pra passar o código externo.

3. Na hora de gravar os dados, a função passava o Edit do código como parâmetro.
   Botei pra ao invés de passar o conteúdo do Edit, passar diretamente a chave
   do MontaSelect, que continua sendo o Código de responsabilidade.
  ---------------------------------------------------------------------------- }

//Atualizado em: 03/11/2003 - pendência 15150
//               27/02/2004 - pendência 14933 - Não seleciona o
// centro de responsabilidade padrão se a fundação utilisa a estrutura de centro de responsabilidade.


interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroMT, MontaSelect, Db, DBClient, uCMClientDataSet,
  CmEventosCadastro, ImgList, Wwdatsrc, IvDictio, IvMulti, IvEMulti,
  MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97Ctls, TB97, ExtCtrls, Grids,
  Wwdbigrd, Wwdbgrid, uCtrlCadUsuxCResp, DBaseDados, usistema, DBTables,
  Wwquery, uCmSqlParams, uMensErro;

type
  TFrmCadCRespxUsuMT = class(TFrmCadastroMT)
    plnTransf: TPanel;
    btnAdiciona: TSpeedButton;
    BtnRemove: TSpeedButton;
    BtnAdicionaTudo: TSpeedButton;
    btnRemoveTudo: TSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    wwDbGridUSU: TwwDBGrid;
    CdsUsuario: TCMClientDataSet;
    DsUsuario: TwwDataSource;
    GroupBox1: TGroupBox;
    EditCodigo: TEdit;
    Label2: TLabel;
    EditCentro: TEdit;
    Label1: TLabel;
    DbGridSel: TwwDBGrid;
    CMSqlParams1: TCMSqlParams;
    CdsUsuarioIDUSUARIO: TFloatField;
    CdsUsuarioNOMEUSUARIO: TStringField;
    CdsUsuarioNOME: TStringField;
    CdsIDUSUARIO: TFloatField;
    CdsNOMEUSUARIO: TStringField;
    CdsCODCENTRORESPON: TStringField;
    CdsIDPESSOA: TFloatField;
    CdsNOME: TStringField;
    CdsIDPESSOAACESSO: TFloatField;
    sqlUsaCentResp: TCMSqlParams;
    procedure FormCreate(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure btnAdicionaClick(Sender: TObject);
    procedure BtnRemoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtnAdicionaTudoClick(Sender: TObject);
    procedure btnRemoveTudoClick(Sender: TObject);
    procedure CmeCadastroApplyEdit(sender: TObject; var Accept: Boolean);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroEdit(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeCadastroConfirma(Sender: TObject);
    procedure CmeCadastroAtualizaBotoes(Sender: TObject);
    procedure wwDbGridUSUTitleButtonClick(Sender: TObject;
      AFieldName: String);
    procedure DbGridSelTitleButtonClick(Sender: TObject;
      AFieldName: String);
  private
    { Private declarations }
    CtrlCadUsuxCResp: TCtrlCadUsuxCResp;

    procedure MensErroMt (MessageInfo: string);
    procedure InsereUsusario;
    procedure ExcluiUsusario;
    procedure MontaQuery (const sCRespon: string);
  public
    { Public declarations }
  end;

var
  FrmCadCRespxUsuMT: TFrmCadCRespxUsuMT;

implementation

{$R *.DFM}

procedure TFrmCadCRespxUsuMT.FormCreate(Sender: TObject);
var cdsAux : TcmClientDataSet; // 27/02/2004 - pendência 14933
begin
  inherited;

  cdsAux  := TcmClientDataset.Create(nil); // 27/02/2004 - pendência 14933

  // 27/02/2004 - pendência 14933
  sqlUsaCentResp.Prepare;
  sqlUsaCentResp.ParamByName('IDPESSOA').asInteger := sistema.idempresa;

  cdsAux.Data := sqlUsaCentResp.Data;
  MontaSelect.Filtro.Add('CENTRESPON.IDPESSOA = '+ IntToStr(sistema.IdEmpresa));

  // 27/02/2004 - pendência 14933
  // se a fundacao usa a estrutura de centro de responsabilidade,
  // então não deve exibir o centro de resposabilidade padrão
  if trim(CdsAux.FieldByName('USACRESPON').asString) = 'S' then
    MontaSelect.Filtro.Add( 'CENTRESPON.CODCENTRORESPON <> ''9999999999''' );

  cdsUsuario.Close;
  CtrlCadUsuxCResp := TCtrlCadUsuxCResp.Create;
  CtrlCadUsuxCResp.Initialize( DtmBaseDados.dbBaseDados, True,
                               Sistema.ConnectionType,   Sistema.ConnectionSide,
                               Sistema.AppRemoteServer,  True, MensErroMt );

  CtrlCadUsuxCResp.IdEmpresa := Sistema.IdEmpresa;
  CtrlCadUsuxCResp.IdUsuario := Sistema.IdUsuario;

  CtrlCadUsuxCResp.CdsDisponiveis  := Cds;

  cdsAux.Free;  // 27/02/2004 - pendência 14933

end;


procedure TFrmCadCRespxUsuMT.CmeCadastroFind(Sender: TObject);
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
    EditCodigo.Text  := MontaSelect.ValoresChave[2]; // em 19/01/2006 p: 15258
    EditCentro.Text  := MontaSelect.ValoresChave[1];
    MontaQuery (MontaSelect.ValoresChave[0]); //  em 23/01/2006 p: 15258
  end;
end;

procedure TFrmCadCRespxUsuMT.btnAdicionaClick(Sender: TObject);
begin
  inherited;
  if wwDbGridUSU.SelectedList.Count = 1 then begin
    InsereUsusario;
    CdsUsuario.Delete;
  end else if wwDbGridUSU.SelectedList.Count > 1 then begin
    Cds.DisableControls;
    CdsUsuario.DisableControls;
    CdsUsuario.First;
    while not CdsUsuario.Eof do begin
      if wwDbGridUSU.IsSelectedRecord then begin
        InsereUsusario;
      end;
      CdsUsuario.Next;
    end;

    // excluir os usuários da grid, se não for de traz pra frente perde o bookmark
    CdsUsuario.Last;
    while not CdsUsuario.Bof do begin
      if wwDbGridUSU.IsSelectedRecord then
        CdsUsuario.Delete;
      CdsUsuario.Prior;
    end;
    Cds.First;
    CdsUsuario.First;
    wwDbGridUSU.UnselectAll;
    DbGridSel.UnselectAll;

    Cds.EnableControls;
    CdsUsuario.EnableControls;
  end;
end;

procedure TFrmCadCRespxUsuMT.BtnRemoveClick(Sender: TObject);
begin
  inherited;
  if DbGridSel.SelectedList.Count = 1 then begin
    ExcluiUsusario;
    Cds.Delete;
  end else if DbGridSel.SelectedList.Count > 1 then begin
    Cds.DisableControls;
    CdsUsuario.DisableControls;
    Cds.First;
    while not Cds.Eof do begin
      if DbGridSel.IsSelectedRecord then
        ExcluiUsusario;
      Cds.Next;
    end;

    // excluir os usuários da grid, se não for de traz pra frente perde o bookmark
    Cds.Last;
    while not Cds.Bof do begin
      if DbGridSel.IsSelectedRecord then
        Cds.Delete;
      Cds.Prior;
    end;
    Cds.First;
    CdsUsuario.First;

    wwDbGridUSU.UnselectAll;
    DbGridSel.UnselectAll;
    Cds.EnableControls;
    CdsUsuario.EnableControls;
  end;
end;

procedure TFrmCadCRespxUsuMT.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  CtrlCadUsuxCResp.Free;
  inherited;
end;

procedure TFrmCadCRespxUsuMT.ExcluiUsusario;
begin

  // insere o usuário na grid usuário disponíveis
  CdsUsuario.Insert;
  CdsUsuarioIDUSUARIO.AsInteger  := CdsIDUSUARIO.AsInteger;
  CdsUsuarioNOME.AsString        := CdsNOME.AsString;
  CdsUsuarioNOMEUSUARIO.AsString := CdsNOMEUSUARIO.AsString;
  CdsUsuario.Post;
end;

procedure TFrmCadCRespxUsuMT.InsereUsusario;
begin
  // insere o usuário na grid usuário disponíveis
  Cds.Insert;
  CdsIDUSUARIO.AsInteger      := CdsUsuarioIDUSUARIO.AsInteger;
  CdsIDPESSOAACESSO.AsInteger := CdsUsuarioIDUSUARIO.AsInteger;
  CdsNOME.AsString            := CdsUsuarioNOME.AsString;
  CdsNOMEUSUARIO.AsString     := CdsUsuarioNOMEUSUARIO.AsString;
  CdsCODCENTRORESPON.AsString := MontaSelect.ValoresChave[0]; // em 23/01/2006 p: 15258
  CdsIDPESSOA.AsInteger       := Sistema.IdEmpresa;
  Cds.Post;

end;

procedure TFrmCadCRespxUsuMT.MensErroMt(MessageInfo: string);
begin
  MsgDlg (MessageInfo,'Global',mtWarning,[mbok],0)
end;

procedure TFrmCadCRespxUsuMT.BtnAdicionaTudoClick(Sender: TObject);
begin
  inherited;
  Cds.DisableControls;
  CdsUsuario.DisableControls;
  CdsUsuario.First;
  while not CdsUsuario.Eof do begin
    InsereUsusario;
    CdsUsuario.Delete;
  end;
  CdsUsuario.First;
  Cds.First;
  Cds.EnableControls;
  CdsUsuario.EnableControls;
end;

procedure TFrmCadCRespxUsuMT.btnRemoveTudoClick(Sender: TObject);
begin
  inherited;
  Cds.DisableControls;
  CdsUsuario.DisableControls;
  Cds.First;
  while not Cds.Eof do begin
    ExcluiUsusario;
    Cds.Delete;
  end;
  CdsUsuario.First;
  Cds.First;
  Cds.EnableControls;
  CdsUsuario.EnableControls;
end;

procedure TFrmCadCRespxUsuMT.CmeCadastroApplyEdit(sender: TObject;
  var Accept: Boolean);
begin
  inherited;
  accept := CtrlCadUsuxCResp.AplicaOperacaoCresponXPessoa;
end;

procedure TFrmCadCRespxUsuMT.CmeCadastroCancel(Sender: TObject);
begin
  inherited;
  MontaQuery (MontaSelect.ValoresChave[0]); // em 23/01/2006 p: 15258
end;

procedure TFrmCadCRespxUsuMT.CmeCadastroEdit(Sender: TObject);
begin
  inherited;
  Cds.CancelUpdates;  // a edição é feita pelos botões
end;

procedure TFrmCadCRespxUsuMT.bbtnConfirmarClick(Sender: TObject);
begin
  CmeCadastro.RepetirInsert := false;
  inherited;

end;

procedure TFrmCadCRespxUsuMT.MontaQuery(const sCRespon: string);
begin
  cdsUsuario.Data  := CtrlCadUsuxCResp.ListaUsuariosNotInCR(sCRespon, sistema.IdEmpresa);
  Cds.Data         := CtrlCadUsuxCResp.ListaUsuariosInCR(sCRespon, sistema.IdEmpresa);
end;

procedure TFrmCadCRespxUsuMT.CmeCadastroConfirma(Sender: TObject);
begin
  inherited;
  MontaQuery (MontaSelect.ValoresChave[0]); // em 23/01/2006 p: 15258
end;

procedure TFrmCadCRespxUsuMT.CmeCadastroAtualizaBotoes(Sender: TObject);
begin
  inherited;
  // força o botão sempre aceso, pois o cds pode estar vazio
  if (EditCentro.Text <> '') and not(sbtnAlterar.Enabled) then
    sbtnAlterar.Enabled := True;
end;

procedure TFrmCadCRespxUsuMT.wwDbGridUSUTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  CdsUsuario.IndexFieldNames := AFieldName;
end;

procedure TFrmCadCRespxUsuMT.DbGridSelTitleButtonClick(Sender: TObject;
  AFieldName: String);
begin
  inherited;
  Cds.IndexFieldNames := AFieldName;
end;

end.
