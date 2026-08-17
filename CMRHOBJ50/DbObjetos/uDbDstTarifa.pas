{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Andre Mesqutia                  }
{ Atualizado Em: 26/03/2007                             }
{                                                       }
{*******************************************************}
//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 07/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alteração en funções para inclusão de novo campos
//******************************************************************************************
Unit uDbDstTarifa;

Interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
   TDbDstTarifa = Class(TCmDbObject)

   Private
      FIddsttarifa: TCmDbField;

      // Para recarrega o cds com o registro após a edição ( bug do padrão ) - usada nos cadastros padronizados
      FIddsttarifa2: Integer;

      FDescricao: TCmDbField;
      FIndtipo: TCmDbField;
      FMoecodigo: TCmDbField;
      FFlgEditar: TCmDbField;
      FIdCidades: TCmDbField;
      FIndDiaSemana: TCmDbField;
      FTipoGrupoVeiculo: TCmDbField;
      Procedure SetDescricao(Const Value: TCmDbField);
      Procedure SetIddsttarifa(Const Value: TCmDbField);
      Procedure SetIndtipo(Const Value: TCmDbField);
      Procedure SetMoecodigo(Const Value: TCmDbField);
      Procedure SetFlgEditar(Const Value: TCmDbField);
      Procedure SetIdCidades(Const Value: TCmDbField);
      Procedure SetIndDiaSemana(Const Value: TCmDbField);
      Procedure SetTipoGrupoVeiculo(Const Value: TCmDbField);

   Public
      Property Iddsttarifa: TCmDbField Read FIddsttarifa Write SetIddsttarifa;
      Property Descricao: TCmDbField Read FDescricao Write SetDescricao;
      Property Indtipo: TCmDbField Read FIndtipo Write SetIndtipo;
      Property Moecodigo: TCmDbField Read FMoecodigo Write SetMoecodigo;
      Property FlgEditar: TCmDbField Read FFlgEditar Write SetFlgEditar;
      Property IdCidades: TCmDbField Read FIdCidades Write SetIdCidades;
      Property IndDiaSemana: TCmDbField Read FIndDiaSemana Write SetIndDiaSemana;
      Property TipoGrupoVeiculo: TCmDbField Read FTipoGrupoVeiculo Write SetTipoGrupoVeiculo;

      // Para recarrega o cds com o registro após a edição ( bug do padrão ) - usada nos cadastros padronizados
      Property Iddsttarifa2: Integer Read FIddsttarifa2 Write FIddsttarifa2;

      Constructor Create(Aowner: TCmCustomCdbObject); Override;

      Function Insert: Boolean; Override;
   End;

Implementation

{ TDbDstTarifa }

Constructor TDbDstTarifa.Create(Aowner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;

   TableName := 'DSTTARIFA';

   fIddsttarifa := CreateCmDbField('IDDSTTARIFA', ftfloat, True, True, False, True, '');
   fMoecodigo := CreateCmDbField('MOECODIGO', ftfloat, False, False, False, True, '');
   fDescricao := CreateCmDbField('DESCRICAO', ftString, False, False, False, True, '');
   fIndtipo := CreateCmDbField('INDTIPO', ftfloat, False, False, False, True, '');
   fFlgEditar := CreateCmDbField('FLGEDITAR', ftfloat, False, False, False, True, '');
   FIdCidades := CreateCmDbField('IDCIDADES', ftfloat, False, False, False, True, '');
   FIndDiaSemana := CreateCmDbField('INDDIASEMANA', ftfloat, False, False, False, True, '');
   FTipoGrupoVeiculo := CreateCmDbField('TIPOGRUPOVEICULO', ftString, false, false, false, true, '');
End;

Function TDbDstTarifa.Insert: Boolean;
Begin
   fIddsttarifa.AsFloat := GetSequence('DSTTARIFA');
   // Para recarrega o cds com o registro após a edição ( bug do padrão ) - usada nos cadastros padronizados
   Iddsttarifa2 := fIddsttarifa.AsInteger;
   Result := Inherited Insert;
End;

Procedure TDbDstTarifa.SetDescricao(Const Value: TCmDbField);
Begin
   FDescricao := Value;
End;

Procedure TDbDstTarifa.SetFlgEditar(Const Value: TCmDbField);
Begin
   FFlgEditar := Value;
End;

Procedure TDbDstTarifa.SetIddsttarifa(Const Value: TCmDbField);
Begin
   FIddsttarifa := Value;
End;

Procedure TDbDstTarifa.SetIndtipo(Const Value: TCmDbField);
Begin
   FIndtipo := Value;
End;

Procedure TDbDstTarifa.SetMoecodigo(Const Value: TCmDbField);
Begin
   FMoecodigo := Value;
End;

Procedure TDbDstTarifa.SetIdCidades(Const Value: TCmDbField);
Begin
   FIdCidades := Value;
End;

Procedure TDbDstTarifa.SetIndDiaSemana(Const Value: TCmDbField);
Begin
   FIndDiaSemana := Value;
End;

Procedure TDbDstTarifa.SetTipoGrupoVeiculo(Const Value: TCmDbField);
Begin
   FTipoGrupoVeiculo := Value;
End;

End.

