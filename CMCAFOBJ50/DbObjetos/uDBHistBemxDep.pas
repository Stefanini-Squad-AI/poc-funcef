// *****************************************************************************
// ***************************** REGISTRO DE ALTERAÇÕES ************************
// *****************************************************************************
//Rotina...........: Criação DBHISTBEMXDEP
//Nº SOL...........: 142551
//Nº KINTANA.......: 911676
//Data da Alteração: 06/12/2010
//Responsável......: Helen V. Bianchi
//Descrição........: Criação
//------------------------------------------------------------------------------

unit uDBHistBemxDep;

interface

Uses uCmCustomCdbObject, uCmDbObject, uSistema, DB;

Type
  TDBHistBemXdep = class(TCmDbObject)

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
    fDataVigencia: TCmDbField;
    fVidautil : TCmDbField;
    FFlgdepsuspensa: TCmDbField;
    FUserinclusao: TCmDbField;
    FDatainiciodep: TCmDbField;
    FDtinclusao: TCmDbField;
    FDatafimdep: TCmDbField;
    FIDSELDEPRECIACAO : TCmDbField;

    procedure SetIdbem(const Value: TCmDbField);
    procedure SetVidautil(const Value: TCmDbField);
    procedure SetUserinclusao(const Value: TCmDbField);
    procedure SetDtinclusao(const Value: TCmDbField);
    procedure SetTaxadep(const Value: TCmDbField);
    procedure SetMoecodigo(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetIdbemxdep(const Value: TCmDbField);
    procedure SetFlgdepsuspensa(const Value: TCmDbField);
    procedure SetFlgdeprec(const Value: TCmDbField);
    procedure SetDeplanc(const Value: TCmDbField);
    procedure SetDatavigencia(const Value: TCmDbField);
    procedure SetDataultdep(const Value: TCmDbField);
    procedure SetDataultcm(const Value: TCmDbField);
    procedure SetDatainiciodep(const Value: TCmDbField);
    procedure SetDatafimdep(const Value: TCmDbField);
    procedure SetCmdep(const Value: TCmDbField);
    procedure SetIDSELDEPRECIACAO(const Value: TCmDbField);

  public
     Property IDSELDEPRECIACAO: TCmDbField read FIDSELDEPRECIACAO write SetIDSELDEPRECIACAO;
     Property Idbem: TCmDbField read FIdbem write SetIdbem;
     Property Vidautil: TCmDbField read FVidautil write SetVidautil;
     Property Userinclusao: TCmDbField read FUserinclusao write SetUserinclusao;
     Property Dtinclusao: TCmDbField read FDtinclusao write SetDtinclusao;
     Property Taxadep: TCmDbField read FTaxadep write SetTaxadep;
     Property Moecodigo: TCmDbField read FMoecodigo write SetMoecodigo;
     Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
     Property Idbemxdep: TCmDbField read FIdbemxdep write SetIdbemxdep;
     Property Flgdepsuspensa: TCmDbField read FFlgdepsuspensa write SetFlgdepsuspensa;
     Property Flgdeprec: TCmDbField read FFlgdeprec write SetFlgdeprec;
     Property Deplanc: TCmDbField read FDeplanc write SetDeplanc;
     Property Datavigencia: TCmDbField read FDatavigencia write SetDatavigencia;
     Property Dataultdep: TCmDbField  read FDataultdep write SetDataultdep;
     Property Dataultcm: TCmDbField read FDataultcm write SetDataultcm;
     Property Datainiciodep: TCmDbField read FDatainiciodep write SetDatainiciodep;
     Property Datafimdep: TCmDbField read FDatafimdep write SetDatafimdep;
     Property Cmdep: TCmDbField read FCmdep write SetCmdep;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDBBemxDep }

constructor TDBHistBemxDep.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName     := 'HISTBEMXDEP';

   fVidautil := CreateCmDbField('VIDAUTIL',ftfloat,False,False,False,True,'');
   fuserinclusao := CreateCmDbField('USERINCLUSAO',ftString,False,False,False,True,'');
   fdtinclusao := CreateCmDbField('DTINCLUSAO',ftDateTime,False,False,False,True,'',-1,True);
   fTaxadep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,True,'');
   fMoecodigo := CreateCmDbField('MOECODIGO',ftfloat,True,True,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,True,False,True,'');
   fIdbemxdep := CreateCmDbField('IDBEMXDEP',ftfloat,True,True,False,True,'');
   fIdbem := CreateCmDbField('IDBEM',ftfloat,True,True,False,True,'');
   fFlgdepsuspensa := CreateCmDbField('FLGDEPSUSPENSA',ftfloat,False,False,False,True,'');
   fFlgdeprec := CreateCmDbField('FLGDEPREC',ftfloat,False,False,False,True,'');
   fDeplanc := CreateCmDbField('DEPLANC',ftfloat,False,False,False,True,'');
   fDatavigencia := CreateCmDbField('DATAVIGENCIA',ftDateTime,True,True,False,True,'');
   fDataultdep := CreateCmDbField('DATAULTDEP',ftDateTime,False,False,False,True,'');
   fDataultcm := CreateCmDbField('DATAULTCM',ftDateTime,False,False,False,True,'');
   fDatainiciodep := CreateCmDbField('DATAINICIODEP',ftDateTime,False,False,False,True,'');
   fDatafimdep := CreateCmDbField('DATAFIMDEP',ftDateTime,False,False,False,True,'');
   fCmdep := CreateCmDbField('CMDEP',ftfloat,False,False,False,True,'');

end;

function TDBHistBemxDep.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBHistBemxDep.LoadFromDB: Boolean;
begin
   Result := Inherited LoadFromDB;
end;

procedure TDBHistBemxDep.SetCmdep(const Value: TCmDbField);
begin
  FCmdep := Value;
end;

procedure TDBHistBemxDep.SetDataUltCM(const Value: TCmDbField);
begin
  FDataUltCM := Value;
end;

procedure TDBHistBemxDep.SetDataUltDep(const Value: TCmDbField);
begin
  FDataUltDep := Value;
end;

procedure TDBHistBemxDep.SetDeplanc(const Value: TCmDbField);
begin
  FDeplanc := Value;
end;

procedure TDBHistBemxDep.SetFlgDeprec(const Value: TCmDbField);
begin
  FFlgDeprec := Value;
end;

procedure TDBHistBemxDep.SetIdbem(const Value: TCmDbField);
begin
  FIdbem := Value;
end;

procedure TDBHistBemxDep.SetIdbemxdep(const Value: TCmDbField);
begin
  FIdbemxdep := Value;
end;

procedure TDBHistBemxDep.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBHistBemxDep.SetMoecodigo(const Value: TCmDbField);
begin
  FMoecodigo := Value;
end;

procedure TDBHistBemxDep.SetTaxadep(const Value: TCmDbField);
begin
  FTaxadep := Value;
end;
procedure TDBHistBemxDep.SetDataVigencia(const Value: TCmDbField);
begin
  FDataVigencia := Value;
end;
procedure TDBHistBemXdep.SetVidautil(const Value: TCmDbField);
begin
  fVidautil := Value;
end;

procedure TDBHistBemXdep.SetDatafimdep(const Value: TCmDbField);
begin
  fDatafimdep := Value;
end;

procedure TDBHistBemXdep.SetDatainiciodep(const Value: TCmDbField);
begin
  fDatainiciodep := Value;
end;

procedure TDBHistBemXdep.SetDtinclusao(const Value: TCmDbField);
begin
  fDtinclusao := Value;
end;

procedure TDBHistBemXdep.SetFlgdepsuspensa(const Value: TCmDbField);
begin
  fFlgdepsuspensa := Value;
end;

procedure TDBHistBemXdep.SetUserinclusao(const Value: TCmDbField);
begin
  fUserinclusao := Value;
end;

procedure TDBHistBemXdep.SetIDSELDEPRECIACAO(const Value: TCmDbField);
begin
  fIDSELDEPRECIACAO := Value;
end;

end.



