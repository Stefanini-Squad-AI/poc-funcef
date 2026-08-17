{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 28/02/2002                             }
{                                                       }
{*******************************************************}

{ --------------------------------------------------------------------------------------------------
Nº SOL......: 172384/9603
Nº KINTANA..: 1661662
Data........: 25/06/2012
Responsável.: Vander Campos
Descrição...: Inclusão do Grupo Da Contas [ Orçamento ]
-------------------------------------------------------------------------------------------------- }
{
Rotina............: SetIdPlanoPrev
N. Sol.............: 122623
N. Kintana......: 603580
Data...............: 13/11/2009
Responsável...: Ricardo Alves
Descrição........: Criação e tratamento dos campos patrocinadora financeiro e
  plano previdenciário financeiro.
}

unit uDbTipordxccxconta;

// Rotina    : Divs
// Data      : 06/06/2006
// Descrição : inserir os campos IDPATRO e PLACONTAPASS
// Pendência : 22515

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTipordxccxconta = class(TCmDbObject)

  private
    FPlaconta: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdempresa: TCmDbField;
    FCodtiprecdes: TCmDbField;
    FCodcentrocusto: TCmDbField;
    FPlano: TCmDbField;
    FRecpag: TCmDbField;
    FIdtipordxccxconta: TCmDbField;
    FIdprograma: TCmDbField;
    FPlacontapass: TCmDbField;

    // Ricardo A. SOL 122623 KTN 603580
    //FIdpatro: TCmDbField;
    FIdPlanoPrev: TCmDbField;
    FIdGrupoOrcamen: TCmDbField; //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662

    procedure SetCodcentrocusto(const Value: TCmDbField);
    procedure SetCodtiprecdes(const Value: TCmDbField);
    procedure SetIdempresa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdprograma(const Value: TCmDbField);
    procedure SetIdtipordxccxconta(const Value: TCmDbField);
    procedure SetPlaconta(const Value: TCmDbField);
    procedure SetPlano(const Value: TCmDbField);
    procedure SetRecpag(const Value: TCmDbField);
    // Ricardo A. SOL 122623 KTN 603580
    //procedure SetIdpatro(const Value: TCmDbField);
    procedure SetIdPlanoPrev( const Value: TCmDbField );
    procedure SetPlacontapass(const Value: TCmDbField);
    procedure SetIdGrupoOrcamen(const Value: TCmDbField);//VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
  public

     Property Recpag: TCmDbField read FRecpag write SetRecpag;
     Property Plano: TCmDbField read FPlano write SetPlano;
     Property Placonta: TCmDbField read FPlaconta write SetPlaconta;
     Property Idtipordxccxconta: TCmDbField read FIdtipordxccxconta write SetIdtipordxccxconta;
     Property Idprograma: TCmDbField read FIdprograma write SetIdprograma;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idempresa: TCmDbField read FIdempresa write SetIdempresa;
     Property Codtiprecdes: TCmDbField read FCodtiprecdes write SetCodtiprecdes;
     Property Codcentrocusto: TCmDbField read FCodcentrocusto write SetCodcentrocusto;
     // 22515 - inserir IDPATRO e PLACONTAPASS

     // Ricardo A. SOL 122623 KTN 603580
     //Property Idpatro: TCmDbField read FIdpatro write SetIdpatro;
     Property IdPlanoPrev: TCmDbField read FIdPlanoPrev write SetIdPlanoPrev;
     Property Placontapass: TCmDbField read FPlacontapass write SetPlacontapass;

     Property IdGrupoOrcamen : TCmDbField read FIdGrupoOrcamen write SetIdGrupoOrcamen; //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662


     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbTipordxccxconta }

constructor TDbTipordxccxconta.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TIPORDXCCXCONTA';

   fRecpag            := CreateCmDbField('RECPAG',ftString,False,False,False,True,'');
   fPlano             := CreateCmDbField('PLANO',ftfloat,False,False,False,True,'');
   fPlaconta          := CreateCmDbField('PLACONTA',ftString,False,False,False,True,'');
   fIdtipordxccxconta := CreateCmDbField('IDTIPORDXCCXCONTA',ftfloat,True,True,False,True,'');
   fIdprograma        := CreateCmDbField('IDPROGRAMA',ftfloat,False,False,False,True,'');
   fIdpessoa          := CreateCmDbField('IDPESSOA',ftfloat,False,False,False,True,'');
   fIdempresa         := CreateCmDbField('IDEMPRESA',ftfloat,False,False,False,True,'');
   fCodtiprecdes      := CreateCmDbField('CODTIPRECDES',ftString,False,False,False,True,'');
   fCodcentrocusto    := CreateCmDbField('CODCENTROCUSTO',ftString,False,False,False,True,'');
   // 22515 - inserir IDPATRO e PLACONTAPASS

   // Ricardo A. SOL 122623 KTN 603580
   //FIdpatro           := CreateCmDbField('IDPATRO',ftFloat,False,False,False,True,'');
   FIdPlanoPrev       := CreateCmDbField('IDPLANOPREV',ftFloat,False,False,False,True,'');

   FPlacontapass      := CreateCmDbField('PLACONTAPASS',ftString,False,False,False,True,'');

   //VANDER CAMPOS - SOL 172384/9603 - KINTANA 1661662
   FIdGrupoOrcamen    := CreateCmDbField('IDGRUPOORCAMEN',ftFloat,False,False,False,True,'');

end;

function TDbTipordxccxconta.Insert: Boolean;
begin

   fIdtipordxccxconta.AsFloat := GetSequence('TIPORDXCCXCONTA');
   Result := Inherited Insert;

end;

function TDbTipordxccxconta.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbTipordxccxconta.SetCodcentrocusto(const Value: TCmDbField);
begin
  FCodcentrocusto := Value;
end;

procedure TDbTipordxccxconta.SetCodtiprecdes(const Value: TCmDbField);
begin
  FCodtiprecdes := Value;
end;

procedure TDbTipordxccxconta.SetIdempresa(const Value: TCmDbField);
begin
  FIdempresa := Value;
end;

procedure TDbTipordxccxconta.SetIdGrupoOrcamen(const Value: TCmDbField);
begin
  FIdGrupoOrcamen := Value;
end;

procedure TDbTipordxccxconta.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDbTipordxccxconta.SetIdPlanoPrev(const Value: TCmDbField);
begin
  FIdPlanoPrev := Value;
end;

procedure TDbTipordxccxconta.SetIdprograma(const Value: TCmDbField);
begin
  FIdprograma := Value;
end;

procedure TDbTipordxccxconta.SetIdtipordxccxconta(const Value: TCmDbField);
begin
  FIdtipordxccxconta := Value;
end;

procedure TDbTipordxccxconta.SetPlaconta(const Value: TCmDbField);
begin
  FPlaconta := Value;
end;

procedure TDbTipordxccxconta.SetPlacontapass(const Value: TCmDbField);
begin
  FPlacontapass := Value;
end;

procedure TDbTipordxccxconta.SetPlano(const Value: TCmDbField);
begin
  FPlano := Value;
end;

procedure TDbTipordxccxconta.SetRecpag(const Value: TCmDbField);
begin
  FRecpag := Value;
end;

end.



