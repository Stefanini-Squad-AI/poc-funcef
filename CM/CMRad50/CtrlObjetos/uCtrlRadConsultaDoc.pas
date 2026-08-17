{-------------------------------------------------------------------------------
 Data       : 21.10.2006
 Autor      : Antonio Marcos Fernandes de Souza (amf)
 Pendência  : 21792
 Descrição  : Criação da Control para ser utilizada com o RAD+ (novo RAD) na Consulta
              de Documentos associados ao processos RAD+
--------------------------------------------------------------------------------}

unit uCtrlRadConsultaDoc;

interface

Uses DB, uDataBase, uCmControlObject, dbclient,
     sysutils, uCtrlPadroes,
     uDbRADPRocesso, uMidasUtil,uCMTypes;

Type
   TContaBancaria = Record
     Id :Real;
     Banco :String;
     NomeBanco :String;
     Agencia :String;
     Nomeagencia :String;
     Numero :String;
     Tipo :String;
     DescTipo :String;
     MascaraConta :string;
     MascaraAgencia :String;
     AgenciaFormat :String;
     NumeroFormat :String;
   end;

  TCtrlRadConsultaDoc = class(TCmControlObject)

  Protected
      procedure DoChangeDataBase; Override;
      procedure OnCreateAppServer;override;
      procedure AfterInitialize;Override;
  private
    FSaldo: extended;
    FContaBancaria: TContaBancaria;
    procedure SetContaBancaria(const Value: TContaBancaria);
    procedure SetSaldo(const Value: extended);
   //
  public
      property Saldo: extended read FSaldo write SetSaldo;
      property ContaBancaria: TContaBancaria read FContaBancaria write SetContaBancaria;

      Constructor Create; Override;
      Destructor  Destroy;Override;

      //amf 21.10.2006 21792 - Extraído do datamodule DDadosBancarios (CmBack50)
      function ListaDadosBancariosDoDocumento(const eCodDocumento: extended): OleVariant;
      function ListaDadosBancariosDocFornecedor(const eCodDocumento: extended): OleVariant;

      //amf 21.10.2006 21792 - Extraído da uModulo da CmCapcarUtilObj50 - PegaNumeroOp
      function GetNumSlip(const eCodDocumento: extended): string;
  end;

implementation

{ TCtrlRadConsultaDoc }

procedure TCtrlRadConsultaDoc.AfterInitialize;
begin
  inherited;

end;

constructor TCtrlRadConsultaDoc.Create;
begin
  inherited;

end;

destructor TCtrlRadConsultaDoc.Destroy;
begin
  inherited;

end;

procedure TCtrlRadConsultaDoc.DoChangeDataBase;
begin
  inherited;

end;

function TCtrlRadConsultaDoc.GetNumSlip(const eCodDocumento: extended): string;
var
  cds: TClientDataSet;
  sSQL: string;
begin
  try
     sSQL :=
       'SELECT NUMSLIP from LOTEPAGTO LP, LOTEXDOCUM LD '+
       'WHERE CODDOCUMENTO = '+ FloatToStr(eCodDocumento) +' AND LP.NUMLOTE = LD.NUMLOTE ';

     cds := TClientDataSet.Create(nil);
     cds.Data := GetDataPacket(sSQL);

    if cds.IsEmpty then
       Result := ''
    else
       Result := cds.FieldByName('NUMSLIP').AsString;

  finally
     FreeAndNil(cds);
  end;
end;

function TCtrlRadConsultaDoc.ListaDadosBancariosDocFornecedor(
  const eCodDocumento: extended): OleVariant;
var
  sSQL: string;
begin
   sSQL :=
     'SELECT DECODE(C.TIPOCONTA,''1'',''Conta Corrente'', '+
     '       DECODE(C.TIPOCONTA,''2'',''Cartão Salário'', '+
     '       DECODE(C.TIPOCONTA,''3'',''Conta Poupança'',''))) AS DESCTIPOCONTA,'+
     '       C.CONTACORRENTE,'+
     '       C.CONTACORRENTE,'+
     '       B.NUMBANCO,'+
     '       A.NUMAGENCIA,'+
     '       C.TIPOCONTA,'+
     '       C.IDCBANCARIA,'+
     '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGENCIA,'+
     '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBANCO,'+
     '       B.MASCARACC,'+
     '       B.MASCARAAGENCIA '+
     'FROM '+
     '       PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
     'WHERE '+
     '      (D.CODDOCUMENTO = ' + FloatToStr(eCodDocumento) + ')' +
     '  AND (C.FLGCONTAPREF = 1) '+
     '  AND (C.IDAGENCIA = A.IDPESSOA) '+
     '  AND (C.IDPESSOA = D.IDFORCLI)  '+
     '  AND (A.IDBANCO   = B.IDPESSOA) '+
     '  AND (A.IDPESSOA = PA.IDPESSOA) '+
     '  AND (B.IDPESSOA = PB.IDPESSOA) '+
     '  AND (D.IDCBANCARIA = C.IDCBANCARIA)';

   Result := GetDataPacket(sSQL);
end;

function TCtrlRadConsultaDoc.ListaDadosBancariosDoDocumento(
  const eCodDocumento: extended): OleVariant;
var
  sSQL: string;
begin
   sSQL :=
     'SELECT DECODE(C.TIPOCONTA,''1'',''Conta Corrente'', '+
     '       DECODE(C.TIPOCONTA,''2'',''Cartão Salário'', '+
     '       DECODE(C.TIPOCONTA,''3'',''Conta Poupança'',''))) AS DESCTIPOCONTA,'+
     '       C.CONTACORRENTE,'+
     '       C.CONTACORRENTE,'+
     '       B.NUMBANCO,'+
     '       A.NUMAGENCIA,'+
     '       C.TIPOCONTA,'+
     '       C.IDCBANCARIA,'+
     '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOMEAGENCIA,'+
     '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOMEBANCO,'+
     '       B.MASCARACC,'+
     '       B.MASCARAAGENCIA '+
     'FROM '+
     '       PESSOA PA, PESSOA PB, DOCUMENTO D, CONTABANCARIA C, AGENCIABANCARIA A, BANCO B '+
     'WHERE '+
     '      (D.CODDOCUMENTO = ' + FloatToStr(eCodDocumento) + ') '+
     '  AND (C.IDAGENCIA = A.IDPESSOA) '+
     '  AND (A.IDBANCO   = B.IDPESSOA) '+
     '  AND (A.IDPESSOA = PA.IDPESSOA) '+
     '  AND (B.IDPESSOA = PB.IDPESSOA) '+
     '  AND (D.IDCBANCARIA = C.IDCBANCARIA)';

   Result := GetDataPacket(sSQL);
end;

procedure TCtrlRadConsultaDoc.OnCreateAppServer;
begin
  inherited;

end;

procedure TCtrlRadConsultaDoc.SetContaBancaria(
  const Value: TContaBancaria);
begin
  FContaBancaria := Value;
end;

procedure TCtrlRadConsultaDoc.SetSaldo(const Value: extended);
begin
  FSaldo := Value;
end;

end.
