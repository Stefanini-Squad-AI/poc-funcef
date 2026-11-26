{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FCadContaBanco;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, DBCtrls, Mask, TEdNum, CmEventosCadastro, ImgList, UFuncoesFolha,
  USistema, dBaseDados;

type
  TfrmCadContaBanco = class(TfrmCadMestreDetalheCS)
    qryDet: TwwQuery;
    updDet: TUpdateSQL;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    lblCPF: TLabel;
    dbedCPF: TDBEdit;
    lblDataNasc: TLabel;
    dbedDataNasc: TDBEdit;
    qryBanco: TwwQuery;
    qryAgencia: TwwQuery;
    rgrpTipoConta: TDBRadioGroup;
    dbgrpContaPref: TDBRadioGroup;
    qryDetIDCBANCARIA: TFloatField;
    qryDetCONTACORRENTE: TStringField;
    qryDetIDAGENCIA: TFloatField;
    qryDetFLGCONTAPREF: TFloatField;
    qryDetIDPESSOA: TFloatField;
    qryDetTIPOCONTA: TStringField;
    qryDetNOMEAGENCIA: TStringField;
    qryDetNOMEBANCO: TStringField;
    qryDetDESCTIPO: TStringField;
    qryIDPESSOA: TFloatField;
    qryNOME: TStringField;
    qryDetIDBANCO: TFloatField;
    qryDATANASC: TDateTimeField;
    qryNUMDOCUMENTO: TStringField;
    dbgrpContaConj: TDBRadioGroup;
    qryDetFLGCONTACONJUNTA: TStringField;
    GroupBox1: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbedContaBancaria: TDBEdit;
    dblkpcmbBanco: TwwDBLookupCombo;
    dblkpcmbAgencia: TwwDBLookupCombo;
    Label4: TLabel;
    edDigBanco: TEditNum;
    Label5: TLabel;
    edDigAgencia: TEditNum;
    qryDetNUMAGENCIA: TStringField;
    qryDetNUMBANCO: TStringField;
    medConta: TMaskEdit;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedContaBancariaExit(Sender: TObject);
    procedure dbgrpContaPrefChange(Sender: TObject);
    procedure dblkpcmbAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edDigAgenciaExit(Sender: TObject);
    procedure edDigBancoExit(Sender: TObject);
    procedure qryAgenciaAfterScroll(DataSet: TDataSet);
    procedure qryBancoAfterScroll(DataSet: TDataSet);
    procedure qryDetAfterEdit(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure CmeDetalheEdit(Sender: TObject);
    procedure CmeDetalheBeforeConfirma(sender: TObject;
      var Accept: Boolean);

  private
    { Private declarations }
    TipoAt: Char;
    iIdTitular, iIdPessoa : integer;
    sBcoAnt, sAgAnt, sCCAnt, sConjAnt: string;
    iTipoAnt, iPrefAnt : integer;
    Function JaExistePreferencial: boolean;  // by Alexandre - 31/08/2000
  public
    { Public declarations }
  end;

var
  frmCadContaBanco: TfrmCadContaBanco;

implementation

uses UDataBase, UMensErro, UCalcDV;

{$R *.DFM}

procedure TfrmCadContaBanco.qryDetAfterScroll(DataSet: TDataSet);
begin
  inherited;
  try
    sBcoAnt:=qryBanco.fieldbyname('numbanco').asstring;
  except
    sBcoAnt:='';
  end;
  try
    sAgAnt:=qryDet.fieldbyname('numagencia').asstring;
  except
    sAgAnt:='';
  end;
  try
    sCCAnt:=qryDet.fieldbyname('contacorrente').asstring;
  except
    sCCAnt:='';
  end;
  try
    iTipoAnt:=qryDet.fieldbyname('tipoconta').asinteger;
  except
    iTipoAnt:=-1;
  end;
  try
    iPrefAnt:=qryDet.fieldbyname('flgcontapref').asinteger;
  except
    iPrefAnt:=-1;
  end;
  try
    sConjAnt:=qryDet.fieldbyname('flgcontaconjunta').asstring;
  except
    sConjAnt:='';
  end;
end;

procedure TfrmCadContaBanco.CmeCadastroFind(Sender: TObject);
begin
  if MontaSelect.RetornouValor then
  begin
    try
      iIdPessoa:=strtoint(MontaSelect.ValoresChave[0]);
    except
      iIdPessoa:=0;
    end;
    try
      iIdTitular:=strtoint(MontaSelect.ValoresChave[1]);
    except
      iIDtitular:=0;
    end;

    qry.Close;
    qry.ParamByName('IdPessoa').Value:=iIdPessoa;
    qry.Open;

    qryBanco.Close;
    qryBanco.Open;

    qryAgencia.Close;
    qryAgencia.ParamByName('pIdBanco').AsInteger:=
      qryBanco.FieldbyName('IdPessoa').AsInteger;
    qryAgencia.Open;

    qryDet.Close;
    qryDet.ParamByName('IdPessoa').Value:=iIdPessoa;
    qryDet.Open;
  end;
end;

procedure TfrmCadContaBanco.CmeDetalheInsert(Sender: TObject);
begin
   inherited;
   qryDet.FieldByName('IdCBancaria').AsInteger := LeUltRegistro(nil,'CONTABANCARIA');
   qryDet.FieldByName('TIPOCONTA').AsInteger        := 1;
   qryDet.FieldByName('FLGCONTAPREF').AsInteger     := 0;
   qryDet.FieldByName('FLGCONTACONJUNTA').AsString  := 'N';
   edDigBanco.Text         := '';
   edDigAgencia.Text       := '';
   edDigBanco.SetFocus ;
end;

procedure TfrmCadContaBanco.CmeDetalheConfirma(Sender: TObject);
begin
  If QryDet.State In [DsEdit,DsInsert] Then
  Begin
    With qryDet Do
    begin
      FieldbyName('NomeBanco').AsString    := dblkpcmbBanco.Text;
      FieldbyName('NomeAgencia').AsString  := dblkpcmbAgencia.Text;
      FieldbyName('DESCTIPO').AsString     := rgrpTipoConta.Items.Strings[rgrpTipoConta.itemIndex];
      FieldByName('IdPessoa').AsInteger    := qry.FieldbyName('IdPessoa').AsInteger;
      inherited;
    end;
  End;

End;

procedure TfrmCadContaBanco.CmeCadastroConfirma(Sender: TObject);
 var sDescricao: string;
Begin
  Inherited;
  AplicaAlteracoes([QryDet]);
  Case TipoAt Of
    '0': sDescricao:='INCLUSÃO DA CONTA BANCÁRIA'+
           '- BCO: '+qryDet.fieldbyname('numbanco').asstring+
           '; AG: '+qryDet.fieldbyname('numagencia').asstring+
           '; CC: '+qryDet.fieldbyname('contacorrente').asstring;
    '1': begin
           sDescricao:='';
           if sBcoAnt <> qryBanco.fieldbyname('numbanco').asstring then
             sDescricao:=sDescricao+' DO BCO "'+sBcoAnt+
               '" PARA BCO "'+qryBanco.fieldbyname('numbanco').asstring+'";';
           if sAgAnt <> qryDet.fieldbyname('numagencia').asstring then
             sDescricao:=sDescricao+' DA AG "'+sAgAnt+
               '" PARA AG "'+qryDet.fieldbyname('numagencia').asstring+'";';
           if sCCAnt <> qryDet.fieldbyname('contacorrente').asstring then
             sDescricao:=sDescricao+' DA CC "'+sCCAnt+
               '" PARA CC "'+qryDet.fieldbyname('contacorrente').asstring+'";';
           if iTipoAnt <> qryDet.fieldbyname('tipoconta').asinteger then
             sDescricao:=sDescricao+' DO TIPO "'+rgrpTipoConta.items[iTipoAnt-1]+
               '" PARA TIPO "'+
               rgrpTipoConta.items[qryDet.fieldbyname('tipoconta').asinteger-1]+'";';
           if iPrefAnt <> qryDet.fieldbyname('flgcontapref').asinteger then
           begin
             if iPrefAnt = 0 then
               sDescricao:=sDescricao+' COLOCADA COMO PREFERENCIAL'+';'
             else
               sDescricao:=sDescricao+' RETIRADA DE PREFERENCIAL'+';';
           end;
           if sConjAnt <> qryDet.fieldbyname('flgcontaconjunta').asstring then
           begin
             if sConjAnt = 'N' then
               sDescricao:=sDescricao+' COLOCADA COMO CONJUNTA'+';'
             else
               sDescricao:=sDescricao+' RETIRADA DE CONJUNTA'+';';
           end;
           if sDescricao <> '' then
             sDescricao:='ALTERAÇÃO NA CONTA CORRENTE:'+sDescricao;
         end;
    '2': sDescricao:='EXCLUSÃO DA CONTA BANCÁRIA:'+
           '- BCO: '+qryDet.fieldbyname('numbanco').asstring+
           '; AG: '+qryDet.fieldbyname('numagencia').asstring+
           '; CC: '+qryDet.fieldbyname('contacorrente').asstring;
    else
      sDescricao:='';
  end;
  if sDescricao <> '' then
    FazerInsertFiario(QryDet.FieldByName('IdPessoa').AsInteger,
                      iIdTitular,
                      Sistema.IdUsuario,Sistema.IdModulo,
                      sDescricao);
End;

procedure TfrmCadContaBanco.dblkpcmbBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not qryBanco.Active then Exit;
  edDigBanco.text := '';

  qryAgencia.Close;
  qryAgencia.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
  qryAgencia.Open;
end;

procedure TfrmCadContaBanco.bbtnOkDetClick(Sender: TObject);
begin
  if Trim(dblkpcmbBanco.Text) = '' then
  begin
    MsgDlg('Selecione o Banco da Conta Bancária. ','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  if Trim(dblkpcmbAgencia.Text) = '' then
  begin
    MsgDlg('Selecione a Agência da Conta Bancária. ','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  if Trim(dbedContaBancaria.Text) = '' then
  begin
    MsgDlg('Informe a Conta Corrente. ','Erro',mtError,[mbOk,mbHelp],0);
    Exit;
  end;

  try
    CalculaDv := TCalcDv.Create;
    CalculaDV.TipoConta  := qryDetTIPOCONTA.AsInteger;
    if not CalculaDV.ValidaConta(qryBanco.FieldByName('NumBanco').AsString,
                                 qryAgencia.FieldByName('numagencia').AsString,
                                 dbedContaBancaria.Text, True) then
      Exit;
  finally
    CalculaDv.Free;
  end;
  inherited;
end;

procedure TfrmCadContaBanco.FormCreate(Sender: TObject);
begin
  inherited;
  qryAgencia.Close;
  qryAgencia.ParamByName('pIdBanco').AsInteger := qryBanco.FieldbyName('IdPessoa').AsInteger;
  qryAgencia.Open;
end;

procedure TfrmCadContaBanco.dbedContaBancariaExit(Sender: TObject);
begin
  inherited;
  try
    CalculaDv := TCalcDv.Create;
    CalculaDV.TipoConta  := rgrpTipoConta.ItemIndex + 1;
    if not CalculaDV.ValidaConta(qryBanco.FieldByName('NumBanco').AsString,
                                 qryAgencia.FieldByName('Numagencia').AsString,
                                 (Sender as TDBEdit).Text, True) then
      (Sender as TDBEdit).Text := '';
  finally
    CalculaDv.Free;
  end;
end;

function TfrmCadContaBanco.JaExistePreferencial: boolean;
 var iConta : integer;
begin
  Result := False;
  iConta := qryDet.FieldByName('IdCBancaria').AsInteger;
  qryDet.First;
  While not qryDet.EOF do
  begin
    if (qryDet.FieldByName('FLGCONTAPREF').AsInteger = 1)  AND
       (iConta <> qryDet.FieldByName('IdCBancaria').AsInteger) then
    begin
      Result := True;
      break;
    end;
    qryDet.Next;
  end;
  qryDet.Locate('IdCBancaria',iConta,[]);
  qryDet.Edit;
end;

procedure TfrmCadContaBanco.dbgrpContaPrefChange(Sender: TObject);
begin
  inherited;
  if (dbgrpContaPref.ItemIndex = 1) and (qryDet.State in [dsInsert, dsEdit]) then
  begin
    if JaExistePreferencial then
    begin
      MsgDlg('Já existe outra conta indicada como "Conta Preferencial". Verifique.', 'Erro',mtError,[mbOk],0);
      dbgrpContaPref.ItemIndex := 0;
      Exit;
    end;
  end;
end;

procedure TfrmCadContaBanco.dblkpcmbAgenciaCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  edDigAgencia.Text := '';
end;

procedure TfrmCadContaBanco.edDigAgenciaExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigAgencia.Text) = '' then Exit;
  if qryAgencia.Locate('NumAgencia',Trim(edDigAgencia.Text),
                       [loCaseInsensitive, loPartialKey]) then
  begin
    dblkpcmbAgencia.Text := qryAgencia.FieldByName('Agencia').AsString;
    dblkpcmbAgencia.PerformSearch;
  end;
end;

procedure TfrmCadContaBanco.edDigBancoExit(Sender: TObject);
begin
  inherited;
  if Trim(edDigBanco.Text) = '' then Exit;
  if qryBanco.Locate('NumBanco',Trim(edDigBanco.Text),
                     [loCaseInsensitive, loPartialKey]) then
  begin
    dblkpcmbBanco.Text := qryBanco.FieldByName('Banco').AsString;
    dblkpcmbBanco.PerformSearch;
  end;
end;

procedure TfrmCadContaBanco.qryAgenciaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryAgencia.Active then Exit;
  if (Trim(dblkpcmbAgencia.Text) = '') or (edDigAgencia.Text <> '') then Exit;
  edDigAgencia.Text := qryAgencia.FieldByName('NumAgencia').AsString;
end;

procedure TfrmCadContaBanco.qryBancoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryBanco.Active then Exit;
  qryAgencia.Close;
  qryAgencia.ParamByName('pIdBanco').AsInteger:=
    qryBanco.FieldbyName('IdPessoa').AsInteger;
  qryAgencia.Open;
  if (Trim(dblkpcmbBanco.Text) = '') or (edDigBanco.Text <> '') then Exit;
  edDigBanco.Text:=qryBanco.FieldByName('NumBanco').AsString;
end;

procedure TfrmCadContaBanco.qryDetAfterEdit(DataSet: TDataSet);
begin
  inherited;
  qryAgencia.Locate('IdPessoa',qryDet.FieldByName('IdAgencia').AsInteger,[]);
  dblkpcmbAgencia.Text:=qryAgencia.FieldByName('Agencia').AsString;
  qryBanco.Locate('IdPessoa',qryAgencia.FieldByName('IdBanco').AsInteger,[]);
  dblkpcmbBanco.Text:=qryBanco.FieldByName('Banco').AsString;
  edDigBanco.Text:=qryBanco.FieldByName('NumBanco').AsString;
  edDigAgencia.Text:=qryAgencia.FieldByName('NumAgencia').AsString;
end;

procedure TfrmCadContaBanco.sbtnInsDetClick(Sender: TObject);
begin
  inherited;
  TipoAt:='0';
end;

procedure TfrmCadContaBanco.sbtnAltDetClick(Sender: TObject);
begin
  inherited;
  TipoAt:='1';
end;

procedure TfrmCadContaBanco.sbtnExcluiDetClick(Sender: TObject);
begin
  inherited;
  TipoAt:='2';
end;

procedure TfrmCadContaBanco.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  //Bruno Bastos 19/12/2002 - Início
  if not dtmBaseDados.dbBaseDados.InTransaction then
    dtmBaseDados.dbBaseDados.StartTransaction;

  if not Sistema.GravaLogOperacoes('Cadastro de contas bancárias.') then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;
  //Bruno Bastos 19/12/2002 - Fim
end;

procedure TfrmCadContaBanco.CmeDetalheEdit(Sender: TObject);
 var maskcc: string;
begin
  inherited;
  maskcc:=qrybanco.fieldbyname('mascaracc').asstring;
  medconta.editmask:=maskcc+';0;_';
  medconta.Text:=qryDet.fieldbyname('CONTACORRENTE').asstring;
end;

procedure TfrmCadContaBanco.CmeDetalheBeforeConfirma(sender: TObject;
  var Accept: Boolean);
 var s: string;
begin
  s:=medconta.Text;
  showmessage(s);
  inherited;
end;

end.
{==============================================================================|
| UNIT: FCADCONTABANCO                                                         |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   CADASTRO DE CONTA BANCÁRIA DE RECEBEDORES                                  |
|                                                                              |
|==============================================================================|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 04.03.2002 A 04.03.2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: 3.02.12g                                                            |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ACERTO NA ALTERAÇÃO DAS CONTAS BANCÁRIAS DE BENEFICIÁRIOS.                 |
| - INCLUSÃO NO PROTOCOLO DAS OPERAÇÕES SOBRE AS CONTAS CORRENTES              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (SE REQUISITO FOI PEDIDO POR UM CLIENTE ESPECÍFICO)                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|==============================================================================}

