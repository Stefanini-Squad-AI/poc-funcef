//Rotina..........: Create()
//N. Sol..........: 133001
//N. Kintana......: 771169
//Data............: 26/03/2010
//Responsável.....:`Paulo Nobre / William M. Santos
//Descrição.......: Correção ao fazer o desfazer correção, o sistema estava apagando todo o histórico.
//*******************************************************
//Rotina..........:
//N. Sol..........: 124767
//N. Kintana......: 637517
//Data............: 24/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementado ajuste para corrigir o problema de desfazer correção monetária,
//                    pois não estava gravando valor das custas na hstetapaproctrab.
//************************************************************************************************
//Rotina..........: 
//N. Sol..........: 122631
//N. Kintana......: 604039
//Data............: 14/09/2009
//Responsável.....: William Santos
//Descrição.......: Implementação para trazer as etapas referentes ao processo selecionado RM JUR-2009.08.
//********************************************************************
//Rotina..........: bbtnConfirmarClick
//N. Sol..........: 527285
//N. Kintana......: 113388
//Data............: 14/07/2009
//Responsável.....: William Santos / Paulo Nobre
//Descrição.......: Implementação para fazer correção monetária das custas.
{*******************************************************}
{ Softtek do Brasil                                     }
{ ** Todos os Direitos Reservados                       }
{ Gerada pelo "CM Bussines Object Builder"              }
{ Analista Responsável: Emerson S.                      }
{ Atualizado Em: 09/04/2009                             }
{ Descricao : Criado para atender o chamado  KT 522313  }
{ SOL 112597.                                           }
{*******************************************************}

unit uDbHstetapaproctrab;

interface

Uses uCmCustomCdbObject, uCmDbObject, DB, uDataBase;

Type
  TDbHstetapaproctrab = class(TCmDbObject)
  private         
    FTrguserinclusao: TCmDbField;
    FCodtiporecurso: TCmDbField;
    FDataatu: TCmDbField;
    FValoratu: TCmDbField;
    //William Santos / Paulo Nobre KINTANA 527285 SOL 113388 INÍCIO
    FValoratucustas: TCmDbField;
    //William Santos / Paulo Nobre KINTANA 527285 SOL 113388 FIM
    FNumseq: TCmDbField;
    FNumproctrab: TCmDbField;
    FIdhistetapaproc: TCmDbField;
    FAssunto: TCmDbField;
    FTrgdtinclusao: TCmDbField;

    procedure SetAssunto(const Value: TCmDbField);
    procedure SetCodtiporecurso(const Value: TCmDbField);
    procedure SetDataatu(const Value: TCmDbField);
    procedure SetIdhistetapaproc(const Value: TCmDbField);
    procedure SetNumproctrab(const Value: TCmDbField);
    procedure SetNumseq(const Value: TCmDbField);
    procedure SetTrgdtinclusao(const Value: TCmDbField);
    procedure SetTrguserinclusao(const Value: TCmDbField);
    procedure SetValoratu(const Value: TCmDbField);
    //William Santos / Paulo Nobre KINTANA 527285 SOL 113388 INICIO
    procedure SetValoratuCustas(const Value: TCmDbField);
    //William Santos / Paulo Nobre KINTANA 527285 SOL 113388 FIM
  //private

  public
     Property Idhistetapaproc  : TCmDbField read FIdhistetapaproc write SetIdhistetapaproc;
     Property Numseq           : TCmDbField read FNumseq          write SetNumseq;
     Property Numproctrab      : TCmDbField read FNumproctrab     write SetNumproctrab;
     Property Valoratu         : TCmDbField read FValoratu        write SetValoratu;
     //William Santos / Paulo Nobre KINTANA 527285 SOL 113388 INÍCIO
     Property Valoratucustas   : TCmDbField read FValoratucustas  write SetValoratucustas;
     //William Santos / Paulo Nobre KINTANA 527285 SOL 113388 FIM
     Property Dataatu          : TCmDbField read FDataatu         write SetDataatu;
     Property Codtiporecurso   : TCmDbField read FCodtiporecurso  write SetCodtiporecurso;
     Property Assunto          : TCmDbField read FAssunto         write SetAssunto;
     Property Trguserinclusao  : TCmDbField read FTrguserinclusao write SetTrguserinclusao;
     Property Trgdtinclusao    : TCmDbField read FTrgdtinclusao   write SetTrgdtinclusao;

     Constructor Create(Aowner: TCmCustomCdbObject); Override;

     Function Insert :Boolean; Override;
  End;

implementation

{ TDbHstetapaproctrab }

constructor TDbHstetapaproctrab.Create(Aowner: TCmCustomCdbObject);
begin
  inherited;
  ErrorIfNoRowsAffected := False;

  TableName := 'HSTETAPAPROCTRAB';

   fValoratu        := CreateCmDbField('VALORATU',ftfloat,False,False,False,True,'');    
   //William Santos / Paulo Nobre KINTANA 527285 SOL 113388 INICIO
   fValoratucustas  := CreateCmDbField('VALORATUCUSTAS',ftfloat,False,False,False,True,'');
   //William Santos / Paulo Nobre KINTANA 527285 SOL 113388 FIM

   // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
   //   fTrguserinclusao := CreateCmDbField('TRGUSERINCLUSAO',ftString,False,False,False,True,'');
   //   fTrgdtinclusao   := CreateCmDbField('TRGDTINCLUSAO',ftDateTime,False,False,False,True,'');

   fNumseq          := CreateCmDbField('NUMSEQ',ftfloat,False,False,False,True,'');
   fNumproctrab     := CreateCmDbField('NUMPROCTRAB',ftfloat,False,False,False,True,'');
   fIdhistetapaproc := CreateCmDbField('IDHISTETAPAPROC',ftfloat,True,True,False,True,'');
   fDataatu         := CreateCmDbField('DATAATU',ftDateTime,False,False,False,True,'');
   fCodtiporecurso  := CreateCmDbField('CODTIPORECURSO',ftfloat,False,False,False,True,'');
   fAssunto         := CreateCmDbField('ASSUNTO',ftString,False,False,False,True,'');
end;

function TDbHstetapaproctrab.Insert: Boolean;
begin

   fIdhistetapaproc.AsFloat := GetSequence('HSTETAPAPROCTRAB');
   Result := Inherited Insert;

end;


procedure TDbHstetapaproctrab.SetAssunto(const Value: TCmDbField);
begin
  FAssunto := Value;
end;

procedure TDbHstetapaproctrab.SetCodtiporecurso(const Value: TCmDbField);
begin
  FCodtiporecurso := Value;
end;

procedure TDbHstetapaproctrab.SetDataatu(const Value: TCmDbField);
begin
  FDataatu := Value;
end;

procedure TDbHstetapaproctrab.SetIdhistetapaproc(const Value: TCmDbField);
begin
  FIdhistetapaproc := Value;
end;

procedure TDbHstetapaproctrab.SetNumproctrab(const Value: TCmDbField);
begin
  FNumproctrab := Value;
end;

procedure TDbHstetapaproctrab.SetNumseq(const Value: TCmDbField);
begin
  FNumseq := Value;
end;

procedure TDbHstetapaproctrab.SetTrgdtinclusao(const Value: TCmDbField);
begin
  // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
  //FTrgdtinclusao := Value;
end;

Procedure TDbHstetapaproctrab.SetTrguserinclusao(Const Value: TCmDbField);
Begin
   // William / Paulo Sol 133001 Kintana 77169 - 26/03/2010
   // FTrguserinclusao := Value;
End;

Procedure TDbHstetapaproctrab.SetValoratu(Const Value: TCmDbField);
Begin

   FValoratu := Value;
End;

procedure TDbHstetapaproctrab.SetValoratucustas(const Value: TCmDbField);
begin
  FValoratucustas := Value;
end;

end.



