unit FProcCadInterfAtuarial;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FSairAjuda, IvDictio, IvMulti, IvEMulti, MAHlpBtn, StdCtrls, Buttons,
  TB97Tlbr, TB97, ExtCtrls, Grids, Wwdbigrd, Wwdbgrid, Db, DBTables,
  Wwquery, Wwdatsrc, Mask, {DBCtrlt} wwdblook, CMDBLookupCombo,
  ComCtrls, wwdbdatetimepicker, CMDateTimePicker, Math;

type
  TfrmProcCadInterfAtuarial = class(TfrmSairAjuda)
    qryPlanPrev: TwwQuery;
    lblPlanoPrev: TLabel;
    lblDtConversaocotas: TLabel;
    qryPartAss: TwwQuery;
    bbtnProcessar: TBitBtn;
    qryAux: TwwQuery;
    qryReserva: TwwQuery;
    qryGarantia: TwwQuery;
    DtEdDtConvCotas: TCMDateTimePicker;
    dblkpcmbbxPlano: TCMDBLookupCombo;
    BtCancelar: TBitBtn;
    procedure bbtnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
  private
    { Private declarations }
    function Garantia(iGarIdpessoa,iGarIdPessjur,iGarIdPlanoprev,iGarSeqProposta : integer) :double;  
    function ArredondaValor(Valor : String) : Extended;
    function TruncaRound(f:String;n:integer):string;
    procedure VerifIndiceHist(qryaux : twwquery;  var sIndice : String ; sIdPLanoPrev, sIdTipoReserva: String ; sDataCota : String);
    function  VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva, sDataMov : String) : Double;    

  public
    { Public declarations }
  end;

var
  frmProcCadInterfAtuarial: TfrmProcCadInterfAtuarial;
  iIdPlano : integer;
  sflgpart : string;
  FimProcesso:Boolean;

implementation


uses  UMensErro, UAdmPrev, dAPrev, fAguarde, dBaseDados ;

{$R *.DFM}

procedure TfrmProcCadInterfAtuarial.bbtnProcessarClick(Sender: TObject);
var
  ssql,sSalMedio : string;
  dSldContaAss, dSldContribPart,dSldContribPatro,dSldTransfPart,dSldTransfPatro, dGarantia : double;
  bErro : boolean;
begin
  inherited;
  if Trim(dblkpcmbbxPlano.Text) = '' then
  begin
    MsgDlg('Plano Previdenciário não preenchido ','Erro',mtError,[mbOk,mbHelp],0);
    dblkpcmbbxPlano.SetFocus;
    Abort;
  end;

  if Trim(DtEdDtConvCotas.Text) = '' then
  begin
    MsgDlg('Data de Conversão das Cotas não preenchida','Erro',mtError,[mbOk,mbHelp],0);
    DtEdDtConvCotas.SetFocus;
    Abort;
  end;

  frmAguarde.Mostra('Processando ...');
  frmAguarde.Refresh;

  BtCancelar.Enabled   :=True;
  bbtnProcessar.Enabled :=False;
  FimProcesso:=False;
  dSldContaAss     := 0;
  dSldContribPart  := 0;
  dSldContribPatro := 0;
  dSldTransfPart   := 0;
  dSldTransfPatro  := 0;

// Busca Participante/Assistido
  With qryPartAss do
  begin
    qryPartAss.Close;
    qryPartAss.ParambyName('IDPLANOPREV').AsInteger := qryPlanPrev.FieldByName('IDPLANOPREV').AsInteger;
    qryPartAss.Open;
    Try
// Inicia a Transacao
      dtmBaseDados.dbBaseDados.StartTransaction;
      With qryAux Do
        begin
          Close;
          Sql.Clear;
          Sql.Add('DELETE FROM INTERFATUARIAL ');
          try
            qryAux.ExecSQL;
          except
          on E: EDBEngineError do
             begin
               MostrarErro(E);
               frmAguarde.Apaga;
               Abort;
               Exit;
             end;
          end;
      end;

      While not eof do
      begin
        Application.ProcessMessages;

// Caso Usuário Cancele o Processo
        if FimProcesso = True then
        begin
          MsgDlg('Processo Cancelado pelo usuário !','Erro',mtError,[mbOk],0);
          frmAguarde.Apaga;
          Abort;
        end;

//------------------------------------------------------------------------------------
//                            Executar regra de Salario Médio
//------------------------------------------------------------------------------------
        sSQL := 'SELECT '+qryPartAss.FieldByName('IdPessoa').AsString+' AS IDPESSOA,  '+
                qryPartAss.FieldByName('IdPessJur').AsString+' AS IDPESSJUR, '+
                qryPartAss.FieldByName('IdPlanoPrev').AsString+' AS IDPLANOPREV, '+
                qryPartAss.FieldByName('SeqProposta').AsString+' AS SEQPROPOSTA, '+
                QuotedStr(DtEdDtConvCotas.Text)+' AS DATAREF '+
                'FROM  DUAL ';

        if Trim(qryPlanPrev.FieldByName('IdRgSalMedioAtu').AsString) <> '' then
        begin
          try
             sSalMedio := RegraNumerica(qryPlanPrev.FieldByName('IdRgSalMedioAtu').AsString,sSQL,bErro, iIdCalculoGeral);
          except
             sSalMedio := '0';
          end;

          if bErro = True then
          begin
            MsgDlg('A Regra de Cálculo de Salário Médio - nº '+qryPlanPrev.FieldByName('IdRgSalMedioAtu').AsString+' - '+
                   ' retornou um valor inválido = '+sSalMedio,'Erro',mtError,[mbOk,mbHelp],0);
            TiraSQL(dtmAPrev.qryAux);
            frmAguarde.Apaga;
            Abort;
            break;
          end;
        end;

        // Reserva
        With qryReserva do
        begin
          Close;
          ParamByName('IDPESSOA').AsInteger         := qryPartAss.FieldByName('IDPESSOA').AsInteger;
          ParamByName('IDPESSJUR').AsInteger        := qryPartAss.FieldByName('IDPESSJUR').AsInteger;
          ParamByName('IDPLANOPREV').AsInteger      := qryPartAss.FieldByName('IDPLANOPREV').AsInteger;
          ParamByName('SEQPROPOSTA').AsInteger      := qryPartAss.FieldByName('SEQPROPOSTA').AsInteger;
          Open;

          While not eof do
          begin
            // Assistido
            if qryPartAss.FieldByName('FlgInterno').AsString = 'AS' then
               if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                  (FieldByName('FLGTRANSFERENCIA').AsInteger = 0) and
                  (FieldByName('FLGTITULARCOLET').AsString = 'T') then
                  dSldContaAss := dSldContaAss + (FieldByName('VALORRESERVA').asFloat * VoltaValorCotacao(dtmAPrev.qryAux,qryReserva.FieldByName('INDICEREAJUSTE').asString,
                                                  qryPartAss.FieldByName('IDPLANOPREV').AsString, qryReserva.FieldByName('IDTIPORESERVA').asString,DtEdDtConvCotas.Text));

            // Ativo ou Mantido
            if (qryPartAss.FieldByName('FlgInterno').AsString = 'AT') OR
               (qryPartAss.FieldByName('FlgInterno').AsString = 'MA') then
            begin
              // Saldo da Conta de Contribuição do Participante
              if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                 (FieldByName('FLGTRANSFERENCIA').AsInteger = 0) and
                 (FieldByName('FLGTITULARCOLET').AsString = 'T') then
                 dSldContribPart := dSldContribPart + (FieldByName('VALORRESERVA').asFloat * VoltaValorCotacao(dtmAPrev.qryAux,qryReserva.FieldByName('INDICEREAJUSTE').asString,
                                                       qryPartAss.FieldByName('IDPLANOPREV').AsString, qryReserva.FieldByName('IDTIPORESERVA').asString, DtEdDtConvCotas.Text))
              // Saldo da Conta de Contribuição da Patrocinadora
              else if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                      (FieldByName('FLGTRANSFERENCIA').AsInteger = 0) and
                      (FieldByName('FLGTITULARCOLET').AsString = 'P') then
                      dSldContribPatro := dSldContribPatro + (FieldByName('VALORRESERVA').asFloat * VoltaValorCotacao(dtmAPrev.qryAux,qryReserva.FieldByName('INDICEREAJUSTE').asString,
                                                              qryPartAss.FieldByName('IDPLANOPREV').AsString, qryReserva.FieldByName('IDTIPORESERVA').asString, DtEdDtConvCotas.Text))
              // Saldo da Conta de Transferência do Participante
              else if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                      (FieldByName('FLGTRANSFERENCIA').AsInteger = 1) and
                      (FieldByName('FLGTITULARCOLET').AsString = 'T') then
                      dSldTransfPart := dSldTransfPart + (FieldByName('VALORRESERVA').asFloat * VoltaValorCotacao(dtmAPrev.qryAux,qryReserva.FieldByName('INDICEREAJUSTE').asString,
                                                          qryPartAss.FieldByName('IDPLANOPREV').AsString, qryReserva.FieldByName('IDTIPORESERVA').asString, DtEdDtConvCotas.Text))
              // Saldo da Conta de Transferência da Patrocinadora
              else if (FieldByName('FLGCONTROLE').AsInteger = 0) and
                      (FieldByName('FLGTRANSFERENCIA').AsInteger = 1) and
                      (FieldByName('FLGTITULARCOLET').AsString = 'P') then
                      dSldTransfPatro := dSldTransfPatro + (FieldByName('VALORRESERVA').asFloat * VoltaValorCotacao(dtmAPrev.qryAux,qryReserva.FieldByName('INDICEREAJUSTE').asString,
                                                            qryPartAss.FieldByName('IDPLANOPREV').AsString, qryReserva.FieldByName('IDTIPORESERVA').asString, DtEdDtConvCotas.Text));
            end;
            Next;
          end;
        end;

        // Garantia
        dGarantia := Garantia(qryPartAss.FieldByName('IDPESSOA').AsInteger,
                              qryPartAss.FieldByName('IDPESSJUR').AsInteger,
                              qryPartAss.FieldByName('IDPLANOPREV').AsInteger,
                              qryPartAss.FieldByName('SEQPROPOSTA').AsInteger);


        With qryAux Do
        begin
          Close;
          Sql.Clear;
          Sql.Add('INSERT INTO INTERFATUARIAL ' +
                  '(IDPLANOPREV,IDPESSJUR,IDPESSOA,MATRICULA,INSCRICAONUMERO,SLDOCONTASSISTIDO,SALARIOMEDIO,' +
                  'SALDOCONTRIBPART,SALDOCONTRIBPATRO,SALDOTRANSFPART,SALDOTRANSFPATRO,GARANTIA)' +
                  'VALUES' +
                  '('+qryPartAss.FieldByName('IDPLANOPREV').AsString + ',' +
                  qryPartAss.FieldByName('IDPESSJUR').AsString + ',' +
                  qryPartAss.FieldByName('IDPESSOA').AsString + ',' +
                  QuotedStr(qryPartAss.FieldByName('MATRICULA').AsString) + ',' +
                  qryPartAss.FieldByName('INSCRICAONUMERO').AsString + ',' +
                  OraNumero(FloatToStr(dSldContaAss)) + ',' +
                  OraNumero(sSalMedio) + ',' +
                  OraNumero(FloatToStr(dSldContribPart)) + ',' +
                  OraNumero(FloatToStr(dSldContribPatro)) + ',' +
                  OraNumero(FloatToStr(dSldTransfPart)) + ',' +
                  OraNumero(FloatToStr(dSldTransfPatro)) + ',' +
                  OraNumero(FloatToStr(dGarantia)) + ')');

          try
            qryAux.ExecSQL;
          except
          on E: EDBEngineError do
             begin
               MostrarErro(E);
               frmAguarde.Apaga;
               Abort;
               Exit;
             end;
          end;
        end;
        dSldContaAss     := 0;
        dSldContribPart  := 0;
        dSldContribPatro := 0;
        dSldTransfPart   := 0;
        dSldTransfPatro  := 0;
        Next;
      end;
// Confirma a Transacao
      dtmBaseDados.dbBaseDados.Commit;
    Except
        MsgDlg('Erro - Interface cancelado.','Erro',mtError,[mbOk],0);
        frmAguarde.Apaga;
// Cancela a Transacao
        dtmBaseDados.dbBaseDados.Rollback;
        Exit;
    end;
  MsgDlg('Processo de Cadastramento da Interface Atuarial terminado com sucesso. ','Informação',mtInformation,[mbOk,mbHelp],0);
  frmAguarde.Apaga;
  end;
end;

function TfrmProcCadInterfAtuarial.Garantia(iGarIdpessoa,iGarIdPessjur,iGarIdPlanoprev,iGarSeqProposta : integer) :double;
var
   dResGarantia : double;
begin
   dResGarantia := 0;

   With qryGarantia do
   begin
     Close;
     ParamByName('IDPESSOA').AsInteger         := iGarIdPessoa;
     ParamByName('IDPESSJUR').AsInteger        := iGarIdPessJur;
     ParamByName('IDPLANOPREV').AsInteger      := iGarIdPlanoPrev;
     ParamByName('SEQPROPOSTA').AsInteger      := iGarSeqProposta;
     Open;

     While not eof do
     begin
       dResGarantia := dResGarantia + (FieldByName('VALORRESERVA').AsFloat * VoltaValorCotacao(dtmAPrev.qryAux,qryGarantia.FieldByName('INDICEREAJUSTE').asString,
                                       IntToStr(iGarIdPlanoprev), qryReserva.FieldByName('IDTIPORESERVA').asString, DtEdDtConvCotas.Text));
       Next;
    end;
   end;

   Garantia := dResGarantia;

end;

procedure TfrmProcCadInterfAtuarial.FormCreate(Sender: TObject);
begin
  inherited;
  qryPlanPrev.Close;
  qryPlanPrev.Open;
end;

procedure TfrmProcCadInterfAtuarial.BtCancelarClick(Sender: TObject);
begin
  inherited;
  FimProcesso:=True;
  BtCancelar.Enabled   :=False;
  bbtnProcessar.Enabled :=True;
end;



function TfrmProcCadInterfAtuarial.VoltaValorCotacao(qryaux : Twwquery ; sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva, sDataMov : String) : Double;
var cAux : char ;
    stipoMoeda : String;
begin
 Result := 0;
 if Trim(sIndiceReajuste) = '' then Exit;


 VerifIndiceHist(qryaux , sIndiceReajuste, sIdPlanoPrev , sIdTipoReserva ,sDataMov );

 //transformar o número de cotas da reserva em moeda
 qryaux.Close;
 qryaux.sql.clear;
 qryaux.SQL.add('SELECT  MOEPERIODICIDADE '+
                ' FROM MOEDA '+
                ' WHERE MOECODIGO = '+sIndiceReajuste+' ');
 Try
   qryaux.Open;
 Except
   result := 0;
   exit;
 End;
 if qryaux.IsEmpty then begin
   result := 0;
   exit;
 end;


 sTipoMoeda := qryAux.FieldByName('MOEPERIODICIDADE').AsString;
 qryaux.Close;
 qryaux.sql.clear;
 if sTipoMoeda = 'M' Then Begin

    qryaux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                   ' AND (COTMESREF = '''+copy(sDataMov,4,2)+copy(sDataMov,7,4)+ '''))'); 

  end
  else begin
    qryaux.SQL.add('SELECT  COTVALOR '+
                   ' FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndiceReajuste+' '+
                   ' AND COTDATA IN '+
                   ' (SELECT MAX(COTDATA) FROM COTACAOMOEDA '+
                   ' WHERE MOECODIGO = '+sIndicereajuste+' '+
                   ' AND COTDATA = TO_DATE(''' + sDataMov +''',''DD/MM/YYYY'')) '); 


  end;
  try
    qryaux.Open;
  except
   result := 0;
   exit;
  end;
 if qryaux.IsEmpty then
 begin
   //erro - não encontrou cotacao para moeda
   result := 0;
   exit;
 end
 else
 begin
    cAux := DecimalSeparator;
    DecimalSeparator := '.';
    result := strtofloat(truncaround(qryaux.fieldbyname('COTVALOR').AsString,8)); 
    DecimalSeparator := cAux;
 end;

end;

procedure TfrmProcCadInterfAtuarial.VerifIndiceHist(qryaux : twwquery;  var sIndice : String ; sIdPLanoPrev, sIdTipoReserva: String ; sDataCota : String);
begin

   //verifica histórico de índices de reservas
   //para o mês informado
   //vai pegar a última moeda cadastrada
   qryaux.Close;
   qryaux.sql.clear;
   qryaux.SQL.add(' SELECT  INDICEREAJUSTE '+
                  ' FROM HISTINDICERESERVA '+
                  ' WHERE '+
                  ' IDPLANOPREV = '''+sIdPLanoPrev+''' AND '+
                  ' IDTIPORESERVA = '''+sIdTipoReserva+''' AND '+
                  ' TO_DATE(TO_CHAR(DATAFIM,''DD/MM/YYYY''),''DD/MM/YYYY'')  '+
                  ' >= TO_DATE('''+sDataCota+''',''DD/MM/YYYY'') '+
                  ' ORDER BY DATAFIM DESC ');
   Try
     qryaux.Open;
   Except
     exit;
   End;
   //se houver algum registro, que dizer que já houve
   //miudança no cadastro de índice
   //então pego o primeiro registro e troco o id da função
   if not qryaux.isempty then
      sIndice := qryaux.fieldbyname('INDICEREAJUSTE').AsString;

end;


function TfrmProcCadInterfAtuarial.TruncaRound(f:String;n:integer):string;
var
 i,j:integer;
 rInteiro : Extended;
 cAux :Char;
begin
   cAux := DecimalSeparator;
   Result := (f);

   i:=pos(',',result);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',result);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if (i <> 0) and (length(copy(result,i+1,length(result)))>n) then
   begin
       rInteiro := strtofloat(result);
       rInteiro := strtofloat(f)*power(10,n);
       j := pos(DecimalSeparator,floattostr(rinteiro));
       if j <> 0 then  rInteiro := ArredondaValor(floattostr(rinteiro));
       rInteiro := rInteiro/power(10,n);
       Result := copy(floattostr(rinteiro),1,i+n)
   end;
   DecimalSeparator := cAux;
end;

function TfrmProcCadInterfAtuarial.ArredondaValor(Valor : String) : Extended;
var cAux : Char;
    i : Integer;
    sValorInt, sValorDec : String;
    dValorInt , dValorDec : Extended;
begin
   cAux := DecimalSeparator;

   if Valor = '' then
   begin
      Result := 0;
      exit;
   end;

   i:=pos(',',Valor);
   if i=0 then
   begin
      DecimalSeparator := '.';
      i:= pos('.',Valor);
   end
   else
   begin
      DecimalSeparator := ',';
   end;

   if i <> 0 then
   begin
      sValorInt := Copy(valor,0,i-1);
      sValorDec := Copy(valor,i+1,1);
      dValorInt := strtofloat(sValorInt);
      dValorDec := strtofloat(sValorDec);

      if dValorDec >= 5 then
      dValorInt := dValorInt + 1;
   end
   else dValorInt := StrToFloat(Valor);


   Result := dValorInt;
   DecimalSeparator := cAux;
end;




end.
