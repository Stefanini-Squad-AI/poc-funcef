unit FParamEvolImpostos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, wwdblook, TB97Ctls, Db, DBTables,
  Wwquery, IvDictio, IvMulti, IvEMulti, MAHlpBtn, Buttons, TB97Tlbr, TB97,
  ExtCtrls, StdCtrls, wwdbdatetimepicker, CMDateTimePicker;

type
  TfrmParamEvolImpostos = class(TfrmOkCancelar)
    qryCarteira: TwwQuery;
    qryCarteiraDESCCARTINVEST: TStringField;
    qryCarteiraIDCARTEIRAINVEST: TFloatField;
    QryLote: TwwQuery;
    QryLoteIDLOTE: TStringField;
    Dock972: TDock97;
    Toolbar971: TToolbar97;
    sbtnProcurar: TToolbarButton97;
    Label2: TLabel;
    edDataRef: TCMDateTimePicker;
    DbLkcLote: TwwDBLookupCombo;
    Label4: TLabel;
    Label3: TLabel;
    DbLkcCarteira: TwwDBLookupCombo;
    Label1: TLabel;
    edDataIni: TCMDateTimePicker;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edDataRefExit(Sender: TObject);
    procedure FazQry;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure edDataRefChange(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmParamEvolImpostos: TfrmParamEvolImpostos;
  iAno,iMes,iDia, iMesIR : word;

implementation

Uses uMensErro,UOperacaoInvest, FDmRelatorio,UFuncoesRendaFixa,UDiasUteisInv;

{$R *.DFM}

procedure TfrmParamEvolImpostos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  QryCarteira.Close;
  QryLote.Close;
end;

procedure TfrmParamEvolImpostos.FormShow(Sender: TObject);
begin
  inherited;
  QryCarteira.Open;
  QryLote.Open;
end;

procedure TfrmParamEvolImpostos.FormCreate(Sender: TObject);
begin
  inherited;
  edDataRef.Date := Date;
  DecodeDate(Date,iAno,iMes,iDia);
  iDia := 1;
  edDataIni.Date := EncodeDate(iAno,iMes,iDia);
end;

procedure TfrmParamEvolImpostos.edDataRefExit(Sender: TObject);
begin
  inherited;
  if trim(edDataRef.Text) = '' then
     begin
         MsgDlg('Data de Referência não foi preenchida','Erro',mtError,[mbOK],0);
         edDataRef.SetFocus;
     end;
end;

Procedure TfrmParamEvolImpostos.FazQry;
var
   QryLocal     :TwwQuery;
   fIRAcumMes,fValorAplicado,fRendAcumMes : double;
   iCartAnt, iInvAnt : integer;
   sLoteAnt : string;
   dDataAplic : TDateTime;
Begin
   QryLocal              := TwwQuery.Create(Application);
   QryLocal.DatabaseName := 'BaseDados';
   fRendAcumMes := 0;
   fIRAcumMes   := 0;
   iCartAnt     := 0;
   iInvAnt      := 0;
   sLoteAnt     := '';
   With DtmRelatorio.qryEvolImpostos Do
   Begin
      DtmRelatorio.RptEvolImpostosLabel5.Caption  := edDataRef.Text;
      DtmRelatorio.RptEvolImpostosLabel82.Caption := edDataIni.Text;
      Close;
      Sql.Clear;
      Sql.add(' SELECT  DISTINCT ');
      Sql.add(' HI.IDCARTEIRAINVEST, HI.IDINVESTIMENTO, HI.DATAMOVCARTINV, HI.TIPMOVCARTINV,');
      Sql.add(' HI.VLRJUROS,HI.VLRVARIACAO,HI.SALDOIRPROV,HI.IDLOTE,HI.SALDOIOFPROV,');
      Sql.add(' HI.NATURMOVCARTINV,HI.VLRMOVCARTINV,HI.HISTMOVCARTINV,');
      Sql.add(' (HI.VLRIRAPU+HI.VLRIRPROV) AS VLRIR,');
      Sql.add(' (HI.VLRIOFAPU+HI.VLRIOFPROV) AS VLRIOF,');
      Sql.add(' (HI.VLRJUROS+HI.VLRVARIACAO) AS RENDIMENTO,');
      Sql.add(' CA.DESCCARTINVEST,');
      Sql.add(' IV.DESCINVESTIMENTO,');
      Sql.add(' TT.DATAEMTITRENFIX, TT.JUROSRENFIX, TT.INDEXRENFIX, TT.PERCINDEX,');
      Sql.add(' TT.INDEXRENFIX2, TT.PERCINDEX2,');
      Sql.add(' TP.DESCTIPRENFIXA,');
      Sql.add(' PE.NOME,');
      Sql.add(' CT.VLRCOMPRATITLOTE,');
      Sql.add(' MO1.MOESIGLA AS MOESIGLA1, MO2.MOESIGLA AS MOESIGLA2,');
      Sql.add(' (0) AS RENDACUMMES,');
      Sql.add(' (0) AS IRACUMMES, (0) AS POSSUISALDO ');
      Sql.add(' FROM');
      Sql.add(' HISTCARTINV HI,');
      Sql.add(' INVESTIMENTO IV,');
      Sql.add(' CARTEIRAINVEST CA,');
      Sql.add(' TIPOTITRENFIXA TP,');
      Sql.add(' TITRENFIXA TT,');
      Sql.add(' CONTRATOINVESTIM CT,');
      Sql.add(' PESSOA PE,');
      Sql.add(' MOEDA MO1,');
      Sql.add(' MOEDA MO2');
      Sql.add(' WHERE');
      Sql.add(' (HI.IDTIPOINVEST = 1)');
      Sql.add(' AND (HI.NATURMOVCARTINV <> ''L'')');
      If Trim(edDataIni.Text) <> '' Then
      begin
         Sql.add(' AND ((HI.DATAMOVCARTINV  >= TO_DATE('''+DateToStr(edDataIni.Date)+''',''DD/MM/YYYY'')) ');
         Sql.add(' AND (HI.DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY''))) ');
      end
      else
         Sql.add(' AND (HI.DATAMOVCARTINV  <= TO_DATE('''+DateToStr(edDataRef.Date)+''',''DD/MM/YYYY'')) ');
      Sql.add(' AND (HI.IDINVESTIMENTO = IV.IDINVESTIMENTO(+))');
      Sql.add(' AND (HI.IDCARTEIRAINVEST = CA.IDCARTEIRAINVEST(+))');
      If Trim(DbLkcCarteira.Text) <> '' Then
         Sql.add(' AND (HI.IDCARTEIRAINVEST = '+DbLkcCarteira.LookupValue+') ');
      If Trim(DbLkcLote.Text) <> '' Then
         Sql.add(' AND (HI.IDLOTE = '+QuotedStr(DbLkcLote.LookupValue)+')   ');
      Sql.add(' AND (HI.IDINVESTIMENTO = TT.IDTITRENFIXA(+))');
      Sql.add(' AND (HI.IDINVESTIMENTO = CT.IDINVESTIMENTO(+))');
      Sql.add(' AND (TT.CODTIPRENFIXA = TP.CODTIPRENFIXA(+))');
      Sql.add(' AND (IV.IDEMISSOR = PE.IDPESSOA(+))');
      Sql.add(' AND (TT.INDEXRENFIX  = MO1.MOECODIGO (+))');
      Sql.add(' AND (TT.INDEXRENFIX2 = MO2.MOECODIGO (+))');
      Sql.add(' ORDER BY ');
      Sql.add(' HI.IDINVESTIMENTO,HI.DATAMOVCARTINV');
      Open;
      First;

      While Not DtmRelatorio.qryEvolImpostos.EOF Do
      Begin
         Edit;
         if (IntToStr(iCartAnt) + IntToStr(iInvAnt) + sLoteAnt) <>
            (IntToStr(FieldByName('IDCARTEIRAINVEST').AsInteger) +
             IntToStr(FieldByName('IDINVESTIMENTO').AsInteger) +
             FieldByName('IDLOTE').AsString) then  // verifico se mudou o investimento para reinicializar variáveis
         begin
            iCartAnt := FieldByName('IDCARTEIRAINVEST').AsInteger;
            iInvAnt  := FieldByName('IDINVESTIMENTO').AsInteger;
            sLoteAnt := FieldByName('IDLOTE').AsString;
            fIRAcumMes := 0;
            fRendAcumMes := 0;
            dDataAplic := FieldByName('DATAEMTITRENFIX').AsDateTime;
            DecodeDate(FieldByName('DATAMOVCARTINV').AsDateTime,iAno,iMesIR,iDia);
         end;
         DecodeDate(FieldByName('DATAMOVCARTINV').AsDateTime,iAno,iMes,iDia);
         if iMes = iMesIR then // mesmo mês
         begin
            fIRAcumMes := FieldByName('VLRIR').AsFloat + fIRAcumMes;
            fRendAcumMes := FieldByName('VLRJUROS').AsFloat +
                            FieldByName('VLRVARIACAO').AsFloat + fRendAcumMes;
         end
         else
         begin
            fIRAcumMes := FieldByName('VLRIR').AsFloat;
            fRendAcumMes := FieldByName('VLRJUROS').AsFloat +
                            FieldByName('VLRVARIACAO').AsFloat;
         end;
         FieldByName('IRACUMMES').asFloat := fIRAcumMes;
         FieldByName('RENDACUMMES').asFloat := fRendAcumMes;
         // Aplicação ou Saldo Inicial
         if ((FieldByName('TIPMOVCARTINV').AsString = 'OPE') or
             (FieldByName('TIPMOVCARTINV').AsString = 'INI')) and
            (FieldByName('NATURMOVCARTINV').AsString = 'A') then
         begin
            FieldByName('TIPMOVCARTINV').AsString := 'APL';
         end
         else if (FieldByName('TIPMOVCARTINV').AsString = 'OPE') and  // Resgate
            (FieldByName('NATURMOVCARTINV').AsString = 'D') then
         begin
            FieldByName('TIPMOVCARTINV').AsString := 'RES';
            FieldByName('RENDIMENTO').AsFloat := ABS(FieldByName('VLRJUROS').AsFloat + FieldByName('VLRVARIACAO').AsFloat);
            FieldByName('IRACUMMES').asFloat := 0;
         end;
         Post;
         DecodeDate(FieldByName('DATAMOVCARTINV').AsDateTime,iAno,iMesIR,iDia);
         Next;
      End;
      First;
   End;
End;

procedure TfrmParamEvolImpostos.bbtnConfirmarClick(Sender: TObject);
begin
  inherited;
  FazQry;
end;

procedure TfrmParamEvolImpostos.edDataRefChange(Sender: TObject);
begin
  inherited;
   DecodeDate(StrToDate(edDataRef.Text),iAno,iMes,iDia);
   iDia := 1;
   edDataIni.Date := EncodeDate(iAno,iMes,iDia);
end;

end.
