// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FPRelRubricasNEncontradas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, Db, DBTables, Wwquery;

type
  TfrmRubricasNEncontradas = class(TfrmOkCancelar)
    qryPatro: TwwQuery;
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    grpSelPatro: TGroupBox;
    Label1: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    qryPlanPREV: TwwQuery;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    edmatini: TEdit;
    Label4: TLabel;
    edmatfim: TEdit;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRubricasNEncontradas: TfrmRubricasNEncontradas;

implementation

uses  UMensErro, UAdmPrev, dRelatorios, USistema;

{$R *.DFM}

procedure TfrmRubricasNEncontradas.FormShow(Sender: TObject);
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

procedure TfrmRubricasNEncontradas.bbtnConfirmarClick(Sender: TObject);
var sAno, sMesReferencia, sAnoMesReferencia, sEnd , sFiltroPatro : string;
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

  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMesReferencia   := sAno+'/'+sMesReferencia;

   // Filtrar apenas as contribuições com motivo = cobrança de contribuição normal
   with dRelatorios.dtmRelatorios do
   begin
     //  OBTER DADOS DA FUNDAÇÃO
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger :=  sistema.idempresa;
     qryFundacao.Prepare;
     qryFundacao.Open;

     qryRubricasNEncontradas.Close;
     qryRubricasNEncontradas.SQL.Clear;
     qryRubricasNEncontradas.SQL.Add('  SELECT  T.MESCOBRANCA, T.MESREFERENCIA , T.VALOR ,T.VALORRECEBIDO, T.CODPROVDESC, '+
                          ' T.IDPESSOA , T.IDPESSJUR, '+
                          ' DECODE(T.FLGTIPODESC,''A'',''Assistencial'',''E'',''Empréstimo'',''Previdencial'') , '+
                          ' EL.MATRICULA , P.NOME PARTICIPANTE, PATRO.NOME PATRO '+
                          ' FROM TMPDESC T , PESSOA P , PESSOA PATRO,'+
                          ' ELEGPATRO EL '+
                          ' WHERE T.MESREFERENCIA = '''+sAnoMesReferencia+'''  '+
                          ' AND T.MESCOBRANCA = '''+sAnoMesReferencia+''' '+
                          ' AND T.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+' '+
                          ' AND T.IDMODULO = 32 '+
                          ' AND T.IDDESCONTO = 0 '+
                          ' AND P.IDPESSOA = T.IDPESSOA '+
                          ' AND PATRO.IDPESSOA = T.IDPESSJUR '+
                          ' AND EL.IDPESSJUR = T.IDPESSJUR '+
                          ' AND EL.IDPESSOA = T.IDPESSOA ');

                          if trim(edmatini.text) <> '' then
                          qryRubricasNEncontradas.SQL.Add(' AND   EL.MATRICULA    >= '+edmatini.text+'');

                          if trim(edmatfim.text) <> '' then
                          qryRubricasNEncontradas.SQL.Add(' AND   EL.MATRICULA    <= '+edmatfim.text+'');

                          qryRubricasNEncontradas.SQL.Add(' ORDER BY T.FLGTIPODESC,  EL.MATRICULA ');

     qryRubricasNEncontradas.Open;
     rpRubricasNEncontradas.print;


   end;



end;

end.
