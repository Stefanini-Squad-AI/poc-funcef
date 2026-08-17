unit UCadastroEventoRegularizacao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadastroGridCS, StdCtrls, Db, DBTables, Wwquery, CmEventosCadastro,
  ImgList, MontaSelect, Wwdatsrc, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  Buttons, TB97Tlbr, TB97Ctls, TB97, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls,
  DBCtrls, Mask, uSistema, wwdblook, UMensErro;

type
  TfrmCadastroEventoRegularizacao = class(TFrmCadastroGridCS)
    qryIDCADEVENTOSDEREGULARIZACAO: TFloatField;
    qryDESCRICAOEVENTO: TStringField;
    qryFLGDESATIVADO: TFloatField;
    qryCODCENTRORESPON: TStringField;
    qryCODCENTROCUSTO: TStringField;
    qryTIPODOCUMENTO: TFloatField;
    qryTIPODOCUMENTOREC: TFloatField;
    qryTRGDTINCLUSAO: TDateTimeField;
    qryTRGUSERINCLUSAO: TStringField;
    qryTRGDTALTERACAO: TDateTimeField;
    qryTRGUSERALTERACAO: TStringField;
    Label1: TLabel;
    dbeCodInterno: TDBEdit;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbeCodRetorno: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    ChkDesativado: TDBCheckBox;
    qryCentroResp: TwwQuery;
    DsCentroResp: TwwDataSource;
    dblkCentroResp: TwwDBLookupCombo;
    qryCentroRespCODCENTRORESPON: TStringField;
    qryCentroRespDESCRICAO: TStringField;
    qryCentroCusto: TwwQuery;
    DsCentroCusto: TwwDataSource;
    DblkCentroCusto: TwwDBLookupCombo;
    qryCentroCustoCODCENTROCUSTO: TStringField;
    qryCentroCustoDESCRICAO: TStringField;
    qryTipoDoc: TwwQuery;
    DsTipoDoc: TwwDataSource;
    dblkTipoDoc: TwwDBLookupCombo;
    qryTipoDocCODTIPDOC: TFloatField;
    qryTipoDocDESCRICAO: TStringField;
    qryCODIGORETORNO: TStringField;
    qryAux: TwwQuery;
    qryTipoDocRec: TwwQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    DsTipoDocRec: TwwDataSource;
    Label3: TLabel;
    dblkTipoDocRec: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure ChkDesativadoClick(Sender: TObject);
    procedure CmeCadastroInsert(Sender: TObject);
    procedure CmeCadastroCancel(Sender: TObject);
    procedure CmeCadastroDelete(Sender: TObject);
    procedure sbtnInserirClick(Sender: TObject);
    procedure bbtnCancelarClick(Sender: TObject);
    procedure CmeCadastroFind(Sender: TObject);
    procedure sbtnProcurarClick(Sender: TObject);
    procedure sbtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeCodRetornoKeyPress(Sender: TObject; var Key: Char);
    procedure dbeCodRetornoMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure dbeCodRetornoExit(Sender: TObject);
  private
    { Private declarations }
    procedure HabilitaControles(bHabilita: boolean);
  public
    { Public declarations }
  end;

var
  frmCadastroEventoRegularizacao: TfrmCadastroEventoRegularizacao;

implementation

{$R *.DFM}

procedure TfrmCadastroEventoRegularizacao.FormCreate(Sender: TObject);
begin
  inherited;
  dbeCodInterno.Enabled := true;

  dbeCodInterno.Enabled := false;
  qryCentroResp.close;
  qryCentroResp.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCentroResp.ParamByName('IDCADEVENTOSDEREGULARIZACAO').AsInteger := 0;
  qryCentroResp.Open;

  qryCentroCusto.close;
  qryCentroCusto.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
  qryCentroCusto.ParamByName('IDCADEVENTOSDEREGULARIZACAO').AsInteger := 0;
  qryCentroCusto.Open;

  qryTipoDoc.close;
  qryTipoDoc.Open;

  qryTipoDocRec.close;
  qryTipoDocRec.open;

  HabilitaControles(false);
end;

procedure TfrmCadastroEventoRegularizacao.bbtnConfirmarClick(
  Sender: TObject);
begin
   dbeCodInterno.Enabled := true;
   // Testa se o codigo retorno não foi informada
   IF trim(dbeCodRetorno.Text) = '' then
   Begin
      MsgDlg('É obrigatório informar o código do retorno.','Informação',mtInformation,[mbOk],0);
      Exit;
   end;

   // Testa se a descrição não foi informada
   IF trim(dbeDescricao.Text) = '' then
   Begin
      MsgDlg('É obrigatório informar a descrição do evento.','Informação',mtInformation,[mbOk],0);
      Exit;
   end;

   // Testa se o centro de responsabilidade não foi informada
   IF trim(dblkCentroResp.Text) = '' then
   Begin
      MsgDlg('É obrigatório selecionar o centro de responsabilidade.','Informação',mtInformation,[mbOk],0);
      Exit;
   end;

   // Testa se o centro de custo não foi informada
   IF trim(DblkCentroCusto.Text) = '' then
   Begin
      MsgDlg('É obrigatório selecionar o centro de custo.','Informação',mtInformation,[mbOk],0);
      Exit;
   end;

   // Testa se o tipo de documento não foi informada
   IF trim(dblkTipoDoc.Text) = '' then
   Begin
      MsgDlg('É obrigatório selecionar o tipo de documento a Pagar.','Informação',mtInformation,[mbOk],0);
      Exit;
   end;

   // Testa se o tipo de documento não foi informada
   IF trim(dblkTipoDocRec.Text) = '' then
   Begin
      MsgDlg('É obrigatório selecionar o tipo de documento a Receber.','Informação',mtInformation,[mbOk],0);
      Exit;
   end;

   if qry.State = DsInsert then
   begin
      qryAux.close;
      qryAux.SQL.clear;
      qryAux.SQL.Add('SELECT 1 FROM CADASTROEVENTOSDEREGULARIZACAO WHERE FLGDESATIVADO = 0 AND CODIGORETORNO = '+dbeCodRetorno.Text);
      qryAux.Open;
      if not(qryAux.IsEmpty) and (qryFLGDESATIVADO.NewValue = 0) then
      begin
         MsgDlg('Não é possível cadastrar o evento, pois já existe um evento ativo cadastrado com o código de retorno informado.','Informação',mtInformation,[mbOk],0);
         exit;
      end;
      qryAux.Close;
   end
   else
   if qry.State = DsEdit then
   begin
      qryAux.close;
      qryAux.SQL.clear;
      qryAux.SQL.Add('SELECT 1 FROM CADASTROEVENTOSDEREGULARIZACAO WHERE FLGDESATIVADO = 0 AND CODIGORETORNO = '+dbeCodRetorno.Text);
      qryAux.Open;

      if (qryAux.RecordCount = 1) and ((qryFLGDESATIVADO.OldValue = 1) and (qryFLGDESATIVADO.NewValue = 0) ) then
      begin
         MsgDlg('Não é possível cadastrar o evento, pois já existe um evento ativo cadastrado com o código de retorno informado.','Informação',mtInformation,[mbOk],0);
         exit;
      end;

      if (qryAux.RecordCount > 1) then
      begin
         MsgDlg('Não é possível cadastrar o evento, pois já existe um evento ativo cadastrado com o código de retorno informado.','Informação',mtInformation,[mbOk],0);
         exit;
      end;

      qryAux.Close;
      qryAux.SQL.clear;
      qryAux.SQL.Add('SELECT 1 FROM HSTREGULARIZACAOFOLHA WHERE IDCADEVENTOSDEREGULARIZACAO = '+dbeCodInterno.Text);
      qryAux.Open;
      if (qryAux.Recordcount > 0) then
      begin
         if not((qryDESCRICAOEVENTO.NewValue = qryDESCRICAOEVENTO.OldValue) and
            (qryCODCENTRORESPON.NewValue = qryCODCENTRORESPON.OldValue) and
            (qryCODCENTROCUSTO.NewValue  = qryCODCENTROCUSTO.OldValue) and
            (qryTIPODOCUMENTO.NewValue   = qryTIPODOCUMENTO.OldValue) and
            (qryTIPODOCUMENTOREC.NewValue   = qryTIPODOCUMENTOREC.OldValue) and
            (qryCODIGORETORNO.NewValue   = qryCODIGORETORNO.OldValue) and
            (qryFLGDESATIVADO.NewValue   <> qryFLGDESATIVADO.OldValue)) then
         begin
            MsgDlg('Não é permitido alterar esse evento, o mesmo já está sendo usado.','Informação',mtInformation,[mbOk],0);
            Exit;
         end;
      end;
      qryAux.Close;

   end;

   dbeCodInterno.Enabled := false;
   inherited;
   bbtnCancelarClick(self);
end;

procedure TfrmCadastroEventoRegularizacao.ChkDesativadoClick(
  Sender: TObject);
begin
   inherited;
   // Testa se a flag desativado foi marcada
   if (ChkDesativado.Checked) then
   begin
      if qry.state in [dsinsert, dsedit] then
         MsgDlg('O evento será desativado após essa marcação.','Informação',mtInformation,[mbOk],0);
   end;
end;

procedure TfrmCadastroEventoRegularizacao.CmeCadastroInsert(
  Sender: TObject);
begin
  inherited;
  qryFLGDESATIVADO.AsInteger := 0;
end;

procedure TfrmCadastroEventoRegularizacao.CmeCadastroCancel(
  Sender: TObject);
begin
  inherited;
  if trim(dbeCodInterno.text) = '' then
  begin
     qry.close;
     qry.ParamByName('IDCADEVENTO').AsInteger := 0;
     qry.Open;
  end;
end;

procedure TfrmCadastroEventoRegularizacao.CmeCadastroDelete(
  Sender: TObject);
begin
   qryAux.Close;
   qryAux.SQL.clear;
   qryAux.SQL.Add('SELECT 1 FROM HSTREGULARIZACAOFOLHA WHERE IDCADEVENTOSDEREGULARIZACAO = '+dbeCodInterno.Text);
   qryAux.Open;
   if (qryAux.Recordcount > 0) then
   begin
      MsgDlg('Não é permitido excluir esse evento, o mesmo já está sendo usado.','Informação',mtInformation,[mbOk],0);
      Exit;
   end;
   qryAux.Close;
   inherited;
end;

procedure TfrmCadastroEventoRegularizacao.sbtnInserirClick(
  Sender: TObject);
begin
  qry.close;
  qry.ParamByName('IDCADEVENTO').AsInteger := 0;
  qry.Open;

  inherited;
  HabilitaControles(true);
end;

procedure TfrmCadastroEventoRegularizacao.bbtnCancelarClick(
  Sender: TObject);
begin
  inherited;
  qry.close;
  sbtnApagar.Enabled  := false;
  sbtnAlterar.Enabled  := false;
  HabilitaControles(false);
end;

procedure TfrmCadastroEventoRegularizacao.CmeCadastroFind(Sender: TObject);
var btrouxe : boolean;
begin
  inherited;
  if MontaSelect.RetornouValor then
  begin
     dbeCodInterno.Enabled := true;
     qry.close;
     qry.ParamByName('IDCADEVENTO').AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],-1);
     qry.Open;
     dbeCodInterno.Enabled := false;

     qryCentroResp.close;
     qryCentroResp.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
     qryCentroResp.ParamByName('IDCADEVENTOSDEREGULARIZACAO').AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],-1);
     qryCentroResp.Open;

     qryCentroCusto.close;
     qryCentroCusto.ParamByName('IDUSUARIO').AsInteger := Sistema.IdUsuario;
     qryCentroCusto.ParamByName('IDCADEVENTOSDEREGULARIZACAO').AsInteger := StrToIntDef(MontaSelect.ValoresChave[0],-1);
     qryCentroCusto.Open;

     btrouxe := (qryCentroCusto.recordcount > 0);


  end;
end;

procedure TfrmCadastroEventoRegularizacao.sbtnProcurarClick(
  Sender: TObject);
begin
  HabilitaControles(true);
  inherited;
  bbtnCancelar.Enabled := true;
  HabilitaControles(false);
end;

procedure TfrmCadastroEventoRegularizacao.HabilitaControles(bHabilita: boolean);
begin
   dbeDescricao.Enabled    := bHabilita;
   ChkDesativado.Enabled   := bHabilita;
   dblkCentroResp.Enabled  := bHabilita;
   dbeCodRetorno.Enabled   := bHabilita;
   DblkCentroCusto.Enabled := bHabilita;
   dblkTipoDoc.Enabled     := bHabilita;
   dblkTipoDocRec.Enabled  := bHabilita;
end;

procedure TfrmCadastroEventoRegularizacao.sbtnAlterarClick(
  Sender: TObject);
begin

  inherited;
  HabilitaControles(true);
end;

procedure TfrmCadastroEventoRegularizacao.FormShow(Sender: TObject);
begin
   inherited;
   HabilitaControles(false);
end;

procedure TfrmCadastroEventoRegularizacao.dbeCodRetornoKeyPress(
  Sender: TObject; var Key: Char);
begin
   inherited;
   if not (Key in ['0'..'9', chr(8), chr(13)]) then
      Key:=#0;
end;

procedure TfrmCadastroEventoRegularizacao.dbeCodRetornoMouseDown(
  Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  try
     StrToInt(dbeCodRetorno.Text);
  except
     dbeCodRetorno.Text := '';
  end;
end;

procedure TfrmCadastroEventoRegularizacao.dbeCodRetornoExit(
  Sender: TObject);
begin
  inherited;
  try
     StrToInt(dbeCodRetorno.Text);
  except
     dbeCodRetorno.Text := '';
  end;
end;

end.
