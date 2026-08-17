{===============================================================================
Responsável : Thiago Melo
Pendência   : SOL 143297 Kintana 928391
Descrição   : Foi adicionado condições para inclusão de grupo mestre no
              Construtor da Classe TDbGrupoRelatorio
=============================================================================== }

{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Marco Antonio Abreu             }
{ Atualizado Em: 16/05/2002                             }
{                                                       }
{*******************************************************}

unit uDbGrupoRelatorio;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbGrupoRelatorio = class(TCmDbObject)
  private
    FIdgruporelatorio: TCmDbField;
    FOrigemcmgr: TCmDbField;
    FDescricao: TCmDbField;
    FIdGrupoMestre: TCmDbField;

    procedure SetDescricao(const Value: TCmDbField);
    procedure SetIdgruporelatorio(const Value: TCmDbField);
    procedure SetOrigemcmgr(const Value: TCmDbField);
    // Thiago Melo SOL 143297 Kintana 928391
    procedure SetIdGrupoMestre(const Value: TCmDbField);
    //

  public
    Property Origemcmgr: TCmDbField read FOrigemcmgr write SetOrigemcmgr;
    Property Idgruporelatorio: TCmDbField read FIdgruporelatorio write SetIdgruporelatorio;
    Property Descricao: TCmDbField read FDescricao write SetDescricao;
    Property IdGrupoMestre  : TCmDbField read FIdGrupoMestre write SetIdGrupoMestre;

    Constructor Create(Aowner: TCmCustomCdbObject); Override;

    Function Insert: Boolean; Override;
    Function LoadFromDb: Boolean; Override;
  End;

implementation

{ TDbGrupoRelatorio }

constructor TDbGrupoRelatorio.Create;
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'GRUPORELATORIO';
  // Thiago Melo SOL 143297 Kintana 928391
  fOrigemcmgr           := CreateCmDbField('ORIGEMCMGR',ftfloat,True,False,False,False,'Origem Grupo');
  //
  fDescricao            := CreateCmDbField('DESCRICAO',ftString,True,False,False,True,'Descrição');
  fIdgruporelatorio     := CreateCmDbField('IDGRUPORELATORIO',ftfloat,True,True,False,True,'Código Grupo');
  // Thiago Melo SOL 143297 Kintana 928391
  FIdGrupoMestre        := CreateCmDbField('IDGRUPOMESTRE',ftfloat,False,False,False,False,'Código Grupo Mestre');
  //
end;

function TDbGrupoRelatorio.Insert: Boolean;
begin
  fIdgruporelatorio.AsFloat := GetSequence('GRUPORELATORIO');
// Thiago Melo SOL 143297 Kintana 928391
//  fOrigemCmGr.AsFloat      := 0;
  Result := Inherited Insert;
end;

function TDbGrupoRelatorio.LoadFromDB: Boolean;
begin
  Result := Inherited LoadFromDB;
end;

procedure TDbGrupoRelatorio.SetDescricao(const Value: TCmDbField);
begin
  FDescricao := Value;
end;

procedure TDbGrupoRelatorio.SetIdGrupoMestre(const Value: TCmDbField);
begin
  FIdGrupoMestre := Value;
end;

procedure TDbGrupoRelatorio.SetIdgruporelatorio(const Value: TCmDbField);
begin
  FIdgruporelatorio := Value;
end;

procedure TDbGrupoRelatorio.SetOrigemcmgr(const Value: TCmDbField);
begin
  FOrigemcmgr := Value;
end;

end.

