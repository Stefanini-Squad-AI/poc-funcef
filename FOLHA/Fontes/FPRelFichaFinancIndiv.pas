unit FPRelFichaFinancIndiv;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  fParamRelFicha, MontaSelect, IvDictio, IvMulti, IvEMulti, MAHlpBtn,
  TB97Tlbr, TB97, StdCtrls, Buttons, Mask, wwdbedit, Wwdbspin, ExtCtrls,
  uObjFolha, dBaseDados, uSistema, uAdmPrevFB;

type
  TFrmPRelFichaFinancIndiv = class(TfrmParamRelFicha)
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPRelFichaFinancIndiv: TFrmPRelFichaFinancIndiv;

implementation

uses dRelFichaFinancIndiv;

{$R *.DFM}

procedure TFrmPRelFichaFinancIndiv.bbtnConfirmarClick(Sender: TObject);
var ano1, ano2, mes1, mes2 : string;
begin
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  // Verifica se os Meses de Referência for'am escolhidos
  If (cbmes1.text = '') Then
  Begin
    ShowMessage('Você precisa digitar o Mês Início de pesquisa');
    Exit;
  End
  Else If (cbmes2.text = '') Then
  Begin
    ShowMessage('Você precisa digitar o Mês Fim de pesquisa');
    Exit;
  End;

  // Passa Mês e Ano para as variáveis
  If cbmes1.ItemIndex < 9 Then mes1 := '0'+inttostr(cbmes1.ItemIndex+1)
  Else mes1 := inttostr(cbmes1.ItemIndex+1);
  If cbmes2.ItemIndex < 9 Then mes2 := '0'+inttostr(cbmes2.ItemIndex+1)
  Else mes2 := inttostr(cbmes2.ItemIndex+1);
  ano1 := dbseano1.Text;
  ano2 := dbseano2.Text;

  dtmRelFichaFinancIndiv.qryFichaFinancIndiv.Close;
  dtmRelFichaFinancIndiv.qryFichaFinancIndiv.Sql.Clear;
  dtmRelFichaFinancIndiv.qryFichaFinancIndiv.Sql.Add(
  ' SELECT '+
    ' P.NOME, '+
    ' PF.DATANASC, '+
    ' HST.IDHSTFOLHABENEF, '+
    ' HST.IDHSTFOLHABENEF||'' - ''||HST.HISTORICO AS HISTORICO, '+
    ' DECODE(PF.FLGISENTOIRRF, 0, ''NÃO'', 1, ''SIM'') AS ISENTO, '+
    ' NVL(D.MATRICULA, E.MATRICULA) AS MATRICULA, '+
    ' D.NUMSEQUENCIA, '+
    ' DECODE(HST.FLGTIPOFOLHA, 3, SUBSTR(H.MESCOBRANCA,1,4)||''/13'', 4, SUBSTR(H.MESCOBRANCA,1,4)||''/13'', H.MESCOBRANCA) MES, '+
    ' DECODE(PD.FLGDESCONTO, 0, H.VALORPROVENTO) AS PROVENTO, '+
    ' DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO) AS DESCONTO, '+
     'DECODE(PD.FLGESPECIAL, '+
       '0, DECODE(PD.FLGDESCONTO, '+
            '2, NVL(H.VALORINFO,H.VALORPROVENTO)||'' (I)'', '+
            '0, NULL, '+
            '1, DECODE(H.VALORRECEBIDO-H.VALORPROVENTO, '+
                 '0, DECODE(NVL(H.VALORINFO,0), '+
                      '0, NULL, '+
                      'H.VALORINFO||'' (I)''), '+
                 'H.VALORRECEBIDO-H.VALORPROVENTO||'' (R)'')'+
            '), '+
       'DECODE(H.VALORPROVENTO,0,H.VALORINFO, '+
         'NVL(H.VALORPROVENTO,H.VALORINFO))||'' (I)'') INFORMATIVO, ');

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    dtmRelFichaFinancIndiv.qryFichaFinancIndiv.Sql.Add(
    ' PD.IDPROVENTO AS CODPROVDESC, '+
    ' PD.DESCRICAO AS DESCRICAO ')
  Else
    dtmRelFichaFinancIndiv.qryFichaFinancIndiv.Sql.Add(
    ' PD.CODPROVDESC AS CODPROVDESC, '+
    ' PD.DESCRPROVDESC AS DESCRICAO ');

  dtmRelFichaFinancIndiv.qryFichaFinancIndiv.Sql.Add(
  ' FROM '+
    ' HSTFOLHABENEF HST, '+
    ' HISTRUBSAL H, '+
    ' PESSOAFISICA PF, '+
    ' ELEGPATRO E, '+
    ' DEPENTIT D, '+
    ' PROVDESC PD, '+
    ' PESSOA P '+
  ' WHERE '+
    ' HST.IDFUNDACAO = '+IntToStr(iIdFundacao)+' AND '+
    ' H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF AND '+
    ' H.IDRESPONSAVEL = '+MontaSelect2.ValoresChave[0] +' AND '+
    ' H.MESCOBRANCA >= '+QuotedStr(ano1+'/'+mes1)+' AND '+
    ' H.MESCOBRANCA <= '+QuotedStr(ano2+'/'+mes2)+' AND '+
    ' H.IDTITULAR = '+MontaSelect2.ValoresChave[2]+' AND '+
    ' H.IDHSTFOLHABENEF = HST.IDHSTFOLHABENEF AND '+
    ' H.IDMODULO = 18 AND '+
    ' P.IDPESSOA = H.IDRESPONSAVEL AND '+
    ' PD.IDPROVENTO = H.IDRUBRICA AND '+
    ' H.IDTITULAR = D.IDTITULAR AND '+
    ' H.IDRESPONSAVEL = D.IDPESSOA AND '+
    ' H.IDTITULAR = E.IDPESSOA AND '+
    ' H.IDPATRO = E.IDPESSJUR AND '+
    ' H.IDRESPONSAVEL = PF.IDPESSOA '+
  ' ORDER BY '+
    ' MES, '+
    ' HST.IDHSTFOLHABENEF, '+
    ' PD.FLGDESCONTO ');

  dtmRelFichaFinancIndiv.qryAgrupaRub.Close;
  dtmRelFichaFinancIndiv.qryAgrupaRub.Sql.Clear;

  If SistemaFolha.FlgUsaCodRubExt = 0 then
    dtmRelFichaFinancIndiv.qryAgrupaRub.Sql.Add(
    ' SELECT '+
      ' PD.IDPROVENTO AS CODPROVDESC, '+
      ' PD.DESCRICAO, ')
  Else
    dtmRelFichaFinancIndiv.qryAgrupaRub.Sql.Add(
    ' SELECT '+
      ' PD.CODPROVDESC, '+
      ' PD.DESCRPROVDESC AS DESCRICAO, ');

  dtmRelFichaFinancIndiv.qryAgrupaRub.Sql.Add(
  ' SUM(DECODE(PD.FLGDESCONTO, 0, H.VALORPROVENTO)) AS PROVENTO, '+
  ' SUM(DECODE(PD.FLGDESCONTO, 1, H.VALORPROVENTO)) AS DESCONTO, '+
  ' P.NOME, '+
  ' D.NUMSEQUENCIA, '+
  ' PF.DATANASC, '+
  ' DECODE(PF.FLGISENTOIRRF, 0, ''NÃO'', 1, ''SIM'') AS ISENTO '+
  ' FROM '+
    ' HISTRUBSAL H, '+
    ' PROVDESC PD, '+
    ' PESSOAFISICA PF, '+
    ' DEPENTIT D, '+
    ' PESSOA P '+
  ' WHERE '+
    ' H.IDPESSJUR = '+IntToStr(iIdFundacao)+' AND '+
    ' H.IDRESPONSAVEL = '+MontaSelect2.ValoresChave[0]+' AND '+
    ' H.MESCOBRANCA >= '+QuotedStr(ano1+'/'+mes1)+' AND '+
    ' H.MESCOBRANCA <= '+QuotedStr(ano2+'/'+mes2)+' AND '+
    ' H.IDTITULAR = '+MontaSelect2.ValoresChave[2]+' AND '+
    ' H.IDHSTFOLHABENEF = H.IDHSTFOLHABENEF AND '+
    ' H.IDMODULO = 18 AND '+
    ' P.IDPESSOA = H.IDRESPONSAVEL AND '+
    ' H.IDRESPONSAVEL = D.IDPESSOA AND '+
    ' H.IDTITULAR     = D.IDTITULAR AND '+
    ' H.IDRESPONSAVEL = PF.IDPESSOA AND '+
    ' PD.IDPROVENTO = H.IDRUBRICA ');

  If SistemaFolha.FlgUsaCodRubExt = 0 Then
    dtmRelFichaFinancIndiv.qryAgrupaRub.Sql.Add(
    ' GROUP BY '+
      ' P.NOME, '+
      ' D.NUMSEQUENCIA, '+
      ' PF.DATANASC, '+
      ' PF.FLGISENTOIRRF, '+
      ' PD.IDPROVENTO, '+
      ' PD.DESCRICAO, '+
      ' PD.FLGDESCONTO '+
    ' ORDER BY '+
      ' PD.IDPROVENTO ')
  Else
    dtmRelFichaFinancIndiv.qryAgrupaRub.Sql.Add(
    ' GROUP BY '+
      ' P.NOME, '+
      ' D.NUMSEQUENCIA, '+
      ' PF.DATANASC, '+
      ' PF.FLGISENTOIRRF, '+
      ' PD.CODPROVDESC, '+
      ' PD.DESCRPROVDESC, '+
      ' PD.FLGDESCONTO '+
    ' ORDER BY '+
    ' PD.CODPROVDESC ');

  dtmRelFichaFinancIndiv.qryRateio.Close;

  dtmRelFichaFinancIndiv.qryRateio.ParamByName('PIDRESPONSAVEL').AsInteger := StrToInt(MontaSelect2.ValoresChave[0]);
  dtmRelFichaFinancIndiv.qryRateio.ParamByName('PIDPESSOA').AsInteger      := StrToInt(MontaSelect2.ValoresChave[2]);

  dtmRelFichaFinancIndiv.qryRateio.Open;
  dtmRelFichaFinancIndiv.lbValorRateio.Caption := dtmRelFichaFinancIndiv.qryRateio.FieldByName('PERCENTUAL').AsString;

  dtmRelFichaFinancIndiv.lbNomeOp1.Caption := dtmRelFichaFinancIndiv.qryRateio.FieldByName('NOMEVALORBASE1').AsString;
  dtmRelFichaFinancIndiv.lbNomeOp2.Caption := dtmRelFichaFinancIndiv.qryRateio.FieldByName('NOMEVALORBASE2').AsString;
  dtmRelFichaFinancIndiv.lbNomeOp3.Caption := dtmRelFichaFinancIndiv.qryRateio.FieldByName('NOMEVALORBASE3').AsString;
  dtmRelFichaFinancIndiv.lbValor1.Caption := dtmRelFichaFinancIndiv.qryRateio.FieldByName('VALORBASE1').AsString;
  dtmRelFichaFinancIndiv.lbValor2.Caption := dtmRelFichaFinancIndiv.qryRateio.FieldByName('VALORBASE2').AsString;
  dtmRelFichaFinancIndiv.lbValor3.Caption := dtmRelFichaFinancIndiv.qryRateio.FieldByName('VALORBASE3').AsString;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: fPRelFichaFinancIndiv                                                  |
| DESCRIÇÃO FUNCIONAL: Relatório de ficha financeira por versão.               |
| NUMREPORT:3911                                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/07/2003 A 14/07/2003                         |
| PENDÊNCIA: 14529                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: FERNANDO JORGE                                                |
| PERÍODO DE IMPLEMENTAÇÃO: DE ??/07/2003 A ??/07/2003                         |
| PENDÊNCIA: 12574                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - PENDENCIA REABERTA PARA AJUSTES NECESSÁRIOS.                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: André Tavares                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/02/2004 A DD/MM/AAAA                         |
| PENDÊNCIA: 15932                                                             |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: FCRT                                                                |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Criado um novo MontaSelect com uma nova query.   |
| Descriçaõ do erro: O Nome do Recebedor está aparecendo Duplicado na Consulta |
|                                                                              |
|------------------------------------------------------------------------------}
