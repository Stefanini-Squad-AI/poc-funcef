{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 05/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbGrpArquivo;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbGrpArquivo = class(TCmDbObject)
  private
    FCodGrupoArquivo: TCmDbField;
    FDescGrupoArquivo: TCmDbField;
    FSetorGrupos: TCmDbField;
  public
    {$IFNDEF VERSAO0505}
    constructor Create(AOwner: TCmCustomCdbObject); override;
    {$ELSE}
    constructor Create; override;
    {$ENDIF}

    property CodGrupoArquivo: TCmDbField read FCodGrupoArquivo write FCodGrupoArquivo;
    property DescGrupoArquivo: TCmDbField read FDescGrupoArquivo write FDescGrupoArquivo;
    property SetorGrupos: TCmDbField read FSetorGrupos write FSetorGrupos;
  end;

implementation

{ TDbGrpArquivo }

{$IFNDEF VERSAO0505}
constructor TDbGrpArquivo.Create(AOwner: TCmCustomCdbObject);
{$ELSE}
constructor TDbGrpArquivo.Create; 
{$ENDIF}
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'GRPARQUIVO';

  FCodGrupoArquivo := CreateCmDbField('CODGRUPOARQUIVO',ftString,true,true,false,false,'');
  FDescGrupoArquivo := CreateCmDbField('DESCGRUPOARQUIVO',ftString,false,false,false,false,'');
  FSetorGrupos := CreateCmDbField('SETORGRUPOS',ftString,false,false,false,false,'');
end;

end.
