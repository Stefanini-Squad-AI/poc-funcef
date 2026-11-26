unit FCadContaBanco;

// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//--------------------------------------------------------------------------------------------------
//Pendência   : WO28422
//Responsável : Leandro
//Data        : 29/05/2026
//Descrição   : Alteração para melhorar desempenho da tela
//--------------------------------------------------------------------------------------------------
//Rotina      : dblkpcmbBancoExit
//Pendência   : SIG112273
//Responsável : Edilaine
//Data        : 06/01/2021
//Descrição   : Excluir validação de máscara para Caixa Economica
//--------------------------------------------------------------------------------------------------
//Rotina      : (dfm  ppmCaixa, qryBanco) dblkpcmbBancoCloseUp, bbtnOkDetClick, dbedContaBancariaExit
//              dbedContaBancariaEnter, dblkpcmbBancoExit, N001ContaCorrente1Click
//Pendência   : SIG100575
//Responsável : Edilaine
//Data        : 13/07/2020
//Descrição   : conta corrente nao estava respeitando mascara cadastrada para o banco
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 218836 KINTANA 2053023
//Responsável : Fernando Xavier  - William Santana
//Data        : 15/08/2014       - 03/12/2015
//Descrição   : Alteração em DFM
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 150721 KINTANA 1095824
//Responsável : BRUNO AZEVEDO
//Data        : 12/01/2011
//Descrição   : Ajuste no controle de transação.
//--------------------------------------------------------------------------------------------------
//Pendência   : SOL 137519 KINTANA 831220
//Responsável : BRUNO AZEVEDO
//Data        : 16/06/2010
//Descrição   : Ajuste no controle de transação ao fechar a tela.
//--------------------------------------------------------------------------------------------------
// Autor(a)    : Claudio Faria
// Data        : 12/09/2007
// Pendencia   : 21191 (ReAbertura)
// Rotina      : MontaSelect
// Alteração   : Alteração da query para buscar a matrícula do dependente
// -----------------------------------------------------------------------------
// Autor(a)    : Gleyber
// Data        : 20/03/2007
// Pendencia   : 21191
// Rotina      : MontaSelect
// Alteração   : Alteração da query para buscar a matrícula do dependente
// -----------------------------------------------------------------------------

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FCadMestreDetCS, IvDictio, IvMulti, IvEMulti, MontaSelect, DBTables, Db,
  Wwdatsrc, Wwquery, TB97Ctls, MAHlpBtn, TB97Tlbr, StdCtrls, Buttons, TB97,
  Grids, Wwdbigrd, Wwdbgrid, ComCtrls, TabControlDetalhe, ExtCtrls,
  wwdblook, DBCtrls, Mask, TEdNum, CmEventosCadastro, ImgList,
  USistema, dBaseDados, Menus, ADODB;

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
    qryAgenciaOld: TwwQuery;
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
    qryDetIDTITULAR: TFloatField;
    ppmCaixa: TPopupMenu;
    N001ContaCorrente1: TMenuItem;
    N002ContaCadernete1: TMenuItem;
    N003ContadePessoaJurdica1: TMenuItem;
    N004DepsitoJudicial1: TMenuItem;
    N635DepsitoJudicialIR1: TMenuItem;
    N013ContadePoupana1: TMenuItem;
    N022ContaCadernetedePoupanaPessoaJurdica1: TMenuItem;
    ConnADO: TADOConnection;
    QryAgencia: TADOQuery;
    Procedure CmeCadastroFind(Sender: TObject);
    Procedure CmeDetalheConfirma(Sender: TObject);
    Procedure CmeCadastroConfirma(Sender: TObject);
    Procedure CmeDetalheInsert(Sender: TObject);
    procedure dblkpcmbBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnOkDetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedContaBancariaExit(Sender: TObject);
    procedure dblkpcmbAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure edDigAgenciaExit(Sender: TObject);
    procedure edDigBancoExit(Sender: TObject);
    procedure qryAgenciaOldAfterScroll(DataSet: TDataSet);
    procedure qryBancoAfterScroll(DataSet: TDataSet);
    procedure qryDetAfterEdit(DataSet: TDataSet);
    procedure sbtnInsDetClick(Sender: TObject);
    procedure sbtnAltDetClick(Sender: TObject);
    procedure sbtnExcluiDetClick(Sender: TObject);
    procedure qryDetAfterScroll(DataSet: TDataSet);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedContaBancariaEnter(Sender: TObject);
    procedure N001ContaCorrente1Click(Sender: TObject);
    procedure dblkpcmbBancoExit(Sender: TObject);

  private
    { Private declarations }
    TipoAt: Char;
    iIdTitular, iIdPessoa : integer;
    sBcoAnt, sAgAnt, sCCAnt, sConjAnt: string;
    iTipoAnt, iPrefAnt : integer;
    Function JaExistePreferencial: boolean;
  public
    { Public declarations }
  end;

var
  frmCadContaBanco: TfrmCadContaBanco;

implementation

uses UDataBase, UMensErro, UCalcDV, uCtrlParamIntegra, uAutorizacao;    //edilaine SIg100575 //WO28422 Leandro

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

    //WO28422 Leandro - inicio 
    {qryBanco.Close;
    qryBanco.Open;

    qryAgencia.Close;
    qryAgencia.Parameters.ParamByName('pIdBanco').value:=
      qryBanco.FieldbyName('IdPessoa').AsInteger;
    qryAgencia.Open;
    }
    //WO28422 Leandro - fim

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
var
   qryAux : TwwQuery;
begin
  If QryDet.State In [DsEdit,DsInsert] Then
  Begin
    //Brunno Mattos - SOL 153260 - KTN 1167636 Inicio
    qryAux := TwwQuery.Create(Self);
    qryAux.DatabaseName :='BaseDados';

    qryAux.Sql.Add(' SELECT IDTITULAR FROM DEPENTIT ' +
                   ' WHERE  IDPESSOA = ' + qry.FieldbyName('IdPessoa').AsString);
    QryAux.Open;
    //Brunno Mattos - SOL 153260 - KTN 1167636 Fim
    With qryDet Do
    begin
      FieldbyName('NomeBanco').AsString    := dblkpcmbBanco.Text;
      FieldbyName('NomeAgencia').AsString  := dblkpcmbAgencia.Text;
      FieldbyName('DESCTIPO').AsString     := rgrpTipoConta.Items.Strings[rgrpTipoConta.itemIndex];
      FieldByName('IdPessoa').AsInteger    := qry.FieldbyName('IdPessoa').AsInteger;
      //Brunno Mattos - SOL 153260 - KTN 1167636 Inicio
      FieldByName('IDTITULAR').Value       := qryAux.FieldbyName('IdTitular').AsInteger;
      //Brunno Mattos - SOL 153260 - KTN 1167636 Fim
      inherited;
    end;
  End;

End;

procedure TfrmCadContaBanco.CmeCadastroConfirma(Sender: TObject);
 var sDescricao: string;
Begin
  qry.CancelUpdates;
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
End;

procedure TfrmCadContaBanco.dblkpcmbBancoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  if not qryBanco.Active then Exit;
  edDigBanco.text := '';

  qryAgencia.Close;
  qryAgencia.Parameters.ParamByName('pIdBanco').Value := qryBanco.FieldbyName('IdPessoa').AsInteger; //WO28422 Leandro  
  qryAgencia.Open;

  dblkpcmbBancoExit(Sender);    //edilaine SIG100575
end;

procedure TfrmCadContaBanco.bbtnOkDetClick(Sender: TObject);
Var qryPreferencial : TwwQuery;
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

  if dbgrpContaPref.ItemIndex = 1 then
  begin
     qryPreferencial := TwwQuery.Create(Nil);

     qryPreferencial.close;
     qryPreferencial.DatabaseName := 'BaseDados';
     qryPreferencial.sql.Clear;
     qryPreferencial.sql.Add(' SELECT COUNT(CONTABANCARIA.FLGCONTAPREF) FLGCONTAPREF ');
     qryPreferencial.sql.Add(' FROM   CONTABANCARIA, PESSOA A,PESSOA B, AGENCIABANCARIA, BANCO ');
     qryPreferencial.sql.Add(' WHERE  CONTABANCARIA.IDPESSOA   = ' + qry.FieldByName('IDPESSOA').AsString );
     qryPreferencial.sql.Add(' AND    CONTABANCARIA.IDAGENCIA  = A.IDPESSOA ');
     qryPreferencial.sql.Add(' AND    CONTABANCARIA.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA ');
     qryPreferencial.sql.Add(' AND    AGENCIABANCARIA.IDBANCO  = B.IDPESSOA ');
     qryPreferencial.sql.Add(' AND    AGENCIABANCARIA.IDBANCO  = BANCO.IDpessoa ');
     qryPreferencial.sql.Add(' AND    CONTABANCARIA.FLGCONTAPREF = 1 ');
     qryPreferencial.open;

     if qryPreferencial.FieldByName('FLGCONTAPREF').AsInteger > 0 then
     begin
        MsgDlg('Conta preferencial já cadastrada.','Erro',mtError,[mbOk,mbHelp],0);
        dbgrpContaPref.ItemIndex := 0;
        dbgrpContaPref.SetFocus;
        FreeAndNil(qryPreferencial);
        Abort;
     end;
     FreeAndNil(qryPreferencial);
  end;

  if rgrpTipoConta.ItemIndex < 3 then
  begin
     if Trim(dbedContaBancaria.Text) = '' then
     begin
        MsgDlg('Informe a Conta Corrente. ','Erro',mtError,[mbOk,mbHelp],0);
        Exit;
     end;

     try
       CalculaDv := TCalcDv.Create;     //edilaine SIG112273
       //edlaine SIG100575 : inicio
       If (qryBanco.FieldByName('FLGVALIDACC').AsString <> 'N') Then
       begin
         CalculaDV.TipoConta  := qryDetTIPOCONTA.AsInteger;
         if not CalculaDV.ValidaConta(qryBanco.FieldByName('NumBanco').AsString,
                                      qryAgencia.FieldByName('numagencia').AsString,
                                      dbedContaBancaria.Text, True) then
           Exit;
       end;
       //edlaine SIG100575 : fim
     finally
       CalculaDv.Free;
     end;
  End;

  inherited;
end;

procedure TfrmCadContaBanco.FormCreate(Sender: TObject);
begin
  ConnADO.Close;                                                //WO28422 Leandro  
  ConnADO.ConnectionString := Autorizacao.getStringConexaoADO;  //WO28422 Leandro  
  ConnADO.Open;                                                 //WO28422 Leandro   

  inherited;
end;

procedure TfrmCadContaBanco.dbedContaBancariaExit(Sender: TObject);
begin
  inherited;
  CalculaDv := TCalcDv.Create;         //edilaine SIG100575
  try
    If (qryBanco.FieldByName('FLGVALIDACC').AsString <> 'N') Then   //edilaine SIG100575
    begin
      CalculaDV.TipoConta  := rgrpTipoConta.ItemIndex + 1;
      if not CalculaDV.ValidaConta(qryBanco.FieldByName('NumBanco').AsString,
                                   qryAgencia.FieldByName('Numagencia').AsString,
                                   (Sender as TDBEdit).Text, True) then
         dbedContaBancaria.Text := '';                 //edilaine SIG100575
        //(Sender as TDBEdit).Text := '';              //edilaine SIG100575
    end;
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

procedure TfrmCadContaBanco.qryAgenciaOldAfterScroll(DataSet: TDataSet);
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
  //WO28422 Leandro  inicio
  //qryAgencia.Close;
  //qryAgencia.ParamByName('pIdBanco').AsInteger:=
  //  qryBanco.FieldbyName('IdPessoa').AsInteger;
  //qryAgencia.Open;
  //WO28422 Leandro  fim
  if (Trim(dblkpcmbBanco.Text) = '') or (edDigBanco.Text <> '') then Exit;
  edDigBanco.Text:=qryBanco.FieldByName('NumBanco').AsString;
end;

procedure TfrmCadContaBanco.qryDetAfterEdit(DataSet: TDataSet);
begin
  inherited;
  //WO28422 Leandro Inicio
  
  //qryBanco.Locate('IdPessoa',qryAgencia.FieldByName('IdBanco').AsInteger,[]);
  qryBanco.Locate('IdPessoa',qryDet.FieldByName('IdBanco').AsInteger,[]);
  dblkpcmbBanco.Text:=qryBanco.FieldByName('Banco').AsString;

  qryAgencia.Close;
  qryAgencia.Parameters.ParamByName('pIdBanco').value:=
  qryBanco.FieldbyName('IdPessoa').AsInteger;
  qryAgencia.Open;

  qryAgencia.Locate('IdPessoa',qryDet.FieldByName('IdAgencia').AsInteger,[]);
  dblkpcmbAgencia.Text:=qryAgencia.FieldByName('Agencia').AsString;

  //WO28422 Leandro  fim

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
  //if not dtmBaseDados.dbBaseDados.InTransaction then
  //  dtmBaseDados.dbBaseDados.StartTransaction;

  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
  //if not Sistema.GravaLogOperacoes('Cadastro de contas bancárias.', True) then
  //  Raise Exception.Create('Não foi possível gravar o log.')
  //else
  //  dtmBaseDados.dbBaseDados.Commit;
  //BRUNO AZEVEDO SOL 150721 KINTANA 1095824
  Sistema.GravaLogOperacoes('Cadastro de contas bancárias.', True);
end;

procedure TfrmCadContaBanco.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220
  if (dtmBaseDados.dbBaseDados.InTransaction) Then Begin
    dtmBaseDados.dbBaseDados.RollBack;
  end;
  //BRUNO AZEVEDO SOL 137519 KINTANA 831220

  ConnADO.Close; //WO28422 Leandro

end;

//edilaine SIG100575 : inicio
procedure TfrmCadContaBanco.dbedContaBancariaEnter(Sender: TObject);
begin
  inherited;
  If (qryBanco.FieldByName('NUMBANCO').AsString = '104') Then
     dbedContaBancaria.PopupMenu :=  ppmCaixa
  Else
     dbedContaBancaria.PopupMenu :=  nil;
end;

procedure TfrmCadContaBanco.N001ContaCorrente1Click(Sender: TObject);
Var
  sTipoConta: String;
begin
  inherited;
  sTipoConta := Copy(IntToStr(TMenuItem(Sender).Tag),2,3);

  qryDet.FieldByName('CONTACORRENTE').AsString := sTipoConta;
  dbedContaBancaria.SelStart := 3;
  dbedContaBancaria.SelLength := 1;

  Case StrToIntDef(sTipoConta,0) of
    1, 3, 4, 635: qryDet.FieldByName('TIPOCONTA').AsInteger := 1;
    2, 13, 22: qryDet.FieldByName('TIPOCONTA').AsInteger := 3;
  End;
end;

procedure TfrmCadContaBanco.dblkpcmbBancoExit(Sender: TObject);
begin
  inherited;
  If (ParamIntegra.MascaraAgencia = '') Then
  Begin
     If (Not qryBanco.FieldByName('MASCARAAGENCIA').IsNull) and
        (qryBanco.FieldByName('NUMBANCO').AsString <> '104') Then     //edilaine SIG112273
        qryDet.FieldByName('NUMAGENCIA').EditMask := qryBanco.FieldByName('MASCARAAGENCIA').AsString + ';' + MaskNoSave + '; '
     Else
        qryDet.FieldByName('NUMAGENCIA').EditMask := '';
  End
  Else
     qryDet.FieldByName('NUMAGENCIA').EditMask := ParamIntegra.MascaraAgencia;

  If (Not qryBanco.FieldByName('MASCARACC').IsNull) and
     (qryBanco.FieldByName('NUMBANCO').AsString <> '104') Then        //edilaine SIG112273
     qryDet.FieldByName('CONTACORRENTE').EditMask := qryBanco.FieldByName('MASCARACC').AsString + ';' + MaskNoSave + '; '
  Else
     qryDet.FieldByName('CONTACORRENTE').EditMask := '';

  qryDet.FieldByName('NOMEBANCO').AsString := qryBanco.FieldByName('BANCO').AsString;
  qryDet.FieldByName('NUMBANCO').AsString := qryBanco.FieldByName('NUMBANCO').AsString;
end;
//edilaine SIG100575 : fim

end.

