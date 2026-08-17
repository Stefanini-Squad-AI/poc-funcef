{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Sergio Fernandes de Almeida     }
{ Atualizado Em: 26/04/2004                             }
{                                                       }
{*******************************************************}

unit uDBCafObraLanc;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB;

Type
  TDBCafObraLanc = class(TCmDbObject)

  private
    FIdgrupo: TCmDbField;
    FIdmodulo: TCmDbField;
    FIdobratipoetapa: TCmDbField;
    FPlncodigo: TCmDbField;
    FCodsubconta: TCmDbField;
    FValofi: TCmDbField;
    FFlgdesmembobra: TCmDbField;
    FDtalancamento: TCmDbField;
    FIdcafobra: TCmDbField;
    FUnidnegoc: TCmDbField;
    FIdencparcial: TCmDbField;
    FNumnota: TCmDbField;
    FComplnota: TCmDbField;
    FIdpessoa: TCmDbField;
    FIdobralanc: TCmDbField;
    FDesclancobra: TCmDbField;
    FIdfornecedor: TCmDbField;
    FDtanota: TCmDbField;
    procedure SetCodsubconta(const Value: TCmDbField);
    procedure SetComplnota(const Value: TCmDbField);
    procedure SetDesclancobra(const Value: TCmDbField);
    procedure SetDtalancamento(const Value: TCmDbField);
    procedure SetDtanota(const Value: TCmDbField);
    procedure SetFlgdesmembobra(const Value: TCmDbField);
    procedure SetIdcafobra(const Value: TCmDbField);
    procedure SetIdencparcial(const Value: TCmDbField);
    procedure SetIdfornecedor(const Value: TCmDbField);
    procedure SetIdgrupo(const Value: TCmDbField);
    procedure SetIdmodulo(const Value: TCmDbField);
    procedure SetIdobralanc(const Value: TCmDbField);
    procedure SetIdobratipoetapa(const Value: TCmDbField);
    procedure SetIdpessoa(const Value: TCmDbField);
    procedure SetNumnota(const Value: TCmDbField);
    procedure SetPlncodigo(const Value: TCmDbField);
    procedure SetUnidnegoc(const Value: TCmDbField);
    procedure SetValofi(const Value: TCmDbField);

  public

    Property Valofi: TCmDbField read FValofi write SetValofi;
    Property Unidnegoc: TCmDbField read FUnidnegoc write SetUnidnegoc;
    Property Plncodigo: TCmDbField read FPlncodigo write SetPlncodigo;
    Property Numnota: TCmDbField read FNumnota write SetNumnota;
    Property Idpessoa: TCmDbField read FIdpessoa write SetIdpessoa;
    Property Idobratipoetapa: TCmDbField read FIdobratipoetapa write SetIdobratipoetapa;
    Property Idobralanc: TCmDbField read FIdobralanc write SetIdobralanc;
    Property Idmodulo: TCmDbField read FIdmodulo write SetIdmodulo;
    Property Idgrupo: TCmDbField read FIdgrupo write SetIdgrupo;
    Property Idfornecedor: TCmDbField read FIdfornecedor write SetIdfornecedor;
    Property Idencparcial: TCmDbField read FIdencparcial write SetIdencparcial;
    Property Idcafobra: TCmDbField read FIdcafobra write SetIdcafobra;
    Property Flgdesmembobra: TCmDbField read FFlgdesmembobra write SetFlgdesmembobra;
    Property Dtanota: TCmDbField read FDtanota write SetDtanota;
    Property Dtalancamento: TCmDbField read FDtalancamento write SetDtalancamento;
    Property Desclancobra: TCmDbField read FDesclancobra write SetDesclancobra;
    Property Complnota: TCmDbField read FComplnota write SetComplnota;
    Property Codsubconta: TCmDbField read FCodsubconta write SetCodsubconta;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert : Boolean; Override;
    Function InsertAs(nIdObraLanc : Extended = 0) : Boolean;
  End;

implementation

{ TDBCafObraLanc }

constructor TDBCafObraLanc.Create(Aowner: TCmCustomCdbObject);
begin
   inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'CAFOBRALANC';

   fValofi := CreateCmDbField('VALOFI',ftfloat,False,False,False,False,'');
   fUnidnegoc := CreateCmDbField('UNIDNEGOC',ftfloat,False,False,False,True,'');
   fPlncodigo := CreateCmDbField('PLNCODIGO',ftfloat,False,False,False,True,'');
   fNumnota := CreateCmDbField('NUMNOTA',ftString,False,False,False,True,'');
   fIdpessoa := CreateCmDbField('IDPESSOA',ftfloat,True,False,False,True,'');
   fIdobratipoetapa := CreateCmDbField('IDOBRATIPOETAPA',ftfloat,False,False,False,True,'');
   fIdobralanc := CreateCmDbField('IDOBRALANC',ftfloat,True,True,False,True,'');
   fIdmodulo := CreateCmDbField('IDMODULO',ftfloat,False,False,False,True,'');
   fIdgrupo := CreateCmDbField('IDGRUPO',ftfloat,False,False,False,True,'');
   fIdfornecedor := CreateCmDbField('IDFORNECEDOR',ftfloat,False,False,False,True,'');
   fIdencparcial := CreateCmDbField('IDENCPARCIAL',ftfloat,False,False,False,True,'');
   fIdcafobra := CreateCmDbField('IDCAFOBRA',ftfloat,True,False,False,True,'');
   fFlgdesmembobra := CreateCmDbField('FLGDESMEMBOBRA',ftfloat,True,False,False,False,'');
   fDtanota := CreateCmDbField('DTANOTA',ftDateTime,False,False,False,True,'');
   fDtalancamento := CreateCmDbField('DTALANCAMENTO',ftDateTime,False,False,False,True,'');
   fDesclancobra := CreateCmDbField('DESCLANCOBRA',ftString,False,False,False,True,'');
   fComplnota := CreateCmDbField('COMPLNOTA',ftString,False,False,False,True,'');
   fCodsubconta := CreateCmDbField('CODSUBCONTA',ftfloat,False,False,False,True,'');
end;

function TDBCafObraLanc.Insert: Boolean;
begin
   Result := Inherited Insert;
end;

function TDBCafObraLanc.InsertAs(nIdObraLanc : Extended) : Boolean;
begin
   if nIdObraLanc <= 0 then
      fIdObraLanc.AsFloat := GetSequence('CAFOBRALANC')
   else
      fIdObraLanc.AsFloat := nIdObraLanc;
   Result := Insert;
end;

procedure TDBCafObraLanc.SetCodsubconta(const Value: TCmDbField);
begin
  FCodsubconta := Value;
end;

procedure TDBCafObraLanc.SetComplnota(const Value: TCmDbField);
begin
  FComplnota := Value;
end;

procedure TDBCafObraLanc.SetDesclancobra(const Value: TCmDbField);
begin
  FDesclancobra := Value;
end;

procedure TDBCafObraLanc.SetDtalancamento(const Value: TCmDbField);
begin
  FDtalancamento := Value;
end;

procedure TDBCafObraLanc.SetDtanota(const Value: TCmDbField);
begin
  FDtanota := Value;
end;

procedure TDBCafObraLanc.SetFlgdesmembobra(const Value: TCmDbField);
begin
  FFlgdesmembobra := Value;
end;

procedure TDBCafObraLanc.SetIdcafobra(const Value: TCmDbField);
begin
  FIdcafobra := Value;
end;

procedure TDBCafObraLanc.SetIdencparcial(const Value: TCmDbField);
begin
  FIdencparcial := Value;
end;

procedure TDBCafObraLanc.SetIdfornecedor(const Value: TCmDbField);
begin
  FIdfornecedor := Value;
end;

procedure TDBCafObraLanc.SetIdgrupo(const Value: TCmDbField);
begin
  FIdgrupo := Value;
end;

procedure TDBCafObraLanc.SetIdmodulo(const Value: TCmDbField);
begin
  FIdmodulo := Value;
end;

procedure TDBCafObraLanc.SetIdobralanc(const Value: TCmDbField);
begin
  FIdobralanc := Value;
end;

procedure TDBCafObraLanc.SetIdobratipoetapa(const Value: TCmDbField);
begin
  FIdobratipoetapa := Value;
end;

procedure TDBCafObraLanc.SetIdpessoa(const Value: TCmDbField);
begin
  FIdpessoa := Value;
end;

procedure TDBCafObraLanc.SetNumnota(const Value: TCmDbField);
begin
  FNumnota := Value;
end;

procedure TDBCafObraLanc.SetPlncodigo(const Value: TCmDbField);
begin
  FPlncodigo := Value;
end;

procedure TDBCafObraLanc.SetUnidnegoc(const Value: TCmDbField);
begin
  FUnidnegoc := Value;
end;

procedure TDBCafObraLanc.SetValofi(const Value: TCmDbField);
begin
  FValofi := Value;
end;

end.



