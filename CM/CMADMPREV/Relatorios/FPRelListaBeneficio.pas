// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 04.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
//------------------------------------------------------------------------------
unit FPRelListaBeneficio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, Db, Wwdatsrc, DBTables, Wwquery, wwdblook, StdCtrls, Spin,
  IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97, ExtCtrls;

type
  TfrmPRelListaBeneficio = class(TfrmOkCancelar)
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    dblkpcmbBeneficio: TwwDBLookupCombo;
    qryPlano: TwwQuery;
    qryBeneficio: TwwQuery;
    dsPlano: TwwDataSource;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPRelListaBeneficio: TfrmPRelListaBeneficio;

implementation

uses DRelatAdmPrev, DAPrev, UMensErro, UAdmPrev;

{$R *.DFM}

procedure TfrmPRelListaBeneficio.FormShow(Sender: TObject);
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
  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; 
  qryPlano.Open;

  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
  qryBeneficio.Open;
end;

procedure TfrmPRelListaBeneficio.bbtnConfirmarClick(Sender: TObject);
var sAno, sMesReferencia, sAnoMesReferencia : string;
begin
  inherited;
  if Trim(cmbMesRef.Text) = ''
  then begin
     MsgDlg('Mês de Referência não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbPlano.Text) = ''
  then begin
     MsgDlg('Plano não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  if Trim(dblkpcmbBeneficio.Text) = ''
  then begin
     MsgDlg('Benefício não preenchido. ','Erro',mtError,[mbOk,mbHelp],0);
     Exit;
  end;

  sAno := Trim(spedAnoRef.Text);
  if cmbMesRef.ItemIndex <= 8
  then sMesReferencia := '0'+IntToStr(cmbMesRef.ItemIndex+1)
  else sMesReferencia := IntToStr(cmbMesRef.ItemIndex+1);
  sAnoMesReferencia   := sAno+'/'+sMesReferencia;

   // Filtrar apenas as contribuições com motivo = cobrança de contribuição normal
   with dtmRelatAdmPrev do
   begin
     //  OBTER DADOS DA FUNDAÇÃO
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;

     lblListaBenefTitulo.Caption := 'Relação Alfabética de Benefícios Pagos - Mês : '+sAnoMesReferencia; 

     lblListaBenefPlano.Caption :=  'Plano Previdenciário : '+qryPlano.FieldbyName('Nome').AsString;

     lblListaBenefDataPrev.Caption := 'Data Prevista para Pagamento : '+ CriticaDataCobrancaSit(dtmAPrev.qry ,
                                      IntToStr(iIdFundacao),
                                      qryPlano.fieldByName('IdPlanoPrev').AsString,
                                      'AS',
                                      'N',
                                      sMesReferencia,
                                      sAno);
     lblListaBenefIndice.Caption := 'Índice de Atualização da Reserva : '+qryBeneficio.FieldByName('MoeDesc').AsString+
                                    '('+qryBeneficio.FieldByName('MoeSigla').AsString;

     qryListaBeneficio.Close;
     qryListaBeneficio.ParamByName('IdBeneficio').AsInteger := qryBeneficio.FieldByName('IdBeneficio').AsInteger;
     qryListaBeneficio.ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
     qryListaBeneficio.ParamByname('MesReferencia').AsString := sAnoMesReferencia;
     qryListaBeneficio.Open;
   end;

end;

procedure TfrmPRelListaBeneficio.dblkpcmbPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryBeneficio.Close;
  qryBeneficio.ParamByName('IdPlanoPrev').AsInteger := qryPlano.FieldByName('IdPlanoPrev').AsInteger;
  qryBeneficio.Open;

end;

end.
