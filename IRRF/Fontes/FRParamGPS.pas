unit FRParamGPS;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FOkCancelar, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, ComCtrls, wwdbdatetimepicker, CMDateTimePicker,
  Db, DBTables, Wwquery, wwdblook;

type
  TfrmRParamGPS = class(TfrmOkCancelar)
    gbPeriodoApu: TGroupBox;
    lblDataIni: TLabel;
    lblDataFim: TLabel;
    deDataIni: TCMDateTimePicker;
    deDataFim: TCMDateTimePicker;
    edPerApur: TEdit;
    edCodigo: TEdit;
    lblPerApu: TLabel;
    lblCodigo: TLabel;
    rgData: TRadioGroup;
    rgVisualizaGPS: TRadioGroup;
    dblcJuros: TwwDBLookupCombo;
    lblNatureza: TLabel;
    dblcMulta: TwwDBLookupCombo;
    Label1: TLabel;
    qryAlteradorJuros: TwwQuery;
    qryAlteradorMulta: TwwQuery;
    qryAux: TwwQuery;
    procedure bbtnConfirmarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    function PegaValorMulta(CodDocumento, CodAlteradorMulta, CodAlteradorJuros : LongInt) : Real;
  public
    { Public declarations }
  end;

var
  frmRParamGPS: TfrmRParamGPS;

implementation
uses DRelatIRRF,uSistema, uMensErro;
{$R *.DFM}

procedure TfrmRParamGPS.bbtnConfirmarClick(Sender: TObject);
begin
   inherited;
   if deDataIni.Text = '' then begin
      MsgDlg('Obrigatório preencher a Data de Início da Apuração','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      deDataIni.SetFocus;
      exit;
   end;
   if deDataFim.Text = '' then begin
      MsgDlg('Obrigatório preencher a Data Final da Apuração','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      deDataFim.SetFocus;
      exit;
   end;
   if edPerApur.Text = '' then begin
      MsgDlg('Obrigatório preencher a Competência','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      edPerApur.SetFocus;
      exit;
   end;
   if edCodigo.Text = '' then begin
      MsgDlg('Obrigatório preencher o Código de Pagamento','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      edCodigo.SetFocus;
      exit;
   end;

   if dblcJuros.Text = '' then begin
      MsgDlg('Obrigatório preencher o Alterador de Juros','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      edCodigo.SetFocus;
      exit;
   end;

   if dblcMulta.Text = '' then begin
      MsgDlg('Obrigatório preencher o Alterador de Multa','Erro',mtError,[mbOk],0);
      modalResult := mrNone;
      edCodigo.SetFocus;
      exit;
   end;
   //
   dtmRelatIRRF.rpGPSLblCodPag1.caption := edCodigo.Text;
   dtmRelatIRRF.rpGPSLblMes1.caption    := edPerApur.Text;
   dtmRelatIRRF.rpGPSLblCodPag2.caption := edCodigo.Text;
   dtmRelatIRRF.rpGPSLblMes2.caption    := edPerApur.Text;
   //
   with dtmRelatIRRF.qryGPS do
     Begin
       Close;
       SQL.Clear;
       sql.Append('SELECT PJ.IDPESSOA AS IDEMPRESA, PJ.RAZAOSOCIAL AS EMPRESA, ES.CODESTADO,');
       sql.Append('       PJ.NUMDOCUMENTO AS CGC, RTRIM(E.LOGRADOURO) ||'', ''|| E.NUMERO ||''''|| DECODE(E.COMPLEMENTO,'' '','' - '' ||''''||');
       sql.Append('       RTRIM(E.COMPLEMENTO)) AS RUA, E.IDCIDADES, RTRIM(E.BAIRRO) AS BAIRRO, RTRIM(C.NOME) AS CIDADE, D.CODGERADORINSS,');
       sql.Append('       RTRIM(SUBSTR(E.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(E.CEP,6,3)) AS CEP, L.VALOR, L.DATALANCTO, D.CODDOCUMENTO, D.NODOCUMENTO, ''                '' AS VALORJUROS,');
       sql.Append('       PJF.RAZAOSOCIAL AS EMPRESAFORNECEDOR, ESF.CODESTADO CODESTADOFORNECEDOR, PJF.NUMDOCUMENTO AS CGCFORNECEDOR,');
       sql.Append('       RTRIM(EF.LOGRADOURO) ||'', ''|| EF.NUMERO ||''''|| DECODE(EF.COMPLEMENTO,'' '','' - '' ||''''||');
       sql.Append('       RTRIM(EF.COMPLEMENTO)) AS RUAFORNECEDOR, EF.IDCIDADES IDCIDADESFORNECEDOR, RTRIM(EF.BAIRRO) AS BAIRROFORNECEDOR, DD.CODDOCUMENTO AS DOCGERADOR, DD.NODOCUMENTO AS NUMERODOCUMETO,');
       sql.Append('       RTRIM(CF.NOME) AS CIDADEFORNECEDOR, RTRIM(SUBSTR(EF.CEP,1,5)) ||''-''|| RTRIM(SUBSTR(EF.CEP,6,3)) AS CEPFORNECEDOR');
       sql.Append('  FROM DOCUMENTO D, DOCUMENTO DD, LANCTODOCUM L, PESSOA PJ, ENDPESS E, CIDADES C, ESTADO ES, ');
       sql.Append('       (SELECT DISTINCT CODDOCINSS FROM LANCTODOCUM WHERE CODDOCINSS IS NOT NULL) I,');
       sql.Append('       PESSOA PJF, ENDPESS EF, CIDADES CF, ESTADO ESF');
       sql.Append(' WHERE (PJ.IDPESSOA = E.IDPESSOA)');
       sql.Append('   AND (PJ.IDENDCOMERCIAL= E.IDENDERECO)');
       sql.Append('   AND (E.IDCIDADES = C.IDCIDADES(+))');
       sql.Append('   AND (C.IDESTADO = ES.IDESTADO(+))');
       sql.Append('   AND (PJ.IDPESSOA = :IDPESSOA)');
       sql.Append('   AND (D.IDPESSOA = :IDPESSOA)');
       sql.Append('   AND (D.CODGERADORINSS = DD.CODDOCUMENTO)');
       sql.Append('   AND (DD.RECPAG = ''P'')');
       sql.Append('   AND (DD.IDFORCLI = PJF.IDPESSOA)');
       sql.Append('   AND (PJF.IDPESSOA = EF.IDPESSOA(+))');
       sql.Append('   AND (PJF.IDENDCOMERCIAL= EF.IDENDERECO(+))');
       sql.Append('   AND (EF.IDCIDADES = CF.IDCIDADES(+))');
       sql.Append('   AND (CF.IDESTADO = ESF.IDESTADO(+))');
       if rgData.ItemIndex = 0 then
         Begin
           SQL.Append('  AND (D.DATAPROGRAMADA >= TO_DATE(:DATAINI,''DD/MM/YYYY''))');
           SQL.Append('  AND (D.DATAPROGRAMADA <= TO_DATE(:DATAFIM,''DD/MM/YYYY''))');
         end
       else
         Begin
           SQL.Append('  AND (L.DATALANCTO >= TO_DATE(:DATAINI,''DD/MM/YYYY''))');
           SQL.Append('  AND (L.DATALANCTO <= TO_DATE(:DATAFIM,''DD/MM/YYYY''))');
         end;
       sql.Append('   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)');
       sql.Append('   AND (D.OPERACAO = L.OPERACAO)');

       if rgVisualizaGPS.ItemIndex = 0 then
          sql.Append('   AND NOT EXISTS (SELECT IM.CODDOCINSS FROM DOCINSS IM WHERE (IM.CODDOCINSS = D.CODDOCUMENTO) AND (IM.FLGIMPRESSO = ''S''))')
       else
          sql.Append('   AND EXISTS (SELECT IM.CODDOCINSS FROM DOCINSS IM WHERE (IM.CODDOCINSS = D.CODDOCUMENTO) AND (IM.FLGIMPRESSO = ''S''))');


       if rgData.ItemIndex = 0 then
         Begin
           SQL.Append('ORDER BY D.DATAPROGRAMADA');
         end
       else
         Begin
           SQL.Append('ORDER BY L.DATALANCTO');
         end;
       ParamByName('IDPESSOA').AsInteger := Sistema.idEmpresa;
       ParamByName('DATAINI').AsString   := deDataIni.Text;
       ParamByName('DATAFIM').AsString   := deDataFim.Text;
       Open;

       first;
       while not eof do
         Begin
           edit;
           fieldByname('VALORJUROS').Asstring := FormatFloat('#,##0.00', PegaValorMulta(fieldByname('DOCGERADOR').Asinteger, qryAlteradorMulta.fieldByname('CODALTERADOR').Asinteger, qryAlteradorJuros.fieldByname('CODALTERADOR').Asinteger));
           post;
           next;
         end;
     end;
end;

function TfrmRParamGPS.PegaValorMulta(CodDocumento, CodAlteradorMulta,
                                      CodAlteradorJuros: Integer): Real;
begin
  with qryAux do
    Begin
      close;
      ParamByName('CODDOCUMENTO').Asinteger := CodDocumento;
      ParamByName('MULTA').Asinteger        := CodAlteradorMulta;
      ParamByName('JUROS').Asinteger        := CodAlteradorJuros;
      open;
      Result := fieldByname('VALOR').AsFloat;
    end;
end;

procedure TfrmRParamGPS.FormCreate(Sender: TObject);
begin
  inherited;
  qryAlteradorJuros.open;
  qryAlteradorMulta.open;
end;

end.
