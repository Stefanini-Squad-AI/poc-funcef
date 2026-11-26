// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//  Autor      : Paulo Ramos
//  Rotina     : bbtnConfirmarClick
//  Pendência  : 22190
//  Data       : 04/05/2006
//  Descricao  : Só considerar registros para portadores tipo 'A' arquivo eletrônico
//------------------------------------------------------------------------------
unit fPRelCredBenefBan;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, TREdit, fcCombo, fcColorCombo, usistema, dbasedados;

type
  TfrmPRelCredBenefBan = class(TFrmReports_Folha)
    pnlAssinatura: TPanel;
    ColorDialog: TColorDialog;
    gbPrimeiraAss: TGroupBox;
    gbSegundaAss: TGroupBox;
    edtAssina1: TEdit;
    edtAssina2: TEdit;
    GroupBox1: TGroupBox;
    fcColorCombo: TfcColorCombo;
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelCredBenefBan: TfrmPRelCredBenefBan;

implementation

uses dRelFolha, uConstFolha;

{$R *.DFM}

procedure TfrmPRelCredBenefBan.bbtnConfirmarClick(Sender: TObject);
Var sSql : String;
    cCh  : Char;
begin
  inherited;
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  cCh:=#0;
  If dblkLoteouVersao.LookupValue = '' then Exit;
  If Tabela = 'HISTRUBSAL' then
  begin
    //CONSIDERAR APENAS TIPO DE PORTADOR ELETRONICO
    sSql:='SELECT BA.NUMBANCO, BAN.NOME, '+_clinefeed+
          '       SUM(DECODE(HS.FLGDESCONTO,0,HS.VALORPROVENTO,-HS.VALORPROVENTO)) AS VALOR, '+_clinefeed+
          '       COUNT(DISTINCT HS.IDRESPONSAVEL) AS QUANTIDADE '+_clinefeed+
          'FROM HISTRUBSAL HS, HSTFOLHABENEFCAP HC, BANCO BA, PESSOA BAN '+_clinefeed+
          'WHERE (HS.IDHSTFOLHABENEF = '+dblkLoteouVersao.LookupValue+') '+_clinefeed+
          'AND (HS.FLGESPECIAL = 0) '+_clinefeed+
          'AND (HS.FLGDESCONTO IN (0,1)) '+_clinefeed+
          'AND (HS.NUMBANCO = BA.NUMBANCO) '+_clinefeed+
          'AND (BAN.IDPESSOA = BA.IDPESSOA) '+_clinefeed+
          'AND (HS.FLGESTORNO = 0 OR HS.FLGESTORNO IS NULL) '+_clinefeed+
          'AND HS.CODDOCUMENTO = HC.CODDOCUMENTO '+_clinefeed+
          'AND HS.CODPORTFORMA = HC.CODPORTFORMA '+_clinefeed+
          'AND HC.TIPOPORTADOR = ''A'' '+_clinefeed+
          'GROUP BY BA.NUMBANCO, BAN.NOME ';
     cCh:='V';
  end
  else
  If Tabela = 'PREVIA' then
  begin
    //CONSIDERAR APENAS TIPO DE PORTADOR ELETRONICO USANDO A BANCOPORTFORMA
    sSql:='SELECT BA.NUMBANCO, BAN.NOME, '+_clinefeed+
          '       SUM(DECODE(PR.FLGDESCONTO,0,PV.VALORPROVENTO,-PV.VALORPROVENTO)) AS VALOR, '+_clinefeed+
          '       COUNT(DISTINCT PV.IDRESPONSAVEL) AS QUANTIDADE '+_clinefeed+
          'FROM PREVIA PV, PROVDESC PR, BANCO BA, PESSOA BAN  '+_clinefeed+
          'WHERE (PV.IDLOTE = '+dblkLoteouVersao.LookupValue+') '+_clinefeed+
          'AND (PR.IDPROVENTO = PV.IDRUBRICA) '+_clinefeed+
          'AND (PR.FLGESPECIAL = 0) '+_clinefeed+
          'AND (PR.FLGDESCONTO IN (0,1)) '+_clinefeed+
          'AND (PV.NUMBANCO = BA.NUMBANCO) '+_clinefeed+
          'AND (BAN.IDPESSOA = BA.IDPESSOA) '+_clinefeed+
          'AND EXISTS (SELECT 1 '+_clinefeed+
          '            FROM BANCOPORTFORMA BP '+_clinefeed+
          '            WHERE (BP.CODPORTFORMA = PV.CODPORTFORMA) '+_clinefeed+
          '            AND (BP.IDMODULO = 18)) '+_clinefeed+
          'AND (PV.IDFAVDOC <> PV.IDRESPONSAVEL) '+_clinefeed+
          'GROUP BY BA.NUMBANCO, BAN.NOME '+_clinefeed;
     cCh:='L';
  end;
  dtmRelFolha.QryCredBenefBan.Close;
  dtmRelFolha.QryCredBenefBan.Sql.Clear;
  dtmRelFolha.QryCredBenefBan.Sql.Add(sSql);
  dtmRelFolha.QryCredBenefBan.Open;
  dtmRelFolha.lbAssina1.Caption := edtAssina1.Text;
  dtmRelFolha.lbAssina2.Caption := edtAssina2.Text;
  Case cCh Of
   'L': dtmRelFolha.ppLabelVersao.Text:='Prévia da Folha de Benefícios : '+
         'Lote: ANO/MÊS REF. '+qryPreviaouEfetivada.FieldByName('MESREFERENCIA').AsString+' - '+
          qryPreviaouEfetivada.FieldByName('DESCRICAO').AsString;

    'V': dtmRelFolha.ppLabelVersao.Text:='Versão da Folha de Benefícios : '+
          qryPreviaouEfetivada.FieldByName('DESCRICAO').AsString;
 end; {Case}
 dtmRelFolha.CorZebra:= fcColorCombo.SelectedColor;
end;

end.

{==============================================================================|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: Sidnei de Brito Marins.                                       |
| PERÍODO DE IMPLEMENTAÇÃO: DE 02/12/2002 A 03/12/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT) Pendência 10774.                                             |
| DESCRIÇÃO DA IMPLEMENTAÇÃO: Alteração para emitir relatório com informações  |
|  da Prévia.                                                                  |
|------------------------------------------------------------------------------}

