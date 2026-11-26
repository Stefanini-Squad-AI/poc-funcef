unit FFiltroRelaTotSupl;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, StdCtrls, fcCombo, fcColorCombo, wwdblook, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls, Db,
  DBTables, Wwquery;

type
  TFrmFiltroRelaTotSupl = class(TfrmOkCancelar)
    pnlVersao: TPanel;
    lblVersao: TLabel;
    lblPatro: TLabel;
    lblPlano: TLabel;
    dblkVersao: TwwDBLookupCombo;
    dblkPatrocinadora: TwwDBLookupCombo;
    dblkPlano: TwwDBLookupCombo;
    ChkConsolidar: TCheckBox;
    ChkConsolidaPlano: TCheckBox;
    qryHistorico: TwwQuery;
    qryPatrocinadora: TwwQuery;
    qryPlano: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkVersaoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dblkPatrocinadoraChange(Sender: TObject);
    procedure dblkPlanoChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFiltroRelaTotSupl: TFrmFiltroRelaTotSupl;

implementation

uses fAguarde, dRelFolha, dRelaTotSuplBenef, uAdmPrevFB;

{$R *.DFM}

procedure TFrmFiltroRelaTotSupl.bbtnConfirmarClick(Sender: TObject);
Var
  Filtro: String;
  ssql : string;

begin
  inherited;
  Filtro := '';

  If ChkConsolidar.Checked And ChkConsolidaPlano.Checked Then
  Begin
    dtmRelaTotSuplBenef.gfbTotPatro.Visible := False;
    dtmRelaTotSuplBenef.lblTotPlano.Caption := 'Total Geral: ';
  End
  Else
  Begin
    If ChkConsolidar.Checked Then
    Begin
      dtmRelaTotSuplBenef.gfbTotPatro.Visible := False;
      dtmRelaTotSuplBenef.lblTotPlano.Caption := 'Total por Plano: ';
    End
    Else
    Begin
      dtmRelaTotSuplBenef.gfbTotPatro.Visible := True;
      dtmRelaTotSuplBenef.lblTotPlano.Caption := 'Total por Plano: ';
    End;
  End;

  If ChkConsolidar.Checked Then
  Begin
    If Trim(dblkPlano.Text) <> '' Then
      dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text :=
    ' SELECT '+
    '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
    '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
    '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
    '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
    '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
    '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
    '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
    '   G3.IDPLANOPREV, G3.IDBENEFICIO, '+
    '   G3.NOMEBENEF, PL.NOME AS NOMEPLANO, ''Todas'' AS NOMEPATRO '
    Else
    Begin
      If ChkConsolidaPlano.Checked Then
        dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text :=
      ' SELECT '+
      '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
      '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
      '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
      '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
      '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
      '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
      '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
      '   G3.IDBENEFICIO, G3.NOMEBENEF, ''Todos'' AS NOMEPLANO, ''Todas'' AS NOMEPATRO '
      Else
        dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text :=
      ' SELECT '+
      '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
      '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
      '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
      '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
      '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
      '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
      '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
      '   G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME AS NOMEPLANO, ''Todas'' AS NOMEPATRO ';
    End;
  End
  Else
  Begin
    If Trim(dblkPlano.Text) <> '' Then
      dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text :=
    ' SELECT '+
    '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
    '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
    '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
    '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
    '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
    '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
    '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
    '   G3.IDPLANOPREV, G3.IDPESSJUR, G3.IDBENEFICIO, '+
    '   G3.NOMEBENEF, PL.NOME AS NOMEPLANO, PT.NOME AS NOMEPATRO '
    Else
    Begin
      If ChkConsolidaPlano.Checked Then
        dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text :=
      ' SELECT '+
      '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
      '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
      '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
      '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
      '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
      '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
      '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
      '   G3.IDPESSJUR, G3.IDBENEFICIO, '+
      '   G3.NOMEBENEF, ''Todos'' AS NOMEPLANO, PT.NOME AS NOMEPATRO '
      Else
        dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text :=
      ' SELECT '+
      '   COUNT(DISTINCT G3.IDRESPONSAVEL) AS QTDE, '+
      '   NVL(SUM(G5.VALORSRB), 0.00) AS TOTALSRB, '+
      '   NVL(SUM(G6.VALORINSS), 0.00) AS TOTALINSS, '+
      '   NVL(SUM(G3.VALORSUP), 0.00) AS TOTALSUPHSTBENEF, '+
      '   NVL(SUM(G4.VALORLIQUIDO), 0.00) AS TOTALLIQUIDO, '+
      '   NVL(SUM(G4.VALORPROV), 0.00) AS TOTALPROVENTO, '+
      '   NVL(SUM(G4.VALORDESC), 0.00) AS TOTALDESCONTO, '+
      '   G3.IDPESSJUR, G3.IDBENEFICIO, '+
      '   G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME AS NOMEPLANO, PT.NOME AS NOMEPATRO ';
    End;
  End;

  dtmRelaTotSuplBenef.qryRelaTotSupl.close;
  if (dblkVersao.Text <> '') and (dblkVersao.LookupValue <> '') then
  begin
    Filtro := Filtro +' IDHSTFOLHABENEF = '+ dblkVersao.LookupValue +#13#10;
    dtmRelaTotSuplBenef.LbVersao.Caption := 'Versão: '+dblkVersao.Text;
  end;

  dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
' FROM (SELECT '+#13#10+
'          DISTINCT G2.VALORSUP, G2.IDPLANOPREV, G2.IDPESSJUR, G2.IDPESSOA, G2.IDRESPONSAVEL, '+#13#10+
'          B.IDBENEFICIO, B.NOME AS NOMEBENEF '+#13#10+
'          FROM (SELECT '+#13#10+
'                   SUM(G.VALORPREV) AS VALORSUP, G.IDPLANOPREV, G.IDPESSJUR, G.IDPESSOA, '+#13#10+
'                   G.IDRESPONSAVEL '+#13#10+
'                FROM (SELECT '+#13#10+
'                         HSB.VALORPREV, HSB.IDPESSOA, BFC.IDRESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESSJUR, '+#13#10+
'                         HSB.IDBENEFICIO, B.TIPOBENEFICIO '+#13#10+
'                       FROM HSTBENEFBFCIARIO HSB, BFCIARIOTITPLAN BFC, BENEFPLANPREV BP, BENEFICIO B '+#13#10+
'                       WHERE '+Filtro;

  If Trim(dblkPatrocinadora.Text) <> '' Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
                            ' AND HSB.IDPESSJUR = '+dblkPatrocinadora.LookupValue;

  If Trim(dblkPlano.Text) <> '' Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
                            ' AND HSB.IDPLANOPREV = '+dblkPlano.LookupValue;

  dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
'                             AND HSB.IDTITULAR = BFC.IDTITULAR '+#13#10+
'                             AND HSB.IDPESSOA = BFC.IDPESSOA '+#13#10+
'                             AND HSB.IDBENEFICIO = BFC.IDBENEFICIO '+#13#10+
'                             AND HSB.IDPLANOPREV = BFC.IDPLANOPREV '+#13#10+
'                             AND HSB.IDPESSJUR = BFC.IDPESSJUR '+#13#10+
'                             AND HSB.IDBENEFICIO = BP.IDBENEFICIO '+#13#10+
'                             AND HSB.IDPLANOPREV = BP.IDPLANOPREV '+#13#10+
'                             AND (BP.FLGREFERENCIA = 0 OR (BP.FLGREFERENCIA = 1 AND BP.FLGPAGAINSS = 1)) '+#13#10+
'                             AND HSB.IDBENEFICIO = B.IDBENEFICIO '+
                            ' AND (((SELECT COUNT(DISTINCT HH1.NUMEROPROCESSO) '+
                              ' FROM HSTBENEFBFCIARIO HH1 '+
                              ' WHERE '+Filtro+
                              ' AND HH1.IDTITULAR = HSB.IDTITULAR '+
                              ' AND HH1.IDPESSOA = HSB.IDPESSOA) = 1) OR '+
                              '(HSB.NUMEROPROCESSO = (SELECT DISTINCT BBF1.NUMEROPROCESSO '+
                                                   ' FROM BENEFBFCIARIO BBF1 '+
                                                   ' WHERE BBF1.DATAINICIO = (SELECT MAX(BBF2.DATAINICIO) '+
                                                                            ' FROM BENEFBFCIARIO BBF2 '+
                                                                            ' WHERE BBF2.IDPESSOA = BBF1.IDTITULAR '+
                                                                            ' AND BBF2.IDTITULAR = BBF1.IDTITULAR) '+
                                                   ' AND BBF1.IDPESSOA = HSB.IDTITULAR '+
                                                   ' AND BBF1.IDTITULAR = HSB.IDPESSOA)))) G '+
'                       GROUP BY G.IDPLANOPREV, G.IDPESSJUR, G.IDPESSOA, '+#13#10+
'                       G.IDRESPONSAVEL) G2, HSTBENEFBFCIARIO HST2, BENEFPLANPREV BP, BENEFICIO B '+#13#10+
'                       WHERE  '+Filtro;

  If Trim(dblkPatrocinadora.Text) <> '' Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
                            ' AND HST2.IDPESSJUR = '+dblkPatrocinadora.LookupValue;

  If Trim(dblkPlano.Text) <> '' Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
                            ' AND HST2.IDPLANOPREV = '+dblkPlano.LookupValue;

  dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
'                             AND HST2.IDPESSOA = G2.IDPESSOA '+#13#10+
'                             AND HST2.IDBENEFICIO = BP.IDBENEFICIO '+#13#10+
'                             AND HST2.IDPLANOPREV = BP.IDPLANOPREV '+#13#10+
'                             AND (BP.FLGREFERENCIA = 0 OR (BP.FLGREFERENCIA = 1 AND BP.FLGPAGAINSS = 1)) '+#13#10+
'                             AND HST2.IDBENEFICIO = B.IDBENEFICIO '+
                              ' AND (((SELECT COUNT(DISTINCT HH1.NUMEROPROCESSO) '+
                              ' FROM HSTBENEFBFCIARIO HH1 '+
                              ' WHERE '+Filtro+
                              ' AND HH1.IDTITULAR = HST2.IDTITULAR '+
                              ' AND HH1.IDPESSOA = HST2.IDPESSOA) = 1) OR '+
                            ' (HST2.NUMEROPROCESSO = (SELECT DISTINCT BBF1.NUMEROPROCESSO '+
                                                    ' FROM BENEFBFCIARIO BBF1 '+
                                                    ' WHERE BBF1.DATAINICIO = (SELECT MAX(BBF2.DATAINICIO) '+
                                                                             ' FROM BENEFBFCIARIO BBF2 '+
                                                                             ' WHERE BBF2.IDPESSOA = BBF1.IDTITULAR '+
                                                                             ' AND BBF2.IDTITULAR = BBF1.IDTITULAR) '+
                                                    ' AND BBF1.IDPESSOA = HST2.IDTITULAR '+
                                                    ' AND BBF1.IDTITULAR = HST2.IDPESSOA))) '+
'                             AND B.TIPOBENEFICIO < 99) G3, '+#13#10+
'                            (SELECT '+#13#10+
'                                    HB.IDPLANOPREV, HB.IDPATRO, HB.IDRESPONSAVEL, '+#13#10+
'                                    SUM(DECODE(PR.FLGESPECIAL,0, '+#13#10+
'                                    DECODE(PR.FLGDESCONTO,0,HB.VALORPROVENTO, 1,(-1)*HB.VALORPROVENTO, 0), 0)) AS VALORLIQUIDO, '+#13#10+
'                                    SUM(DECODE(PR.FLGESPECIAL,0, '+#13#10+
'                                    DECODE(PR.FLGDESCONTO,0,HB.VALORPROVENTO, 1,0, 0), 0)) AS VALORPROV, '+#13#10+
'                                    SUM(DECODE(PR.FLGESPECIAL,0, DECODE(PR.FLGDESCONTO,0,0, 1,HB.VALORPROVENTO, 0), 0)) AS VALORDESC '+#13#10+
'                            FROM HISTRUBSAL HB, PROVDESC PR '+#13#10+
'                            WHERE  '+Filtro+
'                                  AND HB.IDRUBRICA = PR.IDPROVENTO '+#13#10+
'                            GROUP BY HB.IDPLANOPREV, HB.IDPATRO, HB.IDRESPONSAVEL) G4, '+#13#10+
'                            (SELECT '+#13#10+
'                               SUM(G.VALORSRB) AS VALORSRB, G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL '+#13#10+
'                             FROM ( SELECT HSB.VALORSRB, HSB.IDPESSOA, BFC.IDRESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESSJUR, '+#13#10+
'                                           HSB.IDBENEFICIO, B.TIPOBENEFICIO '+#13#10+
'                                    FROM HSTBENEFBFCIARIO HSB, BFCIARIOTITPLAN BFC, BENEFPLANPREV BP, BENEFICIO B '+#13#10+
'                                    WHERE  '+Filtro;

  If Trim(dblkPatrocinadora.Text) <> '' Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
                            ' AND HSB.IDPESSJUR = '+dblkPatrocinadora.LookupValue;

  If Trim(dblkPlano.Text) <> '' Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
                            ' AND HSB.IDPLANOPREV = '+dblkPlano.LookupValue;

  dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
'                                          AND HSB.IDTITULAR = BFC.IDTITULAR '+#13#10+
'                                          AND HSB.IDPESSOA = BFC.IDPESSOA '+#13#10+
'                                          AND HSB.IDBENEFICIO = BFC.IDBENEFICIO '+#13#10+
'                                          AND HSB.IDPLANOPREV = BFC.IDPLANOPREV '+#13#10+
'                                          AND HSB.IDPESSJUR = BFC.IDPESSJUR '+#13#10+
'                                          AND HSB.IDBENEFICIO = BP.IDBENEFICIO '+#13#10+
'                                          AND HSB.IDPLANOPREV = BP.IDPLANOPREV '+#13#10+
'                                          AND (BP.FLGREFERENCIA = 0 OR (BP.FLGREFERENCIA = 1 AND BP.FLGPAGAINSS = 1)) '+#13#10+
'                                          AND HSB.IDBENEFICIO = B.IDBENEFICIO '+
                               ' AND (((SELECT COUNT(DISTINCT HH1.NUMEROPROCESSO) '+
                                      ' FROM HSTBENEFBFCIARIO HH1 '+
                                      ' WHERE '+Filtro+
                                      ' AND HH1.IDTITULAR = HSB.IDTITULAR '+
                                      ' AND HH1.IDPESSOA = HSB.IDPESSOA) = 1) OR '+
                                     ' ( HSB.NUMEROPROCESSO = (SELECT DISTINCT BBF1.NUMEROPROCESSO '+
                                                           ' FROM BENEFBFCIARIO BBF1 '+
                                                           ' WHERE BBF1.DATAINICIO = (SELECT MAX(BBF2.DATAINICIO) '+
                                                                                    ' FROM BENEFBFCIARIO BBF2 '+
                                                                                    ' WHERE BBF2.IDPESSOA = BBF1.IDTITULAR '+
                                                                                    ' AND BBF2.IDTITULAR = BBF1.IDTITULAR) '+
                                                           ' AND BBF1.IDPESSOA = HSB.IDTITULAR '+
                                                           ' AND BBF1.IDTITULAR = HSB.IDPESSOA)))) G '+
'                                    GROUP BY G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL) G5, '+#13#10+
'                                    (SELECT SUM(G.VALORPREV) AS VALORINSS, G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL '+#13#10+
'                                     FROM (SELECT HSB.VALORPREV, HSB.IDPESSOA, BFC.IDRESPONSAVEL, HSB.IDPLANOPREV, HSB.IDPESSJUR, '+#13#10+
'                                                  HSB.IDBENEFICIO, B.TIPOBENEFICIO '+#13#10+
'                                           FROM HSTBENEFBFCIARIO HSB, BFCIARIOTITPLAN BFC, BENEFPLANPREV BP, BENEFICIO B '+#13#10+
'                                           WHERE  '+Filtro;

  If Trim(dblkPatrocinadora.Text) <> '' Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
                            ' AND HSB.IDPESSJUR = '+dblkPatrocinadora.LookupValue;

  If Trim(dblkPlano.Text) <> '' Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
                            ' AND HSB.IDPLANOPREV = '+dblkPlano.LookupValue;

  dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
'                                                 AND HSB.IDTITULAR = BFC.IDTITULAR '+#13#10+
'                                                 AND HSB.IDPESSOA = BFC.IDPESSOA '+#13#10+
'                                                 AND HSB.IDBENEFICIO = BFC.IDBENEFICIO '+#13#10+
'                                                 AND HSB.IDPLANOPREV = BFC.IDPLANOPREV '+#13#10+
'                                                 AND HSB.IDPESSJUR = BFC.IDPESSJUR '+#13#10+
'                                                 AND HSB.IDBENEFICIO = BP.IDBENEFICIO '+#13#10+
'                                                 AND HSB.IDPLANOPREV = BP.IDPLANOPREV '+#13#10+
'                                                 AND BP.FLGREFERENCIA = 1 '+#13#10+
'                                                 AND BP.FLGPAGAINSS = 0 '+#13#10+
'                                                 AND HSB.IDBENEFICIO = B.IDBENEFICIO '+
                                      ' AND (((SELECT COUNT(DISTINCT HH1.NUMEROPROCESSO) '+
                                             ' FROM HSTBENEFBFCIARIO HH1 '+
                                             ' WHERE '+Filtro+
                                             ' AND HH1.IDTITULAR = HSB.IDTITULAR '+
                                             ' AND HH1.IDPESSOA = HSB.IDPESSOA) = 1) OR '+
                                           ' (HSB.NUMEROPROCESSO = (SELECT DISTINCT BBF1.NUMEROPROCESSO '+
                                                                  ' FROM BENEFBFCIARIO BBF1 '+
                                                                  ' WHERE BBF1.DATAINICIO = (SELECT MAX(BBF2.DATAINICIO) '+
                                                                                           ' FROM BENEFBFCIARIO BBF2 '+
                                                                                           ' WHERE BBF2.IDPESSOA = BBF1.IDTITULAR '+
                                                                                           ' AND BBF2.IDTITULAR = BBF1.IDTITULAR) '+
                                                                  ' AND BBF1.IDPESSOA = HSB.IDTITULAR '+
                                                                  ' AND BBF1.IDTITULAR = HSB.IDPESSOA)))) G '+
'                                            GROUP BY G.IDPLANOPREV, G.IDPESSJUR, G.IDRESPONSAVEL ) G6, PESSOA PT, PLANPREV PL '+#13#10+
'                                            WHERE PT.IDPESSOA = G3.IDPESSJUR '+#13#10+
'                                                  AND PL.IDPLANOPREV = G3.IDPLANOPREV '+#13#10+
'                                                  AND G3.IDRESPONSAVEL = G4.IDRESPONSAVEL '+#13#10+
'                                                  AND G3.IDPLANOPREV = G4.IDPLANOPREV '+#13#10+
'                                                  AND G3.IDPESSJUR = G4.IDPATRO '+#13#10+
'                                                  AND G3.IDRESPONSAVEL = G5.IDRESPONSAVEL(+) '+#13#10+
'                                                  AND G3.IDPLANOPREV = G5.IDPLANOPREV(+) '+#13#10+
'                                                  AND G3.IDPESSJUR = G5.IDPESSJUR(+) '+#13#10+
'                                                  AND G3.IDRESPONSAVEL = G6.IDRESPONSAVEL(+) '+#13#10+
'                                                  AND G3.IDPLANOPREV = G6.IDPLANOPREV(+) '+#13#10+
'                                                  AND G3.IDPESSJUR = G6.IDPESSJUR(+) ';

  If ChkConsolidar.Checked Then
  Begin
    If Trim(dblkPlano.Text) <> '' Then
      dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
      ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME '+
      ' ORDER BY G3.IDPLANOPREV, G3.IDBENEFICIO '
    Else
    Begin
      If ChkConsolidaPlano.Checked Then
        dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
        ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF '+
        ' ORDER BY G3.IDBENEFICIO '
      Else
        dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
        ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME '+
        ' ORDER BY G3.IDPLANOPREV, G3.IDBENEFICIO ';
    End;
  End
  Else
  Begin
    If Trim(dblkPlano.Text) <> '' Then
      dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
      ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPLANOPREV, PL.NOME, G3.IDPESSJUR, PT.NOME '+
      ' ORDER BY PT.NOME, PL.NOME, G3.NOMEBENEF '
    Else
    Begin
      If ChkConsolidaPlano.Checked Then
        dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
        ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPESSJUR, PT.NOME '+
        ' ORDER BY PT.NOME, G3.NOMEBENEF '
      Else
        dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text +
        ' GROUP BY G3.IDBENEFICIO, G3.NOMEBENEF, G3.IDPESSJUR, G3.IDPLANOPREV, PL.NOME, PT.NOME '+
        ' ORDER BY PT.NOME, PL.NOME, G3.NOMEBENEF ';
    End;
  End;

  If not dtmRelaTotSuplBenef.qryRelaTotSupl.Prepared Then
    dtmRelaTotSuplBenef.qryRelaTotSupl.Prepare;
    ssql := dtmRelaTotSuplBenef.qryRelaTotSupl.Sql.Text;
  //  cmdebugToFile(ssql,'c:\qryRelaTotSupl.txt');
  dtmRelaTotSuplBenef.qryRelaTotSupl.Open;
end;

procedure TFrmFiltroRelaTotSupl.dblkVersaoChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := ((dblkVersao.Text <> '') And (dblkVersao.LookupValue <> ''));
end;

procedure TFrmFiltroRelaTotSupl.FormShow(Sender: TObject);
begin
  inherited;
  qryHistorico.Open;
  qryPatrocinadora.Open;
  qryPlano.Open;
end;

procedure TFrmFiltroRelaTotSupl.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  qryHistorico.Close;
  qryPatrocinadora.Close;
  qryPlano.Close;
end;

procedure TFrmFiltroRelaTotSupl.dblkPatrocinadoraChange(Sender: TObject);
begin
  inherited;
  If Trim(dblkPatrocinadora.Text) <> '' Then
  Begin
    ChkConsolidar.Enabled := False;
    ChkConsolidar.Checked := False;
  End Else
    ChkConsolidar.Enabled := True;
end;

procedure TFrmFiltroRelaTotSupl.dblkPlanoChange(Sender: TObject);
begin
  inherited;
  If Trim(dblkPlano.Text) <> '' Then
  Begin
    ChkConsolidaPlano.Enabled := False;
    ChkConsolidaPlano.Checked := False;
  End Else
    ChkConsolidaPlano.Enabled := True;
end;

end.
