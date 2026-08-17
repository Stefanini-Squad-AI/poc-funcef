unit uDbTabeladeparaCR;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTabeladeparaCR = class(TCmDbObject)

  private
    FIdtabeladepara: TCmDbField;
    FNometabela: TCmDbField;
    FNomecampodata: TCmDbField;
    FNomecampoempresa: TCmDbField;
    procedure SetIdtabeladepara(const Value: TCmDbField);
    procedure SetNomecampodata(const Value: TCmDbField);
    procedure SetNomecampoempresa(const Value: TCmDbField);
    procedure SetNometabela(const Value: TCmDbField);

  public

     Property Nometabela: TCmDbField read FNometabela write SetNometabela;
     Property Nomecampodata: TCmDbField read FNomecampodata write SetNomecampodata;
     Property Nomecampoempresa: TCmDbField read FNomecampoempresa write SetNomecampoempresa;
     Property Idtabeladepara: TCmDbField read FIdtabeladepara write SetIdtabeladepara;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTabeladepara }



constructor TDbTabeladeparaCR.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'TABELADEPARACR';

   fIdtabeladepara   := CreateCmDbField('IDTABELADEPARACR',ftfloat,True,True,False,True,'');
   fNometabela       := CreateCmDbField('NOMETABELA',ftString,False,False,False,True,'');
   fNomecampodata    := CreateCmDbField('NOMECAMPODATA',ftString,False,False,False,True,'');
   fNomecampoempresa := CreateCmDbField('NOMECAMPOEMPRESA',ftString,False,False,False,True,'');
end;



function TDbTabeladeparaCR.Insert: Boolean;
begin

   fIdtabeladepara.AsFloat := GetSequence('TABELADEPARACR');
   Result := Inherited Insert;

end;



procedure TDbTabeladeparaCR.SetIdtabeladepara(const Value: TCmDbField);
begin
  FIdtabeladepara := Value;
end;



procedure TDbTabeladeparaCR.SetNomecampodata(const Value: TCmDbField);
begin
  FNomecampodata := Value;
end;



procedure TDbTabeladeparaCR.SetNomecampoempresa(const Value: TCmDbField);
begin
  FNomecampoempresa := Value;
end;



procedure TDbTabeladeparaCR.SetNometabela(const Value: TCmDbField);
begin
  FNometabela := Value;
end;



end.



