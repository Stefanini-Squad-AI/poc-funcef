unit fConsultaPreparo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, Db, DBTables, Wwquery, StdCtrls, wwdblook, ComCtrls,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls,
  Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid, Mask, wwdbedit,
  TREdit, TEdNum,uDocumento, uIntegraBack, MontaSelect, fcButton, fcImgBtn,
  fcShapeBtn, DBCtrls, wwdbdatetimepicker, CMDateTimePicker, Menus,
  mxpivsrc, mxgrid, mxDB, mxtables, mxstore, Wwdbspin, DBaseDados, UMensErro;

type
  TfrmConsultaPreparo = class(TfrmSairAjuda)
    qryLote: TwwQuery;
    Panel7: TPanel;
    Panel14: TPanel;
    pnlProgbar: TPanel;
    prgBar: TProgressBar;
    dqryValores: TDecisionQuery;
    dsValores: TDecisionSource;
    dcValores: TDecisionCube;
    pctlBenefContrib: TPageControl;
    tbsBeneficios: TTabSheet;
    qryLoteMESREFERENCIA: TStringField;
    qryLoteDESCRICAO: TStringField;
    qryLoteIDLOTE: TFloatField;
    pctlSelecao: TPageControl;
    tbsHistorico: TTabSheet;
    dblkFolha: TwwDBLookupCombo;
    fcsbtnHistorico: TfcShapeBtn;
    rdgEscolhaTipo: TRadioGroup;
    dpValores: TDecisionPivot;
    DecisionGrid1: TDecisionGrid;
    tbsContribuicoes: TTabSheet;
    dpContrib: TDecisionPivot;
    dgrdContrib: TDecisionGrid;
    dqryContrib: TDecisionQuery;
    dsContrib: TDecisionSource;
    dcContrib: TDecisionCube;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dqryValoresAfterOpen(DataSet: TDataSet);
    procedure dqryValoresAfterClose(DataSet: TDataSet);
    procedure fcsbtnHistoricoClick(Sender: TObject);
    procedure dqryContribAfterOpen(DataSet: TDataSet);
    procedure dqryContribAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConsultaPreparo: TfrmConsultaPreparo;

implementation

{$R *.DFM}

uses uAdmPrevFB;

procedure TfrmConsultaPreparo.FormCreate(Sender: TObject);
begin
  inherited;
  qryLote.close;
  qryLote.SQL.Clear;
  qryLote.SQL.Add(
    'SELECT IDLOTE, MESREFERENCIA, IDLOTE||'' - ''||DESCRICAO AS DESCRICAO '+
    'FROM CTRLINTERFACE '+
    'WHERE TIPO = ''B''  '+
    'AND IDREFERENCIA IS NULL '+
    'AND FLGTIPOFOLHA IN (0,3,4,6) '+
    'AND NVL(FLGCONCESSAO, 0) = 0 '+
    'AND IDPESSOA = '+inttostr(iidfundacao)+' '+
    'ORDER BY MESREFERENCIA DESC, IDLOTE DESC');
  qryLote.open;
  WindowState := wsMaximized;
  pctlSelecao.activepage:=tbsHistorico;
end;

procedure TfrmConsultaPreparo.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryLote.Close;
  dqryValores.Close;
  dqryContrib.Close;
end;

procedure TfrmConsultaPreparo.dqryValoresAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dpValores.Visible := True;
end;

procedure TfrmConsultaPreparo.dqryValoresAfterClose(DataSet: TDataSet);
begin
  inherited;
  dpValores.Visible := False;
end;

procedure TfrmConsultaPreparo.fcsbtnHistoricoClick(Sender: TObject);
begin
  inherited;
  If dblkFolha.LookupValue = '' Then
  Begin
    MsgDlg('Escolha um lote de preparo. ', 'Informação' , mtInformation ,[mbOk], 0);
    dblkFolha.SetFocus;
    Exit;
  End;
  Case rdgEscolhaTipo.ItemIndex Of
    0 : Begin
          dqryValores.Close;
          dqryValores.SQL.Text :=
          ' SELECT '+
            ' PAT.NOME AS PATROCINADORA, '+
            ' PLA.NOME AS PLANO, '+
            ' BB.NOME AS BENEFICIO, '+
            ' BEN.NOME AS BENEFICIARIO, '+
            ' TIT.NOME AS TITULAR, '+
            ' USU.NOME AS USUARIO, '+
            ' TO_CHAR(HST.TRGDTINCLUSAO, ''DD/MM/YYYY'') AS DATAPROCESSO, '+
            ' SUM(HST.VLBENEFPGTO) AS VALORPAGO, '+
            ' SUM(HST.VALORPREV) AS VALORPREVISTO, '+
            ' COUNT(*) AS QUANT '+
          ' FROM '+
            ' HSTBENEFBFCIARIO HST, '+
            ' BENEFICIO BB, '+
            ' PLANPREV PLA, '+
            ' PESSOA PAT, '+
            ' PESSOA USU, '+
            ' PESSOA TIT, '+
            ' PESSOA BEN '+
          ' WHERE '+
            ' (HST.IDLOTE = '+dblkFolha.LookupValue+') AND '+
            ' (BB.IDBENEFICIO = HST.IDBENEFICIO) AND '+
            ' (PLA.IDPLANOPREV = HST.IDPLANOPREV) AND '+
            ' (PAT.IDPESSOA = HST.IDPESSJUR) AND '+
            ' (TIT.IDPESSOA = HST.IDTITULAR) AND '+
            ' (BEN.IDPESSOA = HST.IDPESSOA) AND '+
            ' (USU.IDPESSOA = SUBSTR(HST.TRGUSERINCLUSAO,3,28)) '+
          ' GROUP BY '+
            ' PAT.NOME, '+
            ' PLA.NOME, '+
            ' BB.NOME, '+
            ' USU.NOME, '+
            ' BEN.NOME, '+
            ' TIT.NOME, '+
            ' TO_CHAR(HST.TRGDTINCLUSAO, ''DD/MM/YYYY'') ';
          dqryContrib.Close;
          dqryContrib.SQL.Text :=
          ' SELECT '+
            ' PAT.NOME AS PATROCINADORA, '+
            ' PLA.NOME AS PLANO, '+
            ' CON.NOME AS CONTRIBUICAO, '+
            ' BEN.NOME AS BENEFICIARIO, '+
            ' TIT.NOME AS TITULAR, '+
            ' USU.NOME AS USUARIO, '+
            ' TO_CHAR(HCP.TRGDTINCLUSAO, ''DD/MM/YYYY'') AS DATAPROCESSO, '+
            ' SUM(HCP.VALORRECEBIDO) AS VALORPAGO, '+
            ' SUM(HCP.VALORESPERADO) AS VALORPREVISTO, '+
            ' COUNT(*) AS QUANT '+
            ' FROM '+
              ' HSTCONTRIBPREV HCP, '+
              ' CONTRIBUICAO CON, '+
              ' PLANPREV PLA, '+
              ' PESSOA PAT, '+
              ' PESSOA USU, '+
              ' PESSOA TIT, '+
              ' PESSOA BEN '+
            ' WHERE '+
              ' HCP.IDLOTE = '+dblkFolha.LookupValue+' AND '+
              ' CON.IDCONTRIBUICAO = HCP.IDCONTRIBUICAO AND '+
              ' PLA.IDPLANOPREV = HCP.IDPLANOPREV AND '+
              ' PAT.IDPESSOA = HCP.IDPESSJUR AND '+
              ' USU.IDPESSOA = SUBSTR(HCP.TRGUSERINCLUSAO, 3, 28) AND '+
              ' TIT.IDPESSOA = HCP.IDPESSOA AND '+
              ' BEN.IDPESSOA = HCP.IDPESSOA '+
            ' GROUP BY '+
              ' PAT.NOME, '+
              ' PLA.NOME, '+
              ' CON.NOME, '+
              ' BEN.NOME, '+
              ' TIT.NOME, '+
              ' USU.NOME, '+
              ' TO_CHAR(HCP.TRGDTINCLUSAO, ''DD/MM/YYYY'') ';
        End;

    1 : Begin
          dqryValores.Close;
          dqryValores.SQL.Text :=
          ' SELECT '+
            ' PAT.NOME AS PATROCINADORA, '+
            ' PLA.NOME AS PLANO, '+
            ' BB.NOME AS BENEFICIO, '+
            ' BEN.NOME AS BENEFICIARIO, '+
            ' TIT.NOME AS TITULAR, '+
            ' USU.NOME AS USUARIO, '+
            ' TO_CHAR(HST.TRGDTINCLUSAO, ''DD/MM/YYYY'') AS DATAPROCESSO, '+
            ' SUM(HST.VLBENEFPGTO) AS VALORPAGO, '+
            ' SUM(HST.VALORPREV) AS VALORPREVISTO, '+
            ' COUNT(*) AS QUANT '+
          ' FROM '+
            ' HSTBENEFBFCIARIO HST, '+
            ' BENEFICIO BB, '+
            ' PLANPREV PLA, '+
            ' PESSOA PAT, '+
            ' PESSOA USU, '+
            ' PESSOA TIT, '+
            ' PESSOA BEN '+
          ' WHERE '+
            ' (HST.IDLOTE = '+dblkFolha.LookupValue+') AND '+
            ' (BB.IDBENEFICIO = HST.IDBENEFICIO) AND '+
            ' (PLA.IDPLANOPREV = HST.IDPLANOPREV) AND '+
            ' (PAT.IDPESSOA = HST.IDPESSJUR) AND '+
            ' (USU.IDPESSOA = SUBSTR(HST.TRGUSERINCLUSAO,3,28)) AND '+
            ' (TIT.IDPESSOA = HST.IDTITULAR) AND '+
            ' (BEN.IDPESSOA = HST.IDPESSOA) AND '+
            ' (HST.IDTITULAR = HST.IDPESSOA) '+
          ' GROUP BY '+
            ' PAT.NOME, '+
            ' PLA.NOME, '+
            ' BB.NOME, '+
            ' USU.NOME, '+
            ' BEN.NOME, '+
            ' TIT.NOME, '+
            ' TO_CHAR(HST.TRGDTINCLUSAO, ''DD/MM/YYYY'') ';

          dqryContrib.Close;
          dqryContrib.SQL.Text :=
          ' SELECT '+
            ' PAT.NOME AS PATROCINADORA, '+
            ' PLA.NOME AS PLANO, '+
            ' CON.NOME AS CONTRIBUICAO, '+
            ' BEN.NOME AS BENEFICIARIO, '+
            ' TIT.NOME AS TITULAR, '+
            ' USU.NOME AS USUARIO, '+
            ' TO_CHAR(HCP.TRGDTINCLUSAO, ''DD/MM/YYYY'') AS DATAPROCESSO, '+
            ' SUM(HCP.VALORRECEBIDO) AS VALORPAGO, '+
            ' SUM(HCP.VALORESPERADO) AS VALORPREVISTO, '+
            ' COUNT(*) AS QUANT '+
            ' FROM '+
              ' HSTCONTRIBPREV HCP, '+
              ' PARTPREVPLAN PPP, '+
              ' CONTRIBUICAO CON, '+
              ' PLANPREV PLA, '+
              ' PESSOA PAT, '+
              ' PESSOA USU, '+
              ' PESSOA TIT, '+
              ' PESSOA BEN '+
            ' WHERE '+
              ' HCP.IDLOTE = '+dblkFolha.LookupValue+' AND '+
              ' CON.IDCONTRIBUICAO = HCP.IDCONTRIBUICAO AND '+
              ' PLA.IDPLANOPREV = HCP.IDPLANOPREV AND '+
              ' PAT.IDPESSOA = HCP.IDPESSJUR AND '+
              ' USU.IDPESSOA = SUBSTR(HCP.TRGUSERINCLUSAO, 3, 28) AND '+
              ' TIT.IDPESSOA = HCP.IDPESSOA AND '+
              ' BEN.IDPESSOA = HCP.IDPESSOA AND '+
              ' PPP.IDPESSOA = HCP.IDPESSOA '+
            ' GROUP BY '+
              ' PAT.NOME, '+
              ' PLA.NOME, '+
              ' CON.NOME, '+
              ' BEN.NOME, '+
              ' TIT.NOME, '+
              ' USU.NOME, '+
              ' TO_CHAR(HCP.TRGDTINCLUSAO, ''DD/MM/YYYY'') ';
        End;

    2 : Begin
          dqryValores.Close;
          dqryValores.SQL.Text :=
          ' SELECT '+
            ' PAT.NOME AS PATROCINADORA, '+
            ' PLA.NOME AS PLANO, '+
            ' BB.NOME AS BENEFICIO, '+
            ' BEN.NOME AS BENEFICIARIO, '+
            ' TIT.NOME AS TITULAR, '+
            ' USU.NOME AS USUARIO, '+
            ' TO_CHAR(HST.TRGDTINCLUSAO, ''DD/MM/YYYY'') AS DATAPROCESSO, '+
            ' SUM(HST.VLBENEFPGTO) AS VALORPAGO, '+
            ' SUM(HST.VALORPREV) AS VALORPREVISTO, '+
            ' COUNT(*) AS QUANT '+
          ' FROM '+
            ' HSTBENEFBFCIARIO HST, '+
            ' BENEFICIO BB, '+
            ' PLANPREV PLA, '+
            ' PESSOA PAT, '+
            ' PESSOA USU, '+
            ' PESSOA TIT, '+
            ' PESSOA BEN '+
          ' WHERE '+
            ' (HST.IDLOTE = '+dblkFolha.LookupValue+') AND '+
            ' (BB.IDBENEFICIO = HST.IDBENEFICIO) AND '+
            ' (PLA.IDPLANOPREV = HST.IDPLANOPREV) AND '+
            ' (PAT.IDPESSOA = HST.IDPESSJUR) AND '+
            ' (USU.IDPESSOA = SUBSTR(HST.TRGUSERINCLUSAO,3,28)) AND '+
            ' (TIT.IDPESSOA = HST.IDTITULAR) AND '+
            ' (BEN.IDPESSOA = HST.IDPESSOA) AND '+
            ' (HST.IDTITULAR <> HST.IDPESSOA) '+
          ' GROUP BY '+
            ' PAT.NOME, '+
            ' PLA.NOME, '+
            ' BB.NOME, '+
            ' USU.NOME, '+
            ' BEN.NOME, '+
            ' TIT.NOME, '+
            ' TO_CHAR(HST.TRGDTINCLUSAO, ''DD/MM/YYYY'') ';

          dqryContrib.Close;
          dqryContrib.SQL.Text :=
          ' SELECT '+
            ' PAT.NOME AS PATROCINADORA, '+
            ' PLA.NOME AS PLANO, '+
            ' CON.NOME AS CONTRIBUICAO, '+
            ' BEN.NOME AS BENEFICIARIO, '+
            ' TIT.NOME AS TITULAR, '+
            ' USU.NOME AS USUARIO, '+
            ' TO_CHAR(HCP.TRGDTINCLUSAO, ''DD/MM/YYYY'') AS DATAPROCESSO, '+
            ' SUM(HCP.VALORRECEBIDO) AS VALORPAGO, '+
            ' SUM(HCP.VALORESPERADO) AS VALORPREVISTO, '+
            ' COUNT(*) AS QUANT '+
            ' FROM '+
              ' HSTCONTRIBPREV HCP, '+
              ' CONTRIBUICAO CON, '+
              ' NUCLEOFAMILIAR NFR, '+
              ' PLANPREV PLA, '+
              ' PESSOA PAT, '+
              ' PESSOA USU, '+
              ' PESSOA TIT, '+
              ' PESSOA BEN '+
            ' WHERE '+
              ' HCP.IDLOTE = '+dblkFolha.LookupValue+' AND '+
              ' CON.IDCONTRIBUICAO = HCP.IDCONTRIBUICAO AND '+
              ' PLA.IDPLANOPREV = HCP.IDPLANOPREV AND '+
              ' PAT.IDPESSOA = HCP.IDPESSJUR AND '+
              ' USU.IDPESSOA = SUBSTR(HCP.TRGUSERINCLUSAO, 3, 28) AND '+
              ' TIT.IDPESSOA = HCP.IDPESSOA AND '+
              ' BEN.IDPESSOA = HCP.IDPESSOA AND '+
              ' HCP.IDPESSOA = NFR.IDRESPNUCLEO '+
            ' GROUP BY '+
              ' PAT.NOME, '+
              ' PLA.NOME, '+
              ' CON.NOME, '+
              ' BEN.NOME, '+
              ' TIT.NOME, '+
              ' USU.NOME, '+
              ' TO_CHAR(HCP.TRGDTINCLUSAO, ''DD/MM/YYYY'') ';
        End;
  End;
  Try
    dqryValores.Open;
  Except
    Case rdgEscolhaTipo.ItemIndex Of
      0 : MsgDlg(' Só existe um registro de benefício, para titulares e pensionistas, '+#13
                +'impossibilitando essa consulta. Para conferir essas informações por '+#13
                +'favor use o relatório de benefícios preparados. ', 'Informação', mtInformation, [mbOk], 0);

      1 : MsgDlg(' Só existe um registro de benefício, para titulares, impossibilitando '+#13
                +'essa consulta. Para conferir essas informações, por favor use o rela_ '+#13
                +'tório de benefícios preparados. ', 'Informação', mtInformation, [mbOk], 0);

      2 : MsgDlg(' Só existe um registro de benefício, para pensionistas, impossibilitando '+#13
                +'essa consulta. Para conferir essas informações, por favor use o relatório'+#13
                +'de benefícios preparados. ', 'Informação', mtInformation, [mbOk], 0);
    End;
  End;

  Try
    dqryContrib.Open;
  Except
    Case rdgEscolhaTipo.ItemIndex Of
      0 : MsgDlg(' Só existe um registro de contribuição, para titulares e pensionistas, '+#13
                +'impossibilitando essa consulta. Para conferir essas informações por fa_'+#13
                +'vor use o relatório de benefícios preparados. ', 'Informação', mtInformation, [mbOk], 0);

      1 : MsgDlg(' Só existe um registro de contribuição, para titulares, impossibilitando '+#13
                +'essa consulta. Para conferir essas informações, por favor use o relatório'+#13
                +'de benefícios preparados. ', 'Informação', mtInformation, [mbOk], 0);

      2 : MsgDlg(' Só existe um registro de contribuição, para pensionistas, impossibilitando '+#13
                +'essa consulta. Para conferir essas informações, por favor use o relatório de'+#13
                +'benefícios preparados. ', 'Informação', mtInformation, [mbOk], 0);
    End;
  End;
end;

procedure TfrmConsultaPreparo.dqryContribAfterOpen(DataSet: TDataSet);
begin
  inherited;
  dpContrib.Visible := True;
end;

procedure TfrmConsultaPreparo.dqryContribAfterClose(DataSet: TDataSet);
begin
  inherited;
  dpContrib.Visible := False;
end;

end.
{------------------------------------------------------------------------------|
| UNIT:                                                                        |
| DESCRIÇÃO FUNCIONAL:                                                         |
|                                                                              |
|                                                                              |
|------------------------------------------------------------------------------|
| DESENVOLVEDOR: PAULO RAMOS                                                   |
| PERÍODO DE IMPLEMENTAÇÃO: DE 10/07/2003 A 10/07/2003                         |
| PENDÊNCIA: 14490                                                             |
| VERSÃO PARA LIBERAÇÃO: 3.04.00                                               |
| CLIENTE:                                                                     |
| DESCRIÇÃO DA IMPLEMENTAÇÃO:                                                  |
| - ADAPTAR PARA MULTIFUNDACAO.                                                |
|                                                                              |
|------------------------------------------------------------------------------}

