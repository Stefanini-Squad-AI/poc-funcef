unit FPRelCredBenef;

interface

uses
  Windows    , Messages, SysUtils, Classes, Graphics   , Controls, Forms   , Dialogs ,
  FOkCancelar, Db      , DBTables, Wwquery, MontaSelect, StdCtrls, checklst,  TB97   ,
  registry   ,wwdblook , IvDictio, IvMulti, IvEMulti   , MAHlpBtn, Buttons , TB97Tlbr,
  ExtCtrls, dbasedados, usistema;

type
   TfrmPRelCredBenef = class(TfrmOkCancelar)
    grpMesRef             : TGroupBox;
    dblkfolha             : TwwDBLookupCombo;
    qryHist               : TwwQuery;
    pnlOpcoes             : TPanel;
    Label2                : TLabel;
    edass2                : TEdit;
    edass1                : TEdit;
    qryBanco              : TwwQuery;
    MontaSelectBanco       : TMontaSelect;
    qryRefBen             : TwwQuery;
    cboxBanco: TCheckBox;
    cboxAgencia: TCheckBox;
    lkpBanco: TwwDBLookupCombo;
    lkpAgencia: TwwDBLookupCombo;
    qryAgencia: TwwQuery;
    qryBancoNOME: TStringField;
    qryAgenciaNUMAGENCIA: TStringField;
    qryAgenciaNOME: TStringField;
    qryBancoIDPESSOA: TFloatField;
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lkpBancoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure lkpAgenciaCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure cboxAgenciaClick(Sender: TObject);
    procedure cboxBancoClick(Sender: TObject);
  private
    sIDBeneficiario, sIDBanco, sCPF: string;
    Registry: TRegistry;
    procedure GravaDiretorioCAP;
    procedure CredBenefBeneficio;
    { Private declarations }
  public
    { Public declarations }
  end;
  Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
            Lista: TStringList; Chave, Descricao:String);

var
  frmPRelCredBenef   : TfrmPRelCredBenef;
  i                  : integer;
  LstBanco, Lstbenef : TStringList;
  sBanco1, sbenef1   : String;

implementation

uses UMensErro, uAdmPrevFB, UFuncoesFolha, UFuncoesUteisFB, dRelFolha, fAguarde, uObjFolha;

{$R *.DFM}

procedure TfrmPRelCredBenef.CredBenefBeneficio;
Var sSql: String;
begin
  ssql:='SELECT DISTINCT ';
  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql + ' PD.DESCRICAO AS NOME, '
  else
    sSql:=sSql + ' PD.DESCRPROVDESC AS NOME, ';
  sSql:=sSql +
    '     SUM(DECODE(PRD.FLGDESCONTO,0,DECODE(PRD.FLGESPECIAL,0,HST.VALORPROVENTO,0),DECODE(PRD.FLGESPECIAL,0,HST.VALORPROVENTO*-1,0))) VLBENEFPGTO '+
    'FROM '+
    '     HISTRUBSAL    HST , CONTABANCARIA CB , PROVDESC      PRD  , ELEGPATRO       ELP , '+
    '     PESSOA        BEN , PESSOAFISICA  PF , BANCO         BC   , AGENCIABANCARIA AG  , '+
    '     DOCUMENTO     DC  , PORTADORFORMA POF, PORTADORCONTA POC  , PESSOA          BANP, '+
    '     PESSOA        PJR , PESSOA        AGE, BANCO         BCPAG, AGENCIABANCARIA AGP , '+
    '     BENEFPLANPREV BPP , PESSOA        FUN, PESSOA        BAN  , PESSOA          AGEP, '+
    '     TIPODOCRECPAG TDRP, PROVDESC      PD '+
    'WHERE '+
    '      (HST.IDHSTFOLHABENEF =  '+dblkfolha.lookupvalue+')  AND '+
    '      (PRD.FLGESPECIAL    <> 2)                  AND '+
    '      (CB.FLGCONTAPREF     = 1)                  AND '+
    '      (PF.IDPESSOA         = BEN.IDPESSOA)       AND '+
    '      (PRD.IDPROVENTO      = HST.IDRUBRICA)      AND '+
    '      (ELP.IDPESSJUR       = HST.IDPATRO)        AND '+
    '      (ELP.IDPESSOA        = HST.IDPESSOA)       AND '+
    '      (FUN.IDPESSOA        = HST.IDPESSJUR)      AND '+
    '      (PJR.IDPESSOA        = HST.IDPATRO)        AND '+
    '      (BEN.IDPESSOA        = HST.IDPESSOA)       AND '+
    '      (DC.CODPORTFORMA     = POF.CODPORTFORMA)   AND '+
    '      (HST.CODDOCUMENTO    = DC.CODDOCUMENTO)    AND '+
    '      (HST.IDRUBRICA       = PD.IDPROVENTO)      AND '+
    '      (PF.IDPESSOA         = BPP.IDPESSOA(+))    AND '+
    '      (BPP.CODTIPDOC       = TDRP.CODTIPDOC(+))  AND '+
    '      (HST.IDPESSOA        = CB.IDPESSOA(+))     AND '+
    '      (CB.IDAGENCIA        = AG.IDPESSOA(+))     AND '+
    '      (AG.IDBANCO          = BC.IDPESSOA(+))     AND '+
    '      (AG.IDPESSOA         = AGE.IDPESSOA(+))    AND '+
    '      (BC.IDPESSOA         = BAN.IDPESSOA(+))    AND '+
    '      (POF.CODPORTADOR     = POC.CODPORTADOR(+)) AND '+
    '      (POC.IDBANCO         = BANP.IDPESSOA(+))   AND '+
    '      (POC.IDAGENCIA       = AGEP.IDPESSOA(+))   AND '+
    '      (POC.IDBANCO         = BCPAG.IDPESSOA(+))  AND '+
    '      (POC.IDAGENCIA       = AGP.IDPESSOA(+)) ';

  // Filtragem por Banco: cboxBanco.Checked
  if lkpBanco.Text <> '' then
    sSql:=sSql+' AND (BC.IDPESSOA = '+lkpBanco.LookupValue+') ';

  // Filtragem por Agencia: cboxAgencia.Checked
  if lkpAgencia.text <> '' then
    sSql:=sSql+' AND (AG.NUMAGENCIA = '+QuotedStr(lkpAgencia.LookupValue)+') ';

  If SistemaFolha.FlgUsaCodRubExt = 0 then
    sSql:=sSql+' GROUP BY PD.DESCRICAO '+
               ' ORDER BY PD.DESCRICAO '
  else
    sSql:=sSql+' GROUP BY PD.DESCRPROVDESC '+
               ' ORDER BY PD.DESCRPROVDESC ';

  dtmRelFolha.qryCredBenefBeneficio.Sql.Clear;
  dtmRelFolha.qryCredBenefBeneficio.Sql.Add(sSql);
end;

procedure TfrmPRelCredBenef.GravaDiretorioCAP;
begin
  // Gravar as chaves do Registro
  Registry.RootKey := HKEY_CURRENT_USER;
  if Registry.OpenKey('Software\CM\Folha de Benefícios\',true) then
  begin
    Registry.WriteString('Funcao Assinatura 1',trim(edass1.Text));
    Registry.WriteString('Funcao Assinatura 2',trim(edass2.Text));
  end;
  Registry.CloseKey;
end;

procedure TfrmPRelCredBenef.FormCreate(Sender: TObject);
var wDia, wMes, wAno : Word;
begin
  inherited;
  // Ler as chaves do Registro
  Registry:=TRegistry.Create;
  Registry.RootKey:=HKEY_CURRENT_USER;
  if Registry.OpenKey('Software\CM\Folha de Benefícios\',true) then
  begin
    edass1.Text := Registry.ReadString('Funcao Assinatura 1');
    edass2.Text := Registry.ReadString('Funcao Assinatura 2');
  end;
  Registry.CloseKey;

  qryBanco.Open;
   // default mes/ano
   DecodeDate(Date, wAno, wMes, wDia);

  qryHist.close;
  qryHist.SQL.Clear;
  qryHist.SQL.Add(
    'SELECT IDHSTFOLHABENEF, '+
           'IDHSTFOLHABENEF||'' - ''||HISTORICO AS HISTORICO, '+
           'MESREFERENCIA '+
    'FROM HSTFOLHABENEF '+
    'WHERE FLGESTADO <> 2 '+
    'AND IDFUNDACAO = '+inttostr(iidfundacao)+' '+
    'ORDER BY IDHSTFOLHABENEF DESC ');
  qryHist.open;
end;

Procedure CriaLista(ChkList:TCheckListBox; Query:TwwQuery;
                           Lista: TStringList; Chave, Descricao:String);
Begin
  Lista.Clear;
  While Not Query.Eof Do
  Begin
    ChkList.Items.Add(Query.FieldByName(Descricao).AsString);
    Lista.Add(Query.FieldByName(Chave).AsString);
    Query.Next;
  End;
End;

procedure TfrmPRelCredBenef.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qrybanco.close;
  qryhist.close;
  qryRefBen.close;
  Action := caFree;
end;

procedure TfrmPRelCredBenef.rbtnVisualizarClick(Sender: TObject);
var
  i                    : Integer;
  sSql, sMesReferencia : String;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Inicializa variáveis
  sBanco1 := '';
  sbenef1 := '';
  // Testa Histórico
  if Trim(dblkfolha.Text) = '' then
  begin
    MsgDlg('Histórico não preenchido.', 'ERRO', mtError, [mbOk,mbHelp],0);
    dblkfolha.SetFocus;
    ModalResult := mrNone;
    Exit;
  end;

  GravaDiretorioCAP;

  with dtmRelFolha do
  begin
    // Query do Relatório Principal
    qryCredBenef.Close;
    qryCredBenef.SQL.Clear;
    qryCredBenef.SQL.Add(
      'SELECT '+
      '       DECODE(TDRP.DESCRICAO,NULL,''DOC. NÃO CADASTRADO !'',TDRP.DESCRICAO) AS DOCUMENTO, '+
      '       PJR.NOME       AS PATROCINADORA, '+
      '       BAN.NOME       AS BANCO        , '+
      '       BC.NUMBANCO                    , '+
      '       AGE.NOME       AS AGENCIA      , '+
      '       AG.NUMAGENCIA                  , '+
      '       BEN.NUMDOCUMENTO               , '+
      '       DT.NUMSEQUENCIA                , '+
      '       BEN.NOME                       , '+
      '       POF.DESCRICAO  AS BANCOPAGADOR , '+
      '       HST.DATAPAGAMENTO              , '+
      '       HST.MESCOBRANCA                , '+
      '       HST.CODDOCUMENTO               , '+
      '       ELP.MATRICULA                  , '+
      '       CB.CONTACORRENTE               , '+
      '       BANP.NOME      AS NOMEBANCOPAG , '+
      '       AGEP.NOME      AS NOMEAGENCPAG , '+
      '       AGP.NUMAGENCIA AS NUMAGENCIAPAG, '+
      '       BCPAG.NUMBANCO AS NUMBANCOPAG  , '+
      '       POC.NOCONTACORR                , '+
      '       SUM(DECODE(PRD.FLGDESCONTO,0,DECODE(PRD.FLGESPECIAL,0,HST.VALORPROVENTO,0),DECODE(PRD.FLGESPECIAL,0,HST.VALORPROVENTO*-1,0))) SUMLIQ '+
      'FROM '+
      '     HISTRUBSAL    HST, CONTABANCARIA CB , PROVDESC      PRD  , ELEGPATRO       ELP , '+
      '     PESSOA        BEN, PESSOAFISICA  PF , BANCO         BC   , AGENCIABANCARIA AG  , '+
      '     DOCUMENTO     DC , PORTADORFORMA POF, PORTADORCONTA POC  , PESSOA          BANP, '+
      '     PESSOA        PJR, PESSOA        AGE, BANCO         BCPAG, AGENCIABANCARIA AGP , '+
      '     BENEFPLANPREV BPP, PESSOA        FUN, PESSOA        BAN  , PESSOA          AGEP, '+
      '     TIPODOCRECPAG TDRP,DEPENTIT DT '+
      'WHERE '+
      ' (HST.IDHSTFOLHABENEF =  '+dblkfolha.lookupvalue+')  AND '+
      ' (HST.FLGESTORNO = 0 OR HST.FLGESTORNO IS NULL) AND '+
      ' (PRD.FLGESPECIAL  <> 2)                 AND '+
      ' (CB.FLGCONTAPREF  = 1)                  AND '+
      ' (PF.IDPESSOA      = BEN.IDPESSOA)       AND '+
      ' (PRD.IDPROVENTO   = HST.IDRUBRICA)      AND '+
      ' (ELP.IDPESSJUR    = HST.IDPATRO)        AND '+
      ' (ELP.IDPESSOA     = HST.IDPESSOA)       AND '+
      ' (FUN.IDPESSOA     = HST.IDPESSJUR)      AND '+
      ' (PJR.IDPESSOA     = HST.IDPATRO)        AND '+
      ' (BEN.IDPESSOA     = HST.IDPESSOA)       AND '+
      ' (DC.CODPORTFORMA  = POF.CODPORTFORMA)   AND '+
      ' (HST.CODDOCUMENTO = DC.CODDOCUMENTO)    AND '+
      ' (PF.IDPESSOA      = BPP.IDPESSOA(+))    AND '+
      ' (BPP.CODTIPDOC    = TDRP.CODTIPDOC(+))  AND '+
      ' (HST.IDPESSOA     = CB.IDPESSOA(+))     AND '+
      ' (CB.IDAGENCIA     = AG.IDPESSOA(+))     AND '+
      ' (AG.IDBANCO       = BC.IDPESSOA(+))     AND '+
      ' (AG.IDPESSOA      = AGE.IDPESSOA(+))    AND '+
      ' (BC.IDPESSOA      = BAN.IDPESSOA(+))    AND '+
      ' (POF.CODPORTADOR  = POC.CODPORTADOR(+)) AND '+
      ' (POC.IDBANCO      = BANP.IDPESSOA(+))   AND '+
      ' (POC.IDAGENCIA    = AGEP.IDPESSOA(+))   AND '+
      ' (POC.IDBANCO      = BCPAG.IDPESSOA(+))  AND '+
      ' (POC.IDAGENCIA    = AGP.IDPESSOA(+))    AND '+
      ' (DT.IDTITULAR     = HST.IDTITULAR)      AND '+         
      ' (DT.IDPESSOA      = BEN.IDPESSOA) ');

    // Filtragem por Banco: cboxBanco.Checked
    if lkpBanco.Text <> '' then
      qryCredBenef.SQL.Add('	AND (BC.IDPESSOA = '+lkpBanco.LookupValue+') ');

    // Filtragem por Agencia: cboxAgencia.Checked
    if lkpAgencia.text <> '' then
      qryCredBenef.SQL.Add('	AND (AG.NUMAGENCIA = '+QuotedStr(lkpAgencia.LookupValue)+') ');

    qryCredBenef.SQL.Add(
      '/*------------------------------------------------------------------------------------------*/ '+
      'GROUP BY HST.CODDOCUMENTO, POF.DESCRICAO  , BAN.NOME      , AGE.NOME        , HST.DATAPAGAMENTO, '+
      '         HST.MESCOBRANCA , ELP.MATRICULA  , PJR.NOME      , BEN.NUMDOCUMENTO, DT.NUMSEQUENCIA  , '+
      '         BEN.NOME         , CB.CONTACORRENTE, AG.NUMAGENCIA  , BC.NUMBANCO   , BANP.NOME       , AGEP.NOME        , '+
      '         BCPAG.NUMBANCO  , POC.NOCONTACORR, AGP.NUMAGENCIA, TDRP.DESCRICAO '+
      '/*------------------------------------------------------------------------------------------*/ '+
      'ORDER BY TDRP.DESCRICAO, PJR.NOME  , BC.NUMBANCO, AG.NUMAGENCIA');

    CredBenefBeneficio;

    // * * * Alteração para rodar o Rel. por Banco.

    ppLabelVersao.Caption          := sbenef1;
    rpCredBenefLabel9.caption      := 'Versão:' + dblkFolha.Text;
    rpCredBenefAgenLabel10.caption := 'Versão:' + dblkFolha.Text;
    frmAguarde.Mostra('Aguarde... Montando Relatório!')
  end;
end;

procedure TfrmPRelCredBenef.lkpBancoCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // Verifica se foi selecionado algum banco.
  if lkpBanco.LookupValue <> '' then
  begin
    if not cboxBanco.Checked then cboxBanco.Checked := true;
    // Filtra a Agencia.
    qryAgencia.Close;
    qryAgencia.Prepare;
    qryAgencia.Params[0].Value := qryBancoIDPESSOA.Value;
    qryAgencia.Open;
  end;
end;

procedure TfrmPRelCredBenef.lkpAgenciaCloseUp(Sender: TObject; LookupTable,
  FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  // Verifica se foi selecionado alguma Agencia.
  if lkpAgencia.LookupValue <> '' then
  begin
    IF not cboxAgencia.Checked then cboxAgencia.Checked := true;
  end;
end;

procedure TfrmPRelCredBenef.cboxAgenciaClick(Sender: TObject);
begin
  inherited;
  // controla o checkbox
  if (lkpBanco.Text = '') then
    cboxAgencia.Checked := false;

  // controla o lookup
  lkpAgencia.Enabled := cboxAgencia.Checked;
  if not cboxAgencia.Checked then
    lkpAgencia.LookupValue := '';
end;

procedure TfrmPRelCredBenef.cboxBancoClick(Sender: TObject);
begin
  inherited;
  qryBanco.Active := cboxBanco.Checked;
  cboxAgencia.Enabled := cboxBanco.Checked;
  if not cboxBanco.Checked then
  begin
    cboxAgencia.Checked := false;
    lkpBanco.LookupValue := '';
    lkpAgencia.LookupValue := '';
  end;
end;

end.
{------------------------------------------------------------------------------|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FLAVIO DIAS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 15/05/2002 A 15/05/2002                         |
| VERSÃO PARA LIBERAÇÃO: 3.02.12q                                              |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - INCLUSÃO DA CLAÚSULA (DT.IDTITULAR = HST.IDTITULAR) NA QUERY DO RELATORIO  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei B Marins.                                              |
| PERÍODO DE IMPLEMENTAÇÃO: DE 22/07/2002 A 22/07/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FUNCEF  - Pendencia 7664.                                           |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Modificação para exibir código/descrição externa |                                                                              |
|  conforme a parametrização na tabela PARAMAPREV.                             |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2003 A 10/07/2003                         |
| PENDÊNCIA: 14488                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------}

