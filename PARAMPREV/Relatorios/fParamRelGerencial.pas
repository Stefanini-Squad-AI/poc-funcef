// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
unit FParamRelGerencial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, Wwdatsrc, Grids, Wwdbigrd, Wwdbgrid,
  DBTables, Wwquery, Spin;

type
  TfrmParamRelGerencial = class(TfrmOkCancelar)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    qryPatro: TwwQuery;
    qryPlano: TwwQuery;
    wwDBGrid1: TwwDBGrid;
    dsPatro: TwwDataSource;
    dsPlano: TwwDataSource;
    updPatro: TUpdateSQL;
    updPlano: TUpdateSQL;
    wwDBGrid2: TwwDBGrid;
    cmbMesCob: TComboBox;
    spedAnoCob: TSpinEdit;
    qryAux: TwwQuery;
    procedure FormShow(Sender: TObject);
    procedure bbtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    strPatro,
    strPlano,
    sAnoMesReferencia  : string;
    procedure ProcessaGerencial01;

  public
    { Public declarations }
  end;

var
  frmParamRelGerencial: TfrmParamRelGerencial;

implementation

uses DRelatGerencial, UMensErro, UAdmPREV;

{$R *.DFM}

procedure TfrmParamRelGerencial.FormShow(Sender: TObject);
var
  AYear, AMonth, ADay: Word;
begin
  inherited;
  DecodeDate(date, AYear, AMonth, ADay);
  if (AMonth >= 1) and (AMonth <= 12)
  then begin
     cmbMesCob.ItemIndex := AMonth - 1;
     cmbMesCob.Text      := cmbMesCob.Items[cmbMesCob.ItemIndex];
  end;
  spedAnoCob.Text   := IntToStr(AYear);
  
  qryPatro.Close;
  qryPatro.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 07.07.2003
  qryPatro.Open;

  qryPlano.Close;
  qryPlano.ParamByName('IDFUNDACAO').AsInteger := iIdFundacao; // CAMILLE - 07.07.2003
  qryPlano.Open;
end;

procedure TfrmParamRelGerencial.bbtnConfirmarClick(Sender: TObject);
var sAnoTela, sMesTela,
    sSQL : string;
begin
  inherited;

  // Preencher variaveis auxiliares
  sAnoTela := Trim(spedAnoCob.Text);
  if cmbMesCob.ItemIndex <= 8
  then sMesTela  := '0'+IntToStr(cmbMesCob.ItemIndex+1)
  else sMesTela := IntToStr(cmbMesCob.ItemIndex+1);
  sAnoMesReferencia   := sAnoTela+'/'+sMesTela;

  strPatro := '';
  qryPatro.First;
  while not qryPatro.Eof do
  begin
     if qryPatro.FieldByName('CONSIDERA').AsInteger = 1
     then if strPatro = ''
          then strPatro := qryPatro.FieldByName('IDPESSJUR').AsString
          else strPatro := strPatro+ ','+qryPatro.FieldByName('IDPESSJUR').AsString;
     qryPatro.Next;
  end;

  strPlano := '';
  qryPlano.First;
  while not qryPlano.Eof do
  begin
     if qryPlano.FieldByName('CONSIDERA').AsInteger = 1
     then if strPlano = ''
          then strPlano := qryPlano.FieldByName('IDPLANOPREV').AsString
          else strPlano := strPlano+ ','+qryPlano.FieldByName('IDPLANOPREV').AsString;
     qryPlano.Next;
  end;

  if strPatro = ''
  then begin
     MsgDlg('Selecione uma ou mais patrocinadoras. ', 'Erro', mtError, [mbOk],0);
     Abort;
  end;

  if strPlano = ''
  then begin
     MsgDlg('Selecione um ou mais planos. ', 'Erro', mtError, [mbOk],0);
     Abort;
  end;

  // Abrir querys
  with dtmRelatorioGerencial do
  begin
     qryFundacao.Close;
     qryFundacao.ParamByName('pFundacao').asinteger;
     qryFundacao.ParamByName('pFundacao').asinteger := iIdFundacao;
     qryFundacao.Prepare;
     qryFundacao.Open;
  
     sSQL := ' SELECT PLP.IDPESSJUR, PLP.IDPLANOPREV,                     '+
             '        P.NOME AS PATROCINADORA,                            '+
             '        PL.NOME AS PLANOPREVIDENCIARIO,                     '+
             ''''+sAnoMesReferencia+''' AS ANOMESREFERENCIA,              '+
             '        1 AS DETALHE                                        '+
             ' FROM   PESSOA P, PATRO PT, PLANPREV PL, PLANPREVPATRO PLP  '+
             ' WHERE  PLP.IDPESSJUR   IN ('+strPatro +')                  '+
             ' AND    PLP.IDPLANOPREV IN ('+strPlano +')                  '+
             ' AND    PT.IDPESSOA    = PLP.IDPESSJUR                      '+
             ' AND    PT.IDFUNDACAO  = '+InttoStr(iIdFundacao)+ // CAMILLE - 07.07.2003
             ' AND    P.IDPESSOA     = PT.IDPESSOA                        '+
             ' AND    PL.IDPLANOPREV = PLP.IDPLANOPREV                    '+
             'ORDER BY P.NOME, PL.NOME                                    ';
     qryGerencial.Close;
     qryGerencial.SQL.Clear;
     qryGerencial.SQL.Add(sSQL);
     qryGerencial.Open;

     qryGerencial01.Close;
     qryGerencial01.Open;

//     ProcessaGerencial01;
  end; // with dtmRelatGerencialNOVO
end;

procedure TfrmParamRelGerencial.ProcessaGerencial01;
var sSQL : string;
begin

{ Preencher os campos a seguir por PATROCINADORA, PLANO, REGIONAL :
     TOTALATIVOS          TOTALMANTIDOS         TOTALPARTICIPANTES
     NAOPARTICIPANTES     ADESAO                SALPARTICIPANTES
     SALNAOPARTICIPANTES  PARTICIPANCAONAMASSA  MEDIAETARIAPART
     MEDIAETARIANAOPART   MEDIATEMPOATIVOS      MEDIATEMPOMANTIDOS
     MEDIATEMPOTOTAL      TOTALBENEF
}
   with dtmRelatorioGerencial.qryGerencial01 do
   begin
      if UpdatesPending then CancelUpdates;
      Close;
      Open;

      First;
      while not Eof do // loop por regional
      begin
          // TOTALATIVOS
          sSQL := ' SELECT COUNT(DISTINCT EP.IDPESSOA) AS TOTAL '+
                  ' FROM   ELEGPATRO EL, SITPART SP, EVENTOSPREV  EP          '+
                  ' WHERE  EP.IDPESSJUR    = '+ FieldByName('IDPESSJUR').AsString+
                  ' AND    EP.IDPLANOPREV  = '+ FieldByName('IDPLANOPREV').AsString+
                  ' AND    EL.IDESTAB      = '+ FieldByName('IDFILIALPESSOA').AsString+
                  ' AND    EL.IDPESSJUR    = EP.IDPESSJUR '+
                  ' AND    EL.IDPESSOA     = EP.IDPESSOA  '+
                  ' AND    SP.FLGINTERNO   IN (''AT'', ''MP'' ) '+
                  ' AND    EP.IDSITPARTNOVO = SP.IDSITPART '+
                  ' AND    TO_CHAR(EP.DATAEVENTO, ''YYYY/MM'') <= '''+sAnoMesReferencia+''''+
                  ' AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV '+
                  '                     WHERE  IDPESSJUR   = EP.IDPESSJUR   '+
                  '                     AND    IDPLANOPREV = EP.IDPLANOPREV '+
                  '                     AND    IDPESSOA    = EP.IDPESSOA    '+
                  '                     AND    SEQPROPOSTA = EP.SEQPROPOSTA '+
                  '                     AND    DATAEVENTO > EP.DATAEVENTO ) ';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.Open;
          if not qryAux.IsEmpty
          then begin
             Edit;
             FieldByName('TOTALATIVOS').AsFloat := qryAux.FieldbyName('TOTAL').AsFloat;
             Post;
          end;

          // TOTALMANTIDOS
          sSQL := ' SELECT COUNT(DISTINCT EP.IDPESSOA) AS TOTAL '+
                  ' FROM   ELEGPATRO EL, SITPART SP, EVENTOSPREV  EP          '+
                  ' WHERE  EP.IDPESSJUR    = '+ FieldByName('IDPESSJUR').AsString+
                  ' AND    EP.IDPLANOPREV  = '+ FieldByName('IDPLANOPREV').AsString+
                  ' AND    EL.IDESTAB      = '+ FieldByName('IDFILIALPESSOA').AsString+
                  ' AND    EL.IDPESSJUR    = EP.IDPESSJUR '+
                  ' AND    EL.IDPESSOA     = EP.IDPESSOA  '+
                  ' AND    SP.FLGINTERNO   = ''MA'' '+
                  ' AND    EP.IDSITPARTNOVO = SP.IDSITPART '+
                  ' AND    TO_CHAR(EP.DATAEVENTO, ''YYYY/MM'') <= '''+ sAnoMesReferencia +''''+
                  ' AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV '+
                  '                     WHERE  IDPESSJUR   = EP.IDPESSJUR   '+
                  '                     AND    IDPLANOPREV = EP.IDPLANOPREV '+
                  '                     AND    IDPESSOA    = EP.IDPESSOA    '+
                  '                     AND    SEQPROPOSTA = EP.SEQPROPOSTA '+
                  '                     AND    DATAEVENTO > EP.DATAEVENTO ) ';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.Open;
          if not qryAux.IsEmpty
          then begin
             Edit;
             FieldByName('TOTALMANTIDOS').AsFloat := qryAux.FieldbyName('TOTAL').AsFloat;
             Post;
          end;

          // TOTALPARTICIPANTES
          sSQL := ' SELECT COUNT(DISTINCT EP.IDPESSOA) AS TOTAL '+
                  ' FROM   ELEGPATRO EL, SITPART SP, EVENTOSPREV  EP          '+
                  ' WHERE  EP.IDPESSJUR    = '+ FieldByName('IDPESSJUR').AsString+
                  ' AND    EP.IDPLANOPREV  = '+ FieldByName('IDPLANOPREV').AsString+
                  ' AND    EL.IDESTAB      = '+ FieldByName('IDFILIALPESSOA').AsString+
                  ' AND    EL.IDPESSJUR    = EP.IDPESSJUR '+
                  ' AND    EL.IDPESSOA     = EP.IDPESSOA  '+
                  ' AND    SP.FLGINTERNO   NOT IN (''CA'', ''AE'', ''PN'') '+
                  ' AND    EP.IDSITPARTNOVO = SP.IDSITPART '+
                  ' AND    TO_CHAR(EP.DATAEVENTO, ''YYYY/MM'') <= '''+ sAnoMesReferencia +''''+
                  ' AND    NOT EXISTS ( SELECT 1 FROM EVENTOSPREV '+
                  '                     WHERE  IDPESSJUR   = EP.IDPESSJUR   '+
                  '                     AND    IDPLANOPREV = EP.IDPLANOPREV '+
                  '                     AND    IDPESSOA    = EP.IDPESSOA    '+
                  '                     AND    SEQPROPOSTA = EP.SEQPROPOSTA '+
                  '                     AND    DATAEVENTO > EP.DATAEVENTO ) ';
          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.Open;
          if not qryAux.IsEmpty
          then begin
             Edit;
             FieldByName('TOTALPARTICIPANTES').AsFloat := qryAux.FieldbyName('TOTAL').AsFloat;
             Post;
          end;

          // NAOPARTICIPANTES
          sSQL := ' SELECT COUNT(DISTINCT EL.IDPESSOA) AS TOTAL '+
                  ' FROM   ELEGPATRO EL                         '+
                  ' WHERE  EL.IDPESSJUR    = '+ FieldByName('IDPESSJUR').AsString+
                  ' AND    EL.IDESTAB      = '+ FieldByName('IDFILIALPESSOA').AsString+
                  ' AND    EL.IDPESSOA IN (SELECT IDPESSOA     '+
                  '                        FROM   PARTPREVPLAN '+
                  '                        WHERE  IDPESSJUR   = '+FieldByName('IDPESSJUR').AsString+
                  '                        AND    IDPLANOPREV = '+FieldByName('IDPLANOPREV').AsString+
                  '                        AND    TO_CHAR(DTINICIOINSC,''YYYY/MM'') > '''+ sAnoMesReferencia +''')';

          qryAux.Close;
          qryAux.SQL.Clear;
          qryAux.SQL.Add(sSQL);
          qryAux.Open;
          if not qryAux.IsEmpty
          then begin
             Edit;
             FieldByName('NAOPARTICIPANTES').AsFloat := qryAux.FieldbyName('TOTAL').AsFloat;
             Post;
          end;

          // ADESAO
          // SALPARTICIPANTES
          // SALNAOPARTICIPANTES
          // PARTICIPANCAONAMASSA
          // MEDIAETARIAPART
          // MEDIAETARIANAOPART
          // MEDIATEMPOATIVOS
          // MEDIATEMPOMANTIDOS
          // MEDIATEMPOTOTAL
          // TOTALBENEF
          Next;
      end;

   end;
end;

end.
