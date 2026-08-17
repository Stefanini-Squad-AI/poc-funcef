{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Nome do Desenvolvedor           }
{ Atualizado Em: 20/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrpIndicador;

interface
Uses uCmDbObject, uSistema, DB, uDataBase, uCmCustomCdbObject;

Type
  TDbGrpIndicador = class(TCmDbObject)

  private
    FIdgrpindicador: TCmDbField;
    FIdindicador: TCmDbField;
    FIdsubtipo: TCmDbField;
    FTipolanca: TCmDbField;
    FOrdem: TCmDbField;
    procedure SetIdgrpindicador(const Value: TCmDbField);
    procedure SetIdindicador(const Value: TCmDbField);
    procedure SetIdsubtipo(const Value: TCmDbField);
    procedure SetOrdem(const Value: TCmDbField);
    procedure SetTipolanca(const Value: TCmDbField);

  public

     Property Tipolanca: TCmDbField read FTipolanca write SetTipolanca;
     Property Ordem: TCmDbField read FOrdem write SetOrdem;
     Property Idsubtipo: TCmDbField read FIdsubtipo write SetIdsubtipo;
     Property Idindicador: TCmDbField read FIdindicador write SetIdindicador;
     Property Idgrpindicador: TCmDbField read FIdgrpindicador write SetIdgrpindicador;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
     Function LoadFromDb :Boolean; Override;
  End;

implementation

{ TDbGrpIndicador }

constructor TDbGrpIndicador.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'INDGRPINDICADOR';

   fTipolanca := CreateCmDbField('TIPOLANCA',ftString,True,False,False,True,'Tipo de Indicador');
   fOrdem := CreateCmDbField('ORDEM',ftfloat,False,False,False,True,'Ordem Seq. de Apresentação');
   fIdsubtipo := CreateCmDbField('IDSUBTIPO',ftfloat,True,False,False,True,'ID do Supbtipo de Indicadores');
   fIdindicador := CreateCmDbField('IDINDICADOR',ftfloat,False,False,False,True,'ID do Indicador');
   fIdgrpindicador := CreateCmDbField('IDGRPINDICADOR',ftfloat,True,True,False,True,'ID do Grupo de Indicadores');
end;

function TDbGrpIndicador.Insert: Boolean;
begin

   fIdgrpindicador.AsFloat := GetSequence('INDGRPINDICADOR');
   Result := Inherited Insert;

end;

function TDbGrpIndicador.LoadFromDB: Boolean;
begin

   Result := Inherited LoadFromDB;

end;

procedure TDbGrpIndicador.SetIdgrpindicador(const Value: TCmDbField);
begin
  FIdgrpindicador := Value;
end;

procedure TDbGrpIndicador.SetIdindicador(const Value: TCmDbField);
begin
  FIdindicador := Value;
end;

procedure TDbGrpIndicador.SetIdsubtipo(const Value: TCmDbField);
begin
  FIdsubtipo := Value;
end;

procedure TDbGrpIndicador.SetOrdem(const Value: TCmDbField);
begin
  FOrdem := Value;
end;

procedure TDbGrpIndicador.SetTipolanca(const Value: TCmDbField);
begin
  FTipolanca := Value;
end;

end.



