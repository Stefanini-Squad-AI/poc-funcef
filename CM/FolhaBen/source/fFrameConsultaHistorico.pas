{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit fFrameConsultaHistorico;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, DBCtrls, Mask,
  wwdbedit, Grids, Wwdbigrd, Wwdbgrid, ExtCtrls, uComumFolha, ComCtrls;

type
  TfrmFrameConsultaHistorico = class(TFrame)
    qryPrevia: TwwQuery;
    dsPrevia: TwwDataSource;
    dsRubricasDetalhe: TwwDataSource;
    qryRubricasDetalhe: TwwQuery;
    qryAux: TwwQuery;
    dsFator: TDataSource;
    qryFator: TwwQuery;
    dsSelecao: TwwDataSource;
    qrySelecao: TwwQuery;
    qrySelecaoIDHSTFOLHABENEF: TFloatField;
    qrySelecaoMESCOBRANCA: TStringField;
    qrySelecaoDATAPAGAMENTO: TDateTimeField;
    qrySelecaoHISTORICO: TStringField;
    pnlFundo: TPanel;
    PnlValores: TPanel;
    LblProventos: TLabel;
    LblDescontos: TLabel;
    LblValLiquido: TLabel;
    pnlProventos: TPanel;
    pnlDescontos: TPanel;
    pnlLiquido: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    dbgDetalhe: TwwDBGrid;
    wwDBGrid1: TwwDBGrid;
    PnlDetalhes: TPanel;
    LblDataNasc: TLabel;
    LblNumDep: TLabel;
    LblBanco: TLabel;
    LblAgencia: TLabel;
    LblContaCorrente: TLabel;
    LblArqTxt: TLabel;
    LblPortForma: TLabel;
    LblSitucao: TLabel;
    lblVersaoEstorno: TLabel;
    dbedPortForma: TwwDBEdit;
    dbedVersaoEstorno: TwwDBEdit;
    dbedSituacao: TwwDBEdit;
    dbedDataNasc: TwwDBEdit;
    dbedNumDepIR: TwwDBEdit;
    dbchIsentoIR: TDBCheckBox;
    dbedBanco: TwwDBEdit;
    dbedAgencia: TwwDBEdit;
    dbedContaCorrente: TwwDBEdit;
    dbedNomeArqTxt: TwwDBEdit;
    PnlSRB: TPanel;
    pnlMostraSRB: TPanel;
    lblValorSRB: TLabel;
    lblValorINSS: TLabel;
    lblSuplementacao: TLabel;
    pnlValorSRB: TPanel;
    pnlValorINSS: TPanel;
    pnlValorSupl: TPanel;
    PnlHistorico: TPanel;
    dbgHistorico: TwwDBGrid;
    DBGridRecebedor: TwwDBGrid;
    Splitter1: TSplitter;
    edtDtInicio: TEdit;
    edtDtFinal: TEdit;
    lblDtInicio: TLabel;
    lblDtFinal: TLabel;
    chkBenefProvisorio: TDBCheckBox;
    procedure qrySelecaoAfterScroll(DataSet: TDataSet);
    procedure qryPreviaAfterOpen(DataSet: TDataSet);
    procedure DBGridRecebedorRowChanged(Sender: TObject);
    procedure DBGridRecebedorColEnter(Sender: TObject);
    procedure DBGridRecebedorColExit(Sender: TObject);
  private
    { Private declarations }
    rtotprov: Real;
    rtotdesc: Real;
    sMesCobranca: string;
    iFlgUsaCodRubExt, iFlgAgrupaRub : Integer;
    iIdTitular: integer;
    bPrimeiro: boolean;
    actcontrol: TWinControl;
    Procedure MontaQryMaster;
    Procedure MontaQryMasterAgrupado;
    Procedure MontaQryDet;
    Procedure MontaQryDetAgrupado;
    function MontaConsulta: boolean;
    procedure MostraValores;
    procedure MostraSRB;
    procedure MostraMensagem(sMsg: string);
    function ExecutaMestre(aidTitular: integer; asMesCob: string) : boolean;
    function ExecutaDetalhe(aidTitular: integer; asMesCob: string) : boolean;
  public
    { Public declarations }
    procedure ResetaFrame;
    procedure MontaQry;
    function ExecutaConsulta(aidTitular: integer): boolean;
  end;

implementation

{$R *.DFM}

function TfrmFrameConsultaHistorico.ExecutaDetalhe(aidTitular: integer;
  asMesCob: string): boolean;
begin
  result:=false;

  qryRubricasDetalhe.close;
  qryFator.Close;

  if (aidTitular = 0) or (asMesCob = '') then exit;

  qryRubricasDetalhe.ParamByName('IDTITULAR').asinteger:=aidTitular;
  qryRubricasDetalhe.ParamByName('IDFOLHA').AsInteger:=qrySelecao.FieldByName('IDHSTFOLHABENEF').AsInteger;
  qryFator.ParamByName('pidTitular').asinteger:=aidTitular;
  qryFator.ParamByName('IDFOLHA').AsInteger:=qrySelecao.FieldByName('IDHSTFOLHABENEF').AsInteger;

//P.RAMOS - 11.02.2003 - TRATA SEMPRE OS RECEBEDORES
  //If ComumFolha.FlgAgrupaRubrica = 1 Then
  //Begin
    qryRubricasDetalhe.ParamByName('IDPESSOA').AsInteger:=qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger;
    qryFator.ParamByName('PIDPESSOA').AsInteger:=qryPrevia.Fieldbyname('IDRESPONSAVEL').AsInteger;
  //End
  //Else
  //Begin
    //qryRubricasDetalhe.ParamByName('IDPESSOA').AsInteger:=qryPrevia.Fieldbyname('IDPESSOA').AsInteger;
    //qryFator.ParamByName('PIDPESSOA').AsInteger:=qryPrevia.Fieldbyname('IDPESSOA').AsInteger;
  //End;
//P.RAMOS - 11.02.2003 - ATÉ AQUI

  Try
    rtotprov := 0;
    rtotdesc := 0;
    qryRubricasDetalhe.open;
    qryFator.Open;
    //Bruno Bastos - 24/03/2004 - Início
    If iFlgUsaCodRubExt = 0 Then
    Begin
      qryRubricasDetalhe.fieldbyname('CODRUBRICA').Visible    := True;
      qryRubricasDetalhe.fieldbyname('CODRUBRICAEXT').Visible := False;
    End
    Else
    Begin
      qryRubricasDetalhe.fieldbyname('CODRUBRICA').Visible    := False;
      qryRubricasDetalhe.fieldbyname('CODRUBRICAEXT').Visible := True;
    End;
    //Bruno Bastos - 24/03/2004 - Fim

    (qryRubricasDetalhe.fieldbyname('VALORPROVENTO') as tfloatfield).DisplayFormat:='#0.00';
    (qryRubricasDetalhe.fieldbyname('VALORDESCONTO') as tfloatfield).DisplayFormat:='#0.00';

    qryRubricasDetalhe.disablecontrols;
    while Not qryRubricasDetalhe.Eof do
    begin
      rtotprov := rtotprov + qryRubricasDetalhe.FieldByName('VALORPROVENTO').AsFloat;
      rtotdesc := rtotdesc + qryRubricasDetalhe.FieldByName('VALORDESCONTO').AsFloat;
      qryRubricasDetalhe.Next;
    end;
    qryRubricasDetalhe.First;
    qryRubricasDetalhe.enablecontrols;
    Mostravalores;

    //P.RAMOS - 26.06.2002
    if pnlSRB.Visible then
      MostraSRB;
    //P.RAMOS - 26.06.2002
  except
    Raise;
  end;
  Result := Not qryRubricasDetalhe.IsEmpty;
end;

function TfrmFrameConsultaHistorico.ExecutaMestre(aidTitular: integer;
  asMesCob: string): boolean;
begin
  pnlLiquido.Caption   := '';
  pnlProventos.Caption := '';
  pnlDescontos.Caption := '';
  pnlLiquido.Update;
  pnlProventos.Update;
  pnlDescontos.Update;
  qryPrevia.Close;
  qryPrevia.ParamByName('IDFOLHA').asinteger:=qrySelecao.FieldByName('IDHSTFOLHABENEF').AsInteger;
  qryPrevia.ParamByName('IDTITULAR').asinteger:=aidTitular;
  //Bruno Bastos - 24/03/2004 - if ComumFolha.FlgAgrupaRubrica = 0 Then
  if iFlgAgrupaRub = 0 Then //Bruno Bastos - 24/03/2004
    qryPrevia.ParamByName('MESCOB').AsString:=asMesCob;
  qryPrevia.open;
  Result:=not qryPrevia.IsEmpty;
//  dblkRecebedor.Text:=qryPrevia.FieldByName('BENEFICIARIO').AsString;
end;

function TfrmFrameConsultaHistorico.MontaConsulta: boolean;
begin
  sMesCobranca:=qryselecao.fieldbyname('MESCOBRANCA').asstring;
  result:=true;
  if not ExecutaMestre(iIdTitular, sMesCobranca) then
  begin
    result:=false;
    //If sMatricula <> '' then
     // MsgDlg('Não existe Beneficiários no histórico para o Titular escolhido (Matric:'+sMatricula+').', 'ERRO', mtError, [mbOk,mbHelp],0);
    //If sInscricao <> '' then
     // MsgDlg('Não existe Beneficiários no histórico para o Titular escolhido (Insc:'+sInscricao+').', 'ERRO', mtError, [mbOk,mbHelp],0);
    qryselecao.close;
    Exit;
  end;
  Mostravalores;
end;

procedure TfrmFrameConsultaHistorico.MontaQryDet;
Begin
  qryRubricasDetalhe.SQL.Clear;
  qryRubricasDetalhe.SQL.Add(
  'SELECT MES, IDPESSOA, ORDEM, FLGDESCONTO, CODIRRFDARF, FLGIRRF, FLGSALFAM, '+
         'VALORPROVENTO, VALORDESCONTO, INFORMATIVO, CODRUBRICA, RUBRICA, CODRUBRICAEXT '+
  'FROM (SELECT HST.MES, HST.IDPESSOA, MIN(HST.SEQRUBRICA) AS ORDEM, '+
               'PRD.FLGDESCONTO, PRD.CODIRRFDARF, HST.FLGIRRF, HST.FLGSALFAM, '+
               'SUM(DECODE(PRD.FLGDESCONTO, 0, HST.VALORPROVENTO, NULL)) VALORPROVENTO, '+
               'SUM(DECODE(PRD.FLGDESCONTO, 1, HST.VALORPROVENTO, NULL)) VALORDESCONTO, '+
  //P.RAMOS 24.01.2003 - ALTERAÇÃO NO DECODE DO VALOR INFORMATIVO
  //P.RAMOS 02.08.2002 - ADAPTANDO A QUERY PARA RUBRICAS INFORMATIVAS PROVENTO OU DESCONTO
  //' DECODE(PRD.FLGESPECIAL,                                                 '+
  //'   0,DECODE(PRD.FLGDESCONTO,                                             '+
  //'       2, SUM(HST.VALORINFO)||'' (I)'',                                  '+
  //'       0, NULL,                                                          '+
  //'       1, DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO),               '+
  //'            0, DECODE(SUM(HST.VALORINFO),                                '+
  //'                 0, NULL, SUM(HST.VALORINFO)||'' (I)''),                 '+
  //'   SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')),                 '+
  //'   SUM(HST.VALORINFO)||'' (I)'') INFORMATIVO,                            ');
  //P.RAMOS - 02.09.2002 - ATÉ AQUI
               'DECODE(PRD.FLGESPECIAL, '+
                 '0, DECODE(PRD.FLGDESCONTO, '+
                      '2, NVL(SUM(HST.VALORINFO),SUM(HST.VALORPROVENTO))||'' (I)'', '+
                      '0, NULL, '+
                      '1, DECODE(SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO), '+
                           '0, DECODE(NVL(SUM(HST.VALORINFO),0), '+
                                '0, NULL, '+
                                'SUM(HST.VALORINFO)||'' (I)''), '+
                           'SUM(HST.VALORRECEBIDO-HST.VALORPROVENTO)||'' (R)'')'+
                      '), '+
                 //P.RAMOS - 20.02.2003 - VINCULADA A PENDENCIA 11932 PARA EXIBIR
                                        //CORRETAMENTE O VALOR INFORMATIVO
                 //'SUM(NVL(HST.VALORINFO,HST.VALORPROVENTO))||'' (I)'') INFORMATIVO, ');
                 'DECODE(SUM(HST.VALORPROVENTO),0,SUM(HST.VALORINFO), '+
                   'SUM(NVL(HST.VALORPROVENTO,HST.VALORINFO)))||'' (I)'') INFORMATIVO, ');
  //P.RAMOS 24.01.2003 - ALTERAÇÃO NO DECODE DO VALOR INFORMATIVO - ATÉ AQUI

//início - andré tavares - 05/02/2003 - pendência 16058
  qryRubricasDetalhe.SQL.Add(' HST.IDRUBRICA AS CODRUBRICA, ');
  qryRubricasDetalhe.SQL.Add(' PRD.CODPROVDESC AS CODRUBRICAEXT,');
  qryRubricasDetalhe.SQL.Add(' PRD.DESCRICAO AS RUBRICA ');

{
  If ComumFolha.FLGUSACODRUBEXT = 0 Then
    qryRubricasDetalhe.SQL.Add(' HST.IDRUBRICA AS CODRUBRICA , PRD.DESCRICAO AS RUBRICA ')
  Else
    qryRubricasDetalhe.SQL.Add(' PRD.CODPROVDESC AS CODRUBRICA , PRD.DESCRPROVDESC AS RUBRICA ');
}
//fim - andré tavares - 05/02/2003 - pendência 16058

  qryRubricasDetalhe.SQL.Add(
                       ' FROM HISTRUBSAL HST, PROVDESC PRD '+
                       ' WHERE (HST.IDHSTFOLHABENEF = :IDFOLHA) ' +
                       ' AND (HST.IDTITULAR = :IDTITULAR) '+
                       ' AND (HST.IDRESPONSAVEL = :IDPESSOA) '+
                       ' AND (PRD.IDPROVENTO = HST.IDRUBRICA) ');

  //Bruno Bastos - 24/03/2004 - If ComumFolha.FLGUSACODRUBEXT = 0 Then
  If iFlgUsaCodRubExt = 0 Then //Bruno Bastos - 24/03/2004
    qryRubricasDetalhe.SQL.Add(
    ' GROUP BY                                                                '+
    ' HST.MES,       HST.IDRUBRICA,  PRD.CODIRRFDARF, PRD.FLGDESCONTO,        '+
    ' PRD.DESCRICAO, HST.FLGIRRF,    HST.FLGSALFAM,   HST.IDPESSOA,           '+
    //P.RAMOS 02.09.2002 - ADAPTANDO A QUERY PARA RUBRICAS INFORMATIVAS PROVENTO OU DESCONTO
    ' PRD.FLGESPECIAL, PRD.CODPROVDESC)')
    //P.RAMOS - 02.09.2002 - ATÉ AQUI
  Else
    qryRubricasDetalhe.SQL.Add(
    ' GROUP BY                                                                '+
    ' HST.MES,           PRD.CODPROVDESC, PRD.CODIRRFDARF, PRD.FLGDESCONTO,   '+
    ' PRD.DESCRPROVDESC, HST.FLGIRRF,     HST.FLGSALFAM,   HST.IDPESSOA,      '+
    //P.RAMOS 02.09.2002 - ADAPTANDO A QUERY PARA RUBRICAS INFORMATIVAS PROVENTO OU DESCONTO
    ' PRD.FLGESPECIAL, HST.IDRUBRICA, PRD.DESCRICAO)');

    //P.RAMOS - 02.09.2002 - ATÉ AQUI
  qryRubricasDetalhe.SQL.Add(' ORDER BY ORDEM, CODRUBRICA');
  qryRubricasDetalhe.prepare;
End;

procedure TfrmFrameConsultaHistorico.MontaQryDetAgrupado;
Begin
  qryRubricasDetalhe.Sql.clear;
  qryRubricasDetalhe.Sql.add(
    'SELECT DISTINCT HST.MES, HST.IDPESSOA, HST.VALORPROVENTO AS IDPROVENTO, '+
    'DECODE(PRD.FLGDESCONTO,0,HST.VALORPROVENTO,NULL) VALORPROVENTO, '+
    'DECODE(PRD.FLGDESCONTO,1,HST.VALORPROVENTO,NULL) VALORDESCONTO, '+
    'PRD.FLGDESCONTO, HST.SEQRUBRICA AS ORDEM, PRD.CODIRRFDARF, '+
    //P.RAMOS 24.01.2003 - ALTERAÇÃO NO DECODE DO VALOR INFORMATIVO
    //P.RAMOS 02.09.2002 - ADAPTANDO A QUERY PARA RUBRICAS INFORMATIVAS PROVENTO OU DESCONTO
    //' DECODE(PRD.FLGESPECIAL, '+
    //'   0,DECODE(PRD.FLGDESCONTO, '+
    //'       2, HST.VALORINFO||'' (I)'', '+
    //'       0, NULL, '+
    //'       1, DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO, '+
    //'            0, DECODE(HST.VALORINFO, '+
    //'                 0, NULL, HST.VALORINFO||'' (I)''), '+
    //'   HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')), '+
    //'   HST.VALORINFO||'' (I)'') INFORMATIVO, '+
    //P.RAMOS - 02.09.2002 - ATÉ AQUI
    'DECODE(PRD.FLGESPECIAL, '+
      '0,DECODE(PRD.FLGDESCONTO, '+
          '2, NVL(HST.VALORINFO,HST.VALORPROVENTO)||'' (I)'', '+
          '0, NULL, '+
          '1, DECODE(HST.VALORRECEBIDO-HST.VALORPROVENTO, '+
               '0, DECODE(NVL(HST.VALORINFO,0), '+
                    '0, NULL, '+
                    'HST.VALORINFO||'' (I)''), '+
               'HST.VALORRECEBIDO-HST.VALORPROVENTO||'' (R)'')'+
          '), '+
      //P.RAMOS - 20.02.2003 - VINCULADA A PENDENCIA 11932 PARA EXIBIR
                             //CORRETAMENTE O VALOR INFORMATIVO
      //'NVL(HST.VALORINFO,HST.VALORPROVENTO)||'' (I)'') INFORMATIVO, '+
      'DECODE(HST.VALORPROVENTO,0,HST.VALORINFO, '+
         'NVL(HST.VALORPROVENTO,HST.VALORINFO))||'' (I)'') INFORMATIVO, '+
    //P.RAMOS 24.01.2003 - ALTERAÇÃO NO DECODE DO VALOR INFORMATIVO - ATÉ AQUI
    'HST.FLGIRRF, HST.FLGSALFAM, ');

//início - andré tavares - 05/02/2003 - pendência 16058
  qryRubricasDetalhe.SQL.Add(' HST.IDRUBRICA AS CODRUBRICA, ');
  qryRubricasDetalhe.SQL.Add(' PRD.CODPROVDESC AS CODRUBRICAEXT,');
  qryRubricasDetalhe.SQL.Add(' PRD.DESCRICAO AS RUBRICA ');
{
  if ComumFolha.FLGUSACODRUBEXT = 0 then
    qryRubricasDetalhe.Sql.Add(' HST.IDRUBRICA AS CODRUBRICA, PRD.DESCRICAO AS RUBRICA ')
  else
    qryRubricasDetalhe.Sql.Add(' PRD.CODPROVDESC AS CODRUBRICA, PRD.DESCRPROVDESC AS RUBRICA ');
}
//fim - andré tavares - 05/02/2003 - pendência 16058

  qryRubricasDetalhe.Sql.add
   (' FROM HISTRUBSAL HST, PROVDESC PRD '+
    ' WHERE ' +
    ' (HST.IDHSTFOLHABENEF = :IDFOLHA) ' +
    ' AND (HST.IDTITULAR  = :IDTITULAR) '+
//P.RAMOS - 11.02.2003 - TRATA SEMPRE OS RECEBEDORES
//    ' AND (HST.IDPESSOA   = :IDPESSOA) '+
    ' AND (HST.IDRESPONSAVEL = :IDPESSOA) '+
    ' AND (PRD.IDPROVENTO = HST.IDRUBRICA) '+
//    ' AND (PRD.FLGESPECIAL <> 2) '+ // P.RAMOS - FUNCEF - 12.01.2004
    //P.RAMOS 24.01.2003 - ALTERAÇÃO NO ORDER BY
    //' ORDER BY PRD.FLGDESCONTO, ORDEM ');
    ' ORDER BY ORDEM ');
  qryRubricasDetalhe.prepare;
end;

procedure TfrmFrameConsultaHistorico.MontaQryMaster;
// Query Master sem opção de abono e não agrupada
begin
  qryPrevia.Sql.clear;
  qryprevia.Sql.Add(
  'SELECT '+
  ' DISTINCT PJR.NOME AS PATROCINADORA, TIT.NOME AS TITULAR, '+
  ' ELG.MATRICULA, '+
  ' BEN.NOME AS BENEFICIARIO, '+
  ' PLP.NOME AS PLANO, '+
  ' PPP.INSCRICAONUMERO, '+
  ' DECODE(HST.FLGESTORNO, '+
  '         Null, ''PAGAMENTO NORMAL'', '+
  '         0,    ''PAGAMENTO NORMAL'', '+
  '         1,    ''PAGAMENTO PENDENTE'', '+
  '         2,    ''PAGAMENTO PENDENTE EM PROCESSO DE PREVIA'', '+
  '         3,    ''PAGAMENTO PENDENTE PAGO NOVAMENTE (REENVIADO PARA CAP)'', '+
  '         9,    ''PAGAMENTO INDEVIDO ESTORNADO'') AS SITUACAO, '+
  ' HST.IDVERSAOPAGTO, '+
  ' SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),7,4)||SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),3,3) AS DATAPAGAMENTO, '+
  //P.RAMOS - 07.08.2003 - PEND.14796
  ' NVL(HST.NUMDEPIRRF,NVL(PSF.NUMDEPIRRF,0)) AS NUMDEPIRRF, '+
  ' NVL(HST.FLGISENTOIRRF,NVL(PSF.FLGISENTOIRRF,0)) AS FLGISENTOIRRF, '+
  //P.RAMOS - 07.08.2003 - PEND.14796 - ATÉ AQUI
  ' PSF.DATANASC, '+
//P.RAMOS - 11.02.2003 - MOSTRAR APENAS OS RECEBDORES
  ' HST.IDRESPONSAVEL, '+
//  ' HST.IDPESSOA, '+
  ' HST.MESCOBRANCA, '+
  ' HST.IDPESSJUR, '+
  ' HST.NUMBANCO, '+
  ' HST.NUMAGENCIA, '+
  ' HST.CONTACORRENTE, '+
  //Bruno Bastos 13/05/2002 Início
  ' HFCAP.NOMETXT, '+
  ' PTF.DESCRICAO '+
  //Bruno Bastos 13/05/2002 Fim
  'FROM HISTRUBSAL HST, '+
  ' PARTPREVPLAN PPP, '+
  ' ELEGPATRO ELG, '+
  ' PESSOAFISICA PSF, '+
  ' PESSOA PJR, '+
  ' PESSOA TIT, '+
  ' PESSOA BEN, '+
  ' PLANPREV PLP, '+
  //Bruno Bastos 13/05/2002 Início
  ' HSTFOLHABENEFCAP HFCAP, '+
  ' PORTADORFORMA PTF '+
  //Bruno Bastos 13/05/2002 Fim
  'WHERE '+
  '(HST.IDHSTFOLHABENEF     = :IDFOLHA) '+
  'AND (PJR.IDPESSOA        = HST.IDPATRO) '+
  'AND (HST.IDTITULAR       = :IDTITULAR) '+
  'AND (HST.IDHSTFOLHABENEF = HFCAP.IDHSTFOLHABENEF(+))'+
  //Bruno Bastos 13/05/2002 Início
  'AND (HST.CODDOCUMENTO    = HFCAP.CODDOCUMENTO(+)) '+
  'AND (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+)) '+
  //Bruno Bastos 13/05/2002 Fim
  'AND (PPP.IDPESSJUR       = HST.IDPATRO) '+

  //P.RAMOS - 21.08.2003 - INIBIDO PROVISORIAMENTE.
  //  O JOIN DEVE SER COM PLANOORIGEM. AVALIAR SE ESTE DEVE ENTRAR NA PREVIA
//  'AND (PPP.IDPLANOPREV     = HST.IDPLANOPREV) '+

  'AND (PPP.IDPESSOA        = HST.IDTITULAR) '+

// início - André Tavares - 13/01/2003 - pendência 15109 - pega por default o plano ativo do participante
  'AND ( (HST.IDPLANOPREV = PPP.IDPLANOPREV AND HST.IDPESSOA = HST.IDTITULAR) '+
  'OR (HST.IDPLANOORIGEM = PPP.IDPLANOPREV AND HST.IDPESSOA <> HST.IDTITULAR) ) '+
// fim - André Tavares - 13/01/2003 - pendência 15109 - pega por default o plano ativo do participante



  'AND (TIT.IDPESSOA        = HST.IDTITULAR) '+
  'AND (BEN.IDPESSOA        = HST.IDRESPONSAVEL) '+
  'AND (PLP.IDPLANOPREV     = HST.IDPLANOPREV) '+
  'AND (ELG.IDPESSOA        = HST.IDTITULAR) '+
  //P.RAMOS - 25.09.2001
  'AND (ELG.IDPESSJUR       = HST.IDPATRO) '+
  'AND (PSF.IDPESSOA        = BEN.IDPESSOA) ');
  qryPrevia.ParamByName('IDTITULAR').datatype:=ftinteger;
  qryPrevia.ParamByName('IDFOLHA').datatype:=ftinteger;
  qryPrevia.prepare;
end;

procedure TfrmFrameConsultaHistorico.MontaQryMasterAgrupado;
begin
  qryPrevia.sql.clear;
  qryPrevia.sql.add(
  'SELECT DISTINCT HST.MESCOBRANCA, '+
  //Bruno Bastos 05/09/2002 ' HST.MES, '+
//P.RAMOS - 11.02.2003 - MOSTRAR APENAS OS RECEBDORES
  ' HST.IDRESPONSAVEL, '+
//  ' HST.IDPESSOA, '+
  ' PJR.NOME AS PATROCINADORA, '+
  ' TIT.NOME AS TITULAR, '+
  ' ELG.MATRICULA, '+
  ' BEN.NOME AS BENEFICIARIO, '+
  ' PLP.NOME AS PLANO, '+
  ' PPP.INSCRICAONUMERO, '+
  ' SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),7,4)||SUBSTR(TO_CHAR(HST.DATAPAGAMENTO,''DD/MM/YYYY''),3,3) AS DATAPAGAMENTO, '+
  //P.RAMOS - 07.08.2003 - PEND.14796
  ' NVL(HST.NUMDEPIRRF,NVL(PSF.NUMDEPIRRF,0)) AS NUMDEPIRRF, '+
  ' NVL(HST.FLGISENTOIRRF,NVL(PSF.FLGISENTOIRRF,0)) AS FLGISENTOIRRF, '+
  //P.RAMOS - 07.08.2003 - PEND.14796 - ATÉ AQUI
  //P.RAMOS - 27.06.2002
  ' DECODE(HST.FLGESTORNO, '+
  '         Null, ''PAGAMENTO NORMAL'', '+
  '         0,    ''PAGAMENTO NORMAL'', '+
  '         1,    ''PAGAMENTO PENDENTE'', '+
  '         2,    ''PAGAMENTO PENDENTE EM PROCESSO DE PREVIA'', '+
  '         3,    ''PAGAMENTO PENDENTE PAGO NOVAMENTE (REENVIADO PARA CAP)'', '+
  '         9,    ''PAGAMENTO INDEVIDO ESTORNADO'') AS SITUACAO, '+
  ' HST.IDVERSAOPAGTO, '+
  ' HFCAP.NOMETXT, '+
  ' PTF.DESCRICAO, '+
  //P.RAMOS - 27.06.2002
  ' PSF.DATANASC, '+
  ' HST.IDRESPONSAVEL, '+
  ' HST.IDPESSJUR, '+
  //Bruno Bastos 05/09/2002' HST.MES, '+
  ' HST.NUMBANCO, '+
  ' HST.NUMAGENCIA, '+
  ' HST.CONTACORRENTE '+
  'FROM HISTRUBSAL HST, '+
  ' PARTPREVPLAN PPP, '+
  ' ELEGPATRO ELG, '+
  ' PESSOA TIT, '+
  ' PESSOA PJR, '+
  ' PESSOA BEN, '+
  ' PLANPREV PLP, '+
  //P.RAMOS - 27.06.2002
  ' HSTFOLHABENEFCAP HFCAP, '+
  ' PORTADORFORMA PTF, '+
  //P.RAMOS - 27.06.2002
  ' PESSOAFISICA PSF '+
  'WHERE (HST.IDHSTFOLHABENEF = :idfolha) ' +
  'AND (HST.MESCOBRANCA       = :Mescob) '+
  'AND (PJR.IDPESSOA          = HST.IDPATRO) '+
  'AND (HST.IDTITULAR         = :idTitular) '+
  //P.RAMOS - 27.06.2002
  'AND (HST.CODDOCUMENTO    = HFCAP.CODDOCUMENTO(+)) '+
  'AND (HST.CODPORTFORMA    = PTF.CODPORTFORMA(+)) '+
  //P.RAMOS - 27.06.2002
  'AND (PPP.IDPESSJUR   = HST.IDPATRO) '+

  //P.RAMOS - 21.08.2003 - INIBIDO PROVISORIAMENTE.
  //  O JOIN DEVE SER COM PLANOORIGEM. AVALIAR SE ESTE DEVE ENTRAR NA PREVIA
//  'AND (PPP.IDPLANOPREV = HST.IDPLANOPREV) '+

  'AND (PPP.IDPESSOA    = HST.IDTITULAR) '+

// início - André Tavares - 13/01/2003 - pendência 15109 - pega por default o plano ativo do participante
  'AND ( (HST.IDPLANOPREV = PPP.IDPLANOPREV AND HST.IDPESSOA = HST.IDTITULAR) '+
  'OR (HST.IDPLANOORIGEM = PPP.IDPLANOPREV AND HST.IDPESSOA <> HST.IDTITULAR) ) '+
// fim - André Tavares - 13/01/2003 - pendência 15109 - pega por default o plano ativo do participante

  'AND (TIT.IDPESSOA    = HST.IDTITULAR) '+
//P.RAMOS - 11.02.2003 - MOSTRAR APENAS OS RECEBDORES
//  'AND (BEN.IDPESSOA    = HST.IDPESSOA) '+
  'AND (BEN.IDPESSOA    = HST.IDRESPONSAVEL) '+
  'AND (PLP.IDPLANOPREV = HST.IDPLANOPREV) '+
  'AND (ELG.IDPESSOA    = HST.IDTITULAR) '+
  //P.RAMOS - 25.09.2001
  'AND (ELG.IDPESSJUR   = HST.IDPATRO) '+
  'AND (PSF.IDPESSOA    = BEN.IDPESSOA) ');
  qryPrevia.ParamByName('IDTITULAR').datatype:=ftinteger;
  qryPrevia.ParamByName('MESCOB').datatype:=ftstring;
  qryPrevia.ParamByName('IDFOLHA').datatype:=ftinteger;
  qryPrevia.prepare;
end;

procedure TfrmFrameConsultaHistorico.MostraSRB;
Var
  vsrb, vinss, vsup: Double;
  bFlgProvisorio   : Boolean;
  sDtInicio, sDtFim: String;

begin
  bFlgProvisorio := False; //Bruno Bastos 27/12/2002
  sDtInicio      := '';    //Bruno Bastos 27/12/2002
  sDtFim         := '';    //Bruno Bastos 27/12/2002

  vsrb:=ComumFolha.PegaSRBBeneficio(qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
    inttostr(iIdTitular), inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger),
    bFlgProvisorio, sDtInicio, sDtFim);
  vinss:=ComumFolha.PegaINSSBeneficio(qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
    inttostr(iIdTitular), inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger));
  vsup:=ComumFolha.PegaValorIntegralBeneficio(qryAux, QrySelecao.fieldbyname('MESCOBRANCA').asstring,
    inttostr(iIdTitular), inttostr(qryPrevia.FieldByName('IDRESPONSAVEL').AsInteger));

  //Bruno Bastos 27/12/2002 - Início
  chkBenefProvisorio.Checked := bFlgProvisorio;
  edtDtInicio.Text           := sDtInicio;
  edtDtFinal.Text            := sDtFim;
  //Bruno Bastos 27/12/2002 - Fim

  if vsrb > 0 then
    pnlValorSRB.Caption:=FloatToStrf(vsrb,ffnumber,15,2)+' '
  else
    pnlValorSRB.Caption:='';
  if vinss > 0 then
    pnlValorINSS.Caption:=FloatToStrf(vinss,ffnumber,15,2)+' '
  else
    pnlValorINSS.Caption:='';
  if vsup = 0 then
  begin
    if (vsrb > 0) and (vinss > 0) then
      pnlValorSupl.caption:=FloatToStrf(vsrb-vinss,ffnumber,15,2)+' '
    else
      pnlValorSupl.caption:='';
  end
  else
    pnlValorSupl.Caption:=FloatToStrf(vsup,ffnumber,15,2)+' ';
end;

procedure TfrmFrameConsultaHistorico.MostraValores;
begin
  pnlLiquido.Caption:=FloatToStrf((rTotProv-rTotDesc),ffnumber,15,2);
  pnlProventos.Caption:=FloatToStrf(rTotProv,ffnumber,15,2);
  pnlDescontos.Caption:=FloatToStrf(rTotDesc,ffnumber,15,2);
end;

procedure TfrmFrameConsultaHistorico.qrySelecaoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not bPrimeiro then
    ExecutaMestre(iIdTitular, qryselecao.fieldbyname('MESCOBRANCA').asstring);
end;

procedure TfrmFrameConsultaHistorico.qryPreviaAfterOpen(DataSet: TDataSet);
begin
  lblVersaoEstorno.Visible :=qryPrevia.FieldByName('SITUACAO').AsString = 'PAGAMENTO INDEVIDO ESTORNADO';
  dbedVersaoEstorno.Visible:=qryPrevia.FieldByName('SITUACAO').AsString = 'PAGAMENTO INDEVIDO ESTORNADO';
  LblPortForma.Visible     :=qryPrevia.FieldByName('SITUACAO').AsString <> 'PAGAMENTO INDEVIDO ESTORNADO';
  dbedPortForma.Visible    :=qryPrevia.FieldByName('SITUACAO').AsString <> 'PAGAMENTO INDEVIDO ESTORNADO';
  ExecutaDetalhe(iIdTitular, sMesCobranca);
end;

procedure TfrmFrameConsultaHistorico.ResetaFrame;
begin
  bPrimeiro:=true;
  rTotProv:=0;
  rTotDesc:=0;
  qrySelecao.close;
  qryPrevia.close;
  qryRubricasDetalhe.close;
  pnlproventos.caption:='';
  pnldescontos.caption:='';
  pnlliquido.caption:='';
  PageControl1.ActivePageIndex:=0;
end;

procedure TfrmFrameConsultaHistorico.MostraMensagem(sMsg: string);
begin
  LblProventos.visible:=sMsg='';
  pnlProventos.visible:=sMsg='';
  LblDescontos.visible:=sMsg='';
  pnlDescontos.visible:=sMsg='';
  LblValLiquido.visible:=sMsg='';
  pnlLiquido.visible:=sMsg='';
  if sMsg='' then
    PnlValores.font.color:=clWindowText
  else
    PnlValores.font.color:=clred;
  PnlValores.caption:=sMsg;
end;

function TfrmFrameConsultaHistorico.ExecutaConsulta(aidTitular: integer): boolean;
begin
  iIdTitular:=aidTitular;
  qrySelecao.Close;
  qryselecao.parambyname('TITULAR').asinteger:=iIdTitular;
  qrySelecao.Open;
  result:=MontaConsulta;
  bPrimeiro:=false;
  if result then
    dbgHistorico.setfocus;
end;

procedure TfrmFrameConsultaHistorico.MontaQry;
begin
  //Bruno Bastos - 24/03/2004 - Início
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGUSACODRUBEXT''');
  qryAux.Open;
  iFlgUsaCodRubExt := qryAux.FieldByName('VALORPARAM').AsInteger;
  qryAux.Sql.Clear;
  qryAux.Sql.Add('SELECT VALORPARAM FROM PARAMFOLHA WHERE NOMEPARAM = ''FLGAGRUPARUBRICA''');
  qryAux.Open;
  iFlgAgrupaRub := qryAux.FieldByName('VALORPARAM').AsInteger;
  //Bruno Bastos - 24/03/2004 - Fim

  //Bruno Bastos - 24/03/2004 - If ComumFolha.FlgAgrupaRubrica = 1 Then //Bruno Bastos 14/08/2002
  If iFlgAgrupaRub = 1 Then //Bruno Bastos 24/03/2004
  begin
    MontaQryMaster;
    MontaQryDet;
  End
  Else
  Begin
    MontaQryMasterAgrupado;
    MontaQryDetAgrupado;
  End;
end;

procedure TfrmFrameConsultaHistorico.DBGridRecebedorRowChanged(Sender: TObject);
 var smsg: string;
begin
  smsg:='';
  if not qryPrevia.isempty then
    if (actcontrol = sender) then
      if not ExecutaDetalhe(iIdTitular, sMesCobranca) then
        sMsg:='Problema na consulta do histórico de pagamento para o Beneficiário.';
  MostraMensagem(sMsg);
end;

procedure TfrmFrameConsultaHistorico.DBGridRecebedorColEnter(Sender: TObject);
begin
  actcontrol:=DBGridRecebedor;
end;

procedure TfrmFrameConsultaHistorico.DBGridRecebedorColExit(Sender: TObject);
begin
  actcontrol:=nil;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FFRAMECONSULTAHISTORICO                                                |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FRAME COM INFORMAÇÕES DE PAGAMENTO DE RUBRICA DE UMA VERSÃO.               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 26/06/2002 A 27/06/2002                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO: 3.02.13j                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONSTRUÇÃO DO FRAME.                                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 20/02/2003 A 20/02/2003                         |
| PENDÊNCIA: 11932                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.03.03H                                              |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| VINCULADA A PENDENCIA 11932 PARA EXIBIR CORRETAMENTE O VALOR INFORMATIVO NA  |
| CONSULTA                                                                     |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 07/08/2003 A 07/08/2003                         |
| PENDÊNCIA: 14796                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PEGAR O NUMDEPIRRF E FLGISENTOIRRF DA HISTRUBSAL PRIORITARIAMENTE E PESSOA |
| FISICA CASO ESTEJA NULO NA HISTRUBSAL.                                       |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 08/08/2003 A 08/08/2003                         |
| PENDÊNCIA: 14816                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.01                                               |
| CLIENTE: CBS                                                                 |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - COLOCAR DATA DE PAGAMENTO NA ORDENAÇÃO DO GRID DE VERSÕES.                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: André Tavares                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 05/02/2004                                      |
| PENDÊNCIA: 15109 e 16058                                                     |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA CORREÇÃO: ajuste no join da query e inclusão da coluna que contem o codigo de rubrica extrerno.|
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR:                                                               |
| PERÍODO DE IMPLEMENTAÇÃO: DE DD/MM/AAAA A DD/MM/AAAA                         |
| PENDÊNCIA:                                                                   |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|}

