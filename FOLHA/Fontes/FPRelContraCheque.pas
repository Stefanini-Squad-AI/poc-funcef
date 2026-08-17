unit FPRelContraCheque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MAHlpBtn, StdCtrls, Buttons, cmRepBtn, ExtCtrls, Db,
  DBTables, Wwquery, checklst, Spin, wwdblook, TB97, ComCtrls, TB97Tlbr,
  IvDictio, IvMulti, IvEMulti, FOkCancelar, Wwdatsrc, usistema, dbasedados;

type
  TfrmPRelContraCheque = class(TfrmOkCancelar)
    qryPlano: TwwQuery;
    qryPatro: TwwQuery;
    qrymotivo1: TwwQuery;
    pnlInformacoes: TPanel;
    Label22: TLabel;
    StaticText1: TStaticText;
    dblkpcmbmotivo1: TwwDBLookupCombo;
    Panel1: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    StaticText3: TStaticText;
    chklstPlano: TCheckListBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    lblhistorico: TLabel;
    dblkcmpHistorico: TwwDBLookupCombo;
    qryHistorico: TwwQuery;
    dsHistorico: TwwDataSource;
    cmbPatro: TwwDBLookupCombo;
    procedure FormActivate(Sender: TObject);
    procedure bbtnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure chklstPatroClickCheck(Sender: TObject);
    procedure rbtnVisualizarClick(Sender: TObject);
    procedure rbtnImprimirClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
    strPatro,
    strPlano : string;
    procedure CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
  public
    { Public declarations }
    function EmiteContraCheque(
      pMesReferencia, pMesPagamento, pStrPatro, pStrPlano,
      sTipoRel, sVia, sIdPessoa: string; aTabela:string;
      aFlgOk, aflgdefinitiva: Integer) : boolean;
  end;

var
  frmPRelContraCheque: TfrmPRelContraCheque;


implementation

uses
  UMensErro, UFuncoesFolha, dRelContraCheque, uFolhaBenef, fAguarde, uObjfolha, uAdmPrevFB;

{$R *.DFM}

procedure TfrmPRelContraCheque.CriaLista(chkListX : TCheckListBox; qryLista : TwwQuery);
begin
  chkListX.Items.Clear;
  with qryLista do
  begin
     while not eof do
     begin
        chkListX.Items.Add(FieldByName('Nome').AsString);
        Next;
     end;
  end;
end;

procedure TfrmPRelContraCheque.FormActivate(Sender: TObject);
begin
   inherited;
   qryPatro.Open;

   qryHistorico.close; qryHistorico.Open;

   // Preenche ChkList dos Planos
   chklstPlano.Items.Clear;
   with qryPlano do
   begin
      Close;
      SQl.Clear;
      SQL.Add('SELECT   IDPLANOPREV, NOME '+
              'FROM     PLANPREV '+
              'ORDER BY UPPER(NOME)');
      Open;
      while not eof do
      begin
         chklstPlano.Items.Add(FieldByName('Nome').AsString);
         Next;
      end;
   end;

end;

procedure TfrmPRelContraCheque.bbtnFecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPRelContraCheque.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryPatro.Close;
  qryPlano.Close;
end;

procedure TfrmPRelContraCheque.chklstPatroClickCheck(Sender: TObject);
var
  i    : integer;
begin
  inherited;
  //Preenche ChkList dos Planos da Patrocinadora Selecionada
  qryPlano.Close;
  qryPlano.SQL.Clear;
  strPatro := ' ';

  qryPlano.Open;
  CriaLista(chklstPlano,qryPlano);
end;

procedure TfrmPRelContraCheque.rbtnVisualizarClick(Sender: TObject);
var
  sMesAux,
  sAnoAux,
  sMesReferencia,
  sDataFolha,
  sMesPagamento,
  sAnoReferencia,
  sAnoPagamento   : string;
  i               : integer;
  xTabela:string;
  xFlgOk,xflgdefinitiva:Integer;
begin
  inherited;

  if Trim(dblkcmpHistorico.Text) = '' then
  begin
    MsgDlg('Versão não preenchida.','Erro',mtError,[mbOk,mbHelp],0);
    dblkcmpHistorico.SetFocus;
    Exit;
  end;

  // Preencher variaveis de Mes e Ano de Referencia e Mes e Ano de Pagamento
  if Trim(strPatro) <> ''
  then strPatro := Copy(strPatro, 1, Length(strPatro) - 2);

  // Preencher string com Id's dos planos selecionados
  strPlano := '';
  for i := 0 to chklstPlano.Items.Count - 1 do
  begin
     if not chklstPlano.checked[i] then continue;
     if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive,loPartialKey])
     then strPlano := strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
  end;//for

  if Trim(strPlano) <> ''
  then strPlano := Copy(strPlano, 1, Length(strPlano) - 2);

  xTabela:='HISTRUBSAL';
  xflgdefinitiva:=1;

  EmiteContraCheque(sMesReferencia, sMesPagamento,
		    strPatro,strPlano, 'P','1','',xTabela,xFlgOk,xflgdefinitiva);

end;

procedure TfrmPRelContraCheque.rbtnImprimirClick(Sender: TObject);
var
  sMesReferencia,
  sMesPagamento,
  sAnoReferencia,
  sAnoPagamento   : string;
  i               : integer;
  xTabela:String;
  xFlgOk, xflgdefinitiva:Integer;
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  dtmRelContraCheque.qryFundacao.Close;
  dtmRelContraCheque.qryFundacao.ParamByName('pFundacao').AsInteger:= iIdFundacao;
  dtmRelContraCheque.qryFundacao.Open;

  // Testar se motivo está preenchido
  if Trim(strPatro) <> ''
  then strPatro := Copy(strPatro, 1, Length(strPatro) - 2);

  // Preencher string com Id's dos planos selecionados
  strPlano := '';
  for i := 0 to chklstPlano.Items.Count - 1 do
  begin
     if not chklstPlano.checked[i] then continue;
     if qryPlano.Locate('Nome',chklstPlano.Items[i],[loCaseInsensitive,loPartialKey])
     then strPlano := strPlano + qryPlano.FieldByName('IdPlanoPrev').AsString+ ', ';
  end;//for

  if Trim(strPlano) <> ''
  then strPlano := Copy(strPlano, 1, Length(strPlano) - 2);

  xTabela:='HISTRUBSAL';

  EmiteContraCheque(sMesReferencia, sMesPagamento,
                    strPatro,strPlano, 'P','1','',xTabela,xFlgOk, xflgdefinitiva);

end;

function TfrmPRelContraCheque.EmiteContraCheque(
  pMesReferencia, pMesPagamento, pStrPatro, pStrPlano,
  sTipoRel, sVia, sIdPessoa: string; aTabela: string; aFlgOk,
  aflgdefinitiva: Integer): boolean;
var
  LinhaProvento : Integer;
  sSql, sMesCobranca, MontaSql : String;

begin
  Result         := False;
  MontaSql       := '';

  With dtmRelContraCheque.qrydemonstpag Do
  Begin
    Close;
    sSql := ' SELECT HST.IDRESPONSAVEL, HST.IDPLANOPREV, HST.IDPESSJUR, HST.MESCOBRANCA, '+
            ' PVD.IDPROVENTO, TIT.NOME AS TITULAR, BEN.NOME, PT.NOME AS PATROCINADORA, ';

    If SistemaFolha.FlgUsaCodRubExt = 0 Then
      sSql := sSql + ' PVD.IDPROVENTO AS CODIGO, PVD.DESCRICAO AS DESCRICAO, '
    Else
      sSql := sSql + ' PVD.CODPROVDESC AS CODIGO, PVD.DESCRPROVDESC AS DESCRICAO, ';

    sSql := sSql + ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, '+
                   ' PVD.FLGDESCONTO, PL.NOME AS PLANO, HST.NUMPROCINSS, '+
                   ' DECODE(PFI.FLGISENTOIRRF,1,''SIM'',''NÃO'') ISENTOIRRF, '+
                   ' PFI.NUMDEPIRRF, HST.NUMAGENCIA, HST.CONTACORRENTE, PVD.FLGESPECIAL, ';

    sSql := sSql + ' EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, EP.CEP, '+
                   ' EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, '+
                   ' CID.NOME AS CIDADE, EP.TIPOENDERECO, EP.NOME, '+
                   ' AGN.NOME AS AGENCIA, '+
                   ' DECODE(PVD.FLGDESCONTO,0,''PROVENTO'',1,''DESCONTO'',''INFORMATIVA'') AS PD, '+
                   ' DECODE(PVD.FLGDESCONTO,1,''D'',0,''P'',''I'') AS TPRUBRICA, ';

    If SistemaFolha.FLGAGRUPARUBRICA = 0 Then
      sSql := sSql + ' BC.NOME AS BANCO, '+
                     ' SUBSTR(HST.MES,6,2)||'+'''/'''+'||SUBSTR(HST.MES,1,4) AS MES, '+
                     ' HST.VALORPROVENTO, HST.DATAPAGAMENTO AS DATACREDITO, '+
                     ' DECODE(PVD.FLGDESCONTO,2,HST.VALORINFO||'' (I)'',0,NULL,1, '+
                     ' DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO,0, '+
                     ' DECODE(HST.VALORINFO,0,NULL,HST.VALORINFO||'' (I)''), '+
                     ' HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')) INFORMATIVO, '+
                     ' DECODE(PVD.FLGDESCONTO,0,HST.VALORPROVENTO,0.0) AS VLPROVENTO, '+
                     ' DECODE(PVD.FLGDESCONTO,1,HST.VALORPROVENTO,0.0) AS VLDESCONTO, '+
                     ' HST.VALORPROVENTO - HST.VALORRECEBIDO AS RESIDUO '

    Else
      sSql := sSql + ' BC.NOME AS BANCO, '+
                     ' SUBSTR(HST.MES,6,2)||'+'''/'''+'||SUBSTR(HST.MES,1,4) AS MES, '+
                     ' HST.MESCOBRANCA, HST.DATAPAGAMENTO AS DATACREDITO, '+
                     ' SUM(HST.VALORPROVENTO) VALORPROVENTO, '+
                     ' DECODE(PVD.FLGDESCONTO,2,SUM(HST.VALORINFO)||'' (I)'',0,NULL,1, '+
                     ' DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO),0, '+
                     ' DECODE(SUM(HST.VALORINFO),0,NULL,SUM(HST.VALORINFO)||'' (I)''), '+
                     ' SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')) INFORMATIVO, '+
                     ' SUM(DECODE(PVD.FLGDESCONTO,0,HST.VALORPROVENTO,0.0)) AS VLPROVENTO, '+
                     ' SUM(DECODE(PVD.FLGDESCONTO,1,HST.VALORPROVENTO,0.0)) AS VLDESCONTO, '+
                     ' SUM(HST.VALORPROVENTO - HST.VALORRECEBIDO) AS RESIDUO ';

    sSql := sSql + ' FROM HISTRUBSAL HST, ELEGPATRO ELP, PARTPREVPLAN PPP, PLANPREV PL, '+
                   ' PESSOA TIT, PESSOA BEN, PESSOAFISICA PFI, PROVDESC PVD, ENDPESS EP, '+
                   ' CONTABANCARIA CB, PESSOA BC, PESSOA AGN , PESSOA PT, '+
                   ' BANCO BCO, AGENCIABANCARIA AG, CIDADES CID, ESTADO EST ';

      sSql := sSql + ' WHERE HST.IDHSTFOLHABENEF = '+dblkcmpHistorico.LookupValue;

    If Trim(cmbPatro.Text) <> '' Then
      sSql := sSql + ' AND HST.IDPATRO = '+cmbPatro.LookupValue;

    If Trim(pStrPlano) <> '' Then
      sSql := sSql + ' AND HST.IDPLANOPREV IN (' + pStrPlano + ')';

    sSql := sSql +  ' AND HST.IDPLANOPREV = PL.IDPLANOPREV   ' +         // add trecho acima e comentado o trecho abaixo SOL 145036 Kintana 970354 
                    ' AND PVD.IDPROVENTO = HST.IDRUBRICA     ' +
                    ' AND ELP.IDPESSOA = HST.IDTITULAR       ' +
                    ' AND ELP.IDPESSJUR = HST.IDPATRO        ' +
                    ' AND PPP.IDPESSJUR = HST.IDPATRO        ' +
                    ' AND PPP.IDPLANOPREV = HST.IDPLANOPREV  ' +
                    ' AND PPP.IDPESSOA = HST.IDTITULAR       ' +
                    ' AND PPP.IDPESSJUR = PT.IDPESSOA        ' +
                    ' AND PPP.IDPESSOA = TIT.IDPESSOA        ' +
                    ' AND PFI.IDPESSOA = HST.IDRESPONSAVEL   ' +
                    ' AND EP.IDPESSOA(+) = HST.IDRESPONSAVEL ' +
                    ' AND BEN.IDENDCORRESP = EP.IDENDERECO   ' +
                    ' AND EP.IDCIDADES = CID.IDCIDADES(+)    ' +
                    ' AND EST.IDESTADO(+) = CID.IDESTADO     ' +
                    ' AND BEN.IDPESSOA = HST.IDRESPONSAVEL   ' +
                    ' AND CB.IDPESSOA = HST.IDRESPONSAVEL    ' +
                    ' AND cb.contacorrente = hst.contacorrente  ' +
                    ' AND AG.IDPESSOA = CB.IDAGENCIA      ' +
                    ' AND BCO.IDPESSOA = AG.IDBANCO       ' +
                    ' AND AGN.IDPESSOA = AG.IDPESSOA      ' +
                    ' AND BC.IDPESSOA = BCO.IDPESSOA      ' ;





   { ' AND HST.IDPLANOPREV = PL.IDPLANOPREV '+                 // comentado o trecho abaixo e add novo trecho acima SOL 145036 Kintana 970354
                   ' AND PVD.IDPROVENTO = HST.IDRUBRICA '+
                   ' AND ELP.IDPESSOA = HST.IDTITULAR '+
                   ' AND ELP.IDPESSJUR = HST.IDPATRO   '+
                   ' AND PPP.IDPESSJUR = HST.IDPATRO   '+
                   ' AND PPP.IDPLANOPREV = HST.IDPLANOPREV '+
                   ' AND PPP.IDPESSOA = HST.IDTITULAR '+
                   ' AND PPP.IDPESSJUR = PT.IDPESSOA '+
                   ' AND PPP.IDPESSOA  = TIT.IDPESSOA '+
                   ' AND PFI.IDPESSOA = HST.IDRESPONSAVEL '+
                   ' AND EP.IDPESSOA(+) = HST.IDRESPONSAVEL '+ 
                   (* IMPEDE QUE A QRY RETORNE 2 LINHAS *)
                   ' AND BEN.IDENDCORRESP = EP.IDENDERECO '+
                   (* --------------------------------- *)
                   ' AND EP.IDCIDADES = CID.IDCIDADES(+) '+
                   ' AND EST.IDESTADO(+) = CID.IDESTADO '+
                   ' AND BEN.IDPESSOA = HST.IDRESPONSAVEL '+
                   // Conta preferencial
                   ' AND ((RTRIM(HST.NUMBANCO) = BCO.NUMBANCO) OR (HST.NUMBANCO IS NULL)) '+
                   ' AND ((HST.NUMAGENCIA = AG.NUMAGENCIA) OR (HST.NUMAGENCIA IS NULL)) '+
                   ' AND CB.IDPESSOA = HST.IDRESPONSAVEL '+
                   ' AND CB.FLGCONTAPREF = 1 '+
                   ' AND AG.IDPESSOA = CB.IDAGENCIA '+
                   ' AND BC.IDPESSOA = AG.IDBANCO '+
                   ' AND AGN.IDPESSOA = AG.IDPESSOA '+
                   ' AND BC.IDPESSOA = BCO.IDPESSOA ';      }

    If SistemaFolha.FLGAGRUPARUBRICA = 0 Then
    Begin
      sSql := sSql + ' ORDER BY BEN.NOME, PVD.FLGDESCONTO, ';

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        sSql := sSql + ' PVD.IDPROVENTO '
      Else
        sSql := sSql + ' PVD.CODPROVDESC ';
    End
    Else
    Begin
      sSql := sSql + ' GROUP BY HST.MESCOBRANCA, ';

      If SistemaFolha.FlgUsaCodRubExt = 0 Then
        sSql := sSql + ' PVD.IDPROVENTO, PVD.FLGESPECIAL, HST.IDRESPONSAVEL, HST.IDPLANOPREV, '+
                       ' HST.IDPESSJUR, TIT.NOME, BEN.NOME, PT.NOME, PVD.IDPROVENTO, PVD.DESCRICAO, '+
                       ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, PVD.FLGDESCONTO, '+
                       ' PL.NOME, HST.NUMPROCINSS, PFI.FLGISENTOIRRF, '+
                       ' PFI.NUMDEPIRRF, HST.NUMAGENCIA, HST.CONTACORRENTE, BC.NOME, HST.MES, HST.MESCOBRANCA, '+
                       ' HST.DATAPAGAMENTO, EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, '+
                       ' EP.CEP, EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, CID.NOME, EP.TIPOENDERECO, '+
                       ' EP.NOME, AGN.NOME, DECODE(PVD.FLGDESCONTO, 1, ''D'', 0, ''P'', ''I'') '+
                       ' ORDER BY BEN.NOME, PVD.FLGDESCONTO, PVD.IDPROVENTO '
      Else
        sSql := sSql + ' PVD.CODPROVDESC, PVD.FLGESPECIAL, HST.IDRESPONSAVEL, HST.IDPLANOPREV, '+
                       ' HST.IDPESSJUR, TIT.NOME, BEN.NOME, PT.NOME, PVD.IDPROVENTO, PVD.DESCRPROVDESC, '+
                       ' ELP.MATRICULA, PPP.INSCRICAONUMERO, PFI.DATANASC, PVD.FLGDESCONTO, '+
                       ' PL.NOME, HST.NUMPROCINSS, PFI.FLGISENTOIRRF, '+
                       ' PFI.NUMDEPIRRF, HST.NUMAGENCIA, HST.CONTACORRENTE, BC.NOME, HST.MES, HST.MESCOBRANCA, '+
                       ' HST.DATAPAGAMENTO, EP.IDPESSOA, EP.IDENDERECO, EP.LOGRADOURO, '+
                       ' EP.CEP, EST.CODESTADO, EP.NUMERO, EP.COMPLEMENTO, EP.BAIRRO, CID.NOME, EP.TIPOENDERECO, '+
                       ' EP.NOME, AGN.NOME, DECODE(PVD.FLGDESCONTO, 1, ''D'', 0, ''P'', ''I'') '+
                       ' ORDER BY BEN.NOME, PVD.FLGDESCONTO, PVD.CODPROVDESC '
    End;

    SQL.Clear;
    SQL.Add(sSql);

    Open;

    If IsEmpty Then Begin
      frmAguarde.Apaga; //Coloquei esse código aqui porque essa janela não some quando a query retorna vazio
      MsgDlg('Não existem pessoas para Emissão de Contra Cheque com as opções selecionadas','Erro',mtError,[mbOk,mbHelp],0);
      ModalResult := mrNone;
      Exit;
    End;
  End; {With}

end;//FIM DA FUNÇÃO

procedure TfrmPRelContraCheque.BitBtn1Click(Sender: TObject);
Var i : Integer;
begin
  inherited;
   for i := 0 to chklstPlano.items.count-1 do
   begin
     chklstPlano.Checked[i] := true;
   end;
end;

procedure TfrmPRelContraCheque.BitBtn2Click(Sender: TObject);
Var i : Integer;
begin
  inherited;
  for i := 0 to chklstPlano.items.count-1 do
  begin
     chklstPlano.Checked[i] := not chklstPlano.checked[i];
  end;
end;

end.
{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2002 A 07/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|   - Foi colocado o teste de parâmetro para agrupar ou não por rubrica na qry |
|   do relatório a qryDemonstPag                                               |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: BRUNO BASTOS                                                  |
| PERÍODO DE IMPLEMENTAÇÃO: DE 19/08/2002 A 19/08/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (REFER)                                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|    - Sidnei pediu para trocar o join 'EP.IDPESSOA(+) = HST.IDPESSOA ', pelo  |
|    join 'EP.IDPESSOA(+) = HST.IDRESPONSAVEL'. Na qryDemonstPag no datamodule |
|    feito o mesmo.                                                            |
|------------------------------------------------------------------------------}



