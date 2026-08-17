{==============================================================================|
| Pendência   : SIG TIBERO                                                     |
| Responsável : Everson Luiz Pereira da Cunha                                  |
| Data        : 21/02/2018                                                     |
| Descrição   : Ajustes nos SQL, incluindo os alias nas tabelas/campos.        |
|               Retirada de INDEX, +rule etc.                                  |
|               Melhoria realizada para adaptação ao TIBERO.                   |
|------------------------------------------------------------------------------|
| UNIT: FFILTRORELAQTDPARTFOLHA                                                |
| DESCRIÇÃO FUNCIONAL:                                                         |
|   FORM FILTRO PARA RELATORIO ESTATÍSTICO DE PARTICIPANTES POR VERSÃO         |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: ANDRÉ TAVARES                                                 |
| PERÍODO DE IMPLEMENTAÇÃO: DE ??/??/2002 A ??/??/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - CONSTRUÇÃO DO RELATÓRIO                                                    |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/09/2002 A 10/09/2002                         |
| VERSÃO PARA LIBERAÇÃO:                                                       |
| CLIENTE: (FCRT)                                                              |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ALTERAÇÃO DA CONSULTA PARA REFLETIR OS TOTAIS PELA HSTBENEFBFCIARIO E NÃO  |
| HISTRUBSAL.                                                                  |
|------------------------------------------------------------------------------}

unit FFiltroRelaQtdPartFolha;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Db, DBTables, Wwquery, dRelFolha,
  Grids, Wwdbigrd, Wwdbgrid, ppBands, ppClass, ppVar, ppCtrls, ppPrnabl,
  ppCache, ppProd, ppReport, Wwdatsrc, ppDB, ppComm, ppRelatv, ppDBPipe,
  ppDBBDE, uAdmPrevFB, dRelaQtdPartFolha, fAguarde;

type
  TFrmFiltroRelaQtdPartFolha = class(TfrmOkCancelar)
    qryHistorico: TwwQuery;
    cmbHistorico: TwwDBLookupCombo;
    lblhistorico: TLabel;
    qryPatroFolhaBenef: TwwQuery;
    dblkPatroFolhaBenef: TwwDBLookupCombo;
    Label1: TLabel;
    qryHistoricoHISTORICO: TStringField;
    qryHistoricoMESREFERENCIA: TStringField;
    qryHistoricoIDHSTFOLHABENEF: TFloatField;
    qryPatroFolhaBenefIDPESSOA: TFloatField;
    qryPatroFolhaBenefNOME: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure cmbHistoricoChange(Sender: TObject);
  private
    { Private declarations }
     sqlAux : string;
     sFiltroPatro, sFiltroVersaoFolha : string;
  public
    { Public declarations }
  end;

var
  FrmFiltroRelaQtdPartFolha: TFrmFiltroRelaQtdPartFolha;

implementation
{$R *.DFM}

procedure TFrmFiltroRelaQtdPartFolha.FormCreate(Sender: TObject);
begin
  inherited;
  sqlAux := dtmRelaQtdPartFolha.qryRelaQtdPartFolha.Sql.Text;
  qryHistorico.Close;
  qryHistorico.Prepare;
  qryHistorico.Open;
  cmbHistorico.Enabled := not qryHistorico.IsEmpty;
  qryPatroFolhaBenef.Close;
  qryPatroFolhaBenef.Prepare;
  qryPatroFolhaBenef.Open;
end;

procedure TFrmFiltroRelaQtdPartFolha.bbtnConfirmarClick(Sender: TObject);
begin
  sFiltroVersaoFolha := '';
  sFiltroPatro := '';

  frmAguarde.Mostra(' Processando as Informações do Relatório... ');
  frmAguarde.Repaint;

  dtmRelaQtdPartFolha.qryRelaQtdPartFolha.Close;
  dtmRelaQtdPartFolha.qryRelaQtdPartFolha.Sql.Clear;

  dtmRelFolha.QryFundacao.Close;
  dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  dtmRelFolha.QryFundacao.Open;

  if (cmbHistorico.Text = '') and (dblkPatroFolhaBenef.text = '') then
  begin
    dtmRelaQtdPartFolha.qryRelaQtdPartFolha.sql.Text := sqlAux;
    dtmRelaQtdPartFolha.qryRelaQtdPartFolha.Open;
  end
  else
  begin
    if (cmbHistorico.text <> '') and (cmbHistorico.lookupValue <> '') then
      sFiltroVersaoFolha := ' AND H.IDHSTFOLHABENEF = '+CmbHistorico.LookupValue+#13#10;

    if (dblkPatroFolhaBenef.text <> '') and (dblkPatroFolhaBenef.LookUpValue <> '') then
      sFiltroPatro := ' AND H.IDPESSJUR = ' + dblkPatroFolhaBenef.LookupValue +#13#10;

    dtmRelaQtdPartFolha.qryRelaQtdPartFolha.sql.Text:=
//      ' SELECT PT.NOME PATRO, PL.NOME PLANO, COUNT(DISTINCT IDTITULAR) QTD '+ //Everson TIBERO
      ' SELECT PT.NOME PATRO, PL.NOME PLANO, COUNT(DISTINCT H.IDTITULAR) QTD '+ //Everson TIBERO
      ' FROM HSTBENEFBFCIARIO H, PESSOA PT, PLANPREV PL '+
      ' WHERE PL.IDPLANOPREV = H.IDPLANOPREV '+
      ' AND PT.IDPESSOA = H.IDPESSJUR '+
    sFiltroVersaoFolha +  sFiltroPatro +
      ' GROUP BY PT.NOME, PL.NOME '+
      ' ORDER BY PT.NOME, PL.NOME ';

    dtmRelaQtdPartFolha.qryRelaQtdPartFolha.Open;

    dtmRelaQtdPartFolha.qryVerFolha.close;
    dtmRelaQtdPartFolha.qryVerFolha.ParamByName('idHstFolhaBenef').asFloat := strToFloat(CmbHistorico.LookupValue);
    dtmRelaQtdPartFolha.qryVerFolha.Open;

    frmAguarde.Apaga;
  end;
end;

procedure TFrmFiltroRelaQtdPartFolha.cmbHistoricoChange(Sender: TObject);
begin
  inherited;
  DblkPatroFolhaBenef.Enabled := (cmbHistorico.Text <> '') and (cmbHistorico.LookupValue <> '');
end;

end.
