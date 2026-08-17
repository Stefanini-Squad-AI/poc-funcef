{*******************************************************}
{                                                       }
{ CM Soluções Informática                               }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Andre Mesquita                  }
{ Criado Em: 23/03/2007                                 }
{                                                       }
{*******************************************************}
//******************************************************************************************
//N. Sol..........: 137269
//N. Kintana......: 829602
//Data............: 13/10/2011
//Responsável.....: Paulo Nobre
//Descrição.......: Alteração para inclusão de novos campos
//******************************************************************************************
Unit uDbDstValores;

Interface

Uses uCmDbObject, uCmCustomCdbObject, uSistema, DB, uDataBase;

Type
   TDbDstValores = Class(TCmDbObject)
   Private
      FIdDstTarifa: TCmDbField;
      FDataDstValores: TCmDbField;

      FVlrDst: TCmDbField;
      FLocal: TCmDbField;
      FMoeda: TCmDbField;
      FIdDstAeroporto: TCmDbField;

      FVlControladoDiaria: TCmDbField;
      FVlControladoKMRodado: TCmDbField;
      FVlKmLivreDiaria: TCmDbField;
      FVlKmLivreSemana: TCmDbField;
      FVlKmLivreDiaExtra: TCmDbField;

      Procedure SetDataDstValores(Const Value: TCmDbField);
      Procedure SetIdDstTarifa(Const Value: TCmDbField);
      Procedure SetVlrDst(Const Value: TCmDbField);
      Procedure SetLocal(Const Value: TCmDbField);
      Procedure SetMoeda(Const Value: TCmDbField);
      Procedure SetIdDstAeroporto(Const Value: TCmDbField);
      Procedure SetVlControladoDiaria(Const Value: TCmDbField);
      Procedure SetVlControladoKMRodado(Const Value: TCmDbField);
      Procedure SetVlKmLivreDiaria(Const Value: TCmDbField);
      Procedure SetVlKmLivreSemana(Const Value: TCmDbField);
      Procedure SetVlKmLivreDiaExtra(Const Value: TCmDbField);
   Public
      Constructor Create(AOwner: TCmCustomCdbObject); Override;

      Property IdDstTarifa: TCmDbField Read FIdDstTarifa Write SetIdDstTarifa;
      Property DataDstValores: TCmDbField Read FDataDstValores Write SetDataDstValores;
      Property VlrDst: TCmDbField Read FVlrDst Write SetVlrDst;
      Property Local: TCmDbField Read FLocal Write SetLocal;
      Property Moeda: TCmDbField Read FMoeda Write SetMoeda;
      Property IdDstAeroporto: TCmDbField Read FIdDstAeroporto Write SetIdDstAeroporto;
      Property VlControladoDiaria: TCmDbField Read FVlControladoDiaria Write SetVlControladoDiaria;
      Property VlControladoKMRodado: TCmDbField Read FVlControladoKMRodado Write SetVlControladoKMRodado;
      Property VlKmLivreDiaria: TCmDbField Read FVlKmLivreDiaria Write SetVlKmLivreDiaria;
      Property VlKmLivreSemana: TCmDbField Read FVlKmLivreSemana Write SetVlKmLivreSemana;
      Property VlKmLivreDiaExtra: TCmDbField Read FVlKmLivreDiaExtra Write SetVlKmLivreDiaExtra;
   End;

Implementation

{ TDbDstValores }

Constructor TDbDstValores.Create(AOwner: TCmCustomCdbObject);
Begin
   Inherited;
   ErrorIfNoRowsAffected := False;
   _UpdateKeyFields := True;

   TableName := 'DSTVALORES';

   FIdDstTarifa := CreateCmDbField('IDDSTTARIFA', ftFloat, true, true, false, true, '');
   FDataDstValores := CreateCmDbField('DATADSTVALORES', ftDateTime, true, true, false, true, '');
   FVlrDst := CreateCmDbField('VLRDST', ftFloat, false, false, false, true, '');
   FLocal := CreateCmDbField('TIPOLOCAL', ftString, false, false, false, true, '');
   FMoeda := CreateCmDbField('MOECODIGO', ftFloat, false, false, false, true, '');
   FIdDstAeroporto := CreateCmDbField('IDDSTAEROPORTO', ftFloat, false, false, false, true, '');
   FVlControladoDiaria := CreateCmDbField('VLCONTROLADODIARIA', ftFloat, false, false, false, true, '');
   FVlControladoKMRodado := CreateCmDbField('VLCONTROLADOKMRODADO', ftFloat, false, false, false, true, '');
   FVlKmLivreDiaria := CreateCmDbField('VLKMLIVREDIARIA', ftFloat, false, false, false, true, '');
   FVlKmLivreSemana := CreateCmDbField('VLKMLIVRESEMANA', ftFloat, false, false, false, true, '');
   FVlKmLivreDiaExtra := CreateCmDbField('VLKMLIVREDIAEXTRA', ftFloat, false, false, false, true, '');
End;

Procedure TDbDstValores.SetIdDstTarifa(Const Value: TCmDbField);
Begin
   FIdDstTarifa := Value;
End;

Procedure TDbDstValores.SetDataDstValores(Const Value: TCmDbField);
Begin
   FDataDstValores := Value;
End;

Procedure TDbDstValores.SetVlrDst(Const Value: TCmDbField);
Begin
   FVlrDst := Value;
End;

Procedure TDbDstValores.SetLocal(Const Value: TCmDbField);
Begin
   FLocal := Value;
End;

Procedure TDbDstValores.SetMoeda(Const Value: TCmDbField);
Begin
   FMoeda := Value;
End;

Procedure TDbDstValores.SetIdDstAeroporto(Const Value: TCmDbField);
Begin
   FIdDstAeroporto := Value;
End;

Procedure TDbDstValores.SetVlControladoDiaria(Const Value: TCmDbField);
Begin
   FVlControladoDiaria := Value;
End;

Procedure TDbDstValores.SetVlControladoKMRodado(Const Value: TCmDbField);
Begin
   FVlControladoKMRodado := Value;
End;

Procedure TDbDstValores.SetVlKmLivreDiaria(Const Value: TCmDbField);
Begin
   FVlKmLivreDiaria := Value;
End;

Procedure TDbDstValores.SetVlKmLivreSemana(Const Value: TCmDbField);
Begin
   FVlKmLivreSemana := Value;
End;

Procedure TDbDstValores.SetVlKmLivreDiaExtra(Const Value: TCmDbField);
Begin
   FVlKmLivreDiaExtra := Value;
End;

End.
