{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Raniere S. M. da Silva          }
{ Criado Em: 08/07/2002                                 }
{                                                       }
{*******************************************************}

unit uDbCmpBdGrp;

interface

uses uCmCustomCdbObject, uCmDbObject, uSistema, DB, uDataBase;

type
  TDbCmpBdGrp = class(TCmDbObject)
  private
    FCodGrupoArquivo: TCmDbField;
    FIdCampo: TCmDbField;
  public
    constructor Create(AOwner: TCmCustomCdbObject); override;

    property IdCampo: TCmDbField read FIdCampo write FIdCampo;
    property CodGrupoArquivo: TCmDbField read FCodGrupoArquivo write FCodGrupoArquivo;
  end;

implementation

{ TDbCmpDdGrp }

constructor TDbCmpBdGrp.Create(AOwner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := false;

  TableName := 'CMPBDGRP';

  FIdCampo := CreateCmDbField('IDCAMPO',ftString,true,true,false,false,'');
  FCodGrupoArquivo := CreateCmDbField('CODGRUPOARQUIVO',ftString,true,true,false,false,'');
end;

end.
