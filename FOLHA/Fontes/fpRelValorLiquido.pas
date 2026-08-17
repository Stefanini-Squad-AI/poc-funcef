// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Ádler Souza
// Data        : 24/09/2009
// Rotina      : bbtnConfirmarClick
// Pendência   : SOL 124762 Kintana 636509
// Descricao   : Inclusão de filtro quando selecionada a opção "Por Mês".
// -------------------------------------------------------------------------------------------------
unit FPRELVALORLIQUIDO;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, TREdit, fcCombo, fcColorCombo, usistema, dbasedados, uAdmPrevFB,
  uConstFolha;

type
  TfrmPRelValorLiquido = class(TFrmReports_Folha)
    pnlValorLiquido: TPanel;
    gbFaixaInicial: TGroupBox;
    gbFaixaFinal: TGroupBox;
    edFaixaInicial: TRealEdit;
    edFaixaFinal: TRealEdit;
    Panel1: TPanel;
    rdgOrdem: TRadioGroup;
    GroupBox1: TGroupBox;
    fcColorCombo: TfcColorCombo;
    ColorDialog: TColorDialog;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelValorLiquido: TfrmPRelValorLiquido;

implementation

uses drelValorLiquido;

{$R *.DFM}

procedure TfrmPRelValorLiquido.bbtnConfirmarClick(Sender: TObject);
Var sSql, sMesCobranca: String;
    cCh: Char;
begin
  inherited;

  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  cCh:=#0;
  If cmbMes.ItemIndex In [0 .. 11] then
  begin
    sMesCobranca:=IntToStr(cmbMes.ItemIndex+1);
    If cmbMes.ItemIndex+1 < 10 then sMesCobranca:='0'+sMesCobranca;
    sMesCobranca:=IntToStr(SpnedAno.Value)+'/'+sMesCobranca;
    cCh:='M';
  end else sMesCobranca:='';

  dblkLoteouVersao.LookupValue;

  If Tabela = 'HISTRUBSAL' then
  begin
    sSql:='SELECT EL.MATRICULA, PP.INSCRICAONUMERO, HST.IDRESPONSAVEL, '+_clinefeed+
          ' RESP.NOME AS RECEBEDOR, HT.HISTORICO AS VERSAO, '+_clinefeed+
          ' HT.MESREFERENCIA, '+_clinefeed+  
          ' SUM(DECODE(PD.FLGDESCONTO, 0, HST.VALORPROVENTO,0)) AS PROVENTO, '+_clinefeed+
          ' SUM(DECODE(PD.FLGDESCONTO, 1, HST.VALORPROVENTO,0)) AS DESCONTO, '+_clinefeed+
          ' SUM(DECODE(PD.FLGDESCONTO, 0, HST.VALORPROVENTO,0)) - '+_clinefeed+
          ' SUM(DECODE(PD.FLGDESCONTO, 1, HST.VALORPROVENTO,0)) AS LIQUIDO '+_clinefeed+
          ' FROM HISTRUBSAL HST, HSTFOLHABENEF HT, PARTPREVPLAN PP, ELEGPATRO EL, '+_clinefeed+
          ' PROVDESC PD, PESSOA RESP, PLANPREV PL '+_clinefeed+
          ' WHERE '+_clinefeed;
    If dblkLoteouVersao.LookupValue <> '' then
    begin
      sSql:=sSql+' HST.IDHSTFOLHABENEF = '+dblkLoteouVersao.LookupValue+' '+_clinefeed;
      cCh:='V';
    end
    else
      If sMesCobranca <> '' then
      //SOL124762 - Ádler Souza
        sSql:=sSql+' HST.MESCOBRANCA = '+QuotedStr(sMesCobranca)+' '+_clinefeed+
                   ' AND HST.IDMODULO = 18 '+_clinefeed+
                   ' AND UPPER(HT.HISTORICO) NOT LIKE ''%RESG%''' +_clinefeed+
                   ' AND UPPER(HT.HISTORICO) NOT LIKE ''%PORT%'''+_clinefeed
      //Fim - SOL124762 - Ádler Souza
      else Exit;

    sSql:=sSql+
          ' AND HST.IDPESSJUR = '+IntToStr(iIdFundacao)+' '+_clinefeed+
          ' AND HST.IDHSTFOLHABENEF = HT.IDHSTFOLHABENEF '+_clinefeed+
          ' AND HST.IDTITULAR = PP.IDPESSOA '+_clinefeed+
          ' AND HST.IDPATRO = PP.IDPESSJUR '+_clinefeed+  
          'AND (   (PP.IDPLANOPREV = HST.IDPLANOPREV AND HST.IDTITULAR = HST.IDPESSOA) '+_clinefeed+
          '     OR (PP.IDPLANOPREV = HST.IDPLANOORIGEM AND HST.IDTITULAR <> HST.IDPESSOA)) '+_clinefeed+
          'AND PD.FLGDESCONTO IN (0,1) '+_clinefeed+
          'AND PD.FLGESPECIAL = 0 '+_clinefeed+
          ' AND HST.IDTITULAR = EL.IDPESSOA '+_clinefeed+
          ' AND HST.IDPATRO = EL.IDPESSJUR '+_clinefeed+  
          ' AND HST.IDRESPONSAVEL = RESP.IDPESSOA '+_clinefeed+
          ' AND HST.IDRUBRICA = PD.IDPROVENTO '+_clinefeed+
          ' AND HST.IDPLANOPREV = PL.IDPLANOPREV '+_clinefeed+
          ' AND PP.IDPLANOPREV = PL.IDPLANOPREV '+_clinefeed+
          ' GROUP BY HST.IDRESPONSAVEL, RESP.NOME, '+_clinefeed+
          ' HT.MESREFERENCIA, '+_clinefeed+  
          ' EL.MATRICULA, PP.INSCRICAONUMERO, HT.HISTORICO '+_clinefeed;
  end
  else
  If Tabela = 'PREVIA' then
  begin
    sSql:='SELECT EL.MATRICULA, PP.INSCRICAONUMERO, PRV.IDRESPONSAVEL, '+_clinefeed+
          ' RESP.NOME AS RECEBEDOR, '+_clinefeed+
          ' CT.DESCRICAO AS VERSAO, CT.MESREFERENCIA,'+_clinefeed+
          ' SUM(DECODE(PD.FLGDESCONTO, 0, PRV.VALORPROVENTO,0)) AS PROVENTO, '+_clinefeed+
          ' SUM(DECODE(PD.FLGDESCONTO, 1, PRV.VALORPROVENTO,0)) AS DESCONTO, '+_clinefeed+
          ' SUM(DECODE(PD.FLGDESCONTO, 0, PRV.VALORPROVENTO,0)) - '+_clinefeed+
          ' SUM(DECODE(PD.FLGDESCONTO, 1, PRV.VALORPROVENTO,0)) AS LIQUIDO '+_clinefeed+
          ' FROM PREVIA PRV, CTRLINTERFACE CT, PARTPREVPLAN PP, ELEGPATRO EL, '+_clinefeed+
          ' PROVDESC PD, PESSOA RESP, PLANPREV PL '+_clinefeed+
          ' WHERE '+_clinefeed;
    If dblkLoteouVersao.LookupValue <> '' then
    begin
      sSql:=sSql+' PRV.IDLOTE = '+dblkLoteouVersao.LookupValue+' '+_clinefeed;
      cCh:='L';
    end
    else
      If sMesCobranca <> '' then
      //SOL124762 - Ádler Souza
        sSql:=sSql+' PRV.MESCOBRANCA = '+QuotedStr(sMesCobranca)+' '+_clinefeed +
                   ' AND UPPER(CT.DESCRICAO) NOT LIKE ''%RESG%''' +_clinefeed+
                   ' AND UPPER(CT.DESCRICAO) NOT LIKE ''%PORT%'''+_clinefeed
      //Fim - SOL124762 - Ádler Souza
      else Exit;

    sSql:=sSql+
          ' AND PRV.IDPESSJUR = '+IntToStr(iIdFundacao)+' '+_clinefeed+
          ' AND PRV.IDLOTE = CT.IDLOTE '+_clinefeed+
          ' AND PRV.IDTITULAR = PP.IDPESSOA '+_clinefeed+
          ' AND PRV.IDPATRO = PP.IDPESSJUR '+_clinefeed+  
          'AND (   (PP.IDPLANOPREV = PRV.IDPLANOPREV AND PRV.IDTITULAR = PRV.IDPESSOA) '+_clinefeed+
          '     OR (PP.IDPLANOPREV = PRV.IDPLANOORIGEM AND PRV.IDTITULAR <> PRV.IDPESSOA)) '+_clinefeed+
          ' AND PRV.IDPATRO = EL.IDPESSJUR '+_clinefeed+
          'AND PD.FLGDESCONTO IN (0,1) '+_clinefeed+
          'AND PD.FLGESPECIAL = 0 '+_clinefeed+
          ' AND PRV.IDTITULAR = EL.IDPESSOA '+_clinefeed+
          ' AND PRV.IDPATRO = EL.IDPESSJUR '+_clinefeed+  
          ' AND PRV.IDRESPONSAVEL = RESP.IDPESSOA '+_clinefeed+
          ' AND PRV.IDRUBRICA = PD.IDPROVENTO '+_clinefeed+
          ' AND PRV.IDPLANOPREV = PL.IDPLANOPREV '+_clinefeed+
          ' GROUP BY PRV.IDRESPONSAVEL, RESP.NOME, '+_clinefeed+
          ' EL.MATRICULA, PP.INSCRICAONUMERO, CT.DESCRICAO, '+_clinefeed+
          ' CT.MESREFERENCIA '+_clinefeed;
  end;

  sSql:=
    'SELECT MATRICULA, INSCRICAONUMERO, IDRESPONSAVEL, '+_clinefeed+
          ' RECEBEDOR, VERSAO, MESREFERENCIA, '+_clinefeed+
          ' PROVENTO, DESCONTO, LIQUIDO '+_clinefeed+
    'FROM ('+ssql+')'+
    'WHERE LIQUIDO >= '+oranumero(edFaixaInicial.text)+' '+_clinefeed+
    'AND LIQUIDO <= '+oranumero(edFaixaFinal.text)+' '+_clinefeed;

  Case rdgOrdem.ItemIndex Of
    0: sSql:=sSql+' ORDER BY MATRICULA '+_clinefeed;
    1: sSql:=sSql+' ORDER BY RECEBEDOR '+_clinefeed;
  end; {Case}

  DtmRelValorLiquido.qryRelValorLiquido.Close;
  DtmRelValorLiquido.qryRelValorLiquido.Sql.Clear;
  DtmRelValorLiquido.qryRelValorLiquido.Sql.Add(sSql);
  DtmRelValorLiquido.qryRelValorLiquido.Open;
  DtmRelValorLiquido.dFaixaInicial:=edFaixaInicial.Value;
  DtmRelValorLiquido.dFaixaFinal:=edFaixaFinal.Value;
  DtmRelValorLiquido.ppLabelTitulo.Text:='VALOR LIQUIDO NA FAIXA DE '+
                                           EdFaixaInicial.Text+' A '+
                                            EdFaixaFinal.Text;
 Case cCh Of
   'L': DtmRelValorLiquido.ppLabelVersao.Text:='Lote: ANO/MÊS REF. '+
         DtmRelValorLiquido.qryRelValorLiquido.FieldByName('MESREFERENCIA').AsString+' - '+
          DtmRelValorLiquido.qryRelValorLiquido.FieldByName('VERSAO').AsString;

   'M': DtmRelValorLiquido.ppLabelVersao.Text:='Mês de Cobrança: '+
         cmbMes.Text+'/'+Copy(sMesCobranca,1,4);

   'V': DtmRelValorLiquido.ppLabelVersao.Text:='Versão: '+
         DtmRelValorLiquido.qryRelValorLiquido.FieldByName('VERSAO').AsString;
 end; {Case}
 DtmRelValorLiquido.CorZebra:= fcColorCombo.SelectedColor;
end;

end.
{------------------------------------------------------------------------------|
| UNIT: fPRelValorLiquido.                                                     |
| DESCRIÇÃO FUNCIONAL: Relatório de valores liquidos em uma determinada faixa. |
| NUMREPORT:3757                                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/11/2002 A 12/11/2002.                        |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: ()                                                                  |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Criação da Unit.                                 |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 14/07/2003 A 14/07/2003                         |
| PENDÊNCIA: 14526                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------}

