{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 03/11/2003                             }
{                                                       }
{*******************************************************}

unit uDbTabeladeparacr;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbTabeladeparacr = class(TCmDbObject)

  private
    FNomecampodata: TCmDbField;
    FNomecampoempresa: TCmDbField;
    FNometabela: TCmDbField;
    FIdtabeladeparacr: TCmDbField;
    FTrguserinclusao: TCmDbField;
    FTrgdtinclusao: TCmDbField;
    procedure SetIdtabeladeparacr(const Value: TCmDbField);
    procedure SetNomecampodata(const Value: TCmDbField);
    procedure SetNomecampoempresa(const Value: TCmDbField);
    procedure SetNometabela(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);

  public

     Property Trguserinclusao: TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao: TCmDbField read FTrgdtinclusao write SetTrgdtinclusao;
     Property Nometabela: TCmDbField read FNometabela write SetNometabela;
     Property Nomecampoempresa: TCmDbField read FNomecampoempresa write SetNomecampoempresa;
     Property Nomecampodata: TCmDbField read FNomecampodata write SetNomecampodata;
     Property Idtabeladeparacr: TCmDbField read FIdtabeladeparacr write SetIdtabeladeparacr;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbTabeladeparacr }

constructor TDbTabeladeparacr.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'TABELADEPARACR';

   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   fTrgdtinclusao := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');
   fNometabela := CreateCmDbField('NOMETABELA',ftString,False,False,False,True,'');
   fNomecampoempresa := CreateCmDbField('NOMECAMPOEMPRESA',ftString,False,False,False,True,'');
   fNomecampodata := CreateCmDbField('NOMECAMPODATA',ftString,False,False,False,True,'');
   fIdtabeladeparacr := CreateCmDbField('IDTABELADEPARACR',ftfloat,True,True,False,True,'');
end;



function TDbTabeladeparacr.Insert: Boolean;
begin
   fIdtabeladeparacr.AsFloat := GetSequence('TABELADEPARACR');
   Result := Inherited Insert;
end;


procedure TDbTabeladeparacr.SetIdtabeladeparacr(const Value: TCmDbField);
begin
  FIdtabeladeparacr := Value;
end;

procedure TDbTabeladeparacr.SetNomecampodata(const Value: TCmDbField);
begin
  FNomecampodata := Value;
end;

procedure TDbTabeladeparacr.SetNomecampoempresa(const Value: TCmDbField);
begin
  FNomecampoempresa := Value;
end;

procedure TDbTabeladeparacr.SetNometabela(const Value: TCmDbField);
begin
  FNometabela := Value;
end;

procedure TDbTabeladeparacr.SetTrgdtinclusao(const Value: TCmDbField);
begin
  FTrgdtinclusao := Value;
end;

procedure TDbTabeladeparacr.SetTrguserinclusao(const Value: TCmDbField);
begin
  FTrguserinclusao := Value;
end;

end.



