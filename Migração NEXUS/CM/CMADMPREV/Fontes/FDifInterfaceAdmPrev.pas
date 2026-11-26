// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Nº SIG.....: SIG TIBERO
// Data.......: 02/03/2018
// Responsável: Everson Luiz Pereira da Cunha
// Descrição..: Melhoria no Planus para adequação ao TIBERO.
//              Inclusão de alias nas tabelas e campos.
//              Retirar INDEX, +rule etc
// -----------------------------------------------------------------------------
// Autor(a)    : Camille
// Data        : 07.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO 
// -----------------------------------------------------------------------------
unit FDifInterfaceAdmPrev;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Db, DBTables, Wwquery, wwdblook, Spin;

type
  TFrmDifInterfaceAdmPrev = class(TfrmOkCancelar)
    grpMesAnoRef: TGroupBox;
    cmbMesRef: TComboBox;
    spedAnoRef: TSpinEdit;
    Label1: TLabel;
    dblkpcmbPatro: TwwDBLookupCombo;
    Label2: TLabel;
    dblkpcmbPlano: TwwDBLookupCombo;
    qryPatro: TwwQuery;
    qryPlanPREV: TwwQuery;
    qryContribuicao: TwwQuery;
    Label6: TLabel;
    dblkpcmbContribuicao: TwwDBLookupCombo;
    procedure FormShow(Sender: TObject);
    procedure qryPatroAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbPatroCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure qryPlanPREVAfterScroll(DataSet: TDataSet);
    procedure dblkpcmbPlanoCloseUp(Sender: TObject; LookupTable,
      FillTable: TDataSet; modified: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmDifInterfaceAdmPrev: TFrmDifInterfaceAdmPrev;

implementation

uses DRelatorios, UMensErro, uAdmPrev;

{$R *.DFM}

procedure TFrmDifInterfaceAdmPrev.FormShow(Sender: TObject);
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

procedure TFrmDifInterfaceAdmPrev.qryPatroAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if not qryPatro.Active then Exit;

  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;
end;

procedure TFrmDifInterfaceAdmPrev.dblkpcmbPatroCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryPlanPrev.Close;
  qryPlanPrev.ParamByName('IdPessJur').AsInteger := qryPatro.FieldByName('IdPessoa').AsInteger;
  qryPlanPrev.Open;
end;

procedure TFrmDifInterfaceAdmPrev.bbtnConfirmarClick(Sender: TObject);
var sAno, sMesReferencia, sAnoMesReferencia, sEnd , sFiltroPatro, sFiltroPlano, sFiltroContrib : string;
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

     lblTituloDif.Caption := 'Diferenças Interface x AdmPrev - Mês : '+Trim(cmbMesRef.Text)+' / '+Trim(spedAnoRef.Text);

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


     if  (Trim(dblkpcmbContribuicao.Text) = '')
     then sFiltroContrib :=  ' T.IDDESCONTO'
     else begin
        sFiltroContrib := qryContribuicao.FieldByName('IdContribuicao').AsString;
     end;

     with qryDifInterfaceAdmprev do
     begin
        Close;
        SQL.Clear;
        SQL.Add(' SELECT T.IDPESSOA , T.CODPROVDESC,                                               '+
                '        T.MATRICULA , T.IDDESCONTO, T.VALORRECEBIDO ,                             '+
                '        '''+Trim(dblkpcmbPatro.Text)+''' NOMEPATRO , PL.NOME NOMEPLANO,           '+
                '        C.NOME NOMECONTRIB,                                                       '+
                '        P.NOME, '''+sAnoMesReferencia+''' MESCOBRANCA,                            '+
                '        T.MESREFERENCIA,                                                          '+
                '        DECODE(T.FLGATRASODEVOL,''A'',''ATRASO'',''D'',''DEVOLUÇÃO'','' '')       '+
                ' FROM   PATRO PT, TMPDESC T , PESSOA P ,  PLANPREV PL, CONTRIBUICAO C             '+ 
                ' WHERE  PT.IDFUNDACAO          = '+IntToStr(iIdFundacao)                           + 
                ' AND    T.IDPESSJUR            = PT.IDPESSOA                                      '+ 
                ' AND    P.IDPESSOA             = T.IDPESSOA                                       '+
                ' AND    T.MESREFERENCIA        = T.MESREFERENCIA                                  '+
                ' AND    T.MESCOBRANCA          = '''+sAnoMesReferencia+'''                        '+
                ' AND    T.IDPESSJUR            = '+sFiltroPatro                                    +
                ' AND    T.IDPLANOPREV          = '+sFiltroPlano                                    +
                ' AND    T.IDDESCONTO           = '+sFiltroContrib                                  +
                ' AND    T.FLGDESCFOLHA         = ''P''                                            '+
                ' AND    NVL(T.VALORRECEBIDO,0) > 0                                                '+
//                ' AND    NVL(SITENVIO,0)        > 0                                                '+ //Everson TIBERO
                ' AND    NVL(T.SITENVIO,0)        > 0                                                '+ //Everson TIBERO
                ' AND    PL.IDPLANOPREV         = T.IDPLANOPREV                                    '+
                ' AND    C.IDCONTRIBUICAO       = T.IDDESCONTO                                     '+
                ' AND    NOT EXISTS (SELECT 1 FROM HSTCONTRIBPREV                                  '+
                '                    WHERE  IDPESSJUR      = '+sFiltroPatro                         +
                '                    AND    MESCOBRANCA    = '''+sAnoMesReferencia+'''             '+
                '                    AND    IDPESSOA       = T.IDPESSOA                            '+
                '                    AND    IDCONTRIBUICAO = T.IDDESCONTO                          '+
                '                    AND    IDPLANOPREV    = T.IDPLANOPREV                         '+
                '                    AND    MESREFERENCIA  = T.MESREFERENCIA                       '+
                '                    AND    MESCOBRANCA    = T.MESCOBRANCA                         '+
                '                    AND    VALORRECEBIDO  = T.VALORRECEBIDO                       '+
                '                    AND    FOLHAORIGEM    = ''P'' )                               '+
                ' ORDER BY T.IDPLANOPREV,T.IDDESCONTO , T.IDPESSOA                                 ');
        Open;
     end;

   end;

end;

procedure TFrmDifInterfaceAdmPrev.qryPlanPREVAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  if not qryPlanPrev.Active then Exit;

  qryContribuicao.Close;
  qryContribuicao.ParamByName('IdPlanoPrev').AsInteger := qryPlanPrev.FieldByName('IdPlanoPrev').AsInteger;
  qryContribuicao.Open;
end;

procedure TFrmDifInterfaceAdmPrev.dblkpcmbPlanoCloseUp(Sender: TObject;
  LookupTable, FillTable: TDataSet; modified: Boolean);
begin
  inherited;
  qryContribuicao.Close;
  qryContribuicao.ParamByName('IdPlanoPrev').AsInteger := qryPlanPrev.FieldByName('IdPlanoPrev').AsInteger;
  qryContribuicao.Open;
end;

end.
