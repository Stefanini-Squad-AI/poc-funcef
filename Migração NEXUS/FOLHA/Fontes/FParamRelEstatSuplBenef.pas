unit FParamRelEstatSuplBenef;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FParamRelaEntSaiFolha, Db, Wwdatsrc, DBTables, Wwquery, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons, TB97Tlbr, TB97, wwdblook,
  Mask, wwdbedit, Wwdbspin, ExtCtrls, dRelFolha, uAdmPrevFB, fAguarde, usistema, dbasedados;

type
  TFRMParamRelEstatSuplBenef = class(TfrmParamRelaEntSaiFolha)
    Label1: TLabel;
    Label2: TLabel;
    CbMesFinal: TComboBox;
    dbSEAnoFinal: TwwDBSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cmbBeneficioChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRMParamRelEstatSuplBenef: TFRMParamRelEstatSuplBenef;

implementation
uses dRelEstatSuplBenef;
{$R *.DFM}

procedure TFRMParamRelEstatSuplBenef.bbtnConfirmarClick(Sender: TObject);
var sMesRefIni, sMesRefFinal, sFiltro, sGroupBy : string;
begin
  dtmBaseDados.dbBaseDados.StartTransaction;
  if not Sistema.GravaLogOperacoes('Emissão: '+caption) then
    Raise Exception.Create('Não foi possível gravar o log.')
  else
    dtmBaseDados.dbBaseDados.Commit;

  sMesRefIni := '';
  sMesRefFinal := '';
  sFiltro := '';

  frmAguarde.Mostra(' Processando as Informações do Relatório... ');
  frmAguarde.Repaint;

  dtmRelEstatSuplBenef.QryEstatSuplBenef.Close;

  if (CbMes.Text <> '') then
  begin
    If (cbMes.ItemIndex+1) > 9 Then
      sMesRefIni := FloatToStr(dbseAno.Value) +'/'+ intToStr(cbMes.ItemIndex+1)
    Else sMesRefIni := FloatToStr(dbseAno.Value)+'/0'+IntToStr(cbMes.ItemIndex+1);
  end;

  if (CbMesFinal.Text <> '') then
  begin
    If (cbMesFinal.ItemIndex+1) > 9 Then
      sMesRefFinal := FloatToStr(dbseAnoFinal.Value) +'/'+ intToStr(cbMesFinal.ItemIndex+1)
    Else sMesRefFinal := FloatToStr(dbseAnoFinal.Value)+'/0'+IntToStr(cbMesFinal.ItemIndex+1);
  end;

   if (dbseAno.Value > dbseAnoFinal.Value) then
   begin
    MessageDlg('ERRO: O Mês Inicial é Posterior ao Mês Final.', mtCustom, [mbOK], 0);
    abort;
   end;

   if (sMesRefIni = '') or (sMesRefIni = '') then
   begin
    MessageDlg('Você Deve Selecionar um Período.', mtCustom, [mbOK], 0);
    abort;
   end;


  if (sMesRefIni <> '') and (sMesRefFinal <> '') then
  begin
    sFiltro := sFiltro + ' AND HST.MESCOBRANCA BETWEEN '''+ sMesRefIni + ''' AND '''+ sMesRefFinal +'''' + #13#10;
  end;

  if (cmbBeneficio.Text <> '') and (cmbBeneficio.LookupValue <> '') then
  begin
    sFiltro := sFiltro + ' AND BPP.IDBENEFICIO = ' + cmbBeneficio.LookupValue +#13#10;
  end;

  dtmRelEstatSuplBenef.QryEstatSuplBenef.SQL.Text :=
' SELECT '+#13#10+
'   HST.MESCOBRANCA, '+#13#10+
'   BN.NOME AS BENEFICIO, '+#13#10+
'   sum(decode(pvd.flgdesconto, 0, hst.valorprovento, 0, 0)) as suplementacaoes, '+#13#10+
'   COUNT(*) AS QTDE '+#13#10+
' FROM HISTRUBSAL HST, PROVDESC PVD, BENEFPLANPREV BPP, BENEFICIO BN '+#13#10+
' WHERE '+#13#10+
'   HST.VALORPROVENTO > 0            AND  '+#13#10+
'   PVD.IDPROVENTO  = HST.IDRUBRICA  AND  '+#13#10+
'   BPP.IDRUBRICA   = HST.IDRUBRICA  AND  '+#13#10+
'   BPP.IDBENEFICIO = BN.IDBENEFICIO      '+#13#10+ sFiltro +
' GROUP BY  '+#13#10+
'    HST.MESCOBRANCA, '+#13#10+
'    BN.NOME '+#13#10+
' ORDER BY HST.MESCOBRANCA ASC ';


  dtmRelEstatSuplBenef.QryEstatSuplBenef.Open;

  dtmRelFolha.QryFundacao.Close;
  dtmRelFolha.QryFundacao.ParamByName('pFundacao').AsInteger := iIdFundacao;
  dtmRelFolha.QryFundacao.Open;

  frmAguarde.Apaga;
end;

procedure TFRMParamRelEstatSuplBenef.FormShow(Sender: TObject);
var year, month, day : Word;
begin
  inherited;
  decodedate(date,year,month,day);
  cbmesFinal.itemindex := month-1;
  dbseanoFinal.Value   := Year;
end;


procedure TFRMParamRelEstatSuplBenef.cmbBeneficioChange(Sender: TObject);
begin
  inherited;
  BbtnConfirmar.Enabled := (cmbBeneficio.text <> '') and (cmbBeneficio.LookupValue <> '');
end;

end.
