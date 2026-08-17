{====>   DESENVOLVEDOR NÃO ESQUEÇA DE COMENTAR SUAS ALTERAÇÕES AO LONGO DO
         CÓDIGO, ASSIM COMO COLOCAR A DESCRIÇÃO DA IMPLEMENTAÇÃO/ALTERAÇÃO
         NO HISTÓRICO DE ALTERAÇÕES NO FINAL DESTE ARQUIVO ********************}
unit FFiltroQtdMensalPartBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, fAguarde;

type
  TFrmFiltroQtdMensalPartBenef = class(TFrmReports_Folha)
    qryBenef: TwwQuery;
    Label1: TLabel;
    dblkBeneficios: TwwDBLookupCombo;
    chkreferencia: TCheckBox;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dblkBeneficiosChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFiltroQtdMensalPartBenef: TFrmFiltroQtdMensalPartBenef;

implementation

uses dRelFolha, uAdmPrevFB, dRelQtdMensalPartBenef;
{$R *.DFM}

procedure TFrmFiltroQtdMensalPartBenef.bbtnConfirmarClick(Sender: TObject);
 var ssql, sMesRef, sFiltro : String;
begin
  inherited;
  //ALTERAÇÃO NA CONSULTA PARA FAZER PELA HSTBENEFBFCIARIO
  sMesRef := '';
  sFiltro := '';

  frmAguarde.Mostra(' Processando as Informações do Relatório... ');
  frmAguarde.Repaint;

  dtmRelQtdMensalPartBenef.qryRelQtdPartBenefMes.Close;

// Filtros
  if (dblkLoteOuVersao.Text <> '') and (dblkLoteOuVersao.LookupValue <> '') then
    sFiltro := sFiltro + ' AND HRS.IDHSTFOLHABENEF = ' + dblkLoteOuVersao.LookupValue + #13#10;

  if (CmbMes.Text <> '') then
  begin
    If (cmbMes.ItemIndex+1) > 9 Then
      sMesRef := IntToStr(spnedAno.Value)+'/'+IntToStr(cmbMes.ItemIndex+1)
    Else
      sMesRef := IntToStr(spnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);

    sFiltro := sFiltro + ' AND HRS.MES = ''' + sMesRef + '''' +#13#10;
  end;

  if (dblkBeneficios.Text <> '') and (dblkBeneficios.LookupValue <> '') then
    sFiltro := sFiltro + ' AND BPP.IDBENEFICIO = ' + dblkBeneficios.LookupValue + #13#10;

  ssql:=
    ' SELECT HRS.MES AS MESCOBRANCA, PATRO.NOME AS PATRO, '+#13#10+
          ' PP.NOME AS PLANO, BN.NOME AS BENEFICIO, '+#13#10+
          ' COUNT(DISTINCT HRS.IDTITULAR) AS QTDE '+#13#10+
    ' FROM HSTBENEFBFCIARIO HRS, BENEFPLANPREV BPP, BENEFICIO BN, '+#13#10+
         ' PLANPREV PP, PESSOA PATRO, PATRO PAT '+#13#10+ 
    ' WHERE BPP.IDBENEFICIO = HRS.IDBENEFICIO '+#13#10+
    ' AND BPP.IDPLANOPREV = HRS.IDPLANOPREV '+#13#10;

  ssql:=ssql+' AND HRS.IDPESSJUR = PAT.IDPESSOA '+
             ' AND PAT.IDFUNDACAO = '+inttostr(iidfundacao)+' ';

  if not chkreferencia.checked then
    ssql:=ssql+
      ' AND (BPP.FLGREFERENCIA = 0 OR (BPP.FLGREFERENCIA = 1 AND BPP.FLGPAGAINSS = 1)) '+#13#10;

  ssql:=ssql+
    sFiltro +#13#10+
    ' AND BN.IDBENEFICIO = HRS.IDBENEFICIO '+#13#10+
    ' AND PP.IDPLANOPREV = HRS.IDPLANOPREV '+#13#10+
    ' AND PATRO.IDPESSOA = HRS.IDPESSJUR '+#13#10+
    ' GROUP BY HRS.MES, PP.NOME, BN.NOME, PATRO.NOME '+#13#10+
    ' ORDER BY PATRO.NOME, PP.NOME, BN.NOME';

  dtmRelQtdMensalPartBenef.qryRelQtdPartBenefMes.sql.clear;
  dtmRelQtdMensalPartBenef.qryRelQtdPartBenefMes.sql.add(ssql);
  dtmRelQtdMensalPartBenef.qryRelQtdPartBenefMes.Open;

  dtmRelFolha.QryFundacao.Close;
  dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  dtmRelFolha.QryFundacao.Open;
  frmAguarde.Apaga;

end;

procedure TFrmFiltroQtdMensalPartBenef.FormCreate(Sender: TObject);
begin
  inherited;
  ssql:='SELECT DISTINCT B.IDBENEFICIO, B.NOME '+
        'FROM PLANPREVPATRO P, BENEFPLANPREV V, BENEFICIO B, PATRO PAT '+
        'WHERE (P.IDPESSJUR = PAT.IDPESSOA) '+
        'AND (PAT.IDFUNDACAO = '+inttostr(iidfundacao)+') '+
        'AND (V.IDPLANOPREV = P.IDPLANOPREV) '+
        'AND (B.IDBENEFICIO = V.IDBENEFICIO) '+
        'ORDER BY B.NOME';
  qryBenef.close;
  qryBenef.SQL.Clear;
  qryBenef.SQL.Add(sSQL);
  qryBenef.open;
end;

procedure TFrmFiltroQtdMensalPartBenef.dblkBeneficiosChange(
  Sender: TObject);
begin
  inherited;
  chkreferencia.checked:=trim(dblkBeneficios.text) = '';
  chkreferencia.enabled:=trim(dblkBeneficios.text) = '';
end;

end.
{------------------------------------------------------------------------------|
| UNIT: FFILTROQTDMENSALPARTBENEF                                              |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FORM FILTRO PARA RELATORIO ESTATÍSTICO DE PARTICIPANTES POR BENEFÍCIO.     |
| NUMREPORT:3548                                                               |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE ??/??/2002 A ??/??/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONSTRUÇÃO DO RELATÓRIO                                                    |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 11/09/2002 A 11/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DA CONSULTA PARA REFLETIR OS TOTAIS PELA HSTBENEFBFCIARIO E NÃO  |
| HISTRUBSAL.                                                                  |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2003 A 10/07/2003                         |
| PENDÊNCIA: 14486                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAÇÃO PARA MULTIFUNDAÇÃO.                                              |
|                                                                              |
|------------------------------------------------------------------------------}

