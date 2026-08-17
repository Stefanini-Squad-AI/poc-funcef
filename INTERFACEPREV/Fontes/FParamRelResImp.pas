// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelResImp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, DBTables, Wwquery, wwdblook, StdCtrls, Spin, IvDictio,
  IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmParamRelResImp = class(TfrmOkCancelar)
    Panel1: TPanel;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    grpSelPatro: TGroupBox;
    Label1: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    qryPlanPREV: TwwQuery;
    qryPatro: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamRelResImp: TfrmParamRelResImp;

implementation

uses  UMensErro, UAdmPrev, dRelatorios, USistema;

{$R *.DFM}

procedure TfrmParamRelResImp.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
  sAno : string;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesRef.ItemIndex := AMonth - 1;
     cmbMesRef.Text := cmbMesRef.Items[cmbMesRef.ItemIndex];
  end;
  spedAnoRef.Text   := IntToStr(AYear);
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao;
  qryPatro.Open;
end;

procedure TfrmParamRelResImp.bbtnConfirmarClick(Sender: TObject);
Var
 sAno,
 sMesReferencia,
 sAnoMesReferencia,
 sSql               : string;
begin
  inherited;
  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbPatro.Text) = ''
  then begin
     MsgDlg('Patrocinadora não preenchida. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  // Prepara MesCobrança
  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMesReferencia   := sAno+'/'+sMesReferencia;

  // Monta a query e executa
  with dRelatorios.dtmRelatorios do
  Begin
   sSql := 'SELECT HT.IDRUBRICA, RP.CODPROVDESC, '+
           'RP.DESCRPROVDESC AS NOMERUBRICA, '+
           'COUNT(1) AS QUANTD, SUM(HT.VALORPROVENTO) AS TOTAL '+
           'FROM HISTRUBSAL HT, RUBRICAXPESS RP '+
           'WHERE HT.IDMODULO = '+inttostr(Sistema.IdModulo)+
           ' AND HT.MESCOBRANCA = '+QuotedStr(sAnoMesReferencia)+
           ' AND HT.REFERENCIA = '+QuotedStr('***')+
           ' AND HT.IDPESSJUR = '+dblkpcmbPatro.LookupValue+
           ' AND RP.IDPESSOA = HT.IDPESSJUR'+
           ' AND HT.IDRUBRICA = RP.IDRUBRICA '+
           'GROUP BY RP.CODPROVDESC, HT.IDRUBRICA, RP.DESCRPROVDESC '+
           'ORDER BY RP.CODPROVDESC';

   ppLabel70.Text := 'Patrocinadora: '+dblkpcmbPatro.Text;
   ppLabel71.Text := 'Mes: '+sAnoMesReferencia;

   qryResImp.Close;
   qryResImp.SQL.Clear;
   qryResImp.SQL.Add(sSql);
   qryResImp.Open
  End;
end;

end.
