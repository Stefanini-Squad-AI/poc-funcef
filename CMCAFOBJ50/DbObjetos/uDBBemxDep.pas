{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 20/04/2002                             }
{                                                       }
{*******************************************************
{-------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES ----------------------------------------------------
--------------------------------------------------------------------------------
Rotina...........: _
Nº SOL...........: 198886.18334
Data da Alteração: 10/01/2017
Responsável......: Darivaldo Alencar
Descrição........: Inclusão na tela Cadastro de Classe de Bens a opção para
                   inclusão da taxa de depreciação.
--------------------------------------------------------------------------------
Rotina...........:  -
Nº SOL...........: 142551
Nº KINTANA.......: 911676
Data da Alteração: 06/12/2010
Responsável......: Helen V. Bianchi
Descrição........: Add o Campo DATAINICIODEP   e DataFimDep
-------------------------------------------------------------------------------}

unit uDBBemxDep;

interface
Uses uCmDbObject, DB, uCmCustomCdbObject;

Type
  TDBBemxDep = class(TCmDbObject)

  private
    FIdbem: TCmDbField;
    FIdpessoa: TCmDbField;
    FMoecodigo: TCmDbField;
    FIdbemxdep: TCmDbField;
    FTaxadep: TCmDbField;
    FDepLanc: TCmDbField;
    FCmdep: TCmDbField;
    FDataUltDep: TCmDbField;
    FDataUltCM: TCmDbField;
    FFlgDeprec: TCmDbField;
    FDataInicioDep: TCmDbField;
    FDataFimDep: TCmDbField;
    FVidaUtil: TCmDbField;//Darivaldo Alencar SOL.198886.18334
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetIdbem(const Value: TCmDbField);
    procedure SetIdbemxdep(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);
    procedure SetDataUltDep(const Value: TCmDbField);
    procedure SetDataUltCM(const Value: TCmDbField);
    procedure SetFlgDeprec(const Value: TCmDbField);
    procedure SetDataInicioDep(const Value: TCmDbField);
    procedure SetDataFimDep(const Value: TCmDbField);
    procedure SetVidaUtil(const Value: TCmDbField);//Darivaldo Alencar SOL.198886.18334
  public

     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbemxdep: TCmDbField read FIdbemxdep write SetIdbemxdep;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;
     Property DataUltDep: TCmDbField read FDataUltDep write SetDataUltDep;
     Property DataUltCM: TCmDbField read FDataUltCM write SetDataUltCM;
     Property FlgDeprec: TCmDbField read FFlgDeprec write SetFlgDeprec;
     Property DataInicioDep: TCmDbField read FDataInicioDep write SetDataInicioDep;
     Property DataFimDep: TCmDbField read FDataFimDep write SetDataFimDep;
     Property VidaUtil: TCmDbField read FVidaUtil write SetVidaUtil;  //Darivaldo Alencar SOL.198886.18334

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBBemxDep }

constructor TDBBemxDep.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'BEMXDEP';

   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,False,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,False,'');
   fIdbemxdep := CreateCmDbField('IDBEMXDEP',ftfloat,True,True,False,False,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,False,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,False,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,False,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDataultcm := CreateCmDbField('DATAULTCM',ftDateTime,False,False,False,True,'');
   fFlgDeprec := CreateCmDbField('FLGDEPREC',ftfloat,False,False,False,False,'');
   fDataInicioDep := CreateCmDbField('DATAINICIODEP',ftDateTime,False,False,False,True,'');
   fDataFimDep := CreateCmDbField('DATAFIMDEP',ftDateTime,False,False,False,True,'');
   fVidaUtil := CreateCmDbField('VIDAUTIL',ftfloat,False,False,False,False,'');  //Darivaldo Alencar SOL.198886.18334
end;

function TDBBemxDep.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBBemxDep.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBBemxDep.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDBBemxDep.SetDataFimDep(const Value: TCmDbField);
begin
    FDataFimDep  := Value;
end;

procedure TDBBemxDep.SetDataInicioDep(const Value: TCmDbField);
begin
  FDataInicioDep  := Value;
end;

procedure TDBBemxDep.SetDataUltCM(const Value: TCmDbField);
begin
  FDataUltCM := Value;
end;

procedure TDBBemxDep.SetDataUltDep(const Value: TCmDbField);
begin
  FDataUltDep := Value;
end;

procedure TDBBemxDep.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBBemxDep.SetFlgDeprec(const Value: TCmDbField);
begin
  FFlgDeprec := Value;
end;

procedure TDBBemxDep.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBBemxDep.SetIdbemxdep(const Value: TCmDbField);
begin
  FIdbemxdep := Value;
end;

procedure TDBBemxDep.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBBemxDep.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBBemxDep.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;

//Darivaldo Alencar SOL.198886.18334 -inicio
procedure TDBBemxDep.SetVidaUtil(const Value: TCmDbField);
begin
  fVidaUtil := Value;
end;
//Darivaldo Alencar SOL.198886.18334 -fim

end.



