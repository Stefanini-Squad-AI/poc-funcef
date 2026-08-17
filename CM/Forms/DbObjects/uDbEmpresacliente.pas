{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/02/2002                             }
{                                                       }
{*******************************************************}

unit uDbEmpresacliente;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uCmControlObject;

Type
  TDbEmpresacliente = class(TCmDbObject)

  private
    FFlgsitcredito: TCmDbField;
    FCodsubconta: TCmDbField;
    FMotivobloq: TCmDbField;
    FContacreceita: TCmDbField;
    FContacadiantamento: TCmDbField;
    FIdempresa: TCmDbField;
    FPlano: TCmDbField;
    FFlgstatus: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdforcli: TCmDbField;
    FIdpromotor: TCmDbField;
    FPerccomiscartao: TCmDbField;
    FVlrlimcredito: TCmDbField;
    FPrazocartao: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FPerccomispromotor: TCmDbField;
    FContaccliente: TCmDbField;
    FUnidnegoc: TCmDbField;
    FCodCorrespEmpresa: TCmDbField;
    FObsCliente: TCmDbField;
    FCriaSubConta: Boolean;
    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetContacadiantamento(const Value: TCmDbField);
    procedure SetContaccliente(const Value: TCmDbField);
    procedure SetContacreceita(const Value: TCmDbField);
    procedure SetFlgsitcredito(const Value: TCmDbField);
    procedure SetFlgstatus(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdforcli(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdpromotor(const Value: TCmDbField);
    procedure SetMotivobloq(const Value: TCmDbField);
    procedure SetPerccomiscartao(const Value: TCmDbField);
    procedure SetPerccomispromotor(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetPrazocartao(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetVlrlimcredito(const Value: TCmDbField);
    procedure SetCodCorrespEmpresa(const Value: TCmDbField);
    procedure SetObsCliente(const Value: TCmDbField);
    procedure SetCriaSubConta(const Value: Boolean);

    function InsereSubConta: Boolean;

  public

     Property Vlrlimcredito: TCmDbField read FVlrlimcredito write SetVlrlimcredito;
     Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
     Property Prazocartao: TCmDbField read FPrazocartao write SetPrazocartao;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Perccomispromotor: TCmDbField read FPerccomispromotor write SetPerccomispromotor;
     Property Perccomiscartao: TCmDbField read FPerccomiscartao write SetPerccomiscartao;
     Property Motivobloq: TCmDbField read FMotivobloq write SetMotivobloq;
     Property Idpromotor: TCmDbField read FIdpromotor write SetIdpromotor;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idforcli: TCmDbField read FIdforcli write SetIdforcli;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Flgstatus: TCmDbField read FFlgstatus write SetFlgstatus;
     Property Flgsitcredito: TCmDbField read FFlgsitcredito write SetFlgsitcredito;
     Property Contacreceita: TCmDbField read FContacreceita write SetContacreceita;
     Property Contaccliente: TCmDbField read FContaccliente write SetContaccliente;
     Property Contacadiantamento: TCmDbField read FContacadiantamento write SetContacadiantamento;
     Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     Property CodCorrespEmpresa: TCmDbField read FCodCorrespEmpresa write SetCodCorrespEmpresa;
     Property ObsCliente: TCmDbField read FObsCliente write SetObsCliente;

     property CriaSubConta: Boolean read FCriaSubConta write SetCriaSubConta;


     Constructor Create(Aowner: TCmCustomCdbObject); Override;
     destructor Destroy; Override;

     Function Insert :Boolean; Override;
     Function Update :Boolean; Override;
     function Delete :Boolean; virtual;

     Function LoadFromDb :Boolean; Override;
  End;

implementation

Uses uCmMath, Sysutils, uDbSubcontaPadrao;

{ TDbEmpresacliente }

constructor TDbEmpresacliente.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  FCriaSubConta := false;

  ErrorIfNoRowsAffected := False;

  TableName := 'EMPRESACLIENTE';

  fVlrlimcredito := CreateCmDbField('VLRLIMCREDITO',ftfloat,False,False,False,True,'Valor Limite de Crédito');
  fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'Unidade de Negócio');
  fPrazocartao := CreateCmDbField('PRAZOCARTAO',ftfloat,False,False,False,True,'Prazo Cartão');
  fPlano := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'Plano Contábil');
  fPerccomispromotor := CreateCmDbField('PERCCOMISPROMOTOR',ftfloat,False,False,False,True,'Percentual de Comissão Promor');
  fPerccomiscartao := CreateCmDbField('PERCCOMISCARTAO',ftfloat,False,False,False,True,'Percentual de Comissão Cartão');
  fMotivobloq := CreateCmDbField('MOTIVOBLOQ',ftString,False,False,False,True,'Motivo de Bloqueio');
  fIdpromotor := CreateCmDbField('IDPROMOTOR',ftfloat,False,False,False,True,'Identificador do Promotor');
  fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'Identificador da Empresa');
  fIdforcli := CreateCmDbField('IDFORCLI',ftfloat,True,True,False,True,'Identificador do Cliente');
  fIdempresa := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'Id Empresa Centro de Custo');
  fFlgstatus := CreateCmDbField('FLGSTATUS',ftString,False,False,False,True,'Status');
  fFlgsitcredito := CreateCmDbField('FLGSITCREDITO',ftString,False,False,False,True,'Situação de Crédito');
  fContacreceita := CreateCmDbField('CONTACRECEITA',ftString,False,False,False,True,'Conta Débito');
  fContaccliente := CreateCmDbField('CONTACCLIENTE',ftString,False,False,False,True,'Conta Crédito');
  fContacadiantamento := CreateCmDbField('CONTACADIANTAMENTO',ftString,False,False,False,True,'Conta Contábil Adiantamento');
  fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'Sub Conta');
  fCodcentrocusto := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'Centro de Custo');
  fCodCorrespEmpresa := CreateCmDbField('CODCORRESPEMPRESA',ftString,False,False,False,True,'Código Correspondente Empresa');
  FObsCliente := CreateCmDbField('OBSCLIENTE',ftString,False,False,False,True,'Código Correspondente Empresa');
end;

function TDbEmpresacliente.Insert: Boolean;
var
   sPromotor : String;
begin
   result := InsereSubConta;
   if result then
   begin
      Result := Inherited Insert;

      If Result And (FIdpessoa.AsFloat = -1) Then
      Begin
         if fIdpromotor.Asinteger = 0 then
            sPromotor := 'NULL'
         else
            sPromotor := fIdpromotor.AsString;

         Result :=  TCmControlObject(Owner).ExecSQL( ' INSERT INTO EMPRESACLIENTE ' +
                    '    (IDPESSOA, ' +
                    '     IDFORCLI, ' +
                    '     PERCCOMISCARTAO, ' +
                    '     PRAZOCARTAO, ' +
                    '     PERCCOMISPROMOTOR, ' +
                    '     IDPROMOTOR, ' +
                    '     VLRLIMCREDITO, ' +
                    '     FLGSITCREDITO, ' +
                    '     MOTIVOBLOQ, ' +
                    '     FLGSTATUS, PLANO, CONTACCLIENTE, CONTACRECEITA) ' +
                    ' SELECT ' +
                    '   E.IDPESSOA, ' +
                      FIdforcli.AsString + ', ' +
                      FloatToStrCM(FPerccomiscartao.AsFloat) + ', ' +
                      FloatToStrCM(FPrazocartao.AsFloat) + ', ' +
                      FloatToStrCM(fPerccomispromotor.AsFloat) + ', ' +
                      sPromotor + ', ' +
                      FloatToStrCM(fVlrlimcredito.AsFloat) + ', ' +
                      QuotedStr(fFlgsitcredito.AsString) + ', ' +
                      QuotedStr(fMotivobloq.AsString) + ', ' +
                      QuotedStr(fFlgstatus.AsString) + ', ' +
                    '   TC.PLANO, ' +
                    '   TC.PLACONTA, ' +
                    '   TC.PLACONTACRE ' +
                    '  FROM ' +
                    '    EMPRESAPROP E, ' +
                    '    TIPOCLIXHOTELXCC TC, ' +
                    '    CLIENTEPESS CP ' +
                    '  WHERE ' +
                    '    ( E.IDPESSOA <> -1 ) AND ' +
                    '    ( CP.IDPESSOA = ' + FIdforcli.AsString + ') AND ' +
                    '    ( E.IDPESSOA = TC.IDPESSOA ) AND ' +
                    '    ( CP.IDTIPOCLIENTE = TC.IDTIPOCLIENTE) ');

         If Not Result Then
            MessageInfo := TCmControlObject(Owner).MessageInfo;
      end;
   end;
end;

function TDbEmpresacliente.Update: Boolean;
var sPromotor : String;
begin
   result := InsereSubConta;

   if result then
   begin
      Result := Inherited Update;

      If Result And (FIdpessoa.AsFloat = -1) Then
      Begin
         if fIdpromotor.Asinteger = 0 then
            sPromotor := 'NULL'
         else
            sPromotor := fIdpromotor.AsString;


         _CdsSelect.Data := TCmControlObject(Owner).GetDataPacket(
                    ' SELECT ' +
                    '   E.IDPESSOA, ' +
                    '   TC.PLANO, ' +
                    '   TC.PLACONTA, ' +
                    '   TC.PLACONTACRE ' +
                    '  FROM ' +
                    '    EMPRESAPROP E, ' +
                    '    TIPOCLIXHOTELXCC TC, ' +
                    '    CLIENTEPESS CP ' +
                    '  WHERE ' +
                    '    ( E.IDPESSOA <> -1 ) AND ' +
                    '    ( CP.IDPESSOA = ' + FIdforcli.AsString + ') AND ' +
                    '    ( E.IDPESSOA = TC.IDPESSOA ) AND ' +
                    '    ( CP.IDTIPOCLIENTE = TC.IDTIPOCLIENTE) ');

         while not _CdsSelect.eof do
         begin
            Result :=  TCmControlObject(Owner).ExecSQL( ' UPDATE EMPRESACLIENTE SET ' +
                       '     PERCCOMISPROMOTOR = ' + FloatToStrCM(fPerccomispromotor.AsFloat) + ', ' +
                       '     IDPROMOTOR = ' + sPromotor + ', ' +
                       '     VLRLIMCREDITO = ' + FloatToStrCM(fVlrlimcredito.AsFloat) + ', ' +
                       '     FLGSITCREDITO = ' + QuotedStr(fFlgsitcredito.AsString) + ', ' +
                       '     MOTIVOBLOQ = ' + QuotedStr(fMotivobloq.AsString) + ', ' +
                       '     PLANO = ' +  _CdsSelect.FieldByName('PLANO').AsString + ', ' +
                       '     CONTACCLIENTE = ' + QuotedStr(_CdsSelect.FieldByName('PLACONTA').AsString) + ', ' +
                       '     CONTACRECEITA = ' + QuotedStr(_CdsSelect.FieldByName('PLACONTACRE').AsString) + ', ' +
                       '     FLGSTATUS = ' + QuotedStr(fFlgstatus.AsString) +
                       ' WHERE IDPESSOA = ' + _CdsSelect.FieldByName('IDPESSOA').AsString + ' AND IDFORCLI = ' + FIdforcli.AsString);

            If Not Result Then
            begin
               MessageInfo := TCmControlObject(Owner).MessageInfo;
               break;
            end
            else
              _CdsSelect.Next;
         end;

         _CdsSelect.Close;
      end;
   end;
end;

function TDbEmpresacliente.Delete: Boolean;
begin
   Result := Inherited Delete;

   If Result And (FIdpessoa.AsFloat = -1) Then
   Begin
      Result :=  TCmControlObject(Owner).ExecSQL( ' DELETE FROM EMPRESACLIENTE WHERE IDFORCLI = ' + FIdforcli.AsString);

      If Not Result Then
         MessageInfo := TCmControlObject(Owner).MessageInfo;
   End;
end;

function TDbEmpresacliente.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDbEmpresacliente.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbEmpresacliente.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDbEmpresacliente.SetContacadiantamento(const Value: TCmDbField);
begin
  FContacadiantamento := Value;
end;

procedure TDbEmpresacliente.SetContaccliente(const Value: TCmDbField);
begin
  FContaccliente := Value;
end;

procedure TDbEmpresacliente.SetContacreceita(const Value: TCmDbField);
begin
  FContacreceita := Value;
end;

procedure TDbEmpresacliente.SetFlgsitcredito(const Value: TCmDbField);
begin
  FFlgsitcredito := Value;
end;

procedure TDbEmpresacliente.SetFlgstatus(const Value: TCmDbField);
begin
  FFlgstatus := Value;
end;

procedure TDbEmpresacliente.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbEmpresacliente.SetIdforcli(const Value: TCmDbField);
begin
  FIdforcli := Value;
end;

procedure TDbEmpresacliente.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbEmpresacliente.SetIdpromotor(const Value: TCmDbField);
begin
  FIdpromotor := Value;
end;

procedure TDbEmpresacliente.SetMotivobloq(const Value: TCmDbField);
begin
  FMotivobloq := Value;
end;

procedure TDbEmpresacliente.SetPerccomiscartao(const Value: TCmDbField);
begin
  FPerccomiscartao := Value;
end;

procedure TDbEmpresacliente.SetPerccomispromotor(const Value: TCmDbField);
begin
  FPerccomispromotor := Value;
end;

procedure TDbEmpresacliente.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbEmpresacliente.SetPrazocartao(const Value: TCmDbField);
begin
  FPrazocartao := Value;
end;

procedure TDbEmpresacliente.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDbEmpresacliente.SetVlrlimcredito(const Value: TCmDbField);
begin
  FVlrlimcredito := Value;
end;

procedure TDbEmpresacliente.SetCodCorrespEmpresa(const Value: TCmDbField);
begin
  FCodCorrespEmpresa := Value;
end;

procedure TDbEmpresacliente.SetObsCliente(const Value: TCmDbField);
begin
  FObsCliente := Value;
end;

procedure TDbEmpresacliente.SetCriaSubConta(const Value: Boolean);
begin
  FCriaSubConta := Value;
end;

destructor TDbEmpresacliente.Destroy;
begin
  inherited;
end;

function TDbEmpresacliente.InsereSubConta: Boolean;
Var
   dbSubConta: TDbSubcontaPadrao;
begin
   if FCriaSubConta and fCodsubconta.IsNull then
   begin
      dbSubConta := TDbSubcontaPadrao.Create(Owner);

      try
         dbSubConta.DataBaseName := Self.DataBaseName;
         result := dbSubConta.InsereSubContaForCli(FIdforcli.AsFloat, FIdPessoa.AsFloat);

         if result then
            Self.FCodsubconta.AsFloat := dbSubConta.Codsubconta.AsFloat
         else
            Self.MessageInfo := dbSubConta.MessageInfo;
      finally
         dbSubConta.free;
      end;
   end
   else
      result := true;
end;

end.



