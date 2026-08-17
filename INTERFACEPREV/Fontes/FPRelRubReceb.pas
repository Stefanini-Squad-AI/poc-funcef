// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
// Autor(a)    : Camille
// Data        : 08.07.2003
// Alteração   : Inclusao do Filtro de MULTI-FUNDACAO
//------------------------------------------------------------------------------
// Rotina      : bbtnConfirmarClick
// Autor(a)    : Gleyber
// Data        : 17/03/2003
// Alteração   : Alteração montar relatório de acordo com a opção FLGGRAVAHIST da ParamInterf
//------------------------------------------------------------------------------
unit FPRelRubReceb;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, wwdblook, Spin, Db, DBTables, Wwquery;

type
  TfrmPRelRubReceb = class(TfrmOkCancelar)
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
  frmPRelRubReceb: TfrmPRelRubReceb;

implementation

uses  UMensErro, UAdmPrev, dRelatorios, USistema;

{$R *.DFM}

procedure TfrmPRelRubReceb.FormShow(Sender: TObject);
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

procedure TfrmPRelRubReceb.bbtnConfirmarClick(Sender: TObject);
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

  if (trim(edmatini.text) = '') or (trim(edmatfim.text) = '') then
  if MsgDlg(' O montagem do relatório pode ser demorada, '+
            'pois a faixa de matrículas não foi preenchida completamente. Deseja continuar? ', 'Confirmação',
            mtConfirmation, [mbNo, mbYes], 0) = mrNo then
            begin
               edmatini.setfocus;
               exit;
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

     qryRubricasReceb.Close;
     qryRubricasReceb.SQL.Clear;
     qryRubricasReceb.SQL.Add('  SELECT 1 AS CONT, H.MESCOBRANCA, H.MES MESREFERENCIA ,H.VALORPROVENTO VALORRECEBIDO, H.CODPROVDESC, '+
                          ' PROVDESC.DESCRICAO, H.IDPESSOA , H.IDPESSJUR, '+
                          ' DECODE(H.FLGCOMPOESALPART,0,0,1,H.VALORPROVENTO) SALARIO, '+
                          ' EL.MATRICULA , P.NOME PARTICIPANTE, PATRO.NOME PATRO '+
                          ' FROM HISTRUBSAL H , PESSOA P , PESSOA PATRO,'+
                          ' ELEGPATRO EL,  PROVDESC'+
                          ' WHERE H.MES = H.MES '+
                          ' AND H.MESCOBRANCA = '''+sAnoMesReferencia+''' '+
                          ' AND H.IDPESSJUR = '+qryPatro.FieldByName('IdPessoa').AsString+' '+
                          ' AND H.IDMODULO = 32 '+
                          ' AND P.IDPESSOA = H.IDPESSOA '+
                          ' AND PATRO.IDPESSOA = H.IDPESSJUR '+
                          ' AND EL.IDPESSJUR = H.IDPESSJUR '+
                          ' AND EL.IDPESSOA = H.IDPESSOA ');

                          if trim(edmatini.text) <> '' then
                          qryRubricasReceb.SQL.Add(' AND   EL.MATRICULA    >= '+edmatini.text+'');

                          if trim(edmatfim.text) <> '' then
                          qryRubricasReceb.SQL.Add(' AND   EL.MATRICULA    <= '+edmatfim.text+'');

                          qryRubricasReceb.SQL.Add(' AND PROVDESC.IDPROVENTO = H.IDRUBRICA ');
                          If qryPatro.FieldByName('FLGGRAVAHIST').AsInteger = 0
                           Then Begin
                              qryRubricasReceb.SQL.Add(' UNION ALL '+
                              ' SELECT 1 AS CONT, C.MESCOBRANCA, C.MESREFERENCIA , '+
                              ' C.VALORRECEBIDO, C.CODPROVDESC, '+
                              ' PROVDESC.DESCRICAO, C.IDPESSOA , C.CODPATRO, '+
                              ' 0 VALORPROVENTO, C.VALORCHAVE , P.NOME, PATRO.NOME '+
                              ' FROM CLASSERUBRICAS C , PESSOA P , PESSOA PATRO, '+
                              ' PROVDESC '+
                              ' WHERE C.MESREFERENCIA = C.MESREFERENCIA '+
                              ' AND C.MESCOBRANCA = '''+sAnoMesReferencia+''' '+
                              ' AND C.CODPATRO = '+qryPatro.FieldByName('IdPessoa').AsString+' ');

                              if trim(edmatini.text) <> '' then
                              qryRubricasReceb.SQL.Add(' AND   C.VALORCHAVE    >= '+edmatini.text+'');

                              if trim(edmatfim.text) <> '' then
                              qryRubricasReceb.SQL.Add(' AND   C.VALORCHAVE    <= '+edmatfim.text+'');


                              qryRubricasReceb.SQL.Add(' AND P.IDPESSOA = C.IDPESSOA '+
                              ' AND PATRO.IDPESSOA = C.CODPATRO '+
                              ' AND PROVDESC.IDPROVENTO = C.IDRUBRICA ');
                           End;
                           qryRubricasReceb.SQL.Add('ORDER BY MATRICULA, DESCRICAO ');

     qryRubricasReceb.Open;
   end;



end;

end.
