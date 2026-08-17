{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/02/2002                             }
{                                                       }
{*******************************************************}
{--------------------------------------------------------------------------------------------------
Nº SIG...........: 35762
Data da Alteração: 15/08/2017
Responsável......: Rodrigo Ramos
Descrição........: Funcionalidade de Cadastro de Favorecido disponibilizada no módulo Folha de Benefícios
//
--------------------------------------------------------------------------------------------------
{
--------------------------------------------------------------------------------------------------
Nº SIG...........: 27550
Data da Alteração: 28/10/2016
Responsável......: Michelle Suellyn Mota
Descrição........: ER180 - Alterações de leiaute e nomenclatura de colunas - GetSelectForPessoa
--------------------------------------------------------------------------------------------------

}
unit uDbContabancaria;

interface

Uses uCmCustomCdbObject, SysUtils, uCmDbObject, DB;

Type
  TDbContabancaria = class(TCmDbObject)

  private
    FContacorrente: TCmDbField;
    FFlgcontaconjunta: TCmDbField;
    FIdagencia: TCmDbField;
    FFlgcontapref: TCmDbField;
    // SOL : 179053 KTN: 1649127 - JRM6
    FFlgcontainativa: TCmDbField;
    // SOL : 179053 KTN: 1649127 - JRM6
    FIdpessoa: TCmDbField;
    FIdcbancaria: TCmDbField;
    FTipoconta: TCmDbField;

    FFlgcontaresgate: TCmDbField; ///// Rodrigo Ramos - SIG35762
    procedure SetContacorrente(const Value: TCmDbField);
    procedure SetFlgcontaconjunta(const Value: TCmDbField);
    procedure SetFlgcontapref(const Value: TCmDbField);
    // SOL : 179053 KTN: 1649127 - JRM6
    procedure SetFlgcontainativa(const Value: TCmDbField);
    // SOL : 179053 KTN: 1649127 - JRM6
    procedure SetIdagencia(const Value: TCmDbField);
    procedure SetIdcbancaria(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetTipoconta(const Value: TCmDbField);

        procedure SetFlgcontaresgate(const Value: TCmDbField); // Rodrigo Ramos - SIG35762

  public

     Property Tipoconta: TCmDbField read FTipoconta write SetTipoconta;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idcbancaria: TCmDbField read FIdcbancaria write SetIdcbancaria;
     Property Idagencia: TCmDbField read FIdagencia write SetIdagencia;
     Property Flgcontapref: TCmDbField read FFlgcontapref write SetFlgcontapref;
     // SOL : 179053 KTN: 1649127 - JRM6
     Property Flgcontainativa: TCmDbField read FFlgcontainativa write SetFlgcontainativa;
     // SOL : 179053 KTN: 1649127 - JRM6
     Property Flgcontaconjunta: TCmDbField read FFlgcontaconjunta write SetFlgcontaconjunta;
     Property Contacorrente: TCmDbField read FContacorrente write SetContacorrente;

          Property Flgcontaresgate: TCmDbField read FFlgcontaresgate write SetFlgcontaresgate; // Rodrigo Ramos - SIG35762

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;

     Function GetSelectForPessoa(rIdPessoa: Double): String;

     Function DeleteForPessoa(rIdPessoa: Double): Boolean;
  End;

implementation

Uses uCmControlObject;

{ TDbContabancaria }

constructor TDbContabancaria.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'CONTABANCARIA';

   fTipoconta := CreateCmDbField('TIPOCONTA',ftString,False,False,False,True,'Tipo da Conta');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'Identificador da Pessoa');
   fIdcbancaria := CreateCmDbField('IDCBANCARIA',ftfloat,True,True,False,True,'Identificador');
   fIdagencia := CreateCmDbField('IDAGENCIA',ftfloat,False,False,False,True,'Agência Bancária');
   fFlgcontapref := CreateCmDbField('FLGCONTAPREF',ftfloat,False,False,False,True,'Indica Conta Preferencial');
   // SOL : 179053 KTN: 1649127 - JRM6
   fFlgcontainativa := CreateCmDbField('FLGCONTAINATIVA',ftString,False,False,False,True,'Indica Conta Inativa');
   // SOL : 179053 KTN: 1649127 - JRM6
   fFlgcontaconjunta := CreateCmDbField('FLGCONTACONJUNTA',ftString,False,False,False,True,'Indica Conta Conjunta');
   fContacorrente := CreateCmDbField('CONTACORRENTE',ftString,False,False,False,True,'Número da Conta');

   fFlgcontaresgate := CreateCmDbField('FLGCONTARESGATE',ftString,False,False,False,True,'Indica Conta Resgate'); // Rodrigo Ramos - SIG35762
   end;

function TDbContabancaria.DeleteForPessoa(rIdPessoa: Double): Boolean;
begin
  Result := TCmControlObject(Owner).ExecSql('DELETE FROM CONTABANCARIA WHERE IDPESSOA = ' + FloatToStr(rIdPessoa));
end;

function TDbContabancaria.GetSelectForPessoa(rIdPessoa: Double): String;
begin
   Result := ' SELECT ' +
             '   C.IDCBANCARIA, C.IDPESSOA, C.IDAGENCIA, C.CONTACORRENTE, ' +
             '   C.FLGCONTAPREF, C.FLGCONTAINATIVA, C.TIPOCONTA, A.NUMAGENCIA, A.IDBANCO, ' +
             '   PB.NOME AS NOMEBANCO, B.NUMBANCO, PA.NOME AS NOMEAGENCIA ' +
             {Início - Michelle Mota - SIG27550 - RNG016}
             '   ,case C.FLGCONTAPREF when 1 then ''Sim''  ' +
             '                       else ''Não'' end as PREF , ' +
             '   case C.FLGCONTAINATIVA when ''S'' then ''Sim'' ' + 
             '                          else ''Não'' end INATIVA, ' +
             '   case C.TIPOCONTA when ''1'' then ''Corrente'' ' +
             '                    when ''2'' then ''Salário'' ' +
             '                    when ''3'' then ''Poupança'' end TPCONTA ' +
             {Término - Michelle Mota - SIG27550 - RNG016}
             {Início - Rodrigo Ramos - SIG35762}
             ' ,C.FLGCONTARESGATE, DECODE(C.FLGCONTARESGATE,0,''N'',''S'') AS CONTARESGATE '  +
             ' FROM ' +
             {Término - Rodrigo Ramos - SIG35762}
             '   PESSOA PB, BANCO B, AGENCIABANCARIA A, CONTABANCARIA C, PESSOA PA ' +
             ' WHERE ' +
             '   ( C.IDPESSOA = ' + FloatToStr(rIdPessoa) + ' ) AND ' +
             '   ( C.IDAGENCIA = A.IDPESSOA )  AND ' +
             '   ( A.IDBANCO = B.IDPESSOA ) AND ' +
             '   ( PA.IDPESSOA =  A.IDPESSOA ) AND ' +
             '   ( B.IDPESSOA = PB.IDPESSOA ) ';
end;

function TDbContabancaria.Insert: Boolean;
begin

   fIdcbancaria.AsFloat := GetSequence('CONTABANCARIA');
   Result := Inherited Insert;

end;

function TDbContabancaria.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbContabancaria.SetContacorrente(const Value: TCmDbField);
begin
  FContacorrente := Value;
end;

procedure TDbContabancaria.SetFlgcontaconjunta(const Value: TCmDbField);
begin
  FFlgcontaconjunta := Value;
end;

procedure TDbContabancaria.SetFlgcontainativa(const Value: TCmDbField);
begin
  FFlgcontaInativa := value;
end;

procedure TDbContabancaria.SetFlgcontapref(const Value: TCmDbField);
begin
  FFlgcontapref := Value;
end;

procedure TDbContabancaria.SetIdagencia(const Value: TCmDbField);
begin
  FIdagencia := Value;
end;

procedure TDbContabancaria.SetIdcbancaria(const Value: TCmDbField);
begin
  FIdcbancaria := Value;
end;

procedure TDbContabancaria.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbContabancaria.SetTipoconta(const Value: TCmDbField);
begin
  FTipoconta := Value;
end;

// Rodrigo Ramos - SIG35762 - Inicio
procedure TDbContabancaria.SetFlgcontaresgate(const Value: TCmDbField);
begin
  FFlgcontaresgate := value;
end;
// Rodrigo Ramos - SIG35762 - Fim

end.
