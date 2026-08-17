// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FPRelResumoRubricas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin;

type
  TfrmPRelResumoRubricas = class(TfrmOkCancelar)
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    Label1: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    Label2: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    qryPlanPREV: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelResumoRubricas: TfrmPRelResumoRubricas;

implementation

uses DRelatorios, UMensErro, uAdmPrev;

{$R *.DFM}

procedure TfrmPRelResumoRubricas.FormShow(Sender: TObject);
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

procedure TfrmPRelResumoRubricas.qryPatroAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryPatro.Active then Exit;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;
end;

procedure TfrmPRelResumoRubricas.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;
end;

procedure TfrmPRelResumoRubricas.bbtnConfirmarClick(Sender: TObject);
var sAno, sMesReferencia, sAnoMesReferencia, sEnd , sFiltroPatro, sFiltroPlano : string;
    i : Integer;
begin
  inherited;
  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if (Trim(dblkpcmbPatro.Text) = '')
  then begin
     MsgDlg('Selecione a Patrocinadora. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;


  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMesReferencia   := sAno+'/'+sMesReferencia;

   // Filtrar apenas as contribuições com motivo = cobrança de contribuição normal
   with dtmRelatorios do
   begin
     //  OBTER DADOS DA FUNDAÇÃO
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     lblTitulo.Caption := 'Resumo de Rubricas Recebidas - Mês : '+Trim(cmbMesRef.Text)+' / '+Trim(spedAnoRef.Text);

     if  (Trim(dblkpcmbPatro.Text) = '')
     then sFiltroPatro :=  ' T.IDPESSJUR'
     else begin
        sFiltroPatro := qryPatro.FieldByName('IdPessoa').AsString;
     end;

     if  (Trim(dblkpcmbPlano.Text) = '')
     then sFiltroPlano :=  ' T.IDPLANOPREV'
     else begin
        sFiltroPlano := qryPlanPrev.FieldByName('IdPlanoPrev').AsString;
     end;

     with qryResumoRubricas do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT SUM(T.VALORRECEBIDO), '''+sAnoMesReferencia+''' MESCOBRANCA,      '+
                '        '''+Trim(dblkpcmbPatro.Text)+''' NOMEPATRO,                       '+
                '        T.MESREFERENCIA ,  T.CODPROVDESC, P.DESCRICAO ,                   '+
                '        PL.NOME NOMEPLANO, C.NOME NOMECONTRIB                             '+
                ' FROM   TMPDESC T , PROVDESC P, PLANPREV PL , CONTRIBUICAO C, PATRO PT    '+
                ' WHERE  T.IDPESSJUR =  '+sFiltroPatro                                     +
                ' AND    T.IDPLANOPREV = '+sFiltroPlano                                    +
                ' AND    T.MESCOBRANCA = '''+sAnoMesReferencia+'''                         '+
                ' AND    T.FLGDESCFOLHA = ''P''                                            '+
                ' AND    NVL(T.VALORRECEBIDO,0) > 0                                        '+
                ' AND    P.IDPROVENTO = T.IDPROVENTO                                       '+
                ' AND    C.IDCONTRIBUICAO = T.IDDESCONTO                                   '+
                ' AND    PL.IDPLANOPREV = T.IDPLANOPREV                                    '+
                ' AND    PT.IDPESSOA    = T.IDPESSJUR                                      '+
                ' AND    PT.IDFUNDACAO  = '+IntToStr(iIdFundacao)                           +
                ' GROUP BY T.MESREFERENCIA ,  T.CODPROVDESC, P.DESCRICAO , PL.NOME, C.NOME '+
                ' ORDER BY PL.NOME,  C.NOME, T.CODPROVDESC , T.MESREFERENCIA               ');
        Open;
     end;

   end;

end;

end.
