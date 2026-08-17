{-----------------------------------------------------------------------------------------------------------------------------------
ALTERAÇÕES / IMPLEMENTAÇÕES --------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
Rotina...........: _
Nº SOL...........: 198886.18334
Data da Alteração: 10/01/2017
Responsável......: Darivaldo Alencar
Descrição........: Criação deste fonte.
-----------------------------------------------------------------------------------------------------------------------------------}

unit uDBClasseTaxaDep;
interface
 Uses uCmDbObject, DB, uCmCustomCdbObject,
     uCmControlObject, uCMTypes,
     SysUtils, dbclient, Provider, uMidasUtil,
     dMTBem;

   Type
     TDBClasseTaxaDep = class(TCmDbObject)
   private
     FIdClasseBem: TCmDbField;
     FTaxaDep: TCmDbField;
     FVidaUtil: TCmDbField;
     procedure SetIdClasseBem(const Value: TCmDbField);
     procedure SetTaxaDep(const Value: TCmDbField);
     procedure SetVidaUtil(const Value: TCmDbField);
   public
     Property IdClasseBem: TCmDbField read FIdClasseBem write SetIdClasseBem;
     Property TaxaDep: TCmDbField read FTaxaDep write SetTaxaDep;
     Property VidaUtil: TCmDbField read FVidaUtil write SetVidaUtil;
     Constructor Create(Aowner: TCmCustomCdbObject);
end;

implementation

Constructor TDBClasseTaxaDep.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CLASSETAXADEP';

   FIdClasseBem := CreateCmDbField('IDCLASSEBEM',ftfloat,True,True,False,False,'');;
   FTaxaDep := CreateCmDbField('TAXADEP',ftfloat,False,False,False,False,'');
   FVidaUtil := CreateCmDbField('VIDAUTIL',ftfloat,False,False,False,False,'');
end;

procedure TDBClasseTaxaDep.SetIdClasseBem(const Value: TCmDbField);
begin
  FIdClasseBem := Value;
end;

procedure TDBClasseTaxaDep.SetTaxaDep(const Value: TCmDbField);
begin
  FTaxaDep := Value;
end;

procedure TDBClasseTaxaDep.SetVidaUtil(const Value: TCmDbField);
begin
  FVidaUtil := Value;
end;

end.
 