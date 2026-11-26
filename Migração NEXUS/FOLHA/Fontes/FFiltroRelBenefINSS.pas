unit FFiltroRelBenefINSS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FReports_Folha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio, IvMulti,
  IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook, Spin,
  ExtCtrls, fAguarde, dRelBenefINSS, dRelFolha,uAdmPrevFB;

type
  TFrmFiltroRelBenefINSS = class(TFrmReports_Folha)
    Label1: TLabel;
    CbMesIni: TComboBox;
    spnedAnoIni: TSpinEdit;
    Label2: TLabel;
    qryPatro: TwwQuery;
    qryPLano: TwwQuery;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    dblkPlano: TwwDBLookupCombo;
    dblkPatro: TwwDBLookupCombo;
    qryBenef: TwwQuery;
    Label5: TLabel;
    dblkBeneficios: TwwDBLookupCombo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkBeneficiosChange(Sender: TObject);
  private
    { Private declarations }
    sMesRefIni, sMesRefFin, sFiltro : string;
    
  public
    { Public declarations }
  end;

var
  FrmFiltroRelBenefINSS: TFrmFiltroRelBenefINSS;

implementation

{$R *.DFM}

procedure TFrmFiltroRelBenefINSS.FormCreate(Sender: TObject);
begin
  inherited;
  sMesRefIni := '';
  sMesRefFin := '';
  sFiltro := '';
  qryPatro.Open;
  qryPlano.Open;
  qryBenef.Open;
  bbtnConfirmar.Enabled := (dblkBeneficios.Text <> '') and (dblkBeneficios.LookupValue <> '')
end;

procedure TFrmFiltroRelBenefINSS.FormShow(Sender: TObject);
begin
  inherited;
  CbMesIni.ItemIndex := 0;
  spnedAnoIni.Text := spnedAno.Text;
end;

procedure TFrmFiltroRelBenefINSS.bbtnConfirmarClick(Sender: TObject);
  var sGroupBy : string;
begin
  inherited;
  sMesRefIni := '';
  sMesRefFin := '';
  sFiltro := '';

  dtmRelBenefInss.qryRelBenefINSS.close;

  dtmRelFolha.QryFundacao.Close;
  dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  dtmRelFolha.QryFundacao.Open;

  if (CbMesIni.Text <> '') then
  begin
    If (CbMesIni.ItemIndex+1) > 9 Then
      sMesRefIni := FloatToStr(spnedAnoIni.Value) +'/'+ intToStr(CbMesIni.ItemIndex+1)
    Else sMesRefIni := FloatToStr(spnedAnoIni.Value)+'/0'+IntToStr(CbMesIni.ItemIndex+1);

    sFiltro := sFiltro + ' AND HST.MES BETWEEN ''' + sMesRefIni + '''' +#13#10;
  end;

  if (CmbMes.Text <> '') then
  begin
    If (CmbMes.ItemIndex+1) > 9 Then
      sMesRefFin := FloatToStr(SpnedAno.Value) +'/'+ intToStr(cmbMes.ItemIndex+1)
    Else sMesRefFin := FloatToStr(SpnedAno.Value)+'/0'+IntToStr(cmbMes.ItemIndex+1);

    sFiltro := sFiltro + ' AND ''' + sMesRefFin + '''' +#13#10;
  end;

  if (sMesRefIni = '') or (sMesRefFin = '') then
  begin
    MessageDlg('É Necessário o Preenchimento dos Campos Mês Inicial e Mês Final!', mtCustom, [mbOK], 0);
    abort;
  end;

  if (sMesRefIni > sMesRefFin) then
  begin
    MessageDlg('O Mês Inicial é Posterior ao Mês Final!', mtCustom, [mbOK], 0);
    abort;
  end;

  frmAguarde.Mostra(' Processando as Informações do Relatório... ');
  frmAguarde.Repaint;


  if  (DblkPatro.Text <> '') and (DblkPatro.LookupValue <> '') then
  begin
    sFiltro := sFiltro + ' AND HST.IDPESSJUR = ' + DblkPatro.LookupValue +#13#10;
  end;

  if  (DblkPlano.Text <> '') and (DblkPlano.LookupValue <> '') then
  begin
    sFiltro := sFiltro + ' AND BPP.IDPLANOPREV = ' + DblkPlano.LookupValue +#13#10;
  end;

  if  (dblkBeneficios.Text <> '') and (dblkBeneficios.LookupValue <> '') then
  begin
    sFiltro := sFiltro + ' AND BPP.IDBENEFICIO = ' + dblkBeneficios.LookupValue +#13#10;
  end;

  // selecionado nenhum plano e nenhuma patro beneficio
  if (DblkPatro.Text = '') and (DblkPatro.LookupValue = '') and (DblkPlano.Text = '') and (DblkPlano.LookupValue = '') then
  begin
    dtmRelBenefInss.qryRelBenefINSS.sql.text := ' SELECT '+#13#10+
                                                '  ''TODAS'' AS PATRO, '+#13#10+
                                                '  ''TODOS'' AS PLANO, '+#13#10+
                                                '  HST.MES, '+#13#10+
                                                '  BN.NOME AS BENEFICIO, '+#13#10+
                                                '  SUM(HST.VLBENEFPGTO) AS SUPLEMENTACAO '+#13#10+
                                                ' FROM HSTBENEFBFCIARIO HST, BENEFPLANPREV BPP, PLANPREV PP, BENEFICIO BN, PESSOA PATRO '+#13#10+
                                                ' WHERE  '+#13#10+
                                                '       BPP.FLGREFERENCIA = 1             AND '+#13#10+
                                                '       BPP.IDBENEFICIO = HST.IDBENEFICIO AND '+#13#10+
                                                '       BPP.IDPLANOPREV = HST.IDPLANOPREV AND '+#13#10+
                                                '       BPP.IDPLANOPREV = PP.IDPLANOPREV  AND '+#13#10+
                                                '       BPP.IDBENEFICIO = BN.IDBENEFICIO  AND '+#13#10+
                                                '       HST.VLBENEFPGTO > 0               AND '+#13#10+
                                                '       HST.FLGDEVOLUCAO <> 1             AND '+#13#10+
                                                '       PATRO.IDPESSOA  = HST.IDPESSJUR '+#13#10 + sFiltro +
                                                ' GROUP BY HST.MES, BN.NOME '+#13#10+
                                                ' ORDER BY HST.MES ASC ';
  end;

  // selecionado uma patro e um beneficio
  if (DblkPatro.Text <> '') and (DblkPatro.LookupValue <> '') and (DblkPlano.Text = '') and (DblkPlano.LookupValue = '') then
  begin
    dtmRelBenefInss.qryRelBenefINSS.sql.text := ' SELECT '+#13#10+
                                                '  PATRO.NOME AS PATRO, '+#13#10+
                                                '  ''TODOS'' AS PLANO, '+#13#10+
                                                '  HST.MES, '+#13#10+
                                                '  BN.NOME AS BENEFICIO, '+#13#10+
                                                '  SUM(HST.VLBENEFPGTO) AS SUPLEMENTACAO '+#13#10+
                                                ' FROM HSTBENEFBFCIARIO HST, BENEFPLANPREV BPP, PLANPREV PP, BENEFICIO BN, PESSOA PATRO '+#13#10+
                                                ' WHERE  '+#13#10+
                                                '       BPP.FLGREFERENCIA = 1             AND '+#13#10+
                                                '       BPP.IDBENEFICIO = HST.IDBENEFICIO AND '+#13#10+
                                                '       BPP.IDPLANOPREV = HST.IDPLANOPREV AND '+#13#10+
                                                '       BPP.IDPLANOPREV = PP.IDPLANOPREV  AND '+#13#10+
                                                '       BPP.IDBENEFICIO = BN.IDBENEFICIO  AND '+#13#10+
                                                '       HST.VLBENEFPGTO > 0               AND '+#13#10+
                                                '       HST.FLGDEVOLUCAO <> 1             AND '+#13#10+                                                '       PATRO.IDPESSOA  = HST.IDPESSJUR '+#13#10 + sFiltro +
                                                ' GROUP BY HST.MES, BN.NOME, PATRO.NOME '+#13#10+
                                                ' ORDER BY PATRO.NOME, HST.MES ASC ';
  end;

  // selecionado um Plano e um beneficio
  if (DblkPatro.Text = '') and (DblkPatro.LookupValue = '') and (DblkPlano.Text <> '') and (DblkPlano.LookupValue <> '') then
  begin
    dtmRelBenefInss.qryRelBenefINSS.sql.text := ' SELECT '+#13#10+
                                                '  ''TODAS'' AS PATRO, '+#13#10+
                                                '  PP.NOME AS PLANO, '+#13#10+
                                                '  HST.MES, '+#13#10+
                                                '  BN.NOME AS BENEFICIO, '+#13#10+
                                                '  SUM(HST.VLBENEFPGTO) AS SUPLEMENTACAO '+#13#10+
                                                ' FROM HSTBENEFBFCIARIO HST, BENEFPLANPREV BPP, PLANPREV PP, BENEFICIO BN, PESSOA PATRO '+#13#10+
                                                ' WHERE  '+#13#10+
                                                '       BPP.FLGREFERENCIA = 1             AND '+#13#10+
                                                '       BPP.IDBENEFICIO = HST.IDBENEFICIO AND '+#13#10+
                                                '       BPP.IDPLANOPREV = HST.IDPLANOPREV AND '+#13#10+
                                                '       BPP.IDPLANOPREV = PP.IDPLANOPREV  AND '+#13#10+
                                                '       BPP.IDBENEFICIO = BN.IDBENEFICIO  AND '+#13#10+
                                                '       HST.VLBENEFPGTO > 0               AND '+#13#10+
                                                '       HST.FLGDEVOLUCAO <> 1             AND '+#13#10+
                                                '       PATRO.IDPESSOA  = HST.IDPESSJUR '+#13#10 + sFiltro +
                                                ' GROUP BY PP.NOME, HST.MES, BN.NOME '+#13#10+
                                                ' ORDER BY HST.MES ASC ';
  end;

  // selecionado um Plano e uma patro e um beneficio
  if (DblkPatro.Text <> '') and (DblkPatro.LookupValue <> '') and (DblkPlano.Text <> '') and (DblkPlano.LookupValue <> '') then
  begin
    dtmRelBenefInss.qryRelBenefINSS.sql.text := ' SELECT '+#13#10+
                                                '  PATRO.NOME AS PATRO, '+#13#10+
                                                '  PP.NOME AS PLANO, '+#13#10+
                                                '  HST.MES, '+#13#10+
                                                '  BN.NOME AS BENEFICIO, '+#13#10+
                                                '  SUM(HST.VLBENEFPGTO) AS SUPLEMENTACAO '+#13#10+
                                                ' FROM HSTBENEFBFCIARIO HST, BENEFPLANPREV BPP, PLANPREV PP, BENEFICIO BN, PESSOA PATRO '+#13#10+
                                                ' WHERE  '+#13#10+
                                                '       BPP.FLGREFERENCIA = 1             AND '+#13#10+
                                                '       BPP.IDBENEFICIO = HST.IDBENEFICIO AND '+#13#10+
                                                '       BPP.IDPLANOPREV = HST.IDPLANOPREV AND '+#13#10+
                                                '       BPP.IDPLANOPREV = PP.IDPLANOPREV  AND '+#13#10+
                                                '       BPP.IDBENEFICIO = BN.IDBENEFICIO  AND '+#13#10+
                                                '       HST.VLBENEFPGTO > 0               AND '+#13#10+
                                                '       HST.FLGDEVOLUCAO <> 1             AND '+#13#10+
                                                '       PATRO.IDPESSOA  = HST.IDPESSJUR '+#13#10 + sFiltro +
                                                ' GROUP BY PATRO.NOME, PP.NOME, HST.MES, BN.NOME '+#13#10+
                                                ' ORDER BY PATRO.NOME, HST.MES ASC ';
  end;

  dtmRelBenefInss.qryRelBenefINSS.Open;
  frmAguarde.Apaga;

end;

procedure TFrmFiltroRelBenefINSS.dblkBeneficiosChange(Sender: TObject);
begin
  inherited;
  bbtnConfirmar.Enabled := (dblkBeneficios.Text <> '') and (dblkBeneficios.LookupValue <> '')
end;

end.
